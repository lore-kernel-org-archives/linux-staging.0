Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C93387358;
	Wed,  4 Feb 2026 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187834; cv=none; b=XPx/aKNOYZYUdOLm4LDOQiT7YThf2epV7jM1/R1eBMjY/9KGoo8B5t+NEReLMpvUuVkMFZZD8i/w+VfqpEEZuNloY3vpScU8KTx+RhpMwajYQoyYMufd2NaohySWptW/gj6wDDO1R5UAmD2ShIN/6wc74GMm2yvgwSofXZHv9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187834; c=relaxed/simple;
	bh=gyNMyVxP26pKXZK9TGmCas3fkFPL+Z6+u3RQL5itCiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUI95abNdUp+NKbmlZYroBKlLJax+DnCNT0333U/KZz0gm0e4xQF3C5TzCv8LqxCVZ1aymvoCHqnRhRXPCj7+CSAUYptzHT7WMCYpHw7AmBy3IQoeoelhlN029BK5SywiU3M1LfWgrQS3hnf7kLXpbHFaw1e5w+UmtcOzqQ34D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O0PRD5t+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O0PRD5t+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF8FC19425;
	Wed,  4 Feb 2026 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770187833;
	bh=gyNMyVxP26pKXZK9TGmCas3fkFPL+Z6+u3RQL5itCiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0PRD5t+9qzHl+MhV8lJaZF5xz8qlEvnzvxMM8UQFKfsyZ0il8Kqi3+ko6hxUVwco
	 8nDtxxD5v/+4267J09XfUBco2R1xfIKIetDsSAUarNT3tcMwrwrsUUXK+Fi4dVn0IF
	 dNPY8OLT14Nghq6OfTDW3B3C8JykOZhB/L8tw2gg=
Date: Wed, 4 Feb 2026 07:50:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dhyaan19022009-hue <dhyan19022009@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dhyaan19022009-hue <dhyaan19022009@gmail.com>
Subject: Re: [PATCH] staging: sm750fb: fix naming styles and const
 declarations
Message-ID: <2026020409-saffron-hypnotist-5c9e@gregkh>
References: <20260204064113.21801-1-dhyaan19022009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204064113.21801-1-dhyaan19022009@gmail.com>

