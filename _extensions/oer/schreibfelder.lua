-- SPDX-License-Identifier: AGPL-3.0-only
-- Writing fields for the printable worksheets.
--
-- A `::: {.schreibfeld}` div becomes an empty framed box: a Typst block in the PDF and a
-- one-cell table with a minimum row height in DOCX. The website keeps the CSS box.
-- In DOCX, every empty body cell of a table inside `::: {.arbeitsblatt}` gets empty
-- paragraphs, so printed rows keep room to write. The PDF sets the row height in Typst.

local BOX_HEIGHT_CM = 4.5
local CELL_LINES = 4
local FRAME_COLOUR = "C9D0D6"

local function cm_to_twips(cm)
  return math.floor(cm / 2.54 * 1440 + 0.5)
end

local function typst_box()
  return pandoc.RawBlock(
    "typst",
    string.format('#block(width: 100%%, height: %.1fcm, stroke: 0.5pt + rgb("#%s"), radius: 3pt)', BOX_HEIGHT_CM, FRAME_COLOUR)
  )
end

local function openxml_box()
  local border = string.format('w:val="single" w:sz="4" w:space="0" w:color="%s"', FRAME_COLOUR)
  local xml = table.concat({
    "<w:tbl>",
    "<w:tblPr>",
    '<w:tblW w:w="5000" w:type="pct"/>',
    "<w:tblBorders>",
    "<w:top " .. border .. "/>",
    "<w:left " .. border .. "/>",
    "<w:bottom " .. border .. "/>",
    "<w:right " .. border .. "/>",
    "</w:tblBorders>",
    "</w:tblPr>",
    '<w:tblGrid><w:gridCol w:w="9000"/></w:tblGrid>',
    "<w:tr>",
    string.format('<w:trPr><w:trHeight w:val="%d" w:hRule="atLeast"/></w:trPr>', cm_to_twips(BOX_HEIGHT_CM)),
    '<w:tc><w:tcPr><w:tcW w:w="5000" w:type="pct"/></w:tcPr><w:p/></w:tc>',
    "</w:tr>",
    "</w:tbl>",
    "<w:p/>",
  })
  return pandoc.RawBlock("openxml", xml)
end

local function empty_lines()
  return pandoc.RawBlock("openxml", string.rep("<w:p/>", CELL_LINES))
end

local function fill_empty_cells(tbl)
  for _, body in ipairs(tbl.bodies) do
    for _, row in ipairs(body.body) do
      for _, cell in ipairs(row.cells) do
        if #cell.contents == 0 then
          cell.contents = pandoc.Blocks({ empty_lines() })
        end
      end
    end
  end
  return tbl
end

function Div(el)
  if el.classes:includes("schreibfeld") then
    if FORMAT:match("typst") then
      return typst_box()
    elseif FORMAT:match("docx") then
      return openxml_box()
    end
  elseif el.classes:includes("arbeitsblatt") and FORMAT:match("docx") then
    return el:walk({ Table = fill_empty_cells })
  end
end
