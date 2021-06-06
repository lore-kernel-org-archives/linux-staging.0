Received: from CAN01-QB1-obe.outbound.protection.outlook.com (mail-eopbgr660068.outbound.protection.outlook.com [40.107.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A670
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 08:09:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfDIwb7Ca+G6dJJ2025/sBHrxdE6+upUFoSzH+vCIb4JcQAnY2oqzttvGOzmnereH5yK63VPVdPK5zCKH7Wo9hnPyF9uFZifYyRW+a0jR/7D6JwDs7OyPehnVd9fUpnKgAzY/PQ35bv4VzECtvkZlMzxt4mJfyoytdZELo9o5XmYjnCd4JMARYzKCsm2otimHzqjluwLM8NoHchfnr55OUVn3F/GdIu4oiWbz2KKg38FR+o7qVbDH+uyEQ+l3zeAZ8bXzmhYGitODd1AuUQ8WHSkeXyKdX1u2kHycX4jvh0ihP51vY2qQywp0fsQSH2QXezkw+O3akDK0DwaUkcExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+p+wwY0wCZNeev1ZYaY1Hg8bgohpBOhiCoCpkUAvpuw=;
 b=f3emYWhicRTUTx0oRKF/35mBIVWirezOjq6eyOEmlwr1iKomieip4gr8V+Cbdmm95P3KQdI2MqI5jQpGXNPt0Csc6IBqeQRFQd6qylgyse5gXhNX8dFVVyXB33+lZ3tMSy1IQFGL9ZZ+OLuJ9UP/UI0gAiV+98HNflsvR7Do2m0agnFYGEY86CFkivouEuefFOj1f2yZ+4yH6l3y9DjpeoSjw0UhDjaHkzVwVoBdR/MWvDJZzzbGnLdeOxhKO4E+invWiSZwPHeBllQrJhtNo+zsRXQekUozUl7qcwzM2Az0LlZtimfF77sl0JFymazWAJvneUivs3tTUxUFLOF0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ucalgary.ca; dmarc=pass action=none header.from=ucalgary.ca;
 dkim=pass header.d=ucalgary.ca; arc=none
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none
 header.from=ucalgary.ca;
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4a::23)
 by YQBPR0101MB4305.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27; Sun, 6 Jun
 2021 08:09:52 +0000
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:8466:4635:4b35]) by YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:8466:4635:4b35%7]) with mapi id 15.20.4173.037; Sun, 6 Jun 2021
 08:09:52 +0000
X-Gm-Message-State: AOAM532IVAM8UktlqcJLfFSRwZ24pEt9J8uF1p77LNjlOR3KckSVU2M+
	Wrt0nnDu/c2zk+DlmoqtZqamo40kE3nIONWqV3A=
X-Google-Smtp-Source: ABdhPJzQldXsY8Jr8F6sGeWFI84u0paBGn7ODmGirrqFvtBNNOO0Px0APDUr/PwLh8TKiAg2Jv3Luz4pwXecTKWr70k=
X-Received: by 2002:a05:622a:174f:: with SMTP id l15mr11699337qtk.141.1622966990690;
 Sun, 06 Jun 2021 01:09:50 -0700 (PDT)
References: <20210606070021.116284-1-wlooi@ucalgary.ca> <YLx1oWQAFPYIFRkF@kroah.com>
 <CAKe_nd2q8caqND=z9Pq7Me_BtyuCd2-Nb_xyepsjDkaPkC8Few@mail.gmail.com> <10029109.FgdUXNWx4t@linux.local>
