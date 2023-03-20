Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744A1104;
	Mon, 20 Mar 2023 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3VxkIZ4f4DjjfenQ958uT4HoXJYvgGNcZXiqMv/3wHg=;
  b=Gz81mD2JpouuLvcgEJRQC+bu/CokOtFC5ZbGmcIalnZnvL5tN6dtKaa+
   42KGcqTA8/OUik82g8JPP+OlXHnQGF/fCWyAvy9XtzGELJdPFdP1Zlond
   JroM82tsiPQyq0qjz9sRj9upg8z7o0YKjZuPVstl3I1KWWf5DsLL9U3gc
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,274,1673910000"; 
   d="scan'208";a="97994568"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 08:45:50 +0100
Date: Mon, 20 Mar 2023 08:45:50 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kloudifold <cloudifold.3125@gmail.com>
cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com, 
    gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions
 to snake_case
In-Reply-To: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
Message-ID: <dd52109f-75e5-2777-cafe-4e70e8ddf2db@inria.fr>
References: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 20 Mar 2023, Kloudifold wrote:

> Cc: linux-kernel@vger.kernel.org
> Bcc:
> Subject: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to snake_case
> Reply-To:

This information should not be part of the message.  I received another
message that didn't have this information.  If you sent that one to fix up
this one, then that one should have benn labelled v5, so that one would
know that this message should be ignored.

julia

>
> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.
>
> - sm750_hw_cursor_setSize  => sm750_hw_cursor_set_size
> - sm750_hw_cursor_setPos   => sm750_hw_cursor_set_pos
> - sm750_hw_cursor_setColor => sm750_hw_cursor_set_color
> - sm750_hw_cursor_setData  => sm750_hw_cursor_set_data
> - sm750_hw_cursor_setData2 => sm750_hw_cursor_set_data2
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
>
> ---
> Changes in v4:
> - Update the commit msg (Deepak)
> - Use tabs replace 8 spaces
>
> This v4 patch was prompted by 2 errors, 2 warnings and 1 checks reported
> by the scripts/checkpatch.pl, which detected the style problem.
>
> Changes in v3:
> - Add this changelog (Philipp)
> - Move lkp tags and link to the correct location in commit log (Alison)
> - Update the commit msg (Philip)
> - Update the commit log (Bagas, Julia)
>
> Changes in v2:
> - Use new function names in call sites (LKP)
>
>  drivers/staging/sm750fb/sm750.c        | 22 +++++++++++-----------
>  drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
>  drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
>  3 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index effc7fcc3..5d7249e82 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -121,14 +121,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
>
>  	sm750_hw_cursor_disable(cursor);
>  	if (fbcursor->set & FB_CUR_SETSIZE)
> -		sm750_hw_cursor_setSize(cursor,
> -					fbcursor->image.width,
> -					fbcursor->image.height);
> +		sm750_hw_cursor_set_size(cursor,
> +					 fbcursor->image.width,
> +					 fbcursor->image.height);
>
>  	if (fbcursor->set & FB_CUR_SETPOS)
> -		sm750_hw_cursor_setPos(cursor,
> -				       fbcursor->image.dx - info->var.xoffset,
> -				       fbcursor->image.dy - info->var.yoffset);
> +		sm750_hw_cursor_set_pos(cursor,
> +					fbcursor->image.dx - info->var.xoffset,
> +					fbcursor->image.dy - info->var.yoffset);
>
>  	if (fbcursor->set & FB_CUR_SETCMAP) {
>  		/* get the 16bit color of kernel means */
> @@ -142,14 +142,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
>  		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
>  		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
>
> -		sm750_hw_cursor_setColor(cursor, fg, bg);
> +		sm750_hw_cursor_set_color(cursor, fg, bg);
>  	}
>
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
>
>  	if (fbcursor->enable)
> diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
> index 43e6f52c2..ff643e33f 100644
> --- a/drivers/staging/sm750fb/sm750_cursor.c
> +++ b/drivers/staging/sm750fb/sm750_cursor.c
> @@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
>  	poke32(HWC_ADDRESS, 0);
>  }
>
> -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
> +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
>  {
>  	cursor->w = w;
>  	cursor->h = h;
>  }
>
> -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
>  {
>  	u32 reg;
>
> @@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
>  	poke32(HWC_LOCATION, reg);
>  }
>
> -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
>  {
>  	u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
>  		HWC_COLOR_12_2_RGB565_MASK;
> @@ -82,8 +82,8 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
>  	poke32(HWC_COLOR_3, 0xffe0);
>  }
>
> -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> -			     const u8 *pcol, const u8 *pmsk)
> +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
> +			      const u8 *pcol, const u8 *pmsk)
>  {
>  	int i, j, count, pitch, offset;
>  	u8 color, mask, opr;
> @@ -132,8 +132,8 @@ void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
>  	}
>  }
>
> -void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
> -			      const u8 *pcol, const u8 *pmsk)
> +void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
> +			       const u8 *pcol, const u8 *pmsk)
>  {
>  	int i, j, count, pitch, offset;
>  	u8 color, mask;
> diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
> index b59643dd6..88fa02f63 100644
> --- a/drivers/staging/sm750fb/sm750_cursor.h
> +++ b/drivers/staging/sm750fb/sm750_cursor.h
> @@ -5,11 +5,11 @@
>  /* hw_cursor_xxx works for voyager,718 and 750 */
>  void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
>  void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
> -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h);
> -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
> -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
> -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> -			     const u8 *data, const u8 *mask);
> -void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
> +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
> +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
> +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
> +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
>  			      const u8 *data, const u8 *mask);
> +void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
> +			       const u8 *data, const u8 *mask);
>  #endif
> --
> 2.40.0
>
>
>
