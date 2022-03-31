Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290100.outbound.protection.outlook.com [40.107.129.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24B7F6
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 09:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjhgZGl+ZCS30qUwB/KfSDypqIlgqd66KR3Sx02QKAOtMW/1vTCD4NU6JDYKae33FED3H6g6LVhkk1ZJ4CpyroUejHRAwTF2dsBkrsTi40fV4lEpc/Z64LE4nZlfkzOMe5rN+IW9YJDNimiDThP9j1CuJNogsd8RcYMuSiP2mRISf2H2Pxy1fibY4RHnWX9AVw87Os63dSA8Ty5LmyqWEEkkBOHS8+u0VF2nCSojdp7pYHoWgwE+VyMUie5T9QKPsBXoNtiq4F0KNG45MNKJTuKKlZMWWtZdC8TLEWysjCuHDKly9dOohEs6V+BHKyUxKicg0oieS5kJHNWutUoxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Eiw3VH9Zzkq4YdPBX4joYJlNq5ijDKXQBTgzJMyJFo=;
 b=YwiVMFfIxehEG3OoSa7X82FCAE9RIo+SMMnvM+KHlELvFFF8M+PsY5Lv0gyv6ItHh1+DDl2RLDP0xFq89hKx1B/OwUagMbxjuSnpN//B8WlZ2mylB3oGcBrrRA5ZT8otmjr64VGJg8VrwuaLuSb3IDKfImKcaL60X/hGBBiN4i8BdUU5o8bzGtrbmqYl8RYBV3FUji57FndffhP7iKOxV3OvzA6WiJLG9yXtO2mhbI3iGKixrV5Pef4fRzQRNjaRh8ygvZI5I7nlZChqVZ6f6lDy/0SeNX8krDh5T6KsyFKLMuSpKYQxOlbS/LNmT2U8CE4J3jYfxlwk+POgvKdKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Eiw3VH9Zzkq4YdPBX4joYJlNq5ijDKXQBTgzJMyJFo=;
 b=Jspf+paM9eaSHihryTC1QNLbZPOE4Qk2W89vKICkurrD66yZ2Ia6CiFFBbHil1HSExnIFYmnkpgeKw4dtYNH1xO1tbf364OFNZIhxY8L8opxJpbyUrVgW5A0GBdnxa1+bemsd0Ygf0yYSu79885Yhls+uCxxMpylFAB28u9gex4=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0897.KORP216.PROD.OUTLOOK.COM (2603:1096:300:20::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19; Thu, 31 Mar 2022 09:55:10 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3%7]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 09:55:10 +0000
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
Subject: [PATCH v6 4/6] staging: media: wave5: Add TODO file
Thread-Topic: [PATCH v6 4/6] staging: media: wave5: Add TODO file
Thread-Index: AdhE2oqP+oIiPzQWQ0K4SA0PHTLaRQACbQWw
Date: Thu, 31 Mar 2022 09:55:10 +0000
Message-ID:
 <SL2P216MB1246D7900A0B9620F1E1A038FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References:
 <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bd57a8e-6767-49bb-2d3d-08da12fc8b59
x-ms-traffictypediagnostic: PS2P216MB0897:EE_
x-microsoft-antispam-prvs:
 <PS2P216MB0897886A4A8E5E627A7AB63AFBE19@PS2P216MB0897.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Lc+f3Xd58uDIr6HAd9RsF5yDQIsA25cGIlxmdMzRzZ7he9cOD+ju2rlkHI0iOA5RKQerQWMILQz7SKcOCp6c4U6OaruVKdSS7wnpbi/U9ObZxiY7iZZ+hH1aUir9aW/PbqoRV/TSnqSMKNcyufe9RjgyBEDoFrDeknLxGX/7ykpK0ykc7T6CcMepwfIHEW07gEyeHQoaN2rFIdyhM1mrZThM+31qrHHxIGc1+Brdx8bnTAdgw0aaA2m1ns9AF02pRR7Uiimy0/hKB6QIVUESwHPEJSr2JSMqDyKJ4vpzPeZ+56vWyGRpILDWGZcuwAszOB5TNjdcNGBqE0syuahBfkUDLwTfByurF+hCxYE8zOGaMBXtaMTzgzPvbjE3K4tnQPxLd3IncBwYnr2QTTgaEtUKoaQMH9lHbc+RcXAKF324CBY0FpkGY0fcI4SniOeLmmsHKSMXOg2rU3RHdDZYd44Vhl/8F1fmT6ubvrXEe8MuUHbqnIvZjc5WTc2FQukKp6Ye+Ybrn3O2Nvlhb+CWoaz5T95F25tLlZA2j0WgAeb7wOM8FXCF3NB5mAa7uVrZjetNqWrHVM5BI0OeIrjhW8eDOAb8P7obBVdlXNP+athe4reLSxvK7zuuXnqb2o0i0HxgmAh53h0urATU0QWW0GnA92RqXR9O13RqF6jEvXl7M2xoEeYHwN2ZGNChxa5kSOWnISkPiXPrdrceLLMB+Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(396003)(136003)(346002)(39840400004)(376002)(2906002)(508600001)(76116006)(86362001)(38100700002)(55016003)(71200400001)(33656002)(66476007)(7696005)(83380400001)(6506007)(5660300002)(316002)(8676002)(122000001)(66446008)(54906003)(66556008)(2940100002)(8936002)(64756008)(7416002)(38070700005)(186003)(66946007)(44832011)(52536014)(9686003)(6916009)(26005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vQLu9uNpVYwFybaOZuwvXZLYnE9HDrjgQ/BAsWa+X/IulcaqAH3FH0FO1jua?=
 =?us-ascii?Q?J1MjArt+ArMrihBRAizDDNTvTZ2MfXHkJd3j0deR6Y9w65fTBB9w2x3NhWLF?=
 =?us-ascii?Q?jgTU5mLr78xzeMRbaG11c/9v1huxWMZADmuhqEZ2IQ9DaRZ86qRJ7FIDf+9x?=
 =?us-ascii?Q?q4BXTKp/cKFvmDn6ZSkkMS1Z4VOpMhrHpmBTVfq23DZNHGDHv/4kDsqKfVbm?=
 =?us-ascii?Q?2zd+f73wfq3Zz04uMg5hWIx2ewczumqtK4yGGZC7MuMSoBNLAM5ce9HxuAXa?=
 =?us-ascii?Q?ddms3BiLRBc9BHTU6hgocy5FJPyuMVqwy+G9rinplWmUv7LxS5OrY1t2BZYJ?=
 =?us-ascii?Q?ZdmZVxma/yWE15uYFpXC7ILa2lJ7Fe8iQiyo6CqLRI7wML07q5sB1cJ0LK+h?=
 =?us-ascii?Q?fRK8vzadjzqFtEOsijZ6k/ZA0vCgGhfd5g3N8Ph9yiRzGNZyywNpX4NFwSzt?=
 =?us-ascii?Q?PwZD/HCAXRrdpaGQ7VuJwNd1jLqrnQryCWhbYnR2HTTFvb6vJE2V3lggSXXI?=
 =?us-ascii?Q?OS+hb1hP+igqGa/4r9l7Tv4mBoYEM8XchqD7oFwzCNTv+cVLYOgt3scyjLLn?=
 =?us-ascii?Q?Y1NbmIKXo8qxRsotFjDCYmEaytWjk+FGxj5RsHBnJwb9o5kYafHQ3QvKKoDc?=
 =?us-ascii?Q?TEiwkeWEUdKT82lMfESJJeua4X7NaYiUcWL80u9nAfw4xhuFIUHOZt32ovyF?=
 =?us-ascii?Q?QjL5Ws3H9+SUO092sHAs3gRqC+jwUMNCxP8nukiKrS+Oscwj/pcgAHaUKkdQ?=
 =?us-ascii?Q?rX4vyEe5DV6AZNtHI5YpdBrm57Z5I3HtsPDyh2bFRzJq4II1gJ6NwHWc14J8?=
 =?us-ascii?Q?7bGQJ8wD+Vj/WmyM3c+bCtYfYtyrpZQiz+7PhuH93j9Dd27cvyTB2WRxTIdm?=
 =?us-ascii?Q?V7NnPpfhVyLGaDtMrm6MCpx6zWa9qdKT6k55afUzkjt9HNpSpmb2GP6CE1UX?=
 =?us-ascii?Q?qA88tfEcZ7EQbhxGplW/+ORzmMy8SjpBsipenqQS912Y3RzHWKVS0fNvkA63?=
 =?us-ascii?Q?NGJfewn7rsNeIGpXqISoH9S4ktruSGzsp+UC19Kbcg5vYbJB+NJQFA8DG+ev?=
 =?us-ascii?Q?2a2z8ocrJZx9cdkEHTtcSvKwnO76r6Jtw40DHnQWOrDRgofcj8BjywCQ/O3F?=
 =?us-ascii?Q?32BANcEH9AC82r1ra3hpwlgAxVgqsevqrQqSgw2ic31Ems404Cc6fF7QaXus?=
 =?us-ascii?Q?xSwld9WloIONlltfcXLnjbnaO0sUCiFyw5L7fJE6kq4tQ7iOnXzYAztDpQAq?=
 =?us-ascii?Q?Kwa234VE01iSNV0LIWyRGP/pKAXqVj7mEVPnLHddz2fmRhEVo/SXsHUinGah?=
 =?us-ascii?Q?v8SU8nnEiTKv7x1YQxI4X8rI0b6swFzH3nj6jplMqIag3w91r4JtxHplnYzC?=
 =?us-ascii?Q?DDB8Kwbp6A62s4GLADJL/iH9POSXerPI883ZnaMJpLVDS7qBVp9jy8yy7E2/?=
 =?us-ascii?Q?5ufNkoGPjzTx6x3ACJ+CWJGIor9Wy6ArRV+yufEidqCzgK5+2haGKH3dIAUf?=
 =?us-ascii?Q?fqOKtfvEf4Hr/Nq3hActK6/3vq86XqwkFCeQk0fJ/M1Flgd75L8F9fXaLnGd?=
 =?us-ascii?Q?nd9vroQ73Y4dePw1FVOiKcq8GtDrk86xlk1yEjK9n5bM39g3/nt9ANsVgui/?=
 =?us-ascii?Q?8vqcvD0mY7//NF4U+WbhKL6ZSfeOTqY13D7NXzfMM+3tax+ZWLu5paqFBkcK?=
 =?us-ascii?Q?CHBK9lrfncMPwNlcMMmvn3ved0XW0zKrLpFrv9xAUHkk9RkhLS8lCA9ix0of?=
 =?us-ascii?Q?VJNMlYpGYWUja9BS9EgmwUJGrSMIa8I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd57a8e-6767-49bb-2d3d-08da12fc8b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 09:55:10.4813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbPyAoabkatntSuQvCHrcvaz3OaovfFzsCGVR74H7iip/Lph2S+J2IDTnrER3c5b3yDzrDP2i0Vrt8vTP3vVRHM6Odclh0/hHtzpWJi7DKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0897

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Add a TODO file listing all that is need for destaging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/wave5/TODO | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 drivers/staging/media/wave5/TODO

diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5=
/TODO
new file mode 100644
index 000000000000..425ed42a234c
--- /dev/null
+++ b/drivers/staging/media/wave5/TODO
@@ -0,0 +1,64 @@
+* Test on real silicon once available
+
+  This driver has so far been tested on pre-silicon FPGA and on the beta B=
eagleV
+  board which uses the StarFive JH7100 beta SoC.
+
+  Testing on FPGA shows it working fine, though the FPGA uses polled inter=
rupts
+  and copied buffers between the host and it's on board RAM.
+
+  Testing on BeagleV shows buffer corruption that is currently attributed =
to a
+  known silicon issue in the SoC that makes the cache coherent interconnec=
t not
+  so coherent.
+  This can likely be solved when the riscv non-coherent dma support lands =
and
+  provide optional v4l2 non-contiguous allocator, though it remains to be =
seen
+  whether support non-coherent use cases will be useful in real world hw.
+
+  Until we can test and resolve any issues on final silicon (due 2H 2021)
+  this driver should remain in staging.
+
+* Handle interrupts better
+
+  Currently the interrupt handling uses an unusual design employing a kfif=
o to
+  transfer irq status to irq thread. This was done as a work around for dr=
opped
+  interrupts seen with IRQF_ONESHOT based handling.
+
+  This needs further investigation and fixing properly, with the aid of
+  C&M and StarFive engineers.
+
+* Fix early end of stream handling
+
+  When using a gstreamer pipeline like this:
+  gst-launch-1.0 filesrc location=3D<file> ! parsebin ! h264parse ! v4l2h2=
64dec ! jpegenc ! identity eos-after=3D3 !  multifilesink location=3D%05d.j=
peg
+  i.e. forced eos after 3 buffers
+  the pipeline stalls on exit waiting for end of job.
+  We need to add some form of early exit detection, instead of the current
+  behaviour of only considering a job finish on PIC_END.
+
+* Support more formats
+
+  The current frontend v4l2 layer only supports V4L2_PIX_FMT_HEVC and
+  V4L2_PIX_FMT_H264.
+  The backend logic supports other formats, so we should wire up the suppo=
rt
+  for further bitsream formats.
+
+* appropreate error handling:
+allocation failure, mutex acquire failure etc.
+
+* remove all unused struct fields
+
+* change struct fields to 'bool' type or bitfield when appropreate
+Likely good candidates are fields named '*_enable' , '*_on'
+
+* handle vdi_allocate_dma_memory failure , each function has to clean afte=
r itself
+
+* make sure that 'u32', 's32' etc. are only used when reading/writing hw
+and change s32 to u32 when s32 is not required
+
+* power management handling - add (runtime_)suspen/resume cb where the clo=
ck is enabled
+
+* fix checkpatch issues (mostly fixes , only left to fix MACRO_ARG_REUSE, =
LONG_LINE)
+
+* revise logic of wave5_vpu_(dec/enc)_register_framebuffer
+
+* check if the  normal kernel endianness/__swab32 routines are sufficient.=
 (instead of the ones
+  implemented in the driver
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
