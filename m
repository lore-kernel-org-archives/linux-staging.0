Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBF38FF;
	Sat, 26 Feb 2022 22:25:26 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s1so12192994edd.13;
        Sat, 26 Feb 2022 14:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ka0fJfaEyT657Um9FeyHeP7Rnr5mv2eI9Xu99fm+8Bk=;
        b=Vt9+nHTtETU58Xc3eIKvRc/WkHWjoUlhcwl8OSex2oWHOba0ClnZbh8LNGfDEyRU8S
         X1Ai8kz/V5UzowVgVc19acKfI9jaMzyAECWMXENKZMiJfc0+THn5ZEnXbJlvJUd6DwMs
         pjgBbX+r4NsXbIm8zxbeOjWX8xx0Bg+hjmXTwuQuCt3jasKdJUWf/xjqADcOM28nPyFi
         IaQZtD34qhroJNtUHPsyHzGNXcX6HHUq+IXFt7qQNv7V92SZGbs9tDx3LeUqpReu3YAM
         Rfgrs4V//Zix6kp1pi47bkBAGOQ7Y8BvWAf+gXSsEc8sI+4mZYQ3MkUz+84c67J/pFCo
         qnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ka0fJfaEyT657Um9FeyHeP7Rnr5mv2eI9Xu99fm+8Bk=;
        b=E8VbZ+8GbO1/AB9WAHM4ietinrcDyj9HM295+tBsCS9uvHJCHqqkwTmCZDezLgQMn4
         vbBgN5QHgmMPWkLc587f0k6fdsXplc/8fZ8VcvQgUrEp25dYovjYSXmXPAJLHHp7YScP
         ABR5efn21f5WoW1zhOLJ+4kMKFv1wRj+3TxffKK9Hc/nbvKLR1e7FREIKpapweVh31QD
         jx6Yz+eMjJBDB797QjkjVol1w/ayVuVzGFH0v8HQDuF6h002lmVGOW2yk2uQTTIzmsA7
         +ZwpP5o+dKrNpwl9nM1jtAhw7+rwsgjAzK+mUAlT2JQEaNL2fNLrOQ/0+jd2JBY+R943
         T6cQ==
X-Gm-Message-State: AOAM530VJph9wGVkcUJeYgdzoF53oC68+uo9i4VdkhIS1PHDL4K7TBQX
	JOT8Gnpr9IarI/H5+BEAIIx00o6Ic0QeclvoujA=
X-Google-Smtp-Source: ABdhPJyBsiw0DvHMRQlUz9GXW0FYpUFaH4DEFXv2v/OYUSpXVkbmZVW8PZj30ZBRG37QqTFig47hC3t4ornAT+QtkDI=
X-Received: by 2002:a05:6402:90b:b0:412:a7cc:f5f9 with SMTP id
 g11-20020a056402090b00b00412a7ccf5f9mr12708238edz.136.1645914324423; Sat, 26
 Feb 2022 14:25:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220225164600.1044663-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20220225164600.1044663-1-benjamin.gaignard@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 26 Feb 2022 16:25:13 -0600
Message-ID: <CAHCN7x+AUy4JsqfdyZFqg4ScR1OgoLvqF91za0AZ278NSBJj4A@mail.gmail.com>
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

On Fri, Feb 25, 2022 at 4:41 PM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> This series aims to make HEVC uapi stable and usable for hardware
> decoder. HEVC uapi is used by 2 mainlined drivers (Cedrus and Hantro)
> and 2 out of the tree drivers (rkvdec and RPI).
>
> After the remarks done on version 2, I have completely reworked to patches
> split so changelogs are meaningless. I have also drop "RFC" from the
> titles.
>
> In this v3 I do all the changes (new controls, documentation, etc..)
> in the staging directory before moving the HEVC uAPI to stable
> steps by steps (unlike the big one patch in v2).
>
> At the end fluster tests results on IMX8MQ is 77/147 for HEVC codec.

Benjamin,

I have an imx8mm and imx8mq that I can test. Do you happen to have a
repo that I can clone to test this?  The imx8m stuff is spread around
between the media tree and the imx tree since it hasn't been fully
merged yet.

thanks,

adam

>
> Benjamin
>
> Benjamin Gaignard (11):
>   media: uapi: HEVC: Add missing fields in HEVC controls
>   media: uapi: HEVC: Rename HEVC stateless controls with STATELESS
>     prefix
>   media: uapi: HEVC: Add document uAPI structure
>   media: uapi: HEVC: Define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS as a
>     dynamic array
>   media: uapi: Move parsed HEVC pixel format out of staging
>   media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET control
>   media: uapi: Move the HEVC stateless control type out of staging
>   media: controls: Log HEVC stateless control in .std_log
>   media: uapi: Create a dedicated header for Hantro control
>   media: uapi: HEVC: fix padding in v4l2 control structures
>   media: uapi: move HEVC stateless controls out of staging
>
> Hans Verkuil (3):
>   videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
>   v4l2-ctrls: add support for dynamically allocated arrays.
>   vivid: add dynamic array test control
>
>  .../userspace-api/media/drivers/hantro.rst    |   5 -
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 831 ++++++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 780 ----------------
>  .../media/v4l/pixfmt-compressed.rst           |   7 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +
>  .../media/v4l/vidioc-queryctrl.rst            |   8 +
>  .../media/videodev2.h.rst.exceptions          |   5 +
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  15 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      | 103 ++-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 198 ++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  32 +-
>  drivers/media/v4l2-core/v4l2-ctrls-priv.h     |   3 +-
>  drivers/media/v4l2-core/v4l2-ctrls-request.c  |  13 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  27 +-
>  drivers/staging/media/hantro/hantro_hevc.c    |   8 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  24 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
>  include/media/hevc-ctrls.h                    | 250 ------
>  include/media/v4l2-ctrls.h                    |  48 +-
>  include/uapi/linux/hantro-media.h             |  19 +
>  include/uapi/linux/v4l2-controls.h            | 436 +++++++++
>  include/uapi/linux/videodev2.h                |  13 +
>  22 files changed, 1686 insertions(+), 1169 deletions(-)
>  delete mode 100644 include/media/hevc-ctrls.h
>  create mode 100644 include/uapi/linux/hantro-media.h
>
> --
> 2.32.0
>
