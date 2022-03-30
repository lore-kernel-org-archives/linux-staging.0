Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC79A7C;
	Wed, 30 Mar 2022 18:52:33 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id c62so25528347edf.5;
        Wed, 30 Mar 2022 11:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CTWrzljSwLfZ0l2PhXMaWGZIdhNeoDOQRnqzHnIspbk=;
        b=JLCUEHQmAu4IFA3Pp0pbMtWaA5zMmoL+kw15OpNzaAzO8UE4DGw0x6yHFtvG6u/yGB
         czJ6FnppkuGExQg2MsjtV/bauz5Y5saZG8yP/EBjfcige3kiaLZ9JDT6ppmno5PaPGPG
         Z2WMjM9A1on4O2PWumA2uSuSZWN0+6X3qZl0NjPpq8KQajpYfLM9IQmP9zL2pLCwnRU1
         NQll0TTUbLacZ68FCz4gHF8gDW1ZFhbe6m3jUUmb+aIctO/qKcrPexJOKkfIPKvuwJsf
         R+qeQbL2eFJKqpsYWI9JHeA8JtbG/y4RQHlf4SVpmg+1LqU3HjLPOnQvGp1Elsydiz2Z
         f3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CTWrzljSwLfZ0l2PhXMaWGZIdhNeoDOQRnqzHnIspbk=;
        b=PLjj2lxhQL6QZ5zQycRDLNn5fAvfzc6vCvt5njXJKOa1vd0XlSjX29MGrqQNlSiWEE
         to7n/aDkmrm3MSBJ6RcjqhYz8TzEdfab2FIx3mqQT1qtB0gA1qDhtLEIKsU3omEaoqFC
         qlpm7MdzVaaW6DfCxVLMSabfsYb/q85mOHA1xL6NEoSYdmVveSZYDsgGgIq+dyi6iQB5
         l3cxyliRNv0z3mzQPhI9UFZ438RzRKwRYPGpahpEqoXGGSFNgaBNDjVPmrmY2xjVQDPA
         kTP88l18OKL3Mu0oVX6X6Im6zwnNd28abrkFokLCMru0Lt30KTbbW5sYORnirFXSmC9c
         z8Rw==
X-Gm-Message-State: AOAM533C3rBTw8foBcZ+s4qbCg5PKeZXcEjFj3Dcldzrx9avbOZpbcYZ
	JUXMDOk2HBIU3Aqq12PVZ+L+JuzJ4Tph2yDtBLQ=
X-Google-Smtp-Source: ABdhPJytxAuQdsBpDd/i3vdjOy1nf0HrltailaW23kgs4zAMNZy9pY7RJ8JsGFEsiiYYszczMXa4Yy9ZR6wG8bfquHI=
X-Received: by 2002:aa7:c64c:0:b0:418:ecf7:afaa with SMTP id
 z12-20020aa7c64c000000b00418ecf7afaamr12680127edr.38.1648666351722; Wed, 30
 Mar 2022 11:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228140838.622021-1-benjamin.gaignard@collabora.com> <eefa63b3-2a4d-4470-9a4e-517087ebcfaf@collabora.com>
In-Reply-To: <eefa63b3-2a4d-4470-9a4e-517087ebcfaf@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 30 Mar 2022 13:52:20 -0500
Message-ID: <CAHCN7xL2uZTMy30FGfDkDK4Lym6wvfr_MTv7QwtchrkTXMQiuw@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] Move HEVC stateless controls out of staging
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mripard@kernel.org, 
	paul.kocialkowski@bootlin.com, Chen-Yu Tsai <wens@csie.org>, 
	"jernej.skrabec" <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	kernel <kernel@collabora.com>, knaerzche@gmail.com, jc@kynesim.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 2:53 AM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 28/02/2022 =C3=A0 15:08, Benjamin Gaignard a =C3=A9crit :
