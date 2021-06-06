Received: from CAN01-QB1-obe.outbound.protection.outlook.com (mail-eopbgr660089.outbound.protection.outlook.com [40.107.66.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A270
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 07:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rn7f77ri4zB+OgRkmRTKMpk2kAIVPxP4HkmdCLjP7cAnols+LliOwSk0iMFB029asrDS+lh46TscxugjzXWukOb0E0aG7WicJ44/jwNuZ/x68xctOLroGYblXzDZBjZQsXutKvs6gKTYUdbQRhuzOF5UfgMK073xy6T9PPiPYXhzWwvyFJVUHW1+eQfVFOptDu6w7+bKgXrZMJ3TdFwfKup+ewEl9Ete7qs4xPEuVngvV/e1lflSaXh9xlUL7IP+EJKs7niqRA4zPYIN6aLRp5Jcg/I3vJh1g73bgt1r0ltQwy04tjj8rh62nAhEnylvYhnNLUBerllTE48f+0a1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X46hjLiGsEx0qUDCCQ2XQ1npprGN9PETAX3OKH9OIBo=;
 b=g/WGsm4FtOU8KTJRpz6vh6f0cEY551lh3F3AGChVSdqButYBI/gvk3Vdzfhw9O6Am4F8Jl42BQwHUB6oh+mEpF03ZkoeFEeEk5lKVslrPWl7DeRzLtuQWe/y2pIcsHYVNRhayL5UfjhVL1K6SYkAjJewF3sw8mMiTLyuhYPN2F+tG+gkON9c9pCX3pQNvbu29PIypXNuXKiaKzFIed0Q9loY+zW/QLCnjkvV3MQA3hUMUsd1M+N30wDLUdqPFOldrLS8++hEJL2tz0QG9v87sShDac8zAtq1jgWKxIJppUcTzbRO1L6VxP5xb9H09acuCFspR7cPpl0EbXWgA587Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ucalgary.ca; dmarc=pass action=none header.from=ucalgary.ca;
 dkim=pass header.d=ucalgary.ca; arc=none
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none
 header.from=ucalgary.ca;
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4a::23)
 by YQBPR0101MB1074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Sun, 6 Jun
 2021 07:51:48 +0000
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:8466:4635:4b35]) by YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:8466:4635:4b35%7]) with mapi id 15.20.4173.037; Sun, 6 Jun 2021
 07:51:48 +0000
X-Gm-Message-State: AOAM531tFXxy8WPfTDzmRrGeg2LjM9BS78DBZZFJiIaVw1OUxP8TPfIC
	kteeSgzXnrCxeJbvHCqQl8OL5ZCV6Tbp75uYBPk=
X-Google-Smtp-Source: ABdhPJwgbWxir12ZE8NTmOXcY/D3mUeB/dnQldIYRZH8GX09Bh9I56+Cn0CCWjlQFmeOO9sUFaQuC2e2O7b0tVSgilo=
X-Received: by 2002:a05:6214:1788:: with SMTP id ct8mr12599598qvb.0.1622965906793;
 Sun, 06 Jun 2021 00:51:46 -0700 (PDT)
