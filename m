Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F268F69;
	Tue, 14 Mar 2023 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678808831; x=1710344831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YpyBrL0ZUlnlLErkJRa5J7/zfbAgnmQdIkLT0HbKI3o=;
  b=bENW/s0gEdYolmMo4tTtDqc7v/wh4iqYv3tXZgjmJokLrrw1s1vLfYvX
   EEUmxnjqP3CQuhJBp1IlihFAbcC/UflNT3x2378Z/DU/r0X7qnxMVWNUO
   bPSEqfKaYNrLk+nYEnN15cZcjvq4FqAvU7AmpaYBDVRciwfJdw52aXCZj
   +BKpMpkaQXEbvW/u/Kvb94vGHHjt06uveLBW9ogewTQpZyWAcWpzZWDMc
   jP61bRLyYjRN7Ewq8oUGQCD8NfVScakdFADRUbShRNYsCAgVRvgba+uCj
   hSfrdYPWvMcalUrRmraRaq6WQbxcnTCugCxOXhT1IEQWzL47WXEfIa4JA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339828171"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="339828171"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768142376"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="768142376"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.140.184])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:46:59 -0700
Date: Tue, 14 Mar 2023 08:46:57 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Kloudifold <cloudifold.3125@gmail.com>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZBCW8YwRCI0IZFkY@aschofie-mobl2>
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
 <ZBCWbcJfX/Gh7hU9@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBCWbcJfX/Gh7hU9@aschofie-mobl2>

On Tue, Mar 14, 2023 at 08:44:45AM -0700, Alison Schofield wrote:
> On Tue, Mar 14, 2023 at 04:43:20AM +0800, Kloudifold wrote:
> > The sm750 driver had some functions named in CamelCase,
> > which violates the kernel's naming convention.
> > In this patch, I rename these functions to snake case,
> > which is the expected style.
> > 
> > This v2 patch was prompted by an error reported by the
> > Linux test robot, which detected the compile error.
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> 
> The tags from lkp go with your tag below - 
> 
>   Reported-by: kernel test robot <lkp@intel.com>
>   Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
> > Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
> > ---
> 
> Your next changelog, will look something like this:
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
> 
> 
> Khadaji,
oops...sorry about that - Kloudifold,

> Did you see the compile errors?  What was the deal with that?
> Thanks,
> Alison
> 
> 
> >  drivers/staging/sm750fb/sm750.c        | 22 +++++++++++-----------
> >  drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
> >  drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
> >  3 files changed, 24 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> > index effc7fcc3..9ddcd7b7d 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -121,14 +121,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
> >  
> >  	sm750_hw_cursor_disable(cursor);
> >  	if (fbcursor->set & FB_CUR_SETSIZE)
> > -		sm750_hw_cursor_setSize(cursor,
> > -					fbcursor->image.width,
> > -					fbcursor->image.height);
> > +		sm750_hw_cursor_set_size(cursor,
> > +					 fbcursor->image.width,
> > +					 fbcursor->image.height);
> >  
> >  	if (fbcursor->set & FB_CUR_SETPOS)
> > -		sm750_hw_cursor_setPos(cursor,
> > -				       fbcursor->image.dx - info->var.xoffset,
> > -				       fbcursor->image.dy - info->var.yoffset);
> > +		sm750_hw_cursor_set_pos(cursor,
> > +				        fbcursor->image.dx - info->var.xoffset,
> > +				        fbcursor->image.dy - info->var.yoffset);
> >  
> >  	if (fbcursor->set & FB_CUR_SETCMAP) {
> >  		/* get the 16bit color of kernel means */
> > @@ -142,14 +142,14 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
> >  		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
> >  		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
> >  
> > -		sm750_hw_cursor_setColor(cursor, fg, bg);
> > +		sm750_hw_cursor_set_color(cursor, fg, bg);
> >  	}
> >  
> >  	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
> > -		sm750_hw_cursor_setData(cursor,
> > -					fbcursor->rop,
> > -					fbcursor->image.data,
> > -					fbcursor->mask);
> > +		sm750_hw_cursor_set_data(cursor,
> > +					 fbcursor->rop,
> > +					 fbcursor->image.data,
> > +					 fbcursor->mask);
> >  	}
> >  
> >  	if (fbcursor->enable)
> > diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
> > index 43e6f52c2..ff643e33f 100644
> > --- a/drivers/staging/sm750fb/sm750_cursor.c
> > +++ b/drivers/staging/sm750fb/sm750_cursor.c
> > @@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
> >  	poke32(HWC_ADDRESS, 0);
> >  }
> >  
> > -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
> > +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
> >  {
> >  	cursor->w = w;
> >  	cursor->h = h;
> >  }
> >  
> > -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> > +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
> >  {
> >  	u32 reg;
> >  
> > @@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
> >  	poke32(HWC_LOCATION, reg);
> >  }
> >  
> > -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> > +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
> >  {
> >  	u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
> >  		HWC_COLOR_12_2_RGB565_MASK;
> > @@ -82,8 +82,8 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
> >  	poke32(HWC_COLOR_3, 0xffe0);
> >  }
> >  
> > -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> > -			     const u8 *pcol, const u8 *pmsk)
> > +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
> > +			      const u8 *pcol, const u8 *pmsk)
> >  {
> >  	int i, j, count, pitch, offset;
> >  	u8 color, mask, opr;
> > @@ -132,8 +132,8 @@ void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> >  	}
> >  }
> >  
> > -void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
> > -			      const u8 *pcol, const u8 *pmsk)
> > +void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
> > +			       const u8 *pcol, const u8 *pmsk)
> >  {
> >  	int i, j, count, pitch, offset;
> >  	u8 color, mask;
> > diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
> > index b59643dd6..88fa02f63 100644
> > --- a/drivers/staging/sm750fb/sm750_cursor.h
> > +++ b/drivers/staging/sm750fb/sm750_cursor.h
> > @@ -5,11 +5,11 @@
> >  /* hw_cursor_xxx works for voyager,718 and 750 */
> >  void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
> >  void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
> > -void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h);
> > -void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
> > -void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
> > -void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
> > -			     const u8 *data, const u8 *mask);
> > -void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
> > +void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
> > +void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
> > +void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
> > +void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
> >  			      const u8 *data, const u8 *mask);
> > +void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
> > +			       const u8 *data, const u8 *mask);
> >  #endif
> > -- 
> > 2.39.2
> > 
> > 
> 
