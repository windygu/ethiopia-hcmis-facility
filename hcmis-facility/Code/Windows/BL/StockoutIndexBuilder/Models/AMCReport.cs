﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace StockoutIndexBuilder.Models
{
    [Table("AmcReport")]
    public class AmcReport
    {
        [Key]
        public int ID { get; set; }
        [ForeignKey("Item")]
        public int ItemID { get; set; }
        public int StoreID { get; set; }
        [NotMapped]
        public string FullItemName { get; set; }
        public int AmcRange { get; set; }
        public double IssueInAmcRange { get; set; }
        public int DaysOutOfStock { get; set; }
        public double AmcWithDOS { get; set; }
        public double AmcWithOutDOS { get; set; }
        public DateTime? LastIndexedTime { get; set; }
        public double? IssueWithDOS { get; set; }
        public int? UnitID { get; set; }

        public virtual Item Item { get; set; }

    }
}