References: <20210606070021.116284-1-wlooi@ucalgary.ca> <YLx1oWQAFPYIFRkF@kroah.com>
In-Reply-To: <YLx1oWQAFPYIFRkF@kroah.com>
From: Wenli Looi <wlooi@ucalgary.ca>
Date: Sun, 6 Jun 2021 00:51:35 -0700
X-Gmail-Original-Message-ID: <CAKe_nd2q8caqND=z9Pq7Me_BtyuCd2-Nb_xyepsjDkaPkC8Few@mail.gmail.com>
Message-ID: <CAKe_nd2q8caqND=z9Pq7Me_BtyuCd2-Nb_xyepsjDkaPkC8Few@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Fix uninitialized variable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [209.85.219.53]
X-ClientProxiedBy: BL1PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:208:256::24) To YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:4a::23)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-qv1-f53.google.com (209.85.219.53) by BL1PR13CA0019.namprd13.prod.outlook.com (2603:10b6:208:256::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.10 via Frontend Transport; Sun, 6 Jun 2021 07:51:48 +0000
Received: by mail-qv1-f53.google.com with SMTP id c10so4509983qvo.9        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 00:51:48 -0700 (PDT)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e75002d-d0fd-4dd8-0fad-08d928bff04f
X-MS-TrafficTypeDiagnostic: YQBPR0101MB1074:
X-Microsoft-Antispam-PRVS:
	<YQBPR0101MB1074A2E3E7082809D885C465B2399@YQBPR0101MB1074.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EpI/A8J3biolA6nE8kB6nxji6EAIrrnm+7LN98ehCrEg5G8Q4OnKV1JMAKoyooMPWEPTI8Zy6u8O4wq1LRWQ1bPfIjr2RLw4ueZGioPHCOkJyU1TdZqSNDTCZmQYkuYLy9ZtKdohge5wQEMFYBU84T3E1zl1ISkgfiiXvm83llmoFrwCIoEaMDbL4y49EecuuVFH02yi5PuugNsqJNDCQF/tbapZk1TlgeICQCE7J0ukLtLLQt3THl3WZNTS55RegkzH01pZb5qL9BhhyL4Xfdlb4/W6EvmRaf2UicsaQUcdOAcfuGzTPkkRlR0Z2iXxchREHX1mWC5GfSD3oGvoosUKfpixcCGGjraIvXYnIdpLiwjljKbr5jv10fMIlCtETpnnX9t5XOG+xbuNJB3EGUcgsH4PTRu3Xp8ygPsdl0hgEY1JyfvPWOEbAv1vl0ONRw/tKmhwUjh9ZYypFz9aGWWyWBMWrpnnXz+sU8xtpbapkWEZ+2YaKO+7ncbd/srWhPML+u2ItG22eYCepelt34KvcuelPhB8kPtpkhmSee8IVGtB33zrTZAHIoCMTndF1V/umXUMlzJBCoRMdoQ6UoVV0m46MZq0ydHatDYK6hAzYXzT7UOUtxaoPrlQmcZqIPhr+lzgOdTirWBZsY2ucg0cw1DbHY6vT6CCYGXUvJ3/DMAm5VEteqXVzJ+HJiBAhVBVyMSHWU8D7HHVD4IuAgFjf40/VGQoRqC2RWax000SNi8AKEIDamef2klqyZxbJOUucxvQ09gbH3X8N4HBI4q6I3fBxRpVgYiI5oFOVji/LdF245qf+GDbJqw4EZLB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(316002)(26005)(86362001)(6862004)(9686003)(66946007)(6666004)(8936002)(42186006)(52116002)(2906002)(83380400001)(186003)(38100700002)(478600001)(38350700002)(55446002)(66476007)(8676002)(66556008)(55236004)(5660300002)(53546011)(107886003)(4326008)(786003)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?QXRsWnJNdHRPL2JEU2lIZXFGM1dKL1A2NUxMNXlTbW5sUDhxSkVtcGVuWkYx?=
 =?utf-8?B?aUVEZDR4UlJsSzZ5bUZ3MEkrbUorMDlnSzNPYTlEQzdRY1FzRkdLM2lQeHJI?=
 =?utf-8?B?b014VTAvQi9xNjRCdGhhcjkwMWc4YVM3bFRyYmFXSHlnajJyc2pQejRiSWlX?=
 =?utf-8?B?bHArcE1qR3g4SkQzT01kWmdvb3NNT1FtTmRMRzRLZEJmSm90Rm9odkdmRXpF?=
 =?utf-8?B?OHZLODhRZzBOQS9mcXh5TW9Xd0FCam9PSUJvTll2bXFkeVZxcWpxam1hclpn?=
 =?utf-8?B?Z1AyZUlvUHNRQ0d3SzFJckswa1ZUbEo1NzNyUzVtdnYvby9vRDdYaUtnWDln?=
 =?utf-8?B?Y0I3cjZTUzUyWGxzR1NJTHJ6YmJnNVh4SXE4Y1RxZkR0VkhNRUJBai9wcFJ3?=
 =?utf-8?B?MUZ4R3BPcFU5aGF5eUlnM1ZjV24wUzh5YTBXMk8vY1E0b3dLN1VZU3g5OGE3?=
 =?utf-8?B?UWU2NERFVFVDZ2RKQkFsM1FOTCtVUUcrNWEzcWZ6ellqc1RCM0lZbWx0RHZO?=
 =?utf-8?B?c1JFajhVRWtPbElHL1lhbnFiS1FpRkVyaHV0THNLMjBZdDlSWWsyME5MU2o0?=
 =?utf-8?B?d2JhdDFSQ0lzWGtpTEhWZ1BldXg2QnErMnhpQnFybGIwMUxzMTZkaXFrVmhB?=
 =?utf-8?B?ZHNlazFWOHFaaHFuMHN3VlVtaWhxUjhmeGdlQ25BYU4zUm0wMG9NUmNFUHVU?=
 =?utf-8?B?RWVxVmFHUStxVWF3cTRKaWR1b3lRTHlBL1daWDU4NVcvbnNwalNvYjhiS0lx?=
 =?utf-8?B?eDdscURMd084SGwvUHJwT3Z0THhTeEVMQkZWd3FVSkg1dmlnYW9JUUpSTEhn?=
 =?utf-8?B?UjB0NDI4SlBreTFsUVFwZmtheldNRnFaK3hmMEhickNUSklXTlZmWVRjcW80?=
 =?utf-8?B?ZUhITDZqVGJxTnN6MGdvL3dKY1EvMXE3NXhvWkxYZmo1clZIakwzc0gvOGFL?=
 =?utf-8?B?TDFaWUpQRkZMUWxQZFdaL0szL3l0dU9zTU9yK25IRzVwWDh2TTgvUVNtYXBh?=
 =?utf-8?B?VVh4aU00WkpBdzE2MWNqeitkWVhSQTdWMEM3RHg3UUxRMWJKRmNrajY1aENU?=
 =?utf-8?B?QUYrR1BDVXFDeDk3WFhic3dCbnUzd0NvYVZzOU0rdlRDcHZZTGNEVHZoZElM?=
 =?utf-8?B?bXd2eVUxTTYxd0ZUbWI1RXEwOW5nejN6NDBPMXpRZmlhek4vYmp2dnBOcWIz?=
 =?utf-8?B?MEdBUWpsbUVWUDVFVk1XVmRMQ00yNDlPak91OVMyTnJxMjZsQzZ5c1FQZXBE?=
 =?utf-8?B?N3pXM0h6cFFKbkRDRUxRTnNjKzNVbmdIeHZ6ekVHSHBzNnJTVWlST21Jd1or?=
 =?utf-8?B?K002QkROcjJ5dnp0eWYvRkQ1TWxBck82dzZnRzh0K2tUR2dkaC9JVFh3STFB?=
 =?utf-8?B?WUJnbkh6V2t5NDYvQkVPU1RlbW5kOGFFMzNCeU5LWU9GTDAzK25rSXRMS2Z4?=
 =?utf-8?B?UWFGMGZhTWRJRDRQYkQzOWZ6ZlBsOVlsZUk3c1d6ZE5Mc004Y0w1YjhSY2Ni?=
 =?utf-8?B?N0Frall6MW9VWDFxZUQ3TVZmUkJEMDlVNXBoTEdncnBDRjlhRG1wSWdnS3lX?=
 =?utf-8?B?dTZxeFJTUk55RTR0YjRabHJmUjdXbUFjcGl1bm9rcFNnakdjQzVVenZtaWhm?=
 =?utf-8?B?OVdCa0pkVEN0TE85K3RMZGhoU2dtc0RTT00xM1EySXpDVXIrNDF6OSt3QXM5?=
 =?utf-8?B?bXhzTUdSTCsrUGRSNWZCbXk1RDFJMDBvTFBvU1NoSTcwMTN0c2RZOGxsNjFK?=
 =?utf-8?Q?dHID2PkYUyLzXWGkC3SBeKniyV6as3slfWq2OTC?=
X-OriginatorOrg: ucalgary.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e75002d-d0fd-4dd8-0fad-08d928bff04f
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2021 07:51:48.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c609a0ec-a5e3-4631-9686-192280bd9151
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/4JinLa1X3e5tEwGObtVa8VtYvruT17P40aCcEhqyTEyhT+DtnntlsqbNXMLioUKHlM41Tbg+5hLdJonaGILQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB1074

On Sun, Jun 6, 2021 at 12:13 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sun, Jun 06, 2021 at 12:00:21AM -0700, Wenli Looi wrote:
> > Uninitialized struct with invalid pointer causes BUG and prevents access
> > point from working. Access point works once I apply this patch.
> >
> > https://forum.armbian.com/topic/14727-wifi-ap-kernel-bug-in-kernel-5444/
> > has more details.
> >
> > Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
> > ---
> >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 2fb80b6eb..7308e1185 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -2384,7 +2384,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
> >       DBG_871X(FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
> >
> >       {
> > -             struct station_info sinfo;
> > +             struct station_info sinfo = {};
>
> What caused this bug to show up?  Did it happen from some other commit?
>
> Are you sure that all of the fields are being cleared properly here,
> what about any "holes" in the structure?
>
> thanks,
> greg k-h

I believe this bug has been present since the driver was added to
staging: https://github.com/torvalds/linux/commit/554c0a3abf216c991c5ebddcdb2c08689ecd290b

It's probably not necessary to zero the entire struct, only
sinfo->pertid, which causes problems with the code here:
https://github.com/torvalds/linux/blob/f5b6eb1e018203913dfefcf6fa988649ad11ad6e/net/wireless/nl80211.c#L5919

You can see the following proposed OpenWrt patch
(700-wifi-8723bs-ap-bugfix.patch in
https://github.com/openwrt/openwrt/pull/4053/files) which sets
sinfo.pertid = 0; instead of zeroing the struct.

Looking at similar code in a non-staging driver, we can see that the
code there zeros the struct using kzalloc():
https://github.com/torvalds/linux/blob/f5b6eb1e018203913dfefcf6fa988649ad11ad6e/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c#L6064

Do you think kzalloc() would be preferable?

Sorry, I'm not familiar with "holes" in the struct.
