Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91382E092B
	for <linux-staging@lists.linux.dev>; Tue,  2 Sep 2025 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756789902; cv=none; b=RkGj2kTkdDdkZU9I0mJIGmF60PyA1ExseSFCvCN94H0x4aa44ZOOJB0Kjb0FFi38R0QlEG/UbawlzGHx9LEW04+xIrhOUeDbRpKEFDfP7JPly/ryITxqxAT+3h93pgKR73+mf2+TJIBTrbFTUZeyoEbI/f7bSovLjRIYF6lVRso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756789902; c=relaxed/simple;
	bh=8rS0LIP0u53ptk9V+ACTPr8p9/DgftmEoayF11LgyCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1ObKghPCOoKH6Kq3v64XCbAEC8vMbO8XK7SS4oQfAUolnxklF0B2i/qZQq0fqzAjkHtCVk+EArpNlpNqxiEMvDDZNDP199NqE7q7JYgOp79ivuMG062qwQmr1KIHSQ1OL2VV1oGrnkQhL8omAUq6wa0LZrfmF1W2aUA6PDLkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaUshFGH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaUshFGH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so15036525e9.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756789899; x=1757394699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTCTGbNV0A/hFnSRRaapGnfqcH++dszehZn/PYcxf4U=;
        b=gaUshFGH/CxVtFueOXnSNO/FjFZp+sxgMatV7CCNPFYUnW47PEO+8XuYMlpaVFn3Aw
         VgRuq6SJqu2PN/OkY3ye3eOqLNZcOlasAXMjqWw8KA6beaRiki9QTeKOs+YO04ILAlxN
         ibBVfO2Y+Gz81JFrZ7PacCEGZAl67JDjGpDGous/7hNiZ/cG6E3n2I6PlL72xUgnSnyN
         uPdirqB9N9yoVYjKZkUx5DBFg4ku4m2Rmq5d+75jt7vk388bVL0Qmwc7wwuqnBALGD5E
         ljH6MdavM2mJ4FtPuu6f0rsQFGL4Gx7R5bRH20DLy7h1eqImpXT+GefrnPpmz/mbw+tz
         4Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756789899; x=1757394699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTCTGbNV0A/hFnSRRaapGnfqcH++dszehZn/PYcxf4U=;
        b=TASEllJrSFjlyWn0fKqri6tAUsn3IvoiJGBWDAnDTukBypb6kJmqOZyXq9k1whKmqn
         pG8K4RtVj+pLSHuzymB+mpJNMi/CuMkasof3RXV6sifUS2ih4Rxq8ZPibvGSbwwnkiL6
         +4t4gNFeIy9UI6xIHdVv3ZVf6383rXG3JTftVUiCA614kNkojXa0/bOHI9Uh2tOs9+xp
         iUHBtKX64bHuGmss7ZVeamv9fBdPYp8LNlW9ZF6e7VfRHz8uvvtbdrsUrYWKhGYa0KMY
         VD+sJ7XRXTtM87UN9WXjWqitwjzqm/7TdecuqVPf2ALXhg5xl+Gj5Qs4Y9q+xwqWNkZ4
         /o4g==
X-Forwarded-Encrypted: i=1; AJvYcCUNJhyVEg/kSXzagfYLN+zXWTSW2V7NYALi/vsYK/YgLVnSPId+PyfBbBsXjSIYyPINPaQsok9lVulc1aL6@lists.linux.dev
X-Gm-Message-State: AOJu0YyWjjQHJnvyRndT0rZlIsYAt+GogdBBGrYKzSrtQlWFkLjCRrUY
	JiwnJTOhwHYaQu9MpcOCWqREFBr05rjzLgGKaBg0jPOj00PV6+npOkziES8ODuRXwRs2PTRabKb
	ZQM8evdvK6N8O+UECQSWH6CQ/CxcChZw=
X-Gm-Gg: ASbGncvcz/ab8LMMvnsHY3C5nDFL1kJ1AL2KKHaoV0XN7opldxTfkS8JpW29Okr07XM
	qbgs7NSTWTy1KA20+9HImP8QHgctVDomjwnSFiKzrriccplQQ14zquhXmu9SHOxJdINRrRYC1pH
	N/xIXNxx5GnBq02qi3MaLncIYIwdoFevFW9K2vASZ7AKUot0sOAfU4oAexp0Z8lc46c+hsCkDue
	yc/vyjEZDkqfg77IzA=
X-Google-Smtp-Source: AGHT+IGa3PRa1/gPaTBOeY7kLDsRJnMljXOD1O/8RwlykLwiecvwVwe6PtEAfF2dKWb9ZplPBeb9IGmICuTGLrkPfCk=
X-Received: by 2002:a05:6000:290f:b0:3b7:8914:cd94 with SMTP id
 ffacd0b85a97d-3d1de5b0a87mr5975119f8f.41.1756789898968; Mon, 01 Sep 2025
 22:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-16-clamor95@gmail.com>
 <3765586.e9J7NaK4W3@senjougahara>