> > This series aims to make HEVC uapi stable and usable for hardware
> > decoder. HEVC uapi is used by 2 mainlined drivers (Cedrus and Hantro)
> > and 2 out of the tree drivers (rkvdec and RPI).
> >
> > After the remarks done on version 2, I have completely reworked to patc=
hes
> > split so changelogs are meaningless. I have also drop "RFC" from the
> > titles.
> >
> > Version 4:
> > - Add num_entry_point_offsets field in  struct v4l2_ctrl_hevc_slice_par=
ams
> > - Fix V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS name
> > - Initialize control V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS
> > - Fix space/tab issue in kernel-doc
> > - Add patch to change data_bit_offset definition
> > - Fix hantro-media SPDX license
> > - put controls under stateless section in v4l2-ctrls-defs.c
> >
> > At the end fluster tests results on IMX8MQ is 77/147 for HEVC codec.
>
> Dear reviewers,
>
> This series is waiting for your feedback,

I tried several times with the suggested repos for both the kernel and
g-streamer without success getting Fluster to pass any tests on the
imx8mq.  I can try again but I likely won't get to it until this
weekend.  If I can get it working, I'll test both the 8mq and 8mm.

adam
>
> Thanks,
> Benjamin
>
> >
> > Benjamin
> >
> >
> > Benjamin Gaignard (12):
> >    media: uapi: HEVC: Add missing fields in HEVC controls
> >    media: uapi: HEVC: Rename HEVC stateless controls with STATELESS
> >      prefix
> >    media: uapi: HEVC: Add document uAPI structure
> >    media: uapi: HEVC: Define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS as a
> >      dynamic array
> >    media: uapi: Move parsed HEVC pixel format out of staging
> >    media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS control
> >    media: uapi: Move the HEVC stateless control type out of staging
> >    media: controls: Log HEVC stateless control in .std_log
> >    media: uapi: Create a dedicated header for Hantro control
> >    media: uapi: HEVC: fix padding in v4l2 control structures
> >    media: uapi: Change data_bit_offset definition
> >    media: uapi: move HEVC stateless controls out of staging
> >
> > Hans Verkuil (3):
> >    videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
> >    v4l2-ctrls: add support for dynamically allocated arrays.
> >    vivid: add dynamic array test control
> >
> >   .../userspace-api/media/drivers/hantro.rst    |   5 -
> >   .../media/v4l/ext-ctrls-codec-stateless.rst   | 833 +++++++++++++++++=
+
> >   .../media/v4l/ext-ctrls-codec.rst             | 780 ----------------
> >   .../media/v4l/pixfmt-compressed.rst           |   7 +-
> >   .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +
> >   .../media/v4l/vidioc-queryctrl.rst            |   8 +
> >   .../media/videodev2.h.rst.exceptions          |   5 +
> >   .../media/test-drivers/vivid/vivid-ctrls.c    |  15 +
> >   drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 ++-
> >   drivers/media/v4l2-core/v4l2-ctrls-core.c     | 198 ++++-
> >   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  37 +-
> >   drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
> >   drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
> >   drivers/staging/media/hantro/hantro_drv.c     |  27 +-
> >   drivers/staging/media/hantro/hantro_hevc.c    |   8 +-
> >   drivers/staging/media/sunxi/cedrus/cedrus.c   |  24 +-
> >   .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
> >   .../staging/media/sunxi/cedrus/cedrus_h265.c  |   2 +-
> >   include/media/hevc-ctrls.h                    | 250 ------
> >   include/media/v4l2-ctrls.h                    |  48 +-
> >   include/uapi/linux/hantro-media.h             |  19 +
> >   include/uapi/linux/v4l2-controls.h            | 439 +++++++++
> >   include/uapi/linux/videodev2.h                |  13 +
> >   23 files changed, 1697 insertions(+), 1170 deletions(-)
> >   delete mode 100644 include/media/hevc-ctrls.h
> >   create mode 100644 include/uapi/linux/hantro-media.h
> >
