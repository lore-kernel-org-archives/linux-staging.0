Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C857C
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 13:22:39 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P9vxlK025669;
	Mon, 25 Apr 2022 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ePcnEmOBO3h+mHScycNNY+elxmLJygO7QGsReilGdD8=;
 b=gKxRErRdrwBcowkP9oHQSjznK3uyCuHcrKyeBOW3HZ5TJ8o6UBSE/BFB4oXtqPginYDx
 Wqe9YdC3V9hGfQf7y8F7klUOjOGINhzDC/h8iSlkJAzXT1d+lY6LgjfECqMF0Z+4wRNc
 t5z3HRI/Xtjr7hRN3T6zg5ojM+V8pu8287FbsXG8G980PjIHO8HnZPLQLpjAvH3E7V8s
 DXXFhHaaN872ivjPDjrVgoSogT2JFu4a+KHSGYg5xzxo+i1oOhCpIxPwatsOkFoUMobY
 QltyrYMB/DMXKlJTAcPt8gT4BPZp5UAz5WU5fe5hFKrr1T2ox1S+I2j6pLtcX0ETNT9Q bA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb1mk58m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Apr 2022 13:22:38 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23PDAwvD036644;
	Mon, 25 Apr 2022 13:22:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fm7w28cv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Apr 2022 13:22:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ejw037NxFdzqbEkPuzN/NHzoQDwvKRETW5mAx+qj18eBMizb6kTgqQ5a0tvkKaLljx43u6BsqDbVkBkoHpE5JU3TarM1gE6GxErJPns6bD77jVYFHEM8wDzqGrBpk/wSlsImewAums4/72+B8Paaxo3zhCvY4VKdaQQ6sTx/S/pmT0Kp9A+I2CZBOUaqvA0kkUkfPlVHhn5WmxjL269HnTVEqZ83LW1aHxYZ0XVqghuJ0xTXj/4bfAN/tfjiboO4WOoiubWlkKhcGcpRXbuTzvwJchLGxV7wzkuMg9CbckdUvEN8qKJoXnpa+HgZvqvj1O2CtA/2VTRtRDZOulTrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePcnEmOBO3h+mHScycNNY+elxmLJygO7QGsReilGdD8=;
 b=XShggw/kFBMO49BHt7rGyJxMoerkrVjYOF5AO1Sjm75a4W+TtdAIIziIFp/nf2Tud+XYTSae9HhOG9+9f12VIdBS970LTZQOCwtu3mf46DZSvZJex464l/iKn5gWx4X5GJaUWxprhvcXWgaW/r5hedO8hMv7XYi2ZK8YIYoZ3Da7OINF4PlA2xjsv58oVO7cl6937QdOf33B/8Hsn1xsr+eAbf/lCo+kPrr7h7Xplo9rY9abSkOjPjkFM+kPaaVhNRCWq+++G/ggEkQQEdkPd7ULOa9uiqqb3lTh6AduozCBktQd1KrFi6MyxBcMEIZIwknk29S+xCzd549lMTEZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePcnEmOBO3h+mHScycNNY+elxmLJygO7QGsReilGdD8=;
 b=VN121PmXy9Cb/f0srdCVlKRGzurn4IQa6J4vxFbUQ6HClcAZaFF1+6EK6Y0R4Rxl+81SPiZxXQN/Jfic5cMRD/g0OaGwZIUnxE17XhxvbxuwHZM1U+W19N+96geWt30qPhkUZZ845ZY+AesfhcMBH+J/AJntieXOVNXi4HHs/rI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2110.namprd10.prod.outlook.com
 (2603:10b6:301:35::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 13:22:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Mon, 25 Apr 2022
 13:22:29 +0000
Date: Mon, 25 Apr 2022 16:22:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC V2] drivers/virt/vSMP: new driver
Message-ID: <20220425132209.GO2462@kadam>
References: <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7310EA802697DCDE90EF187581F99@PAXPR02MB7310.eurprd02.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CT2P275CA0032.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:a::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b46cd357-e453-4160-e6e8-08da26bea562
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2110:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1001MB21109B2AE9B1F2C7847666378EF89@MWHPR1001MB2110.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XSaanWZCjEy0fI7Nxey6dkBKXenYU5fR8CLwmINU1wpys039JQ1VTdSU7ujw/K9Kj4oeAicwZDf/280MHcpTVE0Xgh/fesFEJxo3i4fsUshud7UU6+X/h/+/V1x/xNfmSjAstlB3bAwP6W35kR+vHHfgX5I5QT92R2V/slfqjlLFBu7UliUbSzQtHcp+9k5BGv8OlFg7LJ6gKlzCdIEjifRLhV3XjD5UBBPsXHwb7zYEC/+xnfIDybRn60r2dAJkSKlb67bI+xqBaR3Aj6dBHwtfJxAW46aJd1eUjE8FKORXN3y2Z7uZkPEWbi1jVMT5EkE5NkV7ZQ+h2gkM2DThKL7VRIYY66B2lwBPBUuOqpM13/J/mgDjpvQV794hC6IKuilVJb94sNk6FDOsmEoNyxR4nCCrOKQWkzyM9YdRBvPy78JL3bLDBieUNHBL9rs34FYX5+F2qWqWxY8taFWi9aQPfFryYFF4QUKJII+NwF3G1rVz4Py6GClH6R5Ll5JUk1ZsjUuVmk65A3uiCy3xuPN3ZVkRLQrcUTrcAfTfy/Yyd+yrjbSDb7L/+GTvIuQvfrhmUBnaXHMZZ9c2KJDzdgavQW5MqslvHBtBnrRhbC1KsvgFVhY9vOpe4LSEN/TMeitssLizP8UxCELJiztabYih7LSu3yhzbmyMEBEJaDOuB3YnrYy/ThO44rpUT7/0XVmV57kqNTvf5vlwKHxxtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(1076003)(8936002)(8676002)(5660300002)(4326008)(52116002)(33716001)(316002)(33656002)(6506007)(26005)(9686003)(44832011)(6512007)(2906002)(508600001)(38100700002)(6666004)(38350700002)(6916009)(54906003)(966005)(6486002)(186003)(66556008)(66946007)(66476007)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cmFTEidfcd1nvunUP1tnQLlQlMB+ZfFEO7cq6m9xAp1sasY9jE7DSmM97WHC?=
 =?us-ascii?Q?/lXFqJNbnTtDg739n4yne9IQSVMumy7qA8qWSm2Cpg/4UEvsL3TLu9vYkFIc?=
 =?us-ascii?Q?aRolUCRMZBeZsxEDazlpXwOmj447wZv0cUPd3u0OvKnsCu5zSb6xFA7xHgK2?=
 =?us-ascii?Q?ePdwGO1gpNdkyQkB+MVDjpPt/ufW/w3a/mdb8x6qBoVD1GMuz3OiYSeFkV/c?=
 =?us-ascii?Q?MPYHQ/RMVtHwmGqFVT4nNrzGbYtVKqG94inYG7fJBCImz9ZEMevIqS0s89g9?=
 =?us-ascii?Q?W9T880xuUvdhep7bwzgxnnjDVhzukaBxooKUjmrLs6AG9GTsP4YipKXjIj0G?=
 =?us-ascii?Q?q3FghND2G4/fkjIZL1UA3nYkylBE4F+HqaBP62Rw4ca020mA+ftvvD2VmJgi?=
 =?us-ascii?Q?QK62F7qeiiooOu622ctkt5s8L5EZwffrTPyDYVDCtTf4PDLFvTbw8mgrkZEy?=
 =?us-ascii?Q?9GXpVQZAYkVWrHoM/yUswVu53ojPys+xJvmVp5RJMouX5djcSvQJNPwLJSql?=
 =?us-ascii?Q?cgox9zR0WRMRi5gjY0JkizRb/pHmPGT0+xoY3H5anbQ5uS6H8ohvW6CPZw5v?=
 =?us-ascii?Q?dnfPamuTAsRqolBBHqwg9ptMCdR0ezSfAMV/u1UXP2r6hDLeoBAIXTju11Ru?=
 =?us-ascii?Q?lowVdsYsJj8Trl3Ws9XnLJifCpuvM4lNqrfxteIMVfIv5SI0Txgyb/zEmvcI?=
 =?us-ascii?Q?OZv79AYk32p+ai4LbqXlW9v9VHCNuRkUmV1947oDgUr58SLYZtL/aluAcHnD?=
 =?us-ascii?Q?t2LCGduUoSqHFvk3L/fbO3YpaYeys9pRH9ksnB1bZ1v/pZDWYsVscQ3BSHta?=
 =?us-ascii?Q?jKz/P72WC1tqvDAMuN5lMR1y+XxuIL/7pw/42GQyWYTJTtqSBJaL/Y6nn6kB?=
 =?us-ascii?Q?wgAE//m1LwBEmjHfEXVCdJnAFCzD3IHsbbKMbmUYFa/YACtmsS1lcLnKsqnW?=
 =?us-ascii?Q?ui1j+zpFpVgPYJG6EvgFbKeQ+xpcDg3LNvdrjAsvhzygoo8Loo8AcLA8mXrf?=
 =?us-ascii?Q?az69WiPhE5Bm619l/IHPAQMenHYochaGEPRsCiP1VickUnqR5HrcHHbDkOA7?=
 =?us-ascii?Q?KKRKW1uugexlezpVG01P5izobSGfiPCEYK9Tx5cEHQ4CDiuvpYPWltieq/r4?=
 =?us-ascii?Q?BRgLY6J4zL6zXLKR4W+OR10EBVcOrkyawi9MxfnAdcgPQtdqoO9NK5kDfdaN?=
 =?us-ascii?Q?7Ay0jgI1z6LHgqTpA8BMZLiUk3+7wHz5KzwxdvAqEUyWXqhl6n2sTuvpycCi?=
 =?us-ascii?Q?N7Mb+2j/LeGMQ9vFQPc/376mejyd19go5CTklnWqRBEb8FU/6moV8Uc4aDs7?=
 =?us-ascii?Q?7Q4phtgvu1MBzUxGbFcunjw6dv+clGVK/jx9ZGZRD4lLFB3XrPIROCeC92cd?=
 =?us-ascii?Q?OIcbEBYI0heXmi/K0MJjd1Y5NUd9S75ovwD3Wz0ghvI0JdceDiAl6SsxeXBT?=
 =?us-ascii?Q?2kfEUC7e0kzm7tmhN7rsrUrpafsYebbfz1UwOpOQhjH1RKrGM0jA0ITc0Y0Z?=
 =?us-ascii?Q?+wJe8B9Huvhlg9hsObYs/1uwCzcjETlm52S+g04MhXTDjNlk/2bI+FzjQ0Nd?=
 =?us-ascii?Q?aZ/8CVmTCtknD5c3+ILYMfyDDA16PCmv0vfVeMzZfLm3McwQ8NSsaTol6vBt?=
 =?us-ascii?Q?kNKau/zBFzAHZERCMadEsCrD/7vwGsa5rGFz9d4k3ORkcn7naMvTj1tzjeJ8?=
 =?us-ascii?Q?SRY0piWDjvUBU+dOEsbGgkxNsxVv52ePXbEqW/Q4K0hGmDok1y7R4uBKjuym?=
 =?us-ascii?Q?m2YBUK5pX2bZsEF0lmtNEytoeM8ftaM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46cd357-e453-4160-e6e8-08da26bea562
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:22:29.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Rm3xSnLY7T3byph99KLOVVQK3xtLFb28/rCwFjTh06/4cbO6ZXp/G1aptzU4JtsHjPfZMuPT9/6ybvtvYyWnMCtNeX7k6Oqvu4EtNQCQG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2110
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-25_06:2022-04-25,2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250059
X-Proofpoint-GUID: 0IwTXxwT0MhtovDuaiCdf3i_cgbmaHUG
X-Proofpoint-ORIG-GUID: 0IwTXxwT0MhtovDuaiCdf3i_cgbmaHUG

