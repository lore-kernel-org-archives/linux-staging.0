Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290100.outbound.protection.outlook.com [40.107.129.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722C7F6
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 09:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EA2LTHy/za65Z508HIYCYmWr/syqwvNT/uK3K70tkxGrwsqmjytBAni7akNS6T3LC9hSliLkW/FUXDc/ZUYYw0gp5DwRZ5bSVERDk6EVBDTHgFhcn5rX7eBvFxoHv2cV90ubW935pSLxfOvrCQksuX3nzJPf60oJ6ANzoaACUk2VbW5Y3A0EkEIhigBz+3p4TG582Yl00dTrye1m5Z53EfzjNjN/vaSORz3URJilLZH2KEt6OEQLS89rP7FeKpICO9cwBm9egoQs+1DBDEleV3jJ1a49BL7lVroduENyqHhDvlq1PwJU+CHCY2N6fV2nnwPOwT4t+0ybSMHc+1HJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDKHMLCWB0z6/RGLFZgAjgZeZOtibHMFOGlgvjLnu3I=;
 b=QrooXPLQfxqpkoCOLjB4UTIHGlpI/zz95Cz8hqztq+zIcKFcV3RHshvdYv8cHtlrJ9ljhNXCXRaDnCGw19BXVe9qvWyMz5C+IFbyQgvz+zgOP9k18tCxFCwV3RGIuoG+TFG3EZ8ApDPkQUpBDD2Ew7EHiJtdlfXLu/MsvA+0wAwv9gVLAoaS9tnDDxqSkmN6GjK/OFm6OTDKedOrE9/THfltu6xM0wFszCL3g7Mxa1LcygPXQbeS1j9deCDdMVKaBhDyCZmBufCBapxRStgdd+Q9f8LfXQ+MPurEbaFIyPWUJUZXpTKego53206+BZNuE/Gbr1fKq9cW2/vDO/Ld5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDKHMLCWB0z6/RGLFZgAjgZeZOtibHMFOGlgvjLnu3I=;
 b=RrWOyHIeVUEgHRy6BP9mytCdnV0hF9mhk37q8dOT0GmQ6LGTJKLvXqJP6/EVv6oOSWQZLlC83KqyTGGvBTgRwFWrByCMLPy0Cws+fiQoTMLlUKunvRggM+hLeMruORM7R3I2PZxrZrtz71w2KxopMbip45+lhZX9iDkpikX/cCI=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0550.KORP216.PROD.OUTLOOK.COM (2603:1096:300:10::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17; Thu, 31 Mar 2022 09:55:05 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::194d:3409:b632:abb3%7]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 09:55:05 +0000
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
Subject: [PATCH v6 0/6] staging: media: wave5: add wave5 codec driver
Thread-Topic: [PATCH v6 0/6] staging: media: wave5: add wave5 codec driver
Thread-Index: AdhE3d5NFr5tWcUtSSyJSIIwxVjkNgABaNSg
Date: Thu, 31 Mar 2022 09:55:05 +0000
Message-ID:
 <SL2P216MB12463C7630940E2F79972D45FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References:
 <SL2P216MB12464232808E51FE8F6921AEFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SL2P216MB12464232808E51FE8F6921AEFBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a434315c-a550-4522-69b5-08da12fc8818
x-ms-traffictypediagnostic: PSXP216MB0550:EE_
x-microsoft-antispam-prvs:
 <PSXP216MB05509057E5E3E3A8574FC290FBE19@PSXP216MB0550.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tneUf4cBtWw4t7brLAha6YwRPOv5GdNWR5BIQomGTNvoSKGYVZ0mKokcalejrDexWi8DT8G5PMR0+mvdP64g2CRJVrJ7WDoMkg9oGSrpRo0BgPfw031eJxWvW1aPG6I/LVXfBVb4RUF2VxTpzM/HSxJLKAyMTqK3WIPCZjf/D7uwIuaGVPST4BnyDknapa2IAuh8xjnBCnt/WkvEpmbVJmJ3fjOQrwM9lJSCMF72CNiNmJDuAly7zcMiiV9fVLQD9rtultyg6xXTcPsMRHCqYadbv+Zf26ll98rdPPmjITVs198Cm+1dkD5JiN65xU74zF6eTeUwElZKa13ISXpwTXv3M6H9D039yzdfWgYMdzPyg+hE6iQJDijofTfXqVeJr2RYDk7mxbTBsN9m6pMbbGI/UUR/jyOW7Y3VftF3e8Ug/wgOT9MDwP0TFIIinbxogATVvNleoEnkYvOwKXxs+TpTj1IR5EddnBXdOakld7sKlGzGQEKyo/JUtAE9G+KHNRdqgiMyKdjxRpLTfTTeSFhSY4FtKMAWBxWpND7nzDVuJyzMz4Gz81XR20GQJ+uQdGwK5r/PdQM//w+5tJe1NiX/aZrnrDTYxD9ItVc4psfUzy+BoRKINp969JZJK+TrpWGd/uwh0OWEpbqec/s3Islr+v9Jiv767VnZnEAiNm8wsR70rAEu6cadHitakhwDETe0+tiklIZ5oDH8/ufMrw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(136003)(376002)(396003)(366004)(346002)(39840400004)(4326008)(2906002)(83380400001)(7416002)(66946007)(66446008)(5660300002)(38070700005)(44832011)(52536014)(76116006)(66556008)(64756008)(8936002)(66476007)(316002)(8676002)(86362001)(54906003)(26005)(186003)(122000001)(2940100002)(33656002)(71200400001)(9686003)(38100700002)(55016003)(7696005)(6916009)(6506007)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HjRUCLb/fbSViJZSC27jlJGDsgFfM2ukVx1idUAOs6YAfqCGmNd4hCuVIhVl?=
 =?us-ascii?Q?UibolT1R7D1pW0coPWSsxOOCWi6tTUjlTcWauIeLmcWuCeD+EVhLIH7ibrKl?=
 =?us-ascii?Q?gc3OU4qmRPSkEKJH91hCDj5mPXUNavKLVU2Sm8zSoXh6fq5EoBA09+rGZYdd?=
 =?us-ascii?Q?4+y12efblXb8xSjCX6mH+NtYro7lZvDQGem7WvEMLjReCS1ru81IDWaQqm/Y?=
 =?us-ascii?Q?8sTTnQ2VbT+UaSptdS+Vzjsn0rdYfNmS/cH2R9vt10HQgAvAyprw/6SwsO9o?=
 =?us-ascii?Q?2Pmk/W3AICVyT0Xb7EW7IfDBrqWN8nWxlr7JwswyW4VQJDmHDBFOmkBP//GS?=
 =?us-ascii?Q?PItzwwWYsv+hg/gP9A30R1UxMJPbU9v3OuNlONJLy8CqY+plZdbiF+YxXPo4?=
 =?us-ascii?Q?J2RGXzjgoQIYjvwBk+/4HVDPwnVc6p/rE7Ij8eKu6xsA2o/jXAV6zAex5sTK?=
 =?us-ascii?Q?wczCBnwoIIq9IoKVY94EzXjWPZIKYwNzGVQkD80EqOSKjpl+HEsoIPCWARxR?=
 =?us-ascii?Q?WQwygiRTlv17HYNMrt2z0mBCh9A8MzoPSi9QY7/vLT5iegnAg9goQH0GnBex?=
 =?us-ascii?Q?+v5w7D/w8dbg+jW/WyaHqIvlOBhGiZQMiFS3z2tGgWaPpucndOlXSwOL4XHB?=
 =?us-ascii?Q?ifz3RLGiOAErCPzVDLOGyHl7ZXBxNBy4aTJ8kCmCk1YibdSvffizeoqE5k80?=
 =?us-ascii?Q?/nbTDN0V5aK6QyUv+UsUgA1L/WxonQMyj8KPSt7SMhw6Ux8nrnW9YehtV1Sk?=
 =?us-ascii?Q?Y79MsAMz0IgBaVDT73/rjkpWHIBqHGDRbtulrgT3oKLn8Mfki4cNjfW+7tTy?=
 =?us-ascii?Q?xa1taA/at31nMxIWSrwnRaPI4a9FdeVr5KhLjBzr60wt/sqw+peTKbMML5wJ?=
 =?us-ascii?Q?Imrolxq0g0jthiJRU+fbOEVZIPcHX5vm8sSfd57n3de/LhXcg21TJFkXamJg?=
 =?us-ascii?Q?diarbbxo0yvm22i0c51CzCyIH9i2ycc7XaLgJf4vTvOiqoHoCHun2GCMCW5Z?=
 =?us-ascii?Q?UXPlr3mx39Ht/O2MfN4I9xxUjevvvTShHMGI0YeO9Hv65NAGcTcITKX5TXP6?=
 =?us-ascii?Q?a3NbJbjH8opIMVXncKTOmGBIYFuRvFP8jXfCF/jjl+PWrOXTyX6m3Ot3dllN?=
 =?us-ascii?Q?wt8GFi8jB3WefSNjx+Vk3Lwr28DH47WIii06LDGa+BfP/ODCjHeuW/rQ5iy7?=
 =?us-ascii?Q?iEC9FYcaNdRyNZ8zzdLDio7/2YSoQfvy2sUTu6oiBoie2q2tn7O54eDbPyZf?=
 =?us-ascii?Q?z4LYX9OXhp1M979LAZk3sNP97j0b3jQKylxMVwoXT5w68dtuwLlr/f2U1ADd?=
 =?us-ascii?Q?SGWDuoAHD9wZV77SmqsoTL/DYuYTH7NCjrmNRoEZCTPOKZCGxvBK1dHn+rG1?=
 =?us-ascii?Q?NrHfOdfinndhSEaeC0JR4v/RZlEf/cJSH2+jUqTl30XMP5Vdb/tiwiAUyI7I?=
 =?us-ascii?Q?ZFYYrbl9zWGLtF6D+PIpWHpXW8ywafnoBLYAYkygcxaewb7Y1enHjarkF7ta?=
 =?us-ascii?Q?9Wm6n8sghsGaBLgN+n64a8ElABK9U4DPIIclfZHBExHMx7K11Kl0EjEKwiCg?=
 =?us-ascii?Q?A0DU3h1mrt1O+MZp79kImIjQryK+RBDQNzxXCnHkh+oDVrXGwnpApwzVAixJ?=
 =?us-ascii?Q?LgdKJ7D1Gy3oHh7twuMXXHBrN+OJ093Kx+mM1kT7dklVTaKsds7O3ZKvOvk4?=
 =?us-ascii?Q?Mcd0OYrPT6i2b3KX5EH8oiEe2qSWfgKkvzkNoxjrBcOQN3CeFH9yuYwoJs8V?=
 =?us-ascii?Q?QZq+1rLwi56ZrLu9VuXEbFVWMRZNzhk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a434315c-a550-4522-69b5-08da12fc8818
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 09:55:05.0237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kx1Aj2voUcVinLkRWmz0xbD9WkkCURsXqRecsoTyYS8+NwOp50Biv0G8sSb+yMSb/mqVXwS+7igCT2TLJzsFedEoAeQJwrmWgFAPYrrVTjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0550

The wave5 codec is a stateful encoder/decoder.
It is found on the JH7100 SoC and J721S2 SoC.

The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.

This driver has so far been tested on pre-silicon FPGA and on the beta Beag=
leV board which uses the StarFive JH7100 beta SoC.
Additionally, The driver is also being tested on the J721S2 EVM board.

Testing on J721S2 EVM board shows it working fine both decoder and encoder.
The driver is successfully working with gstreamer v4l2 plugin without any m=
odification.

Testing on FPGA shows it working fine, though the FPGA uses polled interrup=
ts and copied buffers between the host and it's on board RAM.

Testing on BeagleV shows buffer corruption that is currently attributed to =
a known silicon issue in the SoC that makes the cache coherent interconnect=
 not so coherent.
This can likely be solved when the riscv non-coherent dma support lands and=
 provide optional v4l2 non-contiguous allocator, though it remains to be se=
en whether support non-coherent use cases will be useful in real world hw.
Testing the encoder is currently impossible because of the BeagleV buffer p=
roblems, That will need to be tested once we have fixed BeagleV buffer prob=
lems.

v4l2-compliance tests from J721S2:

# v4l2-compliance -d0
v4l2-compliance SHA: not available, 64 bits

Compliance test for vpu-dec device /dev/video0:

Driver Info:
        Driver name      : vpu-dec
        Card type        : vpu-dec
        Bus info         : platform:vpu-dec
        Driver version   : 5.10.100
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 1

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for vpu-dec device /dev/video0: 44, Succeeded: 44, Failed: 0, Warning=
s: 0

# v4l2-compliance -d1
v4l2-compliance SHA: not available, 64 bits

Compliance test for vpu-enc device /dev/video1:

Driver Info:
        Driver name      : vpu-enc
        Card type        : vpu-enc
        Bus info         : platform:vpu-enc
        Driver version   : 5.10.100
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 15 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
                warn: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-=
test-formats.cpp(1320): S_PARM is supported for buftype 2, but not for ENUM=
_FRAMEINTERVALS
                warn: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-=
test-formats.cpp(1320): S_PARM is supported for buftype 10, but not for ENU=
M_FRAMEINTERVALS
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for vpu-enc device /dev/video1: 44, Succeeded: 44, Failed: 0, Warning=
s: 2

changes since v5:

* support NV12/NV21 pixelformat for encoder and decoder
* handle adnormal exit and EOS

changes since v4:

* refactor functions in wave5-hw and fix bug reported by Daniel Palmer
* rename functions and variables to better names
* change variable types such as replacing s32 with u32 and int with bool as=
 appropriate

changes since v3:

* Fixing all issues commented by Dan Carpenter
* Change file names to have wave5- prefix
* In wave5_vpu_probe, enable the clocks before reading registers, as commen=
ted from Daniel Palmer
* Add more to the TODO list,

changes since v2:

Main fixes includes:
* change the yaml and dirver code to support up to 4 clks (instead of one)
* fix Kconfig format
* remove unneeded cast,
* change var types
* change var names, func names
* checkpatch fixes

changes since v1:

Fix chanes due to comments from Ezequiel and Dan Carpenter. Main fixes incl=
ueds:
* move all files to one dir 'wave5'
* replace private error codes with standart error codes
* fix extra spaces
* various checkpatch fixes
* replace private 'DPRINTK' macro with standart 'dev_err/dbg ..'
* fix error handling
* add more possible fixes to the TODO file


Dafna Hirschfeld (4):
  staging: media: wave5: Add vpuapi layer
  staging: media: wave5: Add the vdi layer
  staging: media: wave5: Add the v4l2 layer
  staging: media: wave5: Add TODO file

Robert Beckett (2):
  dt-bindings: media: staging: wave5: add yaml devicetree bindings
  media: wave5: Add wave5 driver to maintainers file

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
