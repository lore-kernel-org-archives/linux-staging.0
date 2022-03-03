Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478BC36B;
	Thu,  3 Mar 2022 01:24:04 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s14so4669887edw.0;
        Wed, 02 Mar 2022 17:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3467nWZC+KAJVLicOM15omsr+yL6Bg92k71Yp4t13dQ=;
        b=TUxU5rY59G2o3LjWEZfFUOJqqwXW4FQeJ+4Nb65Cx0MI2116zcxYevNsk0AALHPnpB
         uogSbFmePS0klnIll9vZ/DXp+psjAzaJxHZ4yjeuQsyfEop7OInuoz0/rCJvI4aYlwQK
         xbiu9T4eQXSTt8KKDFY1hdIpy5wDNRsX7//9Abat+2qWluBT6ala2y61KhnEbGtSJIca
         Ogh1JaH+dp50QX6oyP35/947/KSZWvb1ybqxmOBgemdXCz2F5yWh60iIWDMhUt1oR6AQ
         UlYFLlPdcMVL1X/Vpu058fAY9BXwZOoIwneKmcpc5PpSAiw8brGOxhEUP/kr+2L0z+MM
         0iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3467nWZC+KAJVLicOM15omsr+yL6Bg92k71Yp4t13dQ=;
        b=hSL4IdJR/ZN0sgFzCbifXdsWeP5UeCf4Jv9jghJmvyFXlJq49I5DlZyzj1f48gE44l
         qD4+VqKUZ4KMeIxbsTcr/EsagBxMRrjpCdr86FRF0HHPT2repLcB8PtaRTr0aH/qZiIQ
         3hmaw4EfqPOONJgUOcp9DfdtQ8l9ndTrPt/Q1EUfe+BRQwWOnGu2QHNas0/KE9KZDAI6
         zRXs/UfEEzLs+9XZnZs30j52EzhNXVjR4YfCdyYF5hL3abYQwFqftTwNVtlZrT083rnz
         Fg6DMbizta8v9kedmzj2aQ3gzu3ZEW/GeZVriMxxrM+zrLSRM4NALEZ4T108PfOkpzhS
         bx9w==
X-Gm-Message-State: AOAM5331rD6QRBZ2YkkPPbVMO9livtNk0NNScEDv3/d5xFrVp1bZCCdX
	W0Itkf/MeCACPAAMg6jYCs9kjlQM+9Cyp2rz9Rc=
X-Google-Smtp-Source: ABdhPJwvB1dU87k2TUEoV71MreDjl9INYbX233X4HisAj4CxIAGd6ZOicsbmF/IV18XgbjYDUwwD7ynC/O3RrXgzzys=
X-Received: by 2002:aa7:cb18:0:b0:413:3a7a:b5d6 with SMTP id
 s24-20020aa7cb18000000b004133a7ab5d6mr31792705edt.254.1646270642228; Wed, 02
 Mar 2022 17:24:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225164600.1044663-1-benjamin.gaignard@collabora.com>
 <CAHCN7x+AUy4JsqfdyZFqg4ScR1OgoLvqF91za0AZ278NSBJj4A@mail.gmail.com> <b832271d-cecd-a373-48ff-ba5ce736e47d@collabora.com>
In-Reply-To: <b832271d-cecd-a373-48ff-ba5ce736e47d@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 2 Mar 2022 19:23:50 -0600
Message-ID: <CAHCN7xJ3K2bLEc8dcTM+x-E0brDW-t4yrUdkUe0jCfuzH8v9pA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Move HEVC stateless controls out of staging
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

On Mon, Feb 28, 2022 at 4:13 AM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 26/02/2022 =C3=A0 23:25, Adam Ford a =C3=A9crit :
> > On Fri, Feb 25, 2022 at 4:41 PM Benjamin Gaignard
> > <benjamin.gaignard@collabora.com> wrote:
> >> This series aims to make HEVC uapi stable and usable for hardware
> >> decoder. HEVC uapi is used by 2 mainlined drivers (Cedrus and Hantro)
> >> and 2 out of the tree drivers (rkvdec and RPI).
> >>
> >> After the remarks done on version 2, I have completely reworked to pat=
ches
> >> split so changelogs are meaningless. I have also drop "RFC" from the
> >> titles.
> >>
> >> In this v3 I do all the changes (new controls, documentation, etc..)
> >> in the staging directory before moving the HEVC uAPI to stable
> >> steps by steps (unlike the big one patch in v2).
> >>
> >> At the end fluster tests results on IMX8MQ is 77/147 for HEVC codec.
>
> I have push a branch here:
> https://gitlab.collabora.com/benjamin.gaignard/for-upstream/-/commits/HEV=
C_UAPI_V4
>
> it is the incoming version 4 of this series + patches to enable G2 on my =
IMX8MQ

Benjamin,

I checked this repo out, and built it along with pulling the latest
versions of G-streamer and fluster.
When I check for v4l2 compatibility, I get the following:

    GStreamer-H.264-V4L2-Gst1.0: GStreamer H.264 V4L2 decoder for