On Sun, Apr 24, 2022 at 11:44:33AM +0000, Czerwacki, Eial wrote:
> +u64 vsmp_read_reg_from_cfg(u64 reg, enum reg_size_type type)
> +{
> +	u64 ret_val;
> +
> +	switch (type) {
> +	case VSMP_CTL_REG_SIZE_8BIT:
> +		ret_val = readb(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_16BIT:
> +		ret_val = readw(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_32BIT:
> +		ret_val = readl(cfg_addr + reg);
> +		break;
> +
> +	case VSMP_CTL_REG_SIZE_64BIT:
> +		ret_val = readq(cfg_addr + reg);
> +		break;
> +
> +	default:
> +		printk(KERN_ERR "unsupported reg size type %d.\n", type);
> +		ret_val = (u64) -EINVAL;

This error code gets truncated to a u16 or whatever so it doesn't work.
It's dead code anyway, right?  Just return zero.

> +	}
> +
> +	dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%llx from reg 0x%llx of %d bits\n",
> +		__func__, ret_val, reg, (type + 1) * 8);
> +	return ret_val;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);

[ snip ]

> +
> +/*
> + * deregister the vSMP sysfs object for user space interaction
> + */
> +void vsmp_deregister_sysfs_group(const struct bin_attribute *bin_attr)
> +{
> +	if (vsmp_sysfs_kobj && bin_attr)
> +		sysfs_remove_bin_file(vsmp_sysfs_kobj, bin_attr);
> +}
> +EXPORT_SYMBOL_GPL(vsmp_deregister_sysfs_group);
> +
> +/*
> + * generic function to read from the bar
> + */
> +ssize_t vsmp_generic_buff_read(struct fw_ops *op, u8 bar, u64 reg,
> +			       char *buf, loff_t off, ssize_t count)
> +{
> +	ssize_t ret_val = 0;
> +
> +	if (op->buff_offset >= op->hwi_block_size) {	// perform H/W op
> +		vsmp_reset_op(op);
> +
> +		ret_val = vsmp_read_buff_from_bar(bar, reg, op->buff, op->hwi_block_size, false);
> +		if (ret_val) {
> +			printk(KERN_ERR "%s operation failed\n",
> +			       (op->action == FW_READ) ? "read" : "write");

This read vs write is weird.  We're in a read function.  Also it's
always read.

> +		}
> +		op->buff_offset = 0;
> +	}
> +
> +	if (ret_val)
> +		return ret_val;
> +
> +	return memory_read_from_buffer(buf, count, &op->buff_offset, op->buff, op->hwi_block_size);;
> +}
> +EXPORT_SYMBOL_GPL(vsmp_generic_buff_read);

[ snip ]

> +
> +/*
> + * init the common module
> + */
> +static int __init vsmp_common_info_init(void)
> +{
> +	int ret_val = -0, i;
                      ^^
Negative zero?


> +
> +	for (i = 0; (i < ARRAY_SIZE(cbs_arr) && !ret_val); i++) {
> +		ret_val = cbs_arr[i].reg_cb();
> +		if (ret_val) {
> +			printk(KERN_ERR "failed to init sysfs entry %d (%d), exiting.\n",
> +			       i, ret_val);
> +		}
> +	}
> +
> +	return ret_val;
> +}

[ snip ]

> +
> +/*
> + * this is the maximal possible length of the version which is a text string
> + * the real len is usually much smaller, thus the driver uses this once to read
> + * the version string and record it's actual len.
> + * from that point and on, the actual len will be used in each call.
> + */
> +#define VERSION_MAX_LEN (1 << 19)
> +
> +static struct fw_ops op;

Greg already complained about globals, but this one is particularly bad
because there is no locking so it will lead to corruption.

> +
> +static ssize_t version_read(struct file *filp, struct kobject *kobj,
> +			    struct bin_attribute *bin_attr,
> +			    char *buf, loff_t off, size_t count)
> +{
> +	s64 reg_val = vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);
> +	ssize_t ret_val;
> +
> +	if (reg_val < 0) {
> +		printk(KERN_ERR "failed to value of reg 0x%x\n", VSMP_VERSION_REG);
> +		return 0;
> +	}
> +
> +	ret_val = vsmp_generic_buff_read(&op, 0, reg_val, buf, off, count);
> +	if (ret_val < 0) {
> +		printk(KERN_ERR "failed to read version (%ld)\n", ret_val);
> +		return 0;
> +	}
> +
> +	buf[ret_val++] = '\n';

You need to consider "count" before you print the newline.  #corruption.

> +
> +	return ret_val;
> +}
> +
> +struct bin_attribute version_raw_attr = __BIN_ATTR(version, FILE_PREM, version_read, NULL, VERSION_MAX_LEN);
> +
> +/*
> + * retreive str in order to determine the proper length.
> + * this is the best way to maintain backwards compatibility with all
> + * vSMP versions.
> + */
> +static ssize_t get_version_len(void)
> +{
> +	ssize_t ret_val = 0;

This assignment is never used.  It just disables static analysis for
uninitialized variables and invites bugs.

> +	u64 reg_val;
> +	char *version_str = kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __GFP_NOWARN);
> +
> +	if (!version_str) {
> +		printk(KERN_ERR "failed to allocate buffer\n");
> +		return -ENOMEM;
> +	}
> +
> +	reg_val = vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);
> +	if (reg_val < 0) {
> +		printk(KERN_ERR "failed to value of reg 0x%x\n", VSMP_VERSION_REG);
> +		return 0;
> +	}
> +
> +	memset(version_str, 0, VERSION_MAX_LEN);
> +	ret_val = vsmp_read_buff_from_bar(0, reg_val, version_str, VERSION_MAX_LEN, true);
> +	if (ret_val) {
> +		kfree(version_str);
> +		printk(KERN_ERR "failed to read buffer from bar\n");
> +		return ret_val;
> +	}
> +	kfree(version_str);
        ^^^^^^^^^^^^^^^^^^


