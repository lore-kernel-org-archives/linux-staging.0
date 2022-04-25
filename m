Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290128.outbound.protection.outlook.com [40.107.129.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE58F7A
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 10:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZferHotFAJdqUk5YI5x6tWG+y85ouxgM166D4rY4TUFak3UaT9ihycjmSJ+rCEew+ABoqwnzJEv18sSmGGn/vnuLphEbTyOHIPvY9UfNGh2fXx79vOUSrhZeay8cBTusE45a2Hwt7HSLkvUvUgldgh8HW7ouGBIX1U+LVRUQXhofMH5Nm/71AKCBTHSWNPxkV8ZkG3uG3xiYpE8aDvRwnGC6tLYxC4JIMtL3a4RsfTV18RJiIoNR+vmJnBJZzKBVHILF9dlE2zFifd9h8rv2nosFTM+3xjvs9PYviGxsvxf532cv+GE3jKiP2qtFnrUM32my794jglsMJVbtGSyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWDWXwgGKR048UblJP9//HcMmLdJGqN9oyFdqLCSmwo=;
 b=HS9Ja0r62OQPiUsifu8fqI3JgtTx8XRqI/0v4vyDaCny4XZ4lYhQreEa3MnyvmjrPhvP4NiT64ocFpCIOvHWdXXTEaTrA4BDOQ5oFDb9+yHiI8Mo8hs1kA9di68S6FpcEEGTQVOLi8AUSOW8R9ZcXfO8uGwPNQrdOkzYisHHrHxJhc172js+BQBLT5FFCwX3wGM1YICyOeTRSkA5HgZYuujiPG37oGU1if6OGfbtq9OCN0/SgHHpH7WHphupxtk+ZYXhVQypa5gGotz8zu0IJBoN26m1bbD9ST8bIJ4r2ouNBBQvkG6ZbksAPlGxSR2bVHRS+b+lWOpi47JXEgAczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWDWXwgGKR048UblJP9//HcMmLdJGqN9oyFdqLCSmwo=;
 b=a2Dcg+S+Ll3JlTv0PegCfXqaERZ0wN+r3fHY+3iy11dv9UXnfMkM8/0H0Q+UPtTysr0doW2wNnPiKnSro6d5nQ1bS2RjidJ3JkT0uVWjsZzt7aUImy9iR+D+SpqlgcufaImheC1q1GwZExRkEc2LhfMMTjUMaoCToXmAMfdssuk=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PSXP216MB0120.KORP216.PROD.OUTLOOK.COM (2603:1096:300:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 10:16:02 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 10:16:02 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM"
	<linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "kernel@collabora.com"
	<kernel@collabora.com>, "dafna3@gmail.com" <dafna3@gmail.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>, Scott
 Woo <scott.woo@chipsnmedia.com>, "olivier.crete@collabora.com"
	<olivier.crete@collabora.com>, "dan.carpenter@oracle.com"
	<dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"daniel@0x0f.com" <daniel@0x0f.com>
Subject: [PATCH v7 0/6] staging: media: wave5: add wave5 codec driver
Thread-Topic: [PATCH v7 0/6] staging: media: wave5: add wave5 codec driver
Thread-Index: AdhYiEF5dbKuKoipQIiFJZIhC6Ak7Q==
Date: Mon, 25 Apr 2022 10:16:01 +0000
Message-ID:
 <SL2P216MB1246AED88587FF94698653D9FBF89@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79b1349a-7f63-4000-a386-08da26a499a1
x-ms-traffictypediagnostic: PSXP216MB0120:EE_
x-microsoft-antispam-prvs:
 <PSXP216MB012045D00C1ACE4D8762801FFBF89@PSXP216MB0120.KORP216.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VvfTuJK7hyKwPDV5y5m+eJ/Okz2tHxI5ESkOou5BbBHiwNSQE+iwdE3maV1eAei+k6cBppC/OYV1jGMXiU+vKhVeDnt9apKvP1PYEGlJE1G+HEDDrINl6y7jB3vf+MJ98RQoBKDKjFI/EEnwZFL1bveBb1OQ1Y4+eASCQNhQFfKAL36+TcXuwVDL8gxj8jf1epM3SMsvcqCn3Pxk01wyE1fILZh+9Wb6vo/xGy2mB95fDgJRxR+ofcO1JdI5UMbjto9VFoyec3NKlrnvbYYrvQ6Z1HK0zrgz/kKjuzAeYrLx625iaCdz26KOvADmeJT0fcOhO7JC2QPqEp1qAeJ+Mbd/JWFDoy1zD6KFxpWhX2RXxBuNPMFy1CDbPUucKzOPMH7zfoim4+KiBJE9ndOujnd9JQ7GiTiXXj/TYwPVsxmCAp5wWRctx0QqkUYdNWYKPuCIwic38MZgWaAnKKpY3q/Dg/6U46O7/IuAg8YdWZFH7uFXRPQr0Cx2FRxUlUM7eVziGe0eBYZYweWatDfPyCHNRM19hpS+pSmIW3ju45qZ9B/nr63lIdid2h8UfNwIJPzv92s5rD7CZ6jHQddqQQEaiKDKhwlxtQu206KMX74D0v7dBhyXNT+eJPtzV9p8napq3xINC8deB1xe/a4NadqwgtR5kMAtdn6S3AbV4Y48YHeB+8s9m+cgiecziyMhOYOycihYPYUexIUkf5xnaQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(366004)(136003)(376002)(39850400004)(396003)(186003)(6916009)(54906003)(64756008)(8676002)(83380400001)(66476007)(33656002)(6506007)(9686003)(66556008)(66446008)(4326008)(76116006)(5660300002)(66946007)(316002)(26005)(7416002)(55016003)(8936002)(122000001)(508600001)(7696005)(71200400001)(86362001)(38070700005)(52536014)(38100700002)(2906002)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NJNUa2HVU5cw13iagxSadnoZrvlc7lCfNhXtHzdq6esIjV4K0WOMz1x+WKfw?=
 =?us-ascii?Q?PdFOljVJ6wLHtk7xTPdlZomT+/KlQtveJ4iekylEPuFz2nYuCS5K5JkruN06?=
 =?us-ascii?Q?9dLP70YmsqSAaF5EV0kc+Ebr6sQfxSQywCywNRNWOYdl4KnmDQIz8cmaeBAR?=
 =?us-ascii?Q?lxXqBh2ob77ltFIHk4RWjYma3bB4/jUCa5B/g+LypP2RRO+H5iwww/MMwhea?=
 =?us-ascii?Q?fGykTeCBIJ/ozRHIvKAXzdr9G+ucwl1c6uQVKFTpgxivbQD3sFZMZaCMDzlV?=
 =?us-ascii?Q?AdXNWGKnlrZHzei1uAjZ0iuJ1xgL/CU3oRUA0O78f3igPdIDhzG6YMS/Kgsa?=
 =?us-ascii?Q?O0l8UDpXvNYTDBd23zMk1ipcRal1T+OcZBzwnfUd9KHFuXzqXjOksKcP4U/t?=
 =?us-ascii?Q?kIAF4iUQYJeLH3+h2xBVeuVaIMAtiA/ptxDD1PYXBlCFcCk+BaC7shhjCY/d?=
 =?us-ascii?Q?5dB4ER/SIKFe45CDFjkTI9D4DKBDRQLEkqoE3IdBFnrmFy1K22r0CXcMZMHh?=
 =?us-ascii?Q?GwHORPCAeDHYNlZovlsSAX2CaURQyrRu7uTKuBcFxLMW4Q5ae0zlbW7YKDwg?=
 =?us-ascii?Q?2MHtIGA/xvMmNOS5O3gGCpEs6XqFrMk7/ULjFJjZq0+jjvNc42QqgZAW9nzF?=
 =?us-ascii?Q?je2UDPfIXIcVJ4SOQLxxOvXA+CWW20IqMfagzz6tIrPkyaJsA7ytnNVIzwBm?=
 =?us-ascii?Q?unP+xn/SGwnkPFJzOOOx7RAopPRkfXX3W7uFpU/vf8FhgXmwqDlGS183YsRf?=
 =?us-ascii?Q?hKiYy/KZWu4nggeFEGixeXYoKuwreBFO+sNze4qkjsIdgnKhHeRLd8ZMy2wg?=
 =?us-ascii?Q?+hsBbkwm2A7jZthlADPBYctyo70AHWe6254dgOT41CCiDptKTEpxGmp4iqh9?=
 =?us-ascii?Q?Sc8vSS3JgqSRW4QPjJhXXNCGPxsZe/hBwNNyIC0Sa5ZPBxpRsDKMW4B8QwIp?=
 =?us-ascii?Q?bUVFW7Q4DWVPMygJmI+hockUpvN1mkODwQd8arRPIY/eJRk9XZjvdxLgVYLx?=
 =?us-ascii?Q?JV3Y2ISAzyj9VMAUKvfUXu2a0J40A/SPRr1XDhnjbSrHxD9+Ca1lcBk+xk3y?=
 =?us-ascii?Q?MfrktTpEDxro0+5XspgfQJSsnaqnhxpQYRQX5LKGjCfGeymrFw9duP28+geO?=
 =?us-ascii?Q?HWDWIssZGRaCEr0wFDYl0o7hodUtj2oy24/a/6JMNR34Ioiq37SAiGL5cOdg?=
 =?us-ascii?Q?4TX9k7sWzBFmtyhb/uMf1pNleAgnsi55pZSbWYhiYG88i12HrYErOwltG9+B?=
 =?us-ascii?Q?YlvXeBtBzRcluEiBh4U4dC1Z5uLBgmqBHl2EP8xNRCSf2tqiam6/2nG9Xr5V?=
 =?us-ascii?Q?46Z+yrGsBuYMvqPCgsQfWG87tLd4bDkPO5bVRIljKcQphVEm+OFYthTl3R35?=
 =?us-ascii?Q?V2AOLYgd69zF6JbrW8DAYOw6Eji+2AyT4Y4dRfetxjgEKWMptgn/Gt217WsH?=
 =?us-ascii?Q?ePw0DeYcdAv7kuMbD7lk19NUC9PGUgCkCx1n7zR5FozO8KVhR1Uo2R/LoQni?=
 =?us-ascii?Q?A3/i4JD1Mo86jnZZqaulTSE2Xo7NwL1G3cOZBrsYL/5purVrM7V+1ge7y/gU?=
 =?us-ascii?Q?KbYi/ZtiCCMdslWDYehqKOBT/mRCgCmGIKF/nCPDpj1TzMAmwvXyrLUwNaas?=
 =?us-ascii?Q?ekc8Wnu6udWbJCteFsrEDDtIR67vtfu2uM8pde/+m0nSO4Z/df+5V9j9FurG?=
 =?us-ascii?Q?ygBS9WbjxwYnpKgBHyyobAWe8rLF8LeAf8tJMlIpuQDSGbEq389cDrmoJT4G?=
 =?us-ascii?Q?i242/ZIRGehYuJiL4mSy1Q0oK9kCsRM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b1349a-7f63-4000-a386-08da26a499a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 10:16:02.0033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VrN3tDP2aQ7Ix1qJ/KPLt4W1ok8UcUhZVzFSUaobALPwdZF4VxdX0DLwzy2J9mShFUH6zxR2RbwADBnqTyRopCTh8NPUavJpCV2ozz6QBX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0120

The wave5 codec is a stateful encoder/decoder.
It is found on the J721S2 SoC, JH7100 SoC, ssd202d SoC. Etc..
But current test report is based on J721S2 SoC.

The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.

This driver has so far been tested on J721S2 EVM board and pre-silicon FPGA=
.

Testing on J721S2 EVM board shows it working fine both decoder and encoder.
The driver is successfully working with gstreamer v4l2 good-plugin without =
any modification.

Testing on FPGA also shows it working fine, though the FPGA uses polled int=
errupts and copied buffers between the host and it's on board RAM.

The wave5 driver will be updated to support various EXT_CTRL encoder interf=
ace.

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

changes since v6:

* update TODO file
* get sram info from device tree

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


Dafna Hirschfeld (1):
  staging: media: wave5: Add the vdi layer

Nas Chung (3):
  staging: media: wave5: Add vpuapi layer
  staging: media: wave5: Add the v4l2 layer
  staging: media: wave5: Add TODO file

Robert Beckett (2):
  dt-bindings: media: staging: wave5: add yaml devicetree bindings
  media: wave5: Add wave5 driver to maintainers file

 .../bindings/staging/media/cnm,wave.yaml      |   73 +
 MAINTAINERS                                   |    9 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/wave5/Kconfig           |   12 +
 drivers/staging/media/wave5/Makefile          |   10 +
 drivers/staging/media/wave5/TODO              |   34 +
 drivers/staging/media/wave5/wave5-hw.c        | 3405 +++++++++++++++++
 drivers/staging/media/wave5/wave5-regdefine.h |  655 ++++
 drivers/staging/media/wave5/wave5-vdi.c       |  260 ++
 drivers/staging/media/wave5/wave5-vdi.h       |   81 +
 drivers/staging/media/wave5/wave5-vpu-dec.c   | 1385 +++++++
 drivers/staging/media/wave5/wave5-vpu-enc.c   | 1532 ++++++++
 drivers/staging/media/wave5/wave5-vpu.c       |  381 ++
 drivers/staging/media/wave5/wave5-vpu.h       |   73 +
 drivers/staging/media/wave5/wave5-vpuapi.c    | 1049 +++++
 drivers/staging/media/wave5/wave5-vpuapi.h    | 1144 ++++++
 drivers/staging/media/wave5/wave5-vpuconfig.h |   91 +
 drivers/staging/media/wave5/wave5-vpuerror.h  |  455 +++
 drivers/staging/media/wave5/wave5.h           |   82 +
 20 files changed, 10734 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wav=
e.yaml
 create mode 100644 drivers/staging/media/wave5/Kconfig
 create mode 100644 drivers/staging/media/wave5/Makefile
 create mode 100644 drivers/staging/media/wave5/TODO
 create mode 100644 drivers/staging/media/wave5/wave5-hw.c
 create mode 100644 drivers/staging/media/wave5/wave5-regdefine.h
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vdi.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-dec.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu-enc.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpu.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.c
 create mode 100644 drivers/staging/media/wave5/wave5-vpuapi.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuconfig.h
 create mode 100644 drivers/staging/media/wave5/wave5-vpuerror.h
 create mode 100644 drivers/staging/media/wave5/wave5.h

--=20
2.30.2

