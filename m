Received: from CAN01-TO1-obe.outbound.protection.outlook.com (mail-eopbgr670056.outbound.protection.outlook.com [40.107.67.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002270
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 06:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyzt+nbQe3K1JyIWl+b/8gF/hqgO7zNtpRk9FM8F+Oiq8aF/0NCZlyZ4zZZqSWCsZ7aGhe88+tKTwxL4HJkWRl9dtYhavEAhlJYYkjEbXrmJCnw5+dTFs/p1Waf98btUrBu/qv1x1dQohTr3PoszlVx/6Qo7UmPPUunino/xGqQBZsMhizkeFFaooDfQTX3QHtnk32vx4TN5MbQmk4BjgNBHYDfPtBMT0pvqFH/9HIHQpRAuTXSQETSlcVq7padUlTFs9r8MjjBSptvht1mcmheye9iCyb8cq670QjSNdxG6P0uU1Dfg4YlYVO29gyWJVMyMuLiMmWyfs8N9jfd6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3E88rt/rcU8KJQzYrauX2KMCvgO32lij5xymqVMBYAU=;
 b=dPl5T/1b6ENH4wX7kUF0dID80y13NfHlcauB+ko1xAbC95FnJo9gFM3CataL7nLi8wXXCAxV51cErZjNCfxWzrUpAz9r1JiAjupYbR0VwSkqhPMzBqIxExdQ84NCxqU+pbinT37Xckt/181f1WggJ59s7Uw/kn8wavbYMSN7toV5FO5tkwT+x1Glgfi66m64RoaXlznn0KTnwXj3tAVz6BE/8EWmz1bS6gb10RAyfE2DhMjH/ShNXXfHQHVxSgpE81Xy2/sxs2Dde+V7g09z/FfIr1YMqdzqyw7A/YmC1BJLFzBMYu1peJ1OcGAsKRsIHLt5AwFBWjI3LHqWsUSnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ucalgary.ca; dmarc=pass action=none header.from=ucalgary.ca;
 dkim=pass header.d=ucalgary.ca; arc=none
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none
 header.from=ucalgary.ca;
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4a::23)
 by YQBPR0101MB4682.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:15::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Tue, 8 Jun
 2021 06:40:28 +0000
Received: from YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:8466:4635:4b35]) by YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90eb:8466:4635:4b35%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:40:28 +0000
X-Gm-Message-State: AOAM532QylBFwgi5/aDcRb3xqnFMfTS8sbRqkvRdMdLvLcQMOwvIouY0
	a+elT+DWu4ZBG0CpbFTGmPP27ALrmHdy/FHtzVc=
X-Google-Smtp-Source: ABdhPJx0qzBzrVLoVm9n90u/hbWE+kSRjwsLV4ouR4icLpdk4XVfB3GHHiwvRKhfnQGP9fQdDbRbrjJgxdNC2/Bdza0=
X-Received: by 2002:a05:620a:2942:: with SMTP id n2mr20058554qkp.412.1623134115928;
 Mon, 07 Jun 2021 23:35:15 -0700 (PDT)
References: <7256195.zb9d8qvCYo@linux.local> <20210606184638.13650-1-wlooi@ucalgary.ca>
 <20210607083542.GP1955@kadam> <20210607084642.GQ1955@kadam>
