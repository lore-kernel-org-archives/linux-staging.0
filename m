Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3932F30;
	Sat, 18 Mar 2023 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679171700; x=1710707700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6y8LFFRF3tMIFwo9AMznWXbdSQtpcBHpc7OlfhPf4qE=;
  b=kqvSJVX1TcakFFG6NCAQhvodsmCAuVMj6Zimh67CZU8NuTSpTR2vr6XD
   HZdHC/NBg8stmTi7hb0Z6Pirqh1Spbz+FD3oagHFfkv7p0PeEN2/Ykx44
   Ymvafkk5EnvUp49rTRA/fQQOWCRrGXZAJ05HytZrLc/y7Cwui7vM5EHsH
   bG6k7nb5bDm6Oxlxfdx8ye+l7K361B2sPIhYALS7aIi3I8ElmAohYn9sy
   C1kV8NjymJlkcgpMB7hvGNbecvCAOqb/0NCHnuGturOyHRknhgzBdt4Lm
   JEUWl7BG5cpo+mCWB90JDy5TCkNLgUw2blempZTlXlSU0SYB0aFzAs+um
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="401036621"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="401036621"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 13:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="854828093"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="854828093"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.197.194])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 13:34:59 -0700
Date: Sat, 18 Mar 2023 13:34:57 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Kloudifold <cloudifold.3125@gmail.com>
Cc: outreachy@lists.linux.dev, teddy.wang@siliconmotion.com,
	sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <ZBYgccw+QH+5UKgW@aschofie-mobl2>
References: <ZBW+NX4SLaCyEnJd@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBW+NX4SLaCyEnJd@CloudiRingWorld>

On Sat, Mar 18, 2023 at 09:35:49PM +0800, Kloudifold wrote:
> sm750 driver has sm750_hw_cursor_* functions, which are named in
> camelcase. Rename them to snake case to follow the function naming
> convention.
> 
> Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> 
> ---
> Changes in v3:
> - Add this changelog (Philipp)
> - Move lkp tags and link to the correct location in commit log (Alison)

Hi Kloudifold,

Good to include tags, but let's get them to the 'TAG' location.

The message you received from lkp is:
If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171454.sScrVVOh-lkp@intel.com/

So, you take those 2 lines, and put them above your Signed-off-by:

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303171454.sScrVVOh-lkp@intel.com/
Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>

This is documented, but it's also a pattern that you can search for in
the lore archives to see how folks before you did it.


> - Update the commit msg (Philip)
> - Update the commit log (Bagas, Julia)
> 
> Changes in v2:
> - Use new function names in call sites (LKP)
> 
> This v2 patch was prompted by an error reported by the Linux test
> robot, which detected the compile error.
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/

So - the above lines, starting with 'This v2 patch...' can be removed,
since you've stated it as a Change in v2.

wrt the other feedback about checkpatch failing - test you git commit
hook (per the first patch tutorial) and be sure you're doing a final
checkpatch on the formatted patch.

Keep at it Kloudifold :)
Alison

> ---
> ---
>  drivers/staging/sm750fb/sm750.c        | 22 +++++++++++-----------
>  drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
>  drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index effc7fcc3..a1254f693 100644
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
> +				       	fbcursor->image.dx - info->var.xoffset,
> +				       	fbcursor->image.dy - info->var.yoffset);
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