GStreamer 1.0... =E2=9D=8C
    GStreamer-H.264-V4L2SL-Gst1.0: GStreamer H.264 V4L2SL decoder for
GStreamer 1.0... =E2=9C=94=EF=B8=8F
    GStreamer-AV1-V4L2SL-Gst1.0: GStreamer AV1 V4L2SL decoder for
GStreamer 1.0... =E2=9D=8C
    GStreamer-H.265-V4L2-Gst1.0: GStreamer H.265 V4L2 decoder for
GStreamer 1.0... =E2=9D=8C
    GStreamer-H.265-V4L2SL-Gst1.0: GStreamer H.265 V4L2SL decoder for
GStreamer 1.0... =E2=9D=8C
    GStreamer-VP8-V4L2-Gst1.0: GStreamer VP8 V4L2 decoder for GStreamer 1.0=
... =E2=9D=8C
    GStreamer-VP8-V4L2SL-Gst1.0: GStreamer VP8 V4L2SL decoder for
GStreamer 1.0... =E2=9C=94=EF=B8=8F
    GStreamer-VP9-V4L2SL-Gst1.0: GStreamer VP9 V4L2SL decoder for
GStreamer 1.0... =E2=9C=94=EF=B8=8F

I see H,264, VP8 and VP9, but I would have also expected
GStreamer-H.265-V4L2SL-Gst1.0 to return with a check box.

When I checked to see if both decoders were being enumerated, I found they =
were.
[gst-main] root@localhost:~/gstreamer/fluster# dmesg |grep -i hantro
[   16.044243] hantro_vpu: module is from the staging directory, the
quality is unknown, you have been warned.
[   16.044243] hantro_vpu: module is from the staging directory, the
quality is unknown, you have been warned.
[   16.095661] hantro-vpu 38300000.video-codec: registered
nxp,imx8mq-vpu-g1-dec as /dev/video0
[   16.096782] hantro-vpu 38310000.video-codec: registered
nxp,imx8mq-vpu-g2-dec as /dev/video1

Did I do something wrong, or did I miss something?

adam

>
> Regards,
> Benjamin
>
> > Benjamin,
> >
> > I have an imx8mm and imx8mq that I can test. Do you happen to have a
> > repo that I can clone to test this?  The imx8m stuff is spread around
> > between the media tree and the imx tree since it hasn't been fully
> > merged yet.
> >
> > thanks,
> >
> > adam
> >
> >> Benjamin
> >>
> >> Benjamin Gaignard (11):
> >>    media: uapi: HEVC: Add missing fields in HEVC controls
> >>    media: uapi: HEVC: Rename HEVC stateless controls with STATELESS
> >>      prefix
> >>    media: uapi: HEVC: Add document uAPI structure
> >>    media: uapi: HEVC: Define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS as a
> >>      dynamic array
> >>    media: uapi: Move parsed HEVC pixel format out of staging
> >>    media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET control
> >>    media: uapi: Move the HEVC stateless control type out of staging
> >>    media: controls: Log HEVC stateless control in .std_log
> >>    media: uapi: Create a dedicated header for Hantro control
> >>    media: uapi: HEVC: fix padding in v4l2 control structures
> >>    media: uapi: move HEVC stateless controls out of staging
> >>
> >> Hans Verkuil (3):
> >>    videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
> >>    v4l2-ctrls: add support for dynamically allocated arrays.
> >>    vivid: add dynamic array test control
> >>
> >>   .../userspace-api/media/drivers/hantro.rst    |   5 -
> >>   .../media/v4l/ext-ctrls-codec-stateless.rst   | 831 ++++++++++++++++=
++
> >>   .../media/v4l/ext-ctrls-codec.rst             | 780 ----------------
> >>   .../media/v4l/pixfmt-compressed.rst           |   7 +-
> >>   .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +
> >>   .../media/v4l/vidioc-queryctrl.rst            |   8 +
> >>   .../media/videodev2.h.rst.exceptions          |   5 +
> >>   .../media/test-drivers/vivid/vivid-ctrls.c    |  15 +
> >>   drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 ++-
> >>   drivers/media/v4l2-core/v4l2-ctrls-core.c     | 198 ++++-
> >>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  32 +-
> >>   drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
> >>   drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
> >>   drivers/staging/media/hantro/hantro_drv.c     |  27 +-
> >>   drivers/staging/media/hantro/hantro_hevc.c    |   8 +-
> >>   drivers/staging/media/sunxi/cedrus/cedrus.c   |  24 +-
> >>   .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
> >>   include/media/hevc-ctrls.h                    | 250 ------
> >>   include/media/v4l2-ctrls.h                    |  48 +-
> >>   include/uapi/linux/hantro-media.h             |  19 +
> >>   include/uapi/linux/v4l2-controls.h            | 436 +++++++++
> >>   include/uapi/linux/videodev2.h                |  13 +
> >>   22 files changed, 1686 insertions(+), 1169 deletions(-)
> >>   delete mode 100644 include/media/hevc-ctrls.h
> >>   create mode 100644 include/uapi/linux/hantro-media.h
> >>
> >> --
> >> 2.32.0
> >>