In-Reply-To: <20210607084642.GQ1955@kadam>
From: Wenli Looi <wlooi@ucalgary.ca>
Date: Mon, 7 Jun 2021 23:35:04 -0700
X-Gmail-Original-Message-ID: <CAKe_nd2-z+=6FnoUhSW0H_HZFu0MzUaBnvBg8P1eN0SjH+JG_A@mail.gmail.com>
Message-ID: <CAKe_nd2-z+=6FnoUhSW0H_HZFu0MzUaBnvBg8P1eN0SjH+JG_A@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix uninitialized variable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [209.85.222.170]
X-ClientProxiedBy: MN2PR19CA0025.namprd19.prod.outlook.com
 (2603:10b6:208:178::38) To YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:4a::23)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-qk1-f170.google.com (209.85.222.170) by MN2PR19CA0025.namprd19.prod.outlook.com (2603:10b6:208:178::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 06:40:28 +0000
Received: by mail-qk1-f170.google.com with SMTP id o27so19176349qkj.9        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 23:40:28 -0700 (PDT)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b4eae0d-cc3c-466b-d074-08d92a484ddd
X-MS-TrafficTypeDiagnostic: YQBPR0101MB4682:
X-Microsoft-Antispam-PRVS:
	<YQBPR0101MB4682CDA7C1B9C6D48A7AD9F1B2379@YQBPR0101MB4682.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yGjKbZ4JeVXfHJ4DnN5srHsPGgoG/0LaapuydYMGdt3f+8A/J9FnJ5UZLTuZZiqr5yWGFa8O2tKS8cTmsHKcHQ0KlnEKis5G6Y4BPVlO/ppON9E01Mka2Hx49wi90r/3iQMzYjxG1ycH7KmqfvzTUxkMpTFesR2OfaKRQSIp97+B1tjiAVkZdxs6ZMziUfT5pOd6HdEyhCnJR+Zu/WIy0suti+cylDTg3XhfCclY4U+fRuX12nu740xH9soc7zhch710tUjQ2pIkFwxKNU4KGKkhuS+HZn9pUN3X8+4y2+kPrlzLFlGUIbhZobMWMuOsICxAt9q4czU96eOljXFyS7Htkgh7ikJIw3kXUHE/WPUmfX2dcDzy5XmFqO7OKrRwf3jOaarBgkhWIaq5znY2WdNXEJ/TuDTGcP4TENzsehNwQ74RQHpi1qVz1x3E1f70OZpvZA95x0pKN1VgAz5Dllr8ipp+p69aHdEnHgBVZFJaScFJH3WGnbIL5bqkhQj0lFmU9utaUOfJHwVvZMvGEdKX3L3Uii/UPYgfMeAsIu7luR2jhvL7saLbQTa3ZSjpmz5ptEPoZMkUPUgnjLCUlwbi2F1HePX5inDBJPsZ8a7lBQhN/A6WPsQVoiwt+jI5omGQBpJZLMISr8k8gFCUmEsteGS65xKtmGWjQFdkBxWFjoFi6TNdYyYtpv0LsllU9DkiQ9SyPfms/SaU1V7EWOKND1UEG0VIBHHG6vO0q9SOeh0plx3spi6/WGiw+uVhqsgxZEmMocH8cD+WzWWmVfzlDF43RqSn62GX2Vl004hFmbTvKO2sxd7m4fBPWhm9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(38350700002)(42186006)(8936002)(186003)(38100700002)(55446002)(966005)(316002)(83380400001)(107886003)(786003)(5660300002)(2906002)(54906003)(66476007)(26005)(8676002)(86362001)(478600001)(9686003)(52116002)(6862004)(66946007)(53546011)(66556008)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?dXNzMEwwcWNQT1pwSElMN2FqaVJ2NkZ5NVhUUHcyL3oxdUZDcGhRS1E3bTNE?=
 =?utf-8?B?NllHTC9yTFBqMVR3QXpsOFZYdnR2NE9ualJhTWVKa014Tml0MHFDZlhGcTho?=
 =?utf-8?B?aFQ3bjRYQ3d6TWR4U05MQURXK09VQjJBL2lSU1k4NTNIYVN1Q05nQlNOYjg4?=
 =?utf-8?B?OWlZWVZnVkpZcGl1TmlleGZSWGgvcWdDbDZWdHNXSmdsT3RBYmY4U1JjZ2VT?=
 =?utf-8?B?V3ViSUdxZFJIY3RLeFlLSEwzY2dPZlUxN3BpUzNaUk5WNm9KQUhGc2dPRTdP?=
 =?utf-8?B?bnlsVkg3ZERaaUtsK21tZmI3QkNDZVpmS3NHU2swTTVEUVljUEdNa0V3S0My?=
 =?utf-8?B?MUFSWW1pcVZDZ05jZVpqelhFSzNCNWJCMFZEQU1Ba2lIRmtCSXRPem8yQk1F?=
 =?utf-8?B?bG5LSm96bktoNms0eUpZcDdhVFA3M3p0S09jbit4NklGbFI3VDEvQ2srRkc0?=
 =?utf-8?B?NElFNDlScDhNamJ4RVNkVzlPMHJ5WlVyb0RBMVVRWjRjK29xb28vVnNqRjl5?=
 =?utf-8?B?Y05BOUY4bThPWTl2bE5DOUhVejBnakRHaG1BbVFsMGo1SFowa3kzWFNRd0Rz?=
 =?utf-8?B?RGpoeHNIRnhOTEROa3NvRWd0NGQwaVFmTnhGL2E4cnVtcmJRL1JWRjNZTFJR?=
 =?utf-8?B?L3FweTIrQlJleHVSL2F4Z1VJSEpVcG9UNVA2SDJnY1pDLzVmMTA2MXJRaU4r?=
 =?utf-8?B?MVdrN0lqaUljMU5LSGZQMjZYN0FNUUUrYmRmdFBEb3I4dHM2ZmlsK1pzQmVZ?=
 =?utf-8?B?THp0Z2lPLzlrc3FhVGxrcXFubG81bmRIUjg5VnQ4TG9ETDNSaDBRN2pPeW1i?=
 =?utf-8?B?cmZPUmMxMERiRm1rK1Y5bHN2bXRtdWVuNUE4R01aZUVhOXd6S3IzY2JFaFl3?=
 =?utf-8?B?dk9MOTUvNWpVS29mQ3A1Z1hGVXN0RHVXRWFjSkJ0NWlaUG5SMmFtWHhyQXNz?=
 =?utf-8?B?Tm4xeFU5S0EvM08wUjdrSUdLMkJOa0s1VlJsaTFIcUMvL0hXM1JQN3FESjFQ?=
 =?utf-8?B?Q3pPU0FwQ2RObjhhd0RKazVEQ1ZkSDhUU1M1d1BLcUZVeXQ2RXo5ejk2TUJY?=
 =?utf-8?B?dE5yUzI1VVdueGhPK2FKSHpxdzRFdjhGNW1HRmJIQ0g5L2lrSFJUYjgzdFVw?=
 =?utf-8?B?R3d4cnovbmM5N0twdWczV1g1TmZMeTFxWWFjNTJ1TzRnbkJzTk9ZWkhkR0hL?=
 =?utf-8?B?SkNWMUNWQ3F0SmVabmhRU242b1YzTGc1QVBUcUJZcHFuTlhUdnB3MWs3WFM1?=
 =?utf-8?B?ellDd2tuZmZoRXd5dk12OVZOT0pXSzcvL25xT1RySjdDVUx3RUJCRXE1ODl0?=
 =?utf-8?B?bDlaWStTTy9IMVIzTlNrWnNOMllIR0tJVDZPc056a3dQRERlMmI1dFpzbG8y?=
 =?utf-8?B?SWVReVVFbWJURzgwaEQrVHJYYUJZNkJNSGRxQUdVUnA1bS9tNXVkTmtXalk4?=
 =?utf-8?B?STdsalRLTnpURzhuSXNKYXJldEVwdFhwREZQTlk0Q0JDRFpsVzFCVGROOWQ2?=
 =?utf-8?B?cHpaZ2JROUJoemxsMGxtNkpJQzQ3R04wNm9ESG1abUM2RDFJeVVETm1CWEpX?=
 =?utf-8?B?Qy9NaEQ0RnRNeHRiSTVOTnFraVdZa2NmNHE2TWJRL2dKbzVEeDNHR1JyMWhJ?=
 =?utf-8?B?U3BwdDVQUUt4d3UzSDlKNWxkeXYvUW9iY2RGd2xCL0NiUzJXUTFpS3JkMjZF?=
 =?utf-8?B?bTlpd3pKc3lwcWIvTjBtMEFMaTVoZTF3eHA0UVl3bDJkYWxnNU5MQW9IMGND?=
 =?utf-8?Q?G4auRdjpjPTXs6a/4ArpjPPfIYZlOH8zUr0DbNs?=
X-OriginatorOrg: ucalgary.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4eae0d-cc3c-466b-d074-08d92a484ddd
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB3302.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:40:28.3639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c609a0ec-a5e3-4631-9686-192280bd9151
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkgovS9Kr0XPee26Cf8scDy+wiZHDMppTnZHQxZgMR2njcHikr1ZpeodW6P0LCIfKz1innNZta8rbpZyF4wDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB4682

I will resend the first patch. Thanks for your insightful comments. I
was wondering why every other driver seemed to be allocating "struct
station_info" using kzalloc()

On Mon, Jun 7, 2021 at 1:46 AM Dan Carpenter <dan.carpenter@oracle.com> wro=
te:
>
> [=E2=96=B3EXTERNAL]
>
>
>
> On Mon, Jun 07, 2021 at 11:35:42AM +0300, Dan Carpenter wrote:
> > On Sun, Jun 06, 2021 at 11:46:38AM -0700, Wenli Looi wrote:
> > > Uninitialized struct with invalid pointer causes BUG and prevents acc=
ess
> > > point from working. Access point works once I apply this patch.
> > >
> > > This problem seems to have been present from the time the driver was
> > > added to staging. Most users probably do not use access point so they
> > > will not encounter this bug.
> > >
> > > https://forum.armbian.com/topic/14727-wifi-ap-kernel-bug-in-kernel-54=
44/
> > > has more details.
> > >
> > > kzalloc() seems to be what other drivers are doing in the same situat=
ion
> > > of creating struct station_info and calling cfg80211_new_sta.  In
> > > particular, other drivers like ath6kl and mwifiex will silently retur=
n
> > > when kzalloc fails, so this seems like the right behavior. (mwifiex
> > > returns -ENOMEM from the place kzalloc is called, but if you follow t=
he
> > > chain of calls, the return value is ultimately ignored)
> > >
> > > Links to same situation in other drivers:
> > > https://github.com/torvalds/linux/blob/f5b6eb1e018203913dfefcf6fa9886=
49ad11ad6e/drivers/net/wireless/ath/ath6kl/main.c#L488
> > > https://github.com/torvalds/linux/blob/f5b6eb1e018203913dfefcf6fa9886=
49ad11ad6e/drivers/net/wireless/marvell/mwifiex/uap_event.c#L120
> > >
> > > Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
> > > ---
> > >
> > > v1 -> v2: Switched from large stack variable to kzalloc
> >
> >
> > Nah, v1 was better, it just needs an updated commit message.  See my
> > other email for more details.
>
> I read this again and I thought I should provide some more information.
>
> This sinfo struct used to be huge and that's why people used to allocate
> it if kzalloc() but now it's only 224 bytes so it's okay to put it on
> the stack.
>
> And the problem was never whether the variable was on the stack vs on
> the heap so changing that wasn't part of the "a patch should do one
> thing."  If you want to change it to kzalloc you have to do that in a
> separate patch (don't do that).
>
> And you were reading Greg's questions as saying the patch was wrong, but
> actually they were just questions.
>
> regards,
> dan carpenter
>
