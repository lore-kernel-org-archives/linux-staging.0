Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88113212;
	Tue, 21 Mar 2023 08:20:18 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id kc4so619629plb.10;
        Tue, 21 Mar 2023 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679386818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3V4NGxBw4eHm/lYUisdHOx8Co3V2GaHqym8ZZT0iw0g=;
        b=jfV5q0Q+J8ImO+GbtYzXIWu3Qc3C4M1HcChuMbVmN4kBIz5giHswtxgnH6Bh34OiMu
         Xu46p/ijvMTbPAWA4HS0s0aQGO7lvUnZdiTdsuhQ6ufo9//bWj6C7rXB692ZYfrz0+CF
         jXJ6JXCsnM9ECzRj9UmZOCciFbE83CuTXDm6PgcWRsCjnoCOxMoOdpbLBiDpc+ah3UUZ
         T/c87axNfGEi2DKBZnqhQMZODjCz/GBvnqtaxwC50SUoxIBXbMdjm3AnPT29zZYUsAoZ
         OYGbI4jGNvX+aqr7qmQGWn13KTA9YE9ahAHCNJtUxJL8iSIXbxDrnf3izg28LHxuimck
         Tobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679386818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3V4NGxBw4eHm/lYUisdHOx8Co3V2GaHqym8ZZT0iw0g=;
        b=QOIEkRX2jxdjK+SKubUOuuOef4hPKudK+wEb9ds8TLxBgnrPQMYO7J+f7iIdN393sm
         QKWPpSJEDQ4Jk05BnkcuJkTzTaBdSm9OpHBjnEyYvh28AcOKHqAabFGpjo9MTgTt7ZQp
         U/P46j7Y7UyDw6FZ8Uvzd82MJp5S2LThcgZaibWH+zivK6JnmqlSM8MqnpETMQJEv/Fr
         8kAaMelpxWLrwZIxrXokFf/0wglsR8VvqwckVTv/FrYVivcPvfx20xo/jBYOy8zB/Wm4
         dbLcbjEtIPvEXLyfsgdSoqBG93jOjfTB5WfUvRaGMcvrnj6fAciPSEdidj4ZJegJVUFZ
         t5Ag==
X-Gm-Message-State: AO0yUKUnOY7fb1r59vhd/8YAzT2S863utxyZDYd+xILhTejw5dM2q0E/
	hQHXJhdZoSo6QDWBLrqWKs8=
X-Google-Smtp-Source: AK7set8p5UfWvME3hKxAn56csLh8VfkWwnuC2Ha4za+zvZWvkQ2B3m3C7YG10/tKYhgcN1OSzWKQdg==
X-Received: by 2002:a17:902:e194:b0:1a1:7da3:ef58 with SMTP id y20-20020a170902e19400b001a17da3ef58mr1255288pla.28.1679386818188;
        Tue, 21 Mar 2023 01:20:18 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-83.three.co.id. [180.214.233.83])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f7cd00b0019d1f42b00csm8068353plw.17.2023.03.21.01.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 01:20:17 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 4546B106645; Tue, 21 Mar 2023 15:20:15 +0700 (WIB)
Date: Tue, 21 Mar 2023 15:20:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <ZBlov9bVs4pAJIlA@debian.me>
References: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GxUuoaZq/wKwbAE4"
Content-Disposition: inline
In-Reply-To: <ZBfro5U4s0lWA6tl@CloudiRingWorld>


--GxUuoaZq/wKwbAE4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 01:14:11PM +0800, Kloudifold wrote:
> Cc: linux-kernel@vger.kernel.org=20
> Bcc:=20
> Subject: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to=
 snake_case
> Reply-To:=20

As others have replied, please trim above headers.

>=20
> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.

Great!

>=20
> - sm750_hw_cursor_setSize  =3D> sm750_hw_cursor_set_size
> - sm750_hw_cursor_setPos   =3D> sm750_hw_cursor_set_pos
> - sm750_hw_cursor_setColor =3D> sm750_hw_cursor_set_color
> - sm750_hw_cursor_setData  =3D> sm750_hw_cursor_set_data
> - sm750_hw_cursor_setData2 =3D> sm750_hw_cursor_set_data2

I think from the diff below people can see which exactly functions that
are renamed, so the list above is redundant.

>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@int=
el.com/

lkp report link above is for your v1, so why did you add above tags?

> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm=
750.c
> index effc7fcc3..5d7249e82 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -121,14 +121,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, =
struct fb_cursor *fbcursor)
> =20
>  	sm750_hw_cursor_disable(cursor);
>  	if (fbcursor->set & FB_CUR_SETSIZE)
> -		sm750_hw_cursor_setSize(cursor,
> -					fbcursor->image.width,
> -					fbcursor->image.height);
> +		sm750_hw_cursor_set_size(cursor,
> +					 fbcursor->image.width,
> +					 fbcursor->image.height);
> =20
>  	if (fbcursor->set & FB_CUR_SETPOS)
> -		sm750_hw_cursor_setPos(cursor,
> -				       fbcursor->image.dx - info->var.xoffset,
> -				       fbcursor->image.dy - info->var.yoffset);
> +		sm750_hw_cursor_set_pos(cursor,
> +					fbcursor->image.dx - info->var.xoffset,
> +					fbcursor->image.dy - info->var.yoffset);
> =20
>  	if (fbcursor->set & FB_CUR_SETCMAP) {
>  		/* get the 16bit color of kernel means */
> @@ -142,14 +142,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, =
struct fb_cursor *fbcursor)
>  		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
>  		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
> =20
> -		sm750_hw_cursor_setColor(cursor, fg, bg);
> +		sm750_hw_cursor_set_color(cursor, fg, bg);
>  	}
> =20
>  	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
> -		sm750_hw_cursor_setData(cursor,
> -					fbcursor->rop,
> -					fbcursor->image.data,
> -					fbcursor->mask);
> +		sm750_hw_cursor_set_data(cursor,
> +					 fbcursor->rop,
> +					 fbcursor->image.data,
> +					 fbcursor->mask);
>  	}
> =20
>  	if (fbcursor->enable)
> diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm7=
50fb/sm750_cursor.c
> index 43e6f52c2..ff643e33f 100644
> --- a/drivers/staging/sm750fb/sm750_cursor.c
> +++ b/drivers/staging/sm750fb/sm750_cursor.c
> @@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *curs=
or)
>  	poke32(HWC_ADDRESS, 0);
>  }
> =20
> -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
> +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
>  {
>  	cursor->w =3D w;
>  	cursor->h =3D h;
>  }
> =20
> -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
>  {
>  	u32 reg;
> =20
> @@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor,=
 int x, int y)
>  	poke32(HWC_LOCATION, reg);
>  }
> =20
> -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 b=
g)
>  {
>  	u32 reg =3D (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
>  		HWC_COLOR_12_2_RGB565_MASK;
> @@ -82,8 +82,8 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *curso=
r, u32 fg, u32 bg)
>  	poke32(HWC_COLOR_3, 0xffe0);
>  }
> =20
> -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> -			     const u8 *pcol, const u8 *pmsk)
> +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
> +			      const u8 *pcol, const u8 *pmsk)
>  {
>  	int i, j, count, pitch, offset;
>  	u8 color, mask, opr;
> @@ -132,8 +132,8 @@ void sm750_hw_cursor_setData(struct lynx_cursor *curs=
or, u16 rop,
>  	}
>  }
> =20
> -void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
> -			      const u8 *pcol, const u8 *pmsk)
> +void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
> +			       const u8 *pcol, const u8 *pmsk)
>  {
>  	int i, j, count, pitch, offset;
>  	u8 color, mask;
> diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm7=
50fb/sm750_cursor.h
> index b59643dd6..88fa02f63 100644
> --- a/drivers/staging/sm750fb/sm750_cursor.h
> +++ b/drivers/staging/sm750fb/sm750_cursor.h
> @@ -5,11 +5,11 @@
>  /* hw_cursor_xxx works for voyager,718 and 750 */
>  void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
>  void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
> -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h);
> -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
> -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg=
);
> -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> -			     const u8 *data, const u8 *mask);
> -void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
> +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
> +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
> +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 b=
g);
> +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
>  			      const u8 *data, const u8 *mask);
> +void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
> +			       const u8 *data, const u8 *mask);
>  #endif

Compiled-test only (I don't have the hardware) on x86_64, no compiler
warnings.

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--GxUuoaZq/wKwbAE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZBlovgAKCRD2uYlJVVFO
o8c/AQCLAsLp2Dst72rqykijXGJTpLFHJ3IemYLG8BzrRYlrTwEAqM3NBvNrfTo7
4+CpWJf18kWUlRIkHDMs572vL0Acow0=
=/4Fg
-----END PGP SIGNATURE-----

--GxUuoaZq/wKwbAE4--