In-Reply-To: <10029109.FgdUXNWx4t@linux.local>
From: Wenli Looi <wlooi@ucalgary.ca>
Date: Sun, 6 Jun 2021 01:09:39 -0700
X-Gmail-Original-Message-ID: <CAKe_nd0fNE=+CP4O0cUtOPO5vRC8_gHxjLtH80r_4GO2MW5u4g@mail.gmail.com>
Message-ID: <CAKe_nd0fNE=+CP4O0cUtOPO5vRC8_gHxjLtH80r_4GO2MW5u4g@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Fix uninitialized variable
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [209.85.160.171]
X-ClientProxiedBy: MN2PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:208:234::21) To YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:4a::23)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-qt1-f171.google.com (209.85.160.171) by MN2PR16CA0052.namprd16.prod.outlook.com (2603:10b6:208:234::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Sun, 6 Jun 2021 08:09:52 +0000
Received: by mail-qt1-f171.google.com with SMTP id t9so3924358qtw.7        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 01:09:52 -0700 (PDT)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2c84132-5a61-4b7b-7430-08d928c2763f
X-MS-TrafficTypeDiagnostic: YQBPR0101MB4305:
X-Microsoft-Antispam-PRVS:
	<YQBPR0101MB430535A09C64F639D599E85DB2399@YQBPR0101MB4305.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hr/QdAwtYak6qIw30dsEYWUp9bTjg+5Axy4N5P1mtWyQZ0LiFz7skYoQwGVH6RDamNnw3Badw29Rh4E71HSaRvm478P5P+Uf/qteulHkneNkFoNhNedpWDrfevU1s9RWrZwOwL2G7cSVqWXJN5jDDaGOzMcvh9S6AafwsfiydeVumjiDpT7aMQdQ8JQnVqHbg9OnwMR5YiXpS0AvAHxuN/PhGAkwlN4paHjjh/dkdZbn+GIOT1VJSaybmaS271uGUQE8dcJJIsNl9FrAGC61MyoMugd33Cs6jq080wNU1E+S7OltBuziqrknOj+83ua3B/jxz9g8tmy7pMDz4Kpfkm/msduzA/gTDGuHx6FQbgm1oVF7pG73nLDNw9SWqY5ujRgxXsZy4rb8eDqGu3jOsv1VjFym35WYVNYej+IYWIZzmVidGGEczmajRz6awPm5fRJHIOdo0UhKIRMdcI93Vrrbai8sRpg/qImcZYfzh1nl7DEEORRmg3sT9eoOYherMqFF6wWZfInYF5H1aKjtCuL3TaiwQXxJQ7QM3n/VC8TjQ5cSXWCVuWIcuozQAb3t4RIodkXzVEvYDwvELzmVxnKHuI6JyrYp/aSAcYh5CMlBL+j/hKT7vI3PLZjhQ2XqBruqQ9N1uSPmqInBHVoDk4vMShVR/V654jpS1cf+/a9ThcH/FuIPEC7/V40aXnyDETOoxUYIbZmIcHImbbjuS9LZdrmd8Xt3kNN8fvmUis8ZcjzpCAj4LdR7luqjvyfTKdWtgEcirPcpDNT1VaedculUF1sJ/hbTWybiPjdeYp1qTyZiEh556WmAGD4wWqaH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(26005)(186003)(66946007)(66556008)(66476007)(8936002)(83380400001)(107886003)(786003)(42186006)(5660300002)(316002)(86362001)(52116002)(2906002)(4326008)(53546011)(6862004)(8676002)(38350700002)(55446002)(478600001)(38100700002)(9686003)(6666004)(966005)(55236004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?dEFFdjlHb0ZPRkRvYzhCQUlCTTQwVmlDNng1Z3d4dUord09ieUFETGd4RWtU?=
 =?utf-8?B?c2xLeTNpRGp0RXlCZTVsR3pubkxKSWthTWNiVEozZ3RMaVRmL2NLYTlyQmFa?=
 =?utf-8?B?am1WeTZ3WG0xbUFmTkFKY0lYWHIxSEVSZUlVcnNkL3pKQ1gzd0syQVRBcS9r?=
 =?utf-8?B?aWs2cGhvKzFXbGl6dUdzMEhWcEFPNkRkbnMxRVNXWTlqaTZQZjJsSVlScUh3?=
 =?utf-8?B?QVdUZFNVeDFQVGxBMGNRbFN5WUNzUHdLc1JTbjdLUnZXRnA2LzJ6bFNPS2NH?=
 =?utf-8?B?aHFWR3RqVEZ4dVZ3QkVNREtrejh0aXZYblg2cExBT0JNaHRFcmFvQVEzM0kv?=
 =?utf-8?B?MHFNYjNrRThPcG1DZGlmcDJla1BrNmZtTXBXSzY3Tm5LM3VPZ0dKaCt4cFcz?=
 =?utf-8?B?T0NQV28ycXdPOVBDVzBaS3FkT3c2N3h4eWpubDJoajRrUElaRjJBdlN4WVlJ?=
 =?utf-8?B?Y0x3cS9GSEFRcjAvK2cyaHRpMnhhMDAyMjlWeVRjdGNuODNyR2xUWTNNbmox?=
 =?utf-8?B?bUNYN3U3eklueVN0cUpqZ0lRaW16eGdSMURVMkxTOFRpclI2cXpXR2k3bnQ0?=
 =?utf-8?B?U05vc1I2cVZkK2dzZDc5K2RhSnZhcGhHSGxTSHBsT2lZWUFvdDdhSDJHRjY3?=
 =?utf-8?B?bHRQUzMrL0M2Q2xlRkZUR1hNeXBzZDRyb25yZC9LdUQ4b3FTVlFaT0w3UDNu?=
 =?utf-8?B?Zjk4UlJHT0thMVdOUk1WZC9uc0dUM0plTER6V0czNDFwL2VvMmFsdW1DOU0x?=
 =?utf-8?B?TmxVMjlkMjVLeFdXQ3JXV2JUZ2kyNFdFNUZkMVdFWlA3YklrbkpLbmhlU1hI?=
 =?utf-8?B?NDZmOXRBYjltUVNCQ2FrRTJUb0graEROUUpLM3BUNVlRRy9xSFdmcHFkQ3k0?=
 =?utf-8?B?cTBYb1k1eFdHNFhvdEVnRkRXa1JrOWdNVzhKQlE3MllyRTRRQ2F3UENndGdo?=
 =?utf-8?B?TituOEZ0TmU1ZUFyZDFOcGpxSndkQUFhQjJ3TDJtQ2dQT1loT09ZWXhQVkdS?=
 =?utf-8?B?aDF3MkdSVzZnM3Z3alRNZlU0R1I1bVlJUU5ndUZjcU0vQ3VlNDlLVGZQUG1F?=
 =?utf-8?B?NWpNYnZMR1FNemxuODNub0FuazhqQTJJY3pFU2NwNFdycEIzUTBNZGFNQ21Q?=
 =?utf-8?B?RnpQUWxMb3kwR0UrZllIaWhwL0pMRVB3REhYV2Z0RHdPb0pNTzg2TFF5K0d1?=
 =?utf-8?B?ZlY1STYrNjdCSTR0dHFmTVRFTDBQb3VXRG5zQ0xiWGhZMVU0OS8zVWM3T3Mx?=
 =?utf-8?B?Ui9Id1hueCt6dHIvdTVoVGUzR2NVeGI3anB2THppRXY2aVNrQ1J3VUlwNldI?=
 =?utf-8?B?bjg3eFhuWVdTRnNtUnFaaVplWTRKemZTaEdhbm9PQVVCTHkyclVLZGVuemhi?=
 =?utf-8?B?V1NGQU1CZEpjcVpMN0hkZFBJQnJEWkU0Wk5IS0ZLNHJreG1JTmJBN0NKSUJh?=
 =?utf-8?B?N1A2Z2lBRHVUd1VSWWgrNVUwZ3BNTzBDaFB3c1IrM0FLbkVuV01WdXJmY2Uy?=
 =?utf-8?B?TkJXeE52blBVdWFhZU9QVm5JSmx0M0x3MGI5UFhLYXFHckJ6Q2p3c3RlM1lQ?=
 =?utf-8?B?T3JDTXNBRjRaQ2hRVWZhOGRTSUlBbk9TNTlYc0xCUXRpWC9UdVh3OEwzNC9p?=
 =?utf-8?B?aUM3QjlocGlVTFdEVStyUE1mWUdEbWM0aDgvRzcrb2tFMmljOS9pODN3VGVP?=
 =?utf-8?B?d1psS29Ua2FIc0M0WFFiMjJwQXRBMlhhQWtnZU5EL3o1ZEM0QWJseGdpYlRX?=
 =?utf-8?Q?ySzLYzpFr7jhoIVQwkiewSDiYwg7OgEpqvxTbvO?=
X-OriginatorOrg: ucalgary.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c84132-5a61-4b7b-7430-08d928c2763f
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2021 08:09:52.3361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c609a0ec-a5e3-4631-9686-192280bd9151
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoCijQzAuaz7Lto+YoabkpZjr9Xvlhzk/d7Q2/gbVugmGlvHHbl2Nd3GZ1SJI3NtSG0hlS8AWmtel1cuSRqRpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB4305

On Sun, Jun 6, 2021 at 1:00 AM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
> On Sunday, June 6, 2021 9:51:35 AM CEST Wenli Looi wrote:
> > On Sun, Jun 6, 2021 at 12:13 AM Greg Kroah-Hartman
> >
> > <gregkh@linuxfoundation.org> wrote:
> > > On Sun, Jun 06, 2021 at 12:00:21AM -0700, Wenli Looi wrote:
> > > > Uninitialized struct with invalid pointer causes BUG and prevents access
> > > > point from working. Access point works once I apply this patch.
> > > >
> > > > https://forum.armbian.com/topic/14727-wifi-ap-kernel-bug-in-kernel-5444/
> > > > has more details.
> > > >
> > > > Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
> > > > ---
> > > >
> > > >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > > b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c index 2fb80b6eb..
> 7308e1185
> > > > 100644
> > > > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > > @@ -2384,7 +2384,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct
> adapter *padapter,
> > > > u8 *pmgmt_frame,> >
> > > >       DBG_871X(FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
> > > >
> > > >       {
> > > >
> > > > -             struct station_info sinfo;
> > > > +             struct station_info sinfo = {};
> > >
> > > What caused this bug to show up?  Did it happen from some other commit?
> > >
> > > Are you sure that all of the fields are being cleared properly here,
> > > what about any "holes" in the structure?
> > >
> > > thanks,
> > > greg k-h
> >
> > I believe this bug has been present since the driver was added to
> > staging:
> > https://github.com/torvalds/linux/commit/
> 554c0a3abf216c991c5ebddcdb2c08689ecd290b
> >
> > It's probably not necessary to zero the entire struct, only
> > sinfo->pertid, which causes problems with the code here:
> > https://github.com/torvalds/linux/blob/
> f5b6eb1e018203913dfefcf6fa988649ad11ad6e/net/wire
> > less/nl80211.c#L5919
> >
> > You can see the following proposed OpenWrt patch
> > (700-wifi-8723bs-ap-bugfix.patch in
> > https://github.com/openwrt/openwrt/pull/4053/files) which sets
> > sinfo.pertid = 0; instead of zeroing the struct.
> >
> > Looking at similar code in a non-staging driver, we can see that the
> > code there zeros the struct using kzalloc():
> > https://github.com/torvalds/linux/blob/
> f5b6eb1e018203913dfefcf6fa988649ad11ad6e/drivers/
> > net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c#L6064
> >
> > Do you think kzalloc() would be preferable?
> >
> You cannot use kzalloc there: 'sinfo' is instantiated automatically on the
> stack. The example you took had a pointer to the struct.

The stack variable could be replaced with code like:

struct station_info *sinfo;if (!sinfo)
sinfo = kzalloc(sizeof(*sinfo), GFP_KERNEL);
...
cfg80211_new_sta(..., sinfo, ...);
kfree(sinfo);

which is what the linked code basically does. I'm not sure if this is preferred?

>
> Fabio
> >
> > Sorry, I'm not familiar with "holes" in the struct.
>
>
>
>
