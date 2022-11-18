Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F138F65
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 17:23:48 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id f18so14691196ejz.5
        for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 09:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rxvyRD/NaQsAjl7K9p9F/GYKO4FmZoDr+beCQYxmtZI=;
        b=JwN8fFEeS4qgw8afhvGopypDngHomKWs5ndp82K5dFOXpXoqZkjoqr1dYNvtHXBJZM
         ZKXpkjwwHIMmfppCizC4+GJcF552v5gqeUOtQC4B2WVl9PpCq/+T1ZgIn2Indvgc3QDu
         dlxR4gBHoXs6WXzni+YfT8g2OOe1/CWr38S1R8nAh+btShvaU6btMyH+gvwr1oSHL32Z
         necOa83otX/U/X3gCSdVLi2KvmVDYFoCRsf+YJSUtbSW+XlTFO8HTrG+0atUEMaNG7N5
         SwuTGhR0Rim03AaZDagnyb1LC0eJxhigr2tjlV+Ma5lq1DYSclrwMiUMRu+8ltHmq4pU
         BQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxvyRD/NaQsAjl7K9p9F/GYKO4FmZoDr+beCQYxmtZI=;
        b=f4Ws3Vwb3US5B6RS9I2ho1A04agJh9rATzn27bs8DXfMbCTou8VUHY5jFzGaKxVnzK
         Q8Jenhyru42FBsWJ/V5nlqiG2yAz08ZJbs1uwHLTaONU7q50EG4LQTenjaqrI15a0LCc
         Yi4ppyPsd0hawHU5WVsjvINYEEfF2SKnrTogVHzgAbqVLMcq4z8SS4zM3wjF+xZKCVnY
         3AtH/poN2h33ffuWG4YKtHTsuylavZ/3LiAPeEmEfZvaWUzOy0omfVVVgLxKSHIEellE
         4TqXfhk+4rpXvbJZp5FKgV5ymDBmYgh2ogsMEzKUEf8VNiTvQI1GMsUixOJnXidM4kMY
         d9ag==
X-Gm-Message-State: ANoB5pkfXS6FpZMsCxLeJ3d2oMCihOUp6xScVSIfrrimmO2i1N5hL5gc
	Au0IDz6CV2Cj/WOxYtumHnuDI+MMdboH3KWc4VLJ+w==
X-Google-Smtp-Source: AA0mqf5E3U3QDe/kxJnwRhAE2vuP8wTjd8B7GNWb3t/Y7tj+K6BqfHf/4CMtd+8p3qkNHsDfZwf03vVvq29hHp4Ai2U=
X-Received: by 2002:a17:906:1dc3:b0:7ad:bbcc:814 with SMTP id
 v3-20020a1709061dc300b007adbbcc0814mr6848924ejh.425.1668792227111; Fri, 18
 Nov 2022 09:23:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221118084244.199909-1-umang.jain@ideasonboard.com>
 <20221118084244.199909-4-umang.jain@ideasonboard.com> <166876862357.50677.2208743534141685703@Monstersaurus>
In-Reply-To: <166876862357.50677.2208743534141685703@Monstersaurus>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Nov 2022 17:23:32 +0000
Message-ID: <CAPY8ntCk5ztM2FJtYS0X50rq4E658_4LtqUqEC2154s9dRb8ng@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] vc04_services: bcm2835-camera: Use bool values for mmal_fmt.remove_padding
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Dan Carpenter <error27@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Nov 2022 at 10:50, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Umang Jain (2022-11-18 08:42:44)
> > mmal_fmt.remove_padding is defined as a boolean type hence, use boolean
> > values for it instead of 0/1 integers. This enhances code readability.
>
> This could be (optionally) expanded:
>
> """
> The field 'remove_padding' in 'struct mmal_fmt' is defined as a boolean
> type.
>
> The initialisation of the formats[] array stores integer 0/1 values into
> this field rather than a more readable bool type.
>
> Convert the usages to boolean true/false, and fix up the local storage
> type in mmal_setup_components() to enhance code readability.
> """

Again I'll agree.

> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  .../bcm2835-camera/bcm2835-camera.c           | 30 +++++++++----------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > index fd456d1f7061..797ebe2a973a 100644
> > --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > @@ -87,21 +87,21 @@ static struct mmal_fmt formats[] = {
> >                 .depth = 12,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 1,
> > -               .remove_padding = 1,
> > +               .remove_padding = true,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_YUYV,
> >                 .mmal = MMAL_ENCODING_YUYV,
> >                 .depth = 16,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 2,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_RGB24,
> >                 .mmal = MMAL_ENCODING_RGB24,
> >                 .depth = 24,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 3,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_JPEG,
> >                 .flags = V4L2_FMT_FLAG_COMPRESSED,
> > @@ -109,7 +109,7 @@ static struct mmal_fmt formats[] = {
> >                 .depth = 8,
> >                 .mmal_component = COMP_IMAGE_ENCODE,
> >                 .ybbp = 0,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_H264,
> >                 .flags = V4L2_FMT_FLAG_COMPRESSED,
> > @@ -117,7 +117,7 @@ static struct mmal_fmt formats[] = {
> >                 .depth = 8,
> >                 .mmal_component = COMP_VIDEO_ENCODE,
> >                 .ybbp = 0,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_MJPEG,
> >                 .flags = V4L2_FMT_FLAG_COMPRESSED,
> > @@ -125,63 +125,63 @@ static struct mmal_fmt formats[] = {
> >                 .depth = 8,
> >                 .mmal_component = COMP_VIDEO_ENCODE,
> >                 .ybbp = 0,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_YVYU,
> >                 .mmal = MMAL_ENCODING_YVYU,
> >                 .depth = 16,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 2,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_VYUY,
> >                 .mmal = MMAL_ENCODING_VYUY,
> >                 .depth = 16,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 2,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_UYVY,
> >                 .mmal = MMAL_ENCODING_UYVY,
> >                 .depth = 16,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 2,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_NV12,
> >                 .mmal = MMAL_ENCODING_NV12,
> >                 .depth = 12,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 1,
> > -               .remove_padding = 1,
> > +               .remove_padding = true,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_BGR24,
> >                 .mmal = MMAL_ENCODING_BGR24,
> >                 .depth = 24,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 3,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_YVU420,
> >                 .mmal = MMAL_ENCODING_YV12,
> >                 .depth = 12,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 1,
> > -               .remove_padding = 1,
> > +               .remove_padding = true,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_NV21,
> >                 .mmal = MMAL_ENCODING_NV21,
> >                 .depth = 12,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 1,
> > -               .remove_padding = 1,
> > +               .remove_padding = true,
> >         }, {
> >                 .fourcc = V4L2_PIX_FMT_BGR32,
> >                 .mmal = MMAL_ENCODING_BGRA,
> >                 .depth = 32,
> >                 .mmal_component = COMP_CAMERA,
> >                 .ybbp = 4,
> > -               .remove_padding = 0,
> > +               .remove_padding = false,
> >         },
> >  };
> >
> > @@ -1147,7 +1147,7 @@ static int mmal_setup_components(struct bcm2835_mmal_dev *dev,
> >         struct vchiq_mmal_port *port = NULL, *camera_port = NULL;
> >         struct vchiq_mmal_component *encode_component = NULL;
> >         struct mmal_fmt *mfmt = get_format(f);
> > -       u32 remove_padding;
> > +       bool remove_padding;
> >
> >         if (!mfmt)
> >                 return -EINVAL;
> > --
> > 2.38.1
> >