On Wed, Feb 04, 2026 at 12:11:12PM +0530, dhyaan19022009-hue wrote:
> Signed-off-by: dhyaan19022009-hue <dhyaan19022009@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c    | 26 +++++++++++++-------------
>  drivers/staging/sm750fb/sm750.h    | 14 +++++++-------
>  drivers/staging/sm750fb/sm750_hw.c | 22 +++++++++++-----------
>  3 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 9bf3c0a37..13d513bff 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,7 +33,7 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel;
>  static int g_nomtrr;
> -static const char *g_fbmode[] = {NULL, NULL};
> +static const char * const g_fbmode[] = {NULL, NULL};
>  static const char *g_def_fbmode = "1024x768-32@60";
>  static char *g_settings;
>  static int g_dualview;
> @@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  		"kernel HELPERS prepared vesa_modes",
>  	};
>  
> -	static const char *fixId[2] = {
> +	static const char * const fix_id[2] = {
>  		"sm750_fb1", "sm750_fb2",
>  	};
>  
> @@ -764,7 +764,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  	 * must be set after crtc member initialized
>  	 */
>  	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
> -	crtc->cursor.mmio = sm750_dev->pvReg +
> +	crtc->cursor.mmio = sm750_dev->pv_reg +
>  		0x800f0 + (int)crtc->channel * 0x140;
>  
>  	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
> @@ -862,7 +862,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>  	fix->ywrapstep = crtc->ywrapstep;
>  	fix->accel = FB_ACCEL_SMI;
>  
> -	strscpy(fix->id, fixId[index], sizeof(fix->id));
> +	strscpy(fix->id, fix_id[index], sizeof(fix->id));
>  
>  	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
>  	pr_info("fix->smem_start = %lx\n", fix->smem_start);
> @@ -918,12 +918,12 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
>  
>  	swap = 0;
>  
> -	sm750_dev->initParm.chip_clk = 0;
> -	sm750_dev->initParm.mem_clk = 0;
> -	sm750_dev->initParm.master_clk = 0;
> -	sm750_dev->initParm.powerMode = 0;
> -	sm750_dev->initParm.setAllEngOff = 0;
> -	sm750_dev->initParm.resetMemory = 1;
> +	sm750_dev->init_parm.chip_clk = 0;
> +	sm750_dev->init_parm.mem_clk = 0;
> +	sm750_dev->init_parm.master_clk = 0;
> +	sm750_dev->init_parm.power_mode = 0;
> +	sm750_dev->init_parm.set_all_eng_off = 0;
> +	sm750_dev->init_parm.reset_memory = 1;
>  
>  	/* defaultly turn g_hwcursor on for both view */
>  	g_hwcursor = 3;
> @@ -942,9 +942,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
>  		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
>  			sm750_dev->nocrt = 1;
>  		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
> -			sm750_dev->pnltype = sm750_doubleTFT;
> +			sm750_dev->pnltype = sm750_double_tft;
>  		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
> -			sm750_dev->pnltype = sm750_dualTFT;
> +			sm750_dev->pnltype = sm750_dual_tft;
>  		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
>  			sm750_dev->pnltype = sm750_24TFT;
>  		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
> @@ -1121,7 +1121,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
>  	sm750fb_framebuffer_release(sm750_dev);
>  	arch_phys_wc_del(sm750_dev->mtrr.vram);
>  
> -	iounmap(sm750_dev->pvReg);
> +	iounmap(sm750_dev->pv_reg);
>  	iounmap(sm750_dev->pv_mem);
>  	kfree(g_settings);
>  }
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index 2dc57bbe7..19dbb9120 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -14,8 +14,8 @@
>  
>  enum sm750_pnltype {
>  	sm750_24TFT = 0,	/* 24bit tft */
> -	sm750_dualTFT = 2,	/* dual 18 bit tft */
> -	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
> +	sm750_dual_tft = 2,	/* dual 18 bit tft */
> +	sm750_double_tft = 1,	/* 36 bit double pixel tft */
>  };
>  
>  /* vga channel is not concerned  */
> @@ -39,13 +39,13 @@ enum sm750_path {
>  };
>  
>  struct init_status {
> -	ushort powerMode;
> +	ushort power_mode;
>  	/* below three clocks are in unit of MHZ*/
>  	ushort chip_clk;
>  	ushort mem_clk;
>  	ushort master_clk;
> -	ushort setAllEngOff;
> -	ushort resetMemory;
> +	ushort set_all_eng_off;
> +	ushort reset_memory;
>  };
>  
>  struct lynx_accel {
> @@ -97,12 +97,12 @@ struct sm750_dev {
>  	unsigned long vidreg_start;
>  	__u32 vidmem_size;
>  	__u32 vidreg_size;
> -	void __iomem *pvReg;
> +	void __iomem *pv_reg;
>  	unsigned char __iomem *pv_mem;
>  	/* locks*/
>  	spinlock_t slock;
>  
> -	struct init_status initParm;
> +	struct init_status init_parm;
>  	enum sm750_pnltype pnltype;
>  	enum sm750_dataflow dataflow;
>  	int nocrt;
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index de1331c56..9e69f3387 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -49,19 +49,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  	}
>  
>  	/* now map mmio and vidmem */
> -	sm750_dev->pvReg =
> +	sm750_dev->pv_reg =
>  		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
> -	if (!sm750_dev->pvReg) {
> +	if (!sm750_dev->pv_reg) {
>  		pr_err("mmio failed\n");
>  		ret = -EFAULT;
>  		goto exit;
>  	}
> -	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
> +	pr_info("mmio virtual addr = %p\n", sm750_dev->pv_reg);
>  
> -	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
> -	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
> +	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
> +	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
>  
> -	mmio750 = sm750_dev->pvReg;
> +	mmio750 = sm750_dev->pv_reg;
>  	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
>  
>  	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
> @@ -79,7 +79,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  	sm750_dev->pv_mem =
>  		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
>  	if (!sm750_dev->pv_mem) {
> -		iounmap(sm750_dev->pvReg);
> +		iounmap(sm750_dev->pv_reg);
>  		pr_err("Map video memory failed\n");
>  		ret = -EFAULT;
>  		goto exit;
> @@ -93,7 +93,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  {
>  	struct init_status *parm;
>  
> -	parm = &sm750_dev->initParm;
> +	parm = &sm750_dev->init_parm;
>  	if (parm->chip_clk == 0)
>  		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
>  					       DEFAULT_SM750LE_CHIP_CLOCK :
> @@ -104,7 +104,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  	if (parm->master_clk == 0)
>  		parm->master_clk = parm->chip_clk / 3;
>  
> -	ddk750_init_hw((struct initchip_param *)&sm750_dev->initParm);
> +	ddk750_init_hw((struct initchip_param *)&sm750_dev->init_parm);
>  	/* for sm718, open pci burst */
>  	if (sm750_dev->devid == 0x718) {
>  		poke32(SYSTEM_CTRL,
> @@ -136,10 +136,10 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  		switch (sm750_dev->pnltype) {
>  		case sm750_24TFT:
>  			break;
> -		case sm750_doubleTFT:
> +		case sm750_double_tft:
>  			val |= PANEL_DISPLAY_CTRL_DOUBLE_PIXEL;
>  			break;
> -		case sm750_dualTFT:
> +		case sm750_dual_tft:
>  			val |= PANEL_DISPLAY_CTRL_DUAL_DISPLAY;
>  			break;
>  		}
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