> +
> +	return strlen(version_str);
               ^^^^^^^^^^^^^^^^^^^
Use after free.  Try running Smatch against your code to detect these
bugs.

https://staticthinking.wordpress.com/2022/04/25/how-to-run-smatch-on-your-code/


> +}
> +
> +/*
> + * register the version sysfs entry
> + */
> +int sysfs_register_version_cb(void)
> +{
> +	ssize_t len = get_version_len();
> +	int ret_val;
> +
> +	if (len < 1) {
> +		printk(KERN_ERR "failed to init vSMP version module\n");
> +		return len;

What if len is zero?  (Please return a proper error code).


> +	}
> +	version_raw_attr.size = len;
> +
> +	if (vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {
> +		printk(KERN_ERR "failed to init vSMP version op\n");
> +		return -ENODEV;
> +	}
> +
> +	ret_val = vsmp_register_sysfs_group(&version_raw_attr);
> +	if (ret_val) {
> +		printk(KERN_ERR "failed to init vSMP version support\n");
> +		vsmp_release_op(&op);
> +	}
> +
> +	return ret_val;
> +}
> +

[ snip ]

> +
> +/* module functions */
> +static ssize_t active_log_read(struct file *filp, struct kobject *kobj,
> +			       struct bin_attribute *bin_attr,
> +			       char *buf, loff_t off, size_t count)
> +{
> +	ssize_t ret_val = 0;
> +
> +	if (!op.in_progress) {
> +		ret_val = mutex_lock_interruptible(&active_log_mutex);
> +		if (ret_val) {
> +			printk(KERN_ERR
> +			       "error in atemmpt to lock mutex (%lx)\n",
> +			       ret_val);
> +			return 0;
> +		}
> +
> +		vsmp_write_reg16_to_cfg(VSMP_LOGS_CTRL_REG,
> +					vsmp_read_reg16_from_cfg
> +					(VSMP_LOGS_CTRL_REG) | LOGS_MASK);
> +		op.in_progress = true;
> +		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG, 0);
> +	}
> +
> +	if (vsmp_op_buffer_depleted(&op)) {
> +		if (!(vsmp_read_reg16_from_cfg(VSMP_LOGS_CTRL_REG) & LOGS_MASK)) {
> +			vsmp_reset_op(&op);
> +			op.in_progress = 0;
> +			mutex_unlock(&active_log_mutex);
> +			return ret_val;
> +		}
> +	}
> +
> +	ret_val = vsmp_generic_buff_read(&op, 1, active_log_start, buf, off, count);
> +	if (ret_val < 0) {
> +		printk(KERN_ERR "error reading from buffer\n");
> +		mutex_unlock(&active_log_mutex);
> +		return 0;

return ret_val;

> +	}
> +
> +	if (vsmp_op_buffer_depleted(&op)) {
> +		vsmp_write_reg64_to_cfg(VSMP_LOGS_STATUS_REG,
> +					~0LL & ~(1LL << 0));
> +	}
> +
> +	return count;

This isn't correct necessarily.  It should be something like

	return min(count, ret_val);

> +}

regards,
dan carpenter
