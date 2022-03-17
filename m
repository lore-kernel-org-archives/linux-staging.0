Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3894352
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 13:56:50 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22HDPNQt007230;
	Thu, 17 Mar 2022 13:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=S98yNmfWC5JdETJKOK6FxI2SVoWLxMWEApKIZ4wFkhE=;
 b=tzONSzCf6kLxiB/UTbx1CZBIuu828YdGLRuLW5cil53ftw1jbAKVp0CseeR/TmgacBjH
 1bD/rOzwB+oUcH8Z+i8XJilx9mwNP3Co+yTspHkf0huM17wAREHQuGAESwr4VNt7NDy8
 /6DQpFM0fsPHsaBuo6/uXA8BdKA0l8Qf+Q98OmjC6i9N7j1eKstj04YC4jNPqWoILjNm
 PmWy8XFCktLvQAiutzexlrN2U9nB9i6IFga6cbyRweCFFT54dtFH7BBlstJHEf5r4bpU
 yX35HJ6SxKBOwaFnKSsHukKxRfr0MIRjy5ETU6Bwq7n6SVMdYeP+5rWRt1Td2htTFRdQ WA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3et60rh3us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Mar 2022 13:56:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22HDuEHM134356;
	Thu, 17 Mar 2022 13:56:48 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
	by userp3020.oracle.com with ESMTP id 3et659hcrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Mar 2022 13:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6is8/jPKXIsnV7uhVaKKMJPVGu1vjhxN2qKNM/FrglLFnz1us09usvXLGKkouMLhwRR52n/N/WuBqDIvrc8eo5IT+nPLliI5nB4CRIPgk+T5T9iao84hJS2wHJ9lmgS8b9MYDNOown+n8PxqLbz9hiyRIxk0JPdlQX9cKrma6o5/YqACvB+cWcDtql3SGiUB1k3j3Az4+ECzUYfZmcbbAfDY0BMj8Urow0MmUAjwRuk9rGFXln5Amea17ofypA/uwER1gR0OfZ3d1RBBcFXsAX8wXag+zkyDmZjupeUmo0mzaXLnZ8Gd2jzjsUF+tOvJ36Vh3H61aemqaldCXCNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S98yNmfWC5JdETJKOK6FxI2SVoWLxMWEApKIZ4wFkhE=;
 b=guzqN9d01/WqVoBic4ZsnvdSQQ4uc7hrX423U1b5ccuMnyydUpqjz82QsYoPdAmuQP6FSe4WJx0CVMbg8EIQq0PzxvkjqncuHJT4dbN9p4pCl9/y3m4RbeGdhQ+1eAzFVf0VqiBZjgljmVWWIOWrC/F1nSWLT3CsBYeDWI/hpfIGufmOk5ZxFEy75lyqu4mWq1OLwe0n5lfaWS0o5hsRZPF6eGmHOpLPaWNnG/cAHDJYzXlH/jBpUvGszey93VG9fMCrsr4TW6Psy/5Wz+XhlWSUuuseEsYYrne+foiW1Cip2egM4sLgOOwvFd7TRUWQdEVda5bu3SXtaWSZgAlvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S98yNmfWC5JdETJKOK6FxI2SVoWLxMWEApKIZ4wFkhE=;
 b=o4VXazwQgp3WRvoCUkWLbyNlxANazTJynpB9xBDpFesE3QyJa/5+1HzXcuvTyJ3AIeeF+mDId2hCYdwkr7HuGjlR53TCMSwpkycVK7kiUNrDKBFed2ALqySX35dLz4F8Ap02IWNy7YwuEFStVJy1PijUg7Tb6jHchqB+l9CUcss=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3305.namprd10.prod.outlook.com
 (2603:10b6:5:1a2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Thu, 17 Mar
 2022 13:56:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 13:56:45 +0000
Date: Thu, 17 Mar 2022 16:56:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <20220317135628.GC3293@kadam>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <20220317101942.GX3293@kadam>
 <PAXPR02MB73109408A4070F19F34AD7D181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB73109408A4070F19F34AD7D181129@PAXPR02MB7310.eurprd02.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::27)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 190469d5-5c0c-45a0-d5d9-08da081df917