In-Reply-To: <3765586.e9J7NaK4W3@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Sep 2025 08:11:27 +0300
X-Gm-Features: Ac12FXwYaklM9dfwRJGJ0niOGEaCaWCMSJaDJ1qiJ-WWQceVJ49LceOdwSONuvs
Message-ID: <CAPVz0n2Qo97fcshY=pCUzXn2zNe-akbtgsmhFA=vqvQ28ppZ5A@mail.gmail.com>
Subject: Re: [PATCH v1 15/19] staging: media: tegra-video: tegra20: expand
 format support with RAW8/10 and YUV422 1X16
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 04:10 Mikko=
 Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add support for Bayer formats (RAW8 and RAW10) and YUV422_8 1X16 versio=
ns
> > of existing YUV422_8 2X8.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 71 ++++++++++++++++++++-
> >  1 file changed, 69 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c
> > b/drivers/staging/media/tegra-video/tegra20.c index
> > 67631e0c9ffc..b466fe7f4504 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -186,6 +186,18 @@ static void tegra20_vi_get_input_formats(struct
> > tegra_vi_channel *chan, case MEDIA_BUS_FMT_YVYU8_2X8:
> >               (*yuv_input_format) =3D VI_INPUT_YUV_INPUT_FORMAT_YVYU;
> >               break;
> > +     /* RAW8 */
> > +     case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +     case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +     case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +     case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +     /* RAW10 */
> > +     case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +     case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +     case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +     case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +             (*yuv_input_format) =3D VI_INPUT_INPUT_FORMAT_BAYER;
>
> Should this be main_input_format instead of yuv_input_format?
>

Yes, it should be main_input_format, you are correct. Thank you.

> > +             break;
> >       }
> >  }
> >
> > @@ -220,6 +232,18 @@ static void tegra20_vi_get_output_formats(struct
> > tegra_vi_channel *chan, case V4L2_PIX_FMT_YVU420:
> >               (*main_output_format) =3D
> VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
> >               break;
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SBGGR10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +             (*main_output_format) =3D
> VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
> > +             break;
> >       }
> >  }
> >
> > @@ -300,6 +324,16 @@ static void tegra20_channel_queue_setup(struct
> > tegra_vi_channel *chan) case V4L2_PIX_FMT_VYUY:
> >       case V4L2_PIX_FMT_YUYV:
> >       case V4L2_PIX_FMT_YVYU:
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SBGGR10:
> >               if (chan->vflip)
> >                       chan->start_offset +=3D stride * (height - 1);
> >               if (chan->hflip)
> > @@ -365,6 +399,19 @@ static void tegra20_channel_vi_buffer_setup(struct
> > tegra_vi_channel *chan, tegra20_vi_write(chan,
> > TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base); tegra20_vi_write(chan,
> > TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset); break;
> > +     /* RAW8 */
> > +     case V4L2_PIX_FMT_SRGGB8:
> > +     case V4L2_PIX_FMT_SGRBG8:
> > +     case V4L2_PIX_FMT_SGBRG8:
> > +     case V4L2_PIX_FMT_SBGGR8:
> > +     /* RAW10 */
> > +     case V4L2_PIX_FMT_SRGGB10:
> > +     case V4L2_PIX_FMT_SGRBG10:
> > +     case V4L2_PIX_FMT_SGBRG10:
> > +     case V4L2_PIX_FMT_SBGGR10:
> > +             tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_2),
> base);
> > +             tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_2),
> base +
> > chan->start_offset); +                break;
> >       }
> >  }
> >
> > @@ -446,12 +493,15 @@ static int tegra20_chan_capture_kthread_start(voi=
d
> > *data) static void tegra20_camera_capture_setup(struct tegra_vi_channel
> > *chan) {
> >       u32 output_fourcc =3D chan->format.pixelformat;
> > +     u32 data_type =3D chan->fmtinfo->img_dt;
> >       int width  =3D chan->format.width;
> >       int height =3D chan->format.height;
> >       int stride_l =3D chan->format.bytesperline;
> >       int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
> >                       output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0=
;
> > -     int output_channel =3D OUT_1;
> > +     int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> > +                           data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > +                           OUT_2 : OUT_1;
> >       int main_output_format;
> >       int yuv_output_format;
> >
> > @@ -580,6 +630,20 @@ static const struct tegra_video_format
> > tegra20_video_formats[] =3D { TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8=
, 16,
> > YVYU),
> >       TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> >       TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
> > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
> > +     /* RAW 8 */
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
> > +     TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
> > +     /* RAW 10 */
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
> > +     TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
> >  };
> >
> >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > @@ -606,9 +670,12 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> >  static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_c=
han)
> >  {
> >       struct tegra_vi_channel *vi_chan =3D
> > v4l2_get_subdev_hostdata(&vip_chan->subdev); +        u32 data_type =3D
> > vi_chan->fmtinfo->img_dt;
> >       int width  =3D vi_chan->format.width;
> >       int height =3D vi_chan->format.height;
> > -     int output_channel =3D OUT_1;
> > +     int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> > +                           data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > +                           OUT_2 : OUT_1;
> >
> >       unsigned int main_input_format;
> >       unsigned int yuv_input_format;
>
>
>
>
