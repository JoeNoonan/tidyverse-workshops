library(tidyverse)

gsodi_wide <- read_csv("https://www.idea.int/gsod-indices/sites/default/files/gsodi_pv_3.csv")
region_sub_region_key <- read_csv("region_sub_region_key.csv")

gsodi_id <- names(gsodi_wide)[1:7]
gsodi_vars <- names(gsodi_wide)[8:179]
new_region_vars <- names(region_sub_region_key)[5:6]

gsodi_wide_w_region_names <- left_join(region_sub_region_key, gsodi_wide) %>% 
  select(gsodi_id, new_region_vars, gsodi_vars)

write_csv(gsodi_wide_w_region_names, "gsodi_wide_w_region")