X-MS-TrafficTypeDiagnostic: DM6PR10MB3305:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB330567E09160A6156B71249E8E129@DM6PR10MB3305.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IgCHwZz1QpxY9iB5XKD1/1EnSYGUTIEQd5UdaDf7QHXnHt/kOd2BlhQLq7MRJniEFOUcXlz94mEUcwxat7lFPnihrP4iqTKMlQdZKdcZ6b6G/5ztGbRt51cKZeFORC8yTho7umPlBDr/plW8DCgIwK6TEYQ3PhLC6p7JNNDdzVlmT6381CqdKZAIScJZRswEPvfsySWomQVFgw6DZAjAzQDImXgNNkpUrWdnkI9EClDIrHQSZLhRORefB0hyMTVxge2XBOHXBay9ZGsYl1k5+uF1YPowoT6U02vWh76G29w7cXh2pO6Y3h7TsPqOU1lDo5D6tlOHReTsWL+a3H+9sOdaldVVpg/EK2JVtJQYsnm2Y50sKxgyEzgLmsrqB5jVyZjdTKjizxXgdB2u60ZLi3R+Ujp9eH822MBM3WIHyBL1zg0m+H2G9QZwYCVB75C7Osh2CpFEtkNBKb7wO2GWbgJBIcXvcj4YdA4GknZjKZgdx9RFtgRVnDvgT5wfCpwcC946bm66Cf8b8u7wyWOmA5IKfpPptkDkab7AL9aFVOisASmvRKtxE5xWQHH6Ef/hasi0ci78PLy6M5gk+iVpLRS0fct5j3/Lah41ef60IM2QSrZuWFno3TIOcGaNnn+QtYw6yEk1ldWiL6ew77IfnnfzXR+bCPANzNU6EHkIy1Erb2gGG+T4i+CBF+p2cNqiTMejav6WVAWNZ8WOlwYGPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(9686003)(6666004)(6916009)(52116002)(54906003)(6512007)(4326008)(316002)(33716001)(38100700002)(33656002)(38350700002)(8676002)(6486002)(66476007)(66946007)(6506007)(66556008)(508600001)(86362001)(5660300002)(44832011)(8936002)(83380400001)(1076003)(26005)(186003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5etq97GbvLKvlSJqW0OXNO+3qujYJ8kCJxWAJ4cW13ot99m6W3jzjXB5bl8O?=
 =?us-ascii?Q?k4F0tn6VpwhUJxMMjKc+wPm79gpQDpFDX6rJ4P4U/UbAhvlelXsQkN4E0Sug?=
 =?us-ascii?Q?Vj3ARnpTASrc+KnKAXx+Z7Nr53w3UJIMFTEZhDLDwtorr30Wd3gjfvNj5j7R?=
 =?us-ascii?Q?VJTX46FdrnYidtv4hmeh6oiATbfw6lJ4JmaS73izkByDHYTclhi4MLQxi4f1?=
 =?us-ascii?Q?ARSaN24iwZVMiGlmHerI7ZVFKpxnsF2ell7t2s/uI8yhH/fn6Nse73OP1sw5?=
 =?us-ascii?Q?JuoT5VykEKtjlituUV2/vQNltoTtAB3wCOKm6nY8CqrPJdDRhvu/sluUw7qc?=
 =?us-ascii?Q?E9ZwIE2mDfkJwYzvuwSaxikhLWgsGnfdCQOpZQ16OpQ1pdrTNsesnazIwera?=
 =?us-ascii?Q?fiPaNLy5UO1tMNvde4LOU+p1pjd3y2+4T85LVxu3C7Hx337sEnEepJKA6zB+?=
 =?us-ascii?Q?r+iKl4wM7QmEvNk3ZfLL/3FYrENvFZAii+Ee7AitudwgqWXZOTVyekrxGuCD?=
 =?us-ascii?Q?h7j8OkiVMkWoo0OQrnIxLVGP1Yy9Y45BDFmOkB9H/bT5pGgAo1weD/K46pTh?=
 =?us-ascii?Q?eUq5kqKAumn3ccq7/fnQ9Z1/dlfVgp2TChbK19UaUcwrfOE9ROuziQjM/+0R?=
 =?us-ascii?Q?qSfMHLEqvIrpBLKvuRrIlFWc1UEmpgZSSCczmpaL5GMeq/IUogoUdtDTzH2Z?=
 =?us-ascii?Q?ROPC4Oeg9R8QbrhBmYUVrX5r06TRKEdp/9nfghHWqbFWu2ZhOA20F5UNCDr2?=
 =?us-ascii?Q?xMFXXWG+ixRxFmzfdapjW9kbN6dPGl2abun5Xat1DV9fA4eeKHQ7OCNFoSBh?=
 =?us-ascii?Q?lCRUquEaySaYjMAy7Rp3rsyRRY9s0ko1d71eUb8FUhdMgpTUPHDmHlMLsqIJ?=
 =?us-ascii?Q?stMMUtDKPYGjwKqtRQhhFGy2OoAZCq6Je3W1dZVwD5JpLF3NETqBAv1HCdzv?=
 =?us-ascii?Q?kUSSNaXuE4cVKB2HoQw/74nyuaUx9wc7mdIwvXZLjRrasdCKPxGJKeVgE2zc?=
 =?us-ascii?Q?fuJGC6F5VoO7eXsdWGK5quVpZapMFsBPCj1HLOUwKu8UqrU2MExHelmqbyGh?=
 =?us-ascii?Q?c2meYCPX9faFRloGkOMONQOZPLHumtgEbQtsepYWH9jvAg8jAbDmqTg0EbB3?=
 =?us-ascii?Q?iCQEKmDfc9hTD24oU0YeCuI98suSzgy75w4knisPWaGn+54loX35JKaegm4m?=
 =?us-ascii?Q?7BZJr5YKwIM5jOynUmzdHq9DoOxXvDkzavFvvZwIg07P3J0fDBftaP15JWa/?=
 =?us-ascii?Q?0/rbv4jGpkjptEFB8fL12wFu5zqMCSg1mEWCTIVM9hgilEka4mhw9fYRHhya?=
 =?us-ascii?Q?f8qPBeo0KmVs+VWJ/+6v3TiWwKKuXNrMHL0PAvnrQHgZhR9ohgueg+/6SR8j?=
 =?us-ascii?Q?hmpil5k7fwZyb4ZYiZj2VUeB+C1MJ6GxiXU6HI9z4iWTNfjc/pi9xLYP+BBL?=
 =?us-ascii?Q?0xBr/6SRrziu60np10lUFbtgM4IeVQLdiu7JqDewzyTcnFTyUBqGDA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190469d5-5c0c-45a0-d5d9-08da081df917
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:56:45.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUM2RkT4R8eDKeQ/APbqLr2r/sDCa4K+CY9DXsgLuU4FAvC01G9L9klDBS0aPZUTGPYR70tW3hZTBydglS+OFpwdHa6rumbChdBDVvwyJjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3305
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170082
X-Proofpoint-GUID: SxceXcK4U6In7_-k0rfZ81YPV2MEBMMZ
X-Proofpoint-ORIG-GUID: SxceXcK4U6In7_-k0rfZ81YPV2MEBMMZ

On Thu, Mar 17, 2022 at 01:41:30PM +0000, Czerwacki, Eial wrote:
> >> +     printk(KERN_INFO "mapping bar 0: [0x%llx,0x%llx]\n",
> >> +            mapped_bars[0].start, mapped_bars[0].start + mapped_bars[0].len);
> >> +     cfg_addr = ioremap(mapped_bars[0].start, mapped_bars[0].len);
> >> +
> >> +     if (!cfg_addr) {
> >
> >Delete the blank link between the call and the error checking.  They are
> >part of the same thing.
> did you meant line?
> 

What I mean is that it's like paragraphs.

	cfg_addr = ioremap(mapped_bars[0].start, mapped_bars[0].len);
	if (!cfg_addr)
		return -ENOMEM;

The call and the check go together.

> >
> >> +             printk(KERN_ERR
> >> +                    "failed to map vSMP pci controller at %x:%x.%x, exiting.\n",
> >> +                    vsmp_bus, vsmp_dev, vsmp_func);
> >> +             return -1;
> >> +     }
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +/* exported functions */
> >> +
> >> +/**
> >> + * read a value from a specfic register in the vSMP's device config space
> >> + */
> >> +unsigned long vsmp_read_reg_from_cfg(unsigned int reg, enum reg_size_type type)
> >
> >
> >Use u64 when 64 bit types are intended.
> >
> >> +{
> >> +     unsigned long ret_val;
> >
> >
> >u64 ret_val;
> sure
> 
> >
> >> +
> >> +     switch (type) {
> >> +     case VSMP_CTL_REG_SIZE_8BIT:
> >> +             ret_val = readb(cfg_addr + reg);
> >> +             break;
> >> +
> >> +     case VSMP_CTL_REG_SIZE_16BIT:
> >> +             ret_val = readw(cfg_addr + reg);
> >> +             break;
> >> +
> >> +     case VSMP_CTL_REG_SIZE_32BIT:
> >> +             ret_val = readl(cfg_addr + reg);
> >> +             break;
> >> +
> >> +     case VSMP_CTL_REG_SIZE_64BIT:
> >> +             ret_val = readq(cfg_addr + reg);
> >> +             break;
> >> +
> >> +     default:
> >> +             printk(KERN_ERR "unsupported reg size type %d.\n", type);
> >> +             ret_val = (unsigned long)(-1);
> >
> >
> >64 bit types.  "ret_val = -1ULL;"
> >
> >
> >> +     }
> >> +
> >> +     dev_dbg(&vsmp_dev_obj->dev, "%s: read 0x%lx from reg 0x%x of %d bits\n",
> >> +             __func__, ret_val, reg, (type + 1) * 8);
> >> +     return ret_val;
> >> +}
> >> +EXPORT_SYMBOL_GPL(vsmp_read_reg_from_cfg);
> >> +
> >> +/**
> >> + * write a value to a specfic register in the vSMP's device config space
> >> + */
> >> +void vsmp_write_reg_to_cfg(unsigned int reg, unsigned long value,
> >> +                        enum reg_size_type type)
> >> +{
> >> +     switch (type) {
> >> +     case VSMP_CTL_REG_SIZE_8BIT:
> >> +             writeb((unsigned char)value, cfg_addr + reg);
> >> +             break;
> >> +
> >> +     case VSMP_CTL_REG_SIZE_16BIT:
> >> +             writew((unsigned short)value, cfg_addr + reg);
> >> +             break;
> >> +
> >> +     case VSMP_CTL_REG_SIZE_32BIT:
> >> +             writel((unsigned int)value, cfg_addr + reg);
> >> +             break;
> >> +
> >> +     case VSMP_CTL_REG_SIZE_64BIT:
> >> +             writeq(value, cfg_addr + reg);
> >> +             break;
> >> +
> >> +     default:
> >> +             printk(KERN_ERR "unsupported reg size type %d.\n", type);
> >> +     }
> >> +
> >> +     dev_dbg(&vsmp_dev_obj->dev, "%s: wrote 0x%x to reg 0x%x of %u bits\n",
> >> +             __func__, reg, reg, (type + 1) * 8);
> >> +}
> >> +EXPORT_SYMBOL_GPL(vsmp_write_reg_to_cfg);
> >> +
> >> +/**
> >> + * reag a buffer from a specific offset in a specific bar, maxed to a predefined len size-wise from the vSMP device
> >> + */
> >> +unsigned int vsmp_read_buff_from_bar(unsigned int bar, unsigned int offset,
> >
> >This is unsigned int but it returns zero or negative error codes.
> >
> >Create a separate function for "halt_on_null".  It will be cleaner that
> >way.
> I'll refractor this code properly.
> 
> >
> >> +                                  char *out, unsigned int len,
> >> +                                  bool halt_on_null)
> >> +{
> >> +     unsigned char __iomem *buff;
> >> +
> >> +     BUG_ON(!mapped_bars[bar].start);
> >> +     BUG_ON(ARRAY_SIZE(mapped_bars) <= bar);
> >> +     BUG_ON((offset + len) > mapped_bars[bar].len);
> >> +
> >> +     buff = ioremap(mapped_bars[bar].start + offset, len);
> >> +     if (!buff)
> >> +             return -ENOMEM;
> >> +
> >> +     if (halt_on_null) {
> >> +             int i;
> >> +             unsigned char c;
> >> +
> >> +             for (i = 0; i < len; i++) {
> >> +                     c = ioread8(&buff[i]);
> >> +                     if (!c)
> >> +                             break;
> >> +                     out[i] = c;
> >
> >Copy the NUL terminator to out[i] before the break.
> >
> should I memset out to zero instead?

Right now you're relying on the caller to set the NUL terminator and
that's ugly.  Just do:

		for (i = 0; i < len; i++) {
			c = ioread8(&buff[i]);
			out[i] = c;
			if (!c)
				break;


> 
> >> +             }
> >> +     } else
> >> +             memcpy_fromio(out, buff, len);
> >> +
> >> +     iounmap(buff);
> >> +
> >> +     return 0;
> >> +}

[ snip ]

> >> +static ssize_t version_read(struct file *filp, struct kobject *kobj,
> >> +                         struct bin_attribute *bin_attr,
> >> +                         char *buf, loff_t off, size_t count)
> >> +{
> >> +     ssize_t ret_val = vsmp_generic_buff_read(&op, 0,
> >> +                                              vsmp_read_reg32_from_cfg(VSMP_VERSION_REG),
> >> +                                              buf, off, count);
> >
> >Don't put functions which can fail in the declaration block.
> >
> >        ret_val = vsmp_generic_buff_read(&op, 0,
> >                                         vsmp_read_reg32_from_cfg(VSMP_VERSION_REG),
> >                                         buf, off, count);
> >
> can you explain what is the reason behind this recommendation?
> 

That's just my own preference, not really a rule.  I stole that
guideline from someone else.  I forget who.  But it's a fact that the
declaration block is more bug prone than other code.  (Very clean in
static analysis results).  Plus it means that you put a blank line
between the call and the check which I do not like (again just my
preference).


> >> +
> >> +     if ((ret_val != -ENOMEM) && ((ret_val != -EINVAL)))
> >
> >Don't test for specific error codes.
> >
> >        if (ret_val < 0)
> >                return ret_val;
> >
> >
> now I understand, there was a patchset which fixes for all the -1 and the specific ret_val testing, I see it
> was misplaced at some point of the work.
> thanks for pointing it out
> 
> >> +         buf[ret_val++] = '\n';
> >> +
> >> +     return ret_val;
> >> +}
> >> +
> >> +struct bin_attribute version_raw_attr = __BIN_ATTR(version, FILE_PREM, version_read, NULL, VERSION_MAX_LEN);
> >> +
> >> +/**
> >> + * retrive str in order to determine the proper length.
> >> + * this is the best way to maintain backwards compatibility with all
> >> + * vSMP versions.
> >> + */
> >> +static int get_version_len(void)
> >> +{
> >> +     unsigned reg;
> >> +     char *version_str = kzalloc(VERSION_MAX_LEN, GFP_ATOMIC | __GFP_NOWARN);
> >
> >VERSION_MAX_LEN is 524288 bytes.  That's too long.  Create a small
> >buffer and loop over it until you find the NUL terminator.  Why does
> >this need to be ATOMIC, are we holding a lock?  Hopefully if we can fix
> >the length the __GFP_NOWARN will be unnecessary.
> I'm not sure it is possible to loopover, I'll take that into consideration.
> in this flow, only one access is possible, so I assume GFP_ATOMIC is not needed
> 

This get_version_len() is cray cray...  It needs to loop.

> >
> >> +
> >> +     if (!version_str)
> >> +             return -1;
> >> +
> >> +     reg = vsmp_read_reg32_from_cfg(VSMP_VERSION_REG);
> >> +     memset(version_str, 0, VERSION_MAX_LEN);
> >> +
> >> +     if (vsmp_read_buff_from_bar(0, reg, version_str, VERSION_MAX_LEN, true)) {
> >> +             printk(KERN_ERR "failed to read buffer from bar\n");
> >> +             return -1;
> >> +     }
> >> +
> >> +     version_raw_attr.size = strlen(version_str);
> >
> >get_version_len() should return the length instead of setting a global.
> do you mean version_raw_attr.size = get_version_len()?
> 

Yes, but with negative error codes.

> >
> >> +     kfree(version_str);
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +/**
> >> + * register the version sysfs entry
> >> + */
> >> +int sysfs_register_version_cb(void)
> >> +{
> >> +     if (get_version_len()) {
> >> +             printk(KERN_ERR "failed to init vSMP version module\n");
> >> +             return -1;
> >> +     }
> >> +
> >> +     if (!vsmp_init_op(&op, version_raw_attr.size, FW_READ)) {
> >
> >This if statement is reversed so this code can never work.
> not sure I follow, can you explain?
> 

The vsmp_init_op() function returns zero on success and this code treats
success as failure.

> >
> >> +             printk(KERN_ERR "failed to init vSMP version op\n");
> >> +             return -1;
> >> +     }
> >> +
> >> +     return vsmp_register_sysfs_group(&version_raw_attr);
> >> +}

regards,
dan carpenter

