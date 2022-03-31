Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290100.outbound.protection.outlook.com [40.107.129.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169BB7F6
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 09:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/BqtxvRzgBRPYq10E3EOo+nTMCcWUKd1cvqTFYx6wjmHtJCD0ZGVtw3UiDb8pl0WLbfs32uq/oFjo+I0GD18M8+OZ4AOZWv+jTMHCDcG/AawtaHI3VA4x3/FMC9LwMCc8maHEueY+bOG1BYinoDCrRj963Z/2szOs5gLowSywqITzwOquYzBxhhtzr9xFi1bmMlcV+9O/Gbn9CBWTJNJIIsfqAXJx+DBKTMgmQHnbhFOskJdeFNvNXmMtwBR0bPwuqILNScnnaceYwzHQaTfBnCQvAMkA+c+HN92lIFK2jUIlYRyUCOKz5BD7Ab7wIxeCalFTtcUFXy5fLFfJiv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgPnzLFcip60cyAa2aKqkt7POcAC+tRhjy1cLjjyjZQ=;
 b=DjVe4DzQUyvG7A2rpB7sxLWEg7/1b3rjHvVdsrPRa0B5wphISn67kqsG8H3ylefpIVpvdKF09IFadKTLgVLKlxofD3lsLIOSeuGpCSiJtvy/VgQr2GWTyMJ7dSK1QkUrDxT8vzp/oiNw/OucZh3w7ZNl0tvbVXaOfsG4+dFGMl8o6X7lckppCKQ1gD/im+Q+3awjViWk98KC1rerszMyXNGsCtEO5ncwVhNgyyVRjkTD+rTAO2HrXloyRfhVkP0O1b+44gUhy5s3ZT6norT7dOMDwI0RaNKEMS9FuZjq5NiYHguvvDA3NK+mgdRJUfHkn6MtX8CotMEAVpV28fnzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgPnzLFcip60cyAa2aKqkt7POcAC+tRhjy1cLjjyjZQ=;
 b=hxEmhAAzQP8r+a9bFkNAvDt+qQeCjCygsWtiAXy1p7wfaSN+bL1ZIExjlgNrlq7Nor9P2WU04IASX4mZQ3UIkfnvIKnhItOw4I/0tH8+rx+2RYnUKfCXq+LxdxfBTgtQ93eJYYlKdZ5h2kBsdrgK4GRB1/3qc39IkrDrY0US3vE=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0897.KORP216.PROD.OUTLOOK.COM (2603:1096:300:20::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19; Thu, 31 Mar 2022 09:55:12 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3%7]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 09:55:12 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open
 list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list
	<linux-kernel@vger.kernel.org>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "kernel@collabora.com" <kernel@collabora.com>,
	"dafna3@gmail.com" <dafna3@gmail.com>, "bob.beckett@collabora.com"
	<bob.beckett@collabora.com>, "kiril.bicevski@collabora.com"
	<kiril.bicevski@collabora.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	lafley.kim <lafley.kim@chipsnmedia.com>, Scott Woo
	<scott.woo@chipsnmedia.com>, "olivier.crete@collabora.com"
	<olivier.crete@collabora.com>, "dan.carpenter@oracle.com"
	<dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"daniel@0x0f.com" <daniel@0x0f.com>
Subject: [PATCH v6 6/6] media: wave5: Add wave5 driver to maintainers file
Thread-Topic: [PATCH v6 6/6] media: wave5: Add wave5 driver to maintainers
 file
Thread-Index: AdhE2sHC2xeyGBlORRyVC9wZVIwUSwACQsjw
Date: Thu, 31 Mar 2022 09:55:12 +0000
Message-ID:
 <SL2P216MB1246ECBD1969D86FB4CBBB5DFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References:
 <SL2P216MB1246A702294DB88BFACD563AFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SL2P216MB1246A702294DB88BFACD563AFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 900b60be-1db3-44fb-dfaf-08da12fc8cca
x-ms-traffictypediagnostic: PS2P216MB0897:EE_
x-microsoft-antispam-prvs:
 <PS2P216MB0897AD0380AFE412DAD64236FBE19@PS2P216MB0897.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 n/6UujpHSKbi5NZHq8uRsooYUlT/ng0V8012GDG+3FJXjMMqUztVIU+oOyHC4IPCHGO7Gd1VgfwJnujJiLSfg5jbVPx3Bz89OvNnLVH0+a8T8LR7+krMT7h42ThL6zKHGxum0wnNnGkfnlvsjUA59pdQpIAaem/ymO105Gto5M10QwP1QJKYipJzgcxM4x4no3yYOzJso0V6tUCFP+748S18sz4PPDRWf6GBaFuhE6F5YZAPeO2uAO9mxrmTSknyA3yES6hgLorNmjljWnFgd7Cj4lWtDGH8HkECUMxIv/LYuzYbKRzyRW80AbXYByBHPHmbr0A0bX/N/LG3pttKfVML27Qc6aWyq/9GBh814Bn5KNEyGIyHr14DlJUw/rtRS6S0VCRkv8TnHzGhDnf87j9ftkMRxVvJfg87kRAEqcmjidtsnyvp8reCPG/39a+z61kGMGB73emJLsKwgqrHIz7Qy87s6R3bJ8l7NFOJYQYPxzWqLzfgTE06hdBhT845FF96sn8bLhU4TmsZ4JuIpkUCfWvgwfjKPl7MMxT6ppYkcgLg1weOEq9JMgCi4bxURqHnDQ8MGrFB/aqqiA3F4w+2Chk88ptSwFSGNVja+V5FgWc20cCZos2uiKp3tSwInmz0YlBjKjsFxp5BjQptvdiKdxXzXnUK/cqa89hIhTWgiUkAW+fnnnAoEP0QpoNl93ddaHUozmbe1TzYDLd3Hw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(396003)(136003)(346002)(39840400004)(376002)(2906002)(508600001)(76116006)(86362001)(38100700002)(55016003)(71200400001)(33656002)(66476007)(7696005)(83380400001)(6506007)(5660300002)(316002)(8676002)(122000001)(66446008)(54906003)(66556008)(2940100002)(8936002)(64756008)(7416002)(38070700005)(186003)(66946007)(44832011)(52536014)(9686003)(6916009)(26005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZY9S/fF3wvm7qw2NdmDs5V908Zqsq2Gj/wQTdGk2LWozUk7eF0D4G572rdpY?=
 =?us-ascii?Q?dnKhF/ycPPTQOOuwMpX3Iq/lsZbTCKzrXGGXKFHFu1v5FcsORmiUaVDL6qrL?=
 =?us-ascii?Q?y91IA8VR/wpCrjLgAk9apbP3LG7fjf16N7m2H8ldBxSZFRsGlhsoPxMq0MlA?=
 =?us-ascii?Q?KOTE0lRtpGrt5dIA4AWeM5YherItVZD9WO1rJB/1jTMJTvCTaqcerLylr28W?=
 =?us-ascii?Q?sM/Js56HEEzfqeRD/daEluYx8fzikwPWbS+XMBxkF2+glYGqU4Z/2g68MHT8?=
 =?us-ascii?Q?3MyD0Lnd0JxRKFTVmcRofmZofXPvkX+akwqoQM8soGNjG+gJr7Y6GXP9J1b4?=
 =?us-ascii?Q?j7W91lkI16WZVFWIUzLnIk/QAdNTwgDOOqU4neAAuCRSOVwXtsFz/gXiCvCu?=
 =?us-ascii?Q?P+RB6iIodbZwNf50r1DXNBuVunJyNeGsKBgkpj5rGdYzAycxP9iUSiTyvG5h?=
 =?us-ascii?Q?50BNNpDW8RY80j6sPxwtp1cmPwOh2G3rG18jCdfaqvG34w0vLdy5Oa+DpzrD?=
 =?us-ascii?Q?yz5LB6rl3FUZLfyqLSQpWh5D7JjsXXyul9x50YBLv8GNbfkBJlq0RUwGt7Z1?=
 =?us-ascii?Q?jEh3I9A7a0wg9mPP9j8yH/Aynce8JwiYthU3GcfriRvUuhqFoEqKRjbp2pRJ?=
 =?us-ascii?Q?5HRvoWb/LA3rwbejRjxOb8+Uw4UjBVhRzKcXpucvRBKhnG7dyWMs7mDN52jI?=
 =?us-ascii?Q?CFuvOE80cvaAHCJiHl5uooKTHLZNRJJuw/VxVKqhdeSiQlp9/zwI9P+8KjZ+?=
 =?us-ascii?Q?+WZB/iBCciVGieo/VXbo4S4IEnhzxRLtLuB9iOWmr+ja5f3i+Eh6CQKzg69r?=
 =?us-ascii?Q?x/SCoObOeo9hpdyuQ//vey9Hxb1/Gnq5BSdFORBHDB53NGuOSMx5vTymPmza?=
 =?us-ascii?Q?7yx1dbuEaRiqQvUi+uYtuoBDtOSC66EI5dDb6kcjzN/dmkdUj0LPYNtNht1H?=
 =?us-ascii?Q?3S2+2hh28/kKWqJnWY2Ct8JYReoBWwfMKSaM24I/Vrh3fCxKqx+xw9mspnga?=
 =?us-ascii?Q?cbUzyUDIr5FRO6EvQkHCp/HkPVchg4tzFb93fBiF2Jrk+M1MK6o9hW6A9rtH?=
 =?us-ascii?Q?Qo8rg8PSGkLPst2l9q+f2aVdzt9hP4tbSHZ83fpinoI8uLURl0FzVwe2544W?=
 =?us-ascii?Q?JZCd5WUzLt04it6l+cgUBIarW6LqX5zlC7gLWO5Lu2M/tCTibv8zQXDJlkgO?=
 =?us-ascii?Q?sNOu8jfGCMLf5wUZ7sAuYVudI46gjs9n6Ga8O2mxnAvCWJ8jJM08Lfx8w29I?=
 =?us-ascii?Q?rzm9aVzm+0pJBYYNHsPcCdzYtKrKsFDxmnmqBLududuRCsivGoAEx2s7uej0?=
 =?us-ascii?Q?XU2ShtZ4mdYDUt4kdtLM87C9/8+abZg9H8mO6PYwA34sfx2MLitUuooxzX0q?=
 =?us-ascii?Q?W954OFiKMqvLfelFOlMIlT/RcZt5CbMb/kHJsSUeLdf3dtcPXdnA7ksDO+Bv?=
 =?us-ascii?Q?864GM1uCfdtwvyPTYkxMDKaIfSs6jC9pmjztFiuCAbm0KrvB964NinbxPYHY?=
 =?us-ascii?Q?mt8dbvexV5izVc3NiJwxU7hFf6ggRHjS9zruQhkN+TtDeXqbE4lc4koZ0x8t?=
 =?us-ascii?Q?Gq5okXkcnmQaHlYijCf2ra22dsOwxavri2uKWVROh4/Aq8bVaycngSDbrs64?=
 =?us-ascii?Q?NZc59Oedp7qL9EClVyT9niLH0usoLsoBIH62VcluCGaN9Gp67RG3TjIH+HY9?=
 =?us-ascii?Q?d0NvuOmiWQMC8S+Xqos5Z+GHLapk5t3sdZF+dFYk7lIG5Gj8cmJ33zfYngxk?=
 =?us-ascii?Q?Mr0j1SPbFbiwlAARcw0c+HNxKvITN5I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 900b60be-1db3-44fb-dfaf-08da12fc8cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 09:55:12.8885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FYlfCxiMQ2XAaH+Ge+XybBO9FbtWpul1uiCmNWCQpvOLgwNpcSQd5D5zmu1aE1AW+LeheuUKVbpSicFzqp6J9AfnqUxAhBV0ehny0xx9RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0897

From: Robert Beckett <bob.beckett@collabora.com>

Add the Chips&Media wave5 encoder/decoder driver
to the maintainers file

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53df75660f16..b42706e70222 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21178,6 +21178,15 @@ F:     drivers/watchdog/
 F:     include/linux/watchdog.h
 F:     include/uapi/linux/watchdog.h

+WAVE5 VPU CODEC DRIVER
+M:     Nas Chung <nas.chung@chipsnmedia.com>
+M:     Robert Beckett <bob.beckett@collabora.com>
+M:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+L:     linux-media@vger.kernel.org
+S:     Maintained
+F:     Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
+F:     drivers/staging/media/wave5/
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:     Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.=
com>
 L:     linux-gpio@vger.kernel.org
--
2.30.2

[C&M]
IMPORTANT NOTICE

The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in some unexpected situation, please immediately notify the=
 sender by replying email and then delete this message and any attachments.=
 If you are not the intended recipient, you are hereby notified that any us=
e, distribution, copying, or storage of this message or its attachments is =
strictly prohibited.
