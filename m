Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306D6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:45:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id g10so8970627plt.8
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V6KnqIpI1G1nZtIsittyDe7aXh9sZirwgC5BBRWs6BI=;
        b=nofHWIoczBDzr2I2/6p4FLM7vs8zuNxFMAduuI62uwcX0hnSa23wJkLbMMBSL1bwCM
         s/ewRAtGh2PkYL9gF9HVKu69PQtgFwPdLeCMv3iStY5L1pgQA0eTuqEq0arvnr49WkLZ
         gBSSqO+fkb7OOUdMnAVf0yFXtCe3dON8fAOZpC5/ObEg5Dcf5tNBTvLbIkMSCuCnefQM
         wxU3Eeg0LmHK3JYtU7ZC5UjOY69cL4F3hcbNXvcT3I2Bp0xawFV+UqytvFbPTm+eQgBL
         jiZdTM0AdOm7JC5JLOWFnozVL9vxljiVcd/HJ/Gkotw0l45hRDiHEwXFu6+dHPnnzCBI
         IpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V6KnqIpI1G1nZtIsittyDe7aXh9sZirwgC5BBRWs6BI=;
        b=G6LVQ+x+9rUbFSTl6gOAdwp3AS+906Y5oN1zbLVq7ldoVZWExQ7E9sFtUU0R/HsEqc
         iqvY629pgL8CCSAhRPvJAgEAEflwEtuJQgDhplNZHKKSsARERHnVewA/JK6yKNJRFdvO
         NxzNCOMBtQtOvzusduCV5OzsNmQlNknV276DSm9ehMINbg3eB2ahUDe59bIuwYMspU0l
         bGkrriO09ldJIDApMWgHBpt8wqkC4udcavDxNMdA0P07af7hIDBMg9HsEhPFjB/5Vjek
         q9Q6A1RTUL6x3t7opKAHq51MUYjfGEfjwrm7UrB/+wz6NUA+S0/hZ1b69xq423V+ihv8
         Ge0Q==
X-Gm-Message-State: AOAM530FPxD4uBB+Ss642uxYDkF6DafY+4AEfTN2Ft5ws6LX8ws3Mpjc
	tDJD5FtF/n4/Dcdp3hrkYNY=
X-Google-Smtp-Source: ABdhPJyGOYtOzCI4lGrq08zi0hBR743xVLhdTGGXcJkG5P4gsRpAJ7nDkj/ZXYX0bchExUrub+OFNQ==
X-Received: by 2002:a17:90a:6089:: with SMTP id z9mr2266360pji.211.1617785134171;
        Wed, 07 Apr 2021 01:45:34 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id y3sm3943562pfg.145.2021.04.07.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 01:45:33 -0700 (PDT)
Date: Wed, 7 Apr 2021 01:45:31 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/49] staging: sm750fb: Update dvi_ctrl_device to
 snake case
Message-ID: <YG1xK0bWlJzGp5mX@localhost.localdomain>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
 <a3618331115064265bc3bbf8963a84ee8bb57fed.1617776878.git.pavle.rohalj@gmail.com>
 <YG1t2Y55oyt8qxYi@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1t2Y55oyt8qxYi@kroah.com>

On Wed, Apr 07, 2021 at 10:31:21AM +0200, Greg KH wrote:
> On Tue, Apr 06, 2021 at 11:35:56PM -0700, Pavle Rohalj wrote:
> > Fix "Avoid CamelCase" checkpatch.pl checks for dvi_ctrl_device structure and
> > its usages.
> > 
> > Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_dvi.c    | 30 ++++++++--------
> >  drivers/staging/sm750fb/ddk750_dvi.h    | 20 +++++------
> >  drivers/staging/sm750fb/ddk750_sii164.c | 48 ++++++++++++-------------
> >  drivers/staging/sm750fb/ddk750_sii164.h | 20 +++++------
> >  4 files changed, 59 insertions(+), 59 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> > index cd564ea40779..db19bf732482 100644
> > --- a/drivers/staging/sm750fb/ddk750_dvi.c
> > +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> > @@ -11,20 +11,20 @@
> >   * function API. Please set the function pointer to NULL whenever the function
> >   * is not supported.
> >   */
> > -static struct dvi_ctrl_device g_dcftSupportedDviController[] = {
> > +static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
> 
> Why the "dcft_" prefix?  We know this is a "dvi control device" by the
> fact that the type says it is :)
> 

Didn't catch that--makes sense.

> >  #ifdef DVI_CTRL_SII164
> >  	{
> > -		.pfnInit = sii164InitChip,
> > -		.pfnGetVendorId = sii164GetVendorID,
> > -		.pfnGetDeviceId = sii164GetDeviceID,
> > +		.pfn_init = sii164_init_chip,
> > +		.pfn_get_vendor_id = sii164_get_vendor_id,
> > +		.pfn_get_device_id = sii164_get_device_id,
> >  #ifdef SII164_FULL_FUNCTIONS
> > -		.pfnResetChip = sii164ResetChip,
> > -		.pfnGetChipString = sii164GetChipString,
> > -		.pfnSetPower = sii164SetPower,
> > -		.pfnEnableHotPlugDetection = sii164EnableHotPlugDetection,
> > -		.pfnIsConnected = sii164IsConnected,
> > -		.pfnCheckInterrupt = sii164CheckInterrupt,
> > -		.pfnClearInterrupt = sii164ClearInterrupt,
> > +		.pfn_reset_chip = sii164_reset_chip,
> > +		.pfn_get_chip_string = sii164_get_chip_string,
> > +		.pfn_set_power = sii164_set_power,
> > +		.pfn_enable_hot_plug_detection = sii164_enable_hot_plug_detection,
> > +		.pfn_is_connected = sii164_is_connected,
> > +		.pfn_check_interrupt = sii164_check_interrupt,
> > +		.pfn_clear_interrupt = sii164_clear_interrupt,
> >  #endif
> >  	},
> >  #endif
> > @@ -41,11 +41,11 @@ int dviInit(unsigned char edge_select,
> >  	    unsigned char pll_filter_enable,
> >  	    unsigned char pll_filter_value)
> >  {
> > -	struct dvi_ctrl_device *pCurrentDviCtrl;
> > +	struct dvi_ctrl_device *current_dvi_ctrl;
> >  
> > -	pCurrentDviCtrl = g_dcftSupportedDviController;
> > -	if (pCurrentDviCtrl->pfnInit) {
> > -		return pCurrentDviCtrl->pfnInit(edge_select,
> > +	current_dvi_ctrl = dcft_supported_dvi_controller;
> > +	if (current_dvi_ctrl->pfn_init) {
> > +		return current_dvi_ctrl->pfn_init(edge_select,
> >  						bus_select,
> >  						dual_edge_clk_select,
> >  						hsync_enable,
> > diff --git a/drivers/staging/sm750fb/ddk750_dvi.h b/drivers/staging/sm750fb/ddk750_dvi.h
> > index 1c7a565b617a..4ca2591ea94b 100644
> > --- a/drivers/staging/sm750fb/ddk750_dvi.h
> > +++ b/drivers/staging/sm750fb/ddk750_dvi.h
> > @@ -27,16 +27,16 @@ typedef void (*PFN_DVICTRL_CLEARINTERRUPT)(void);
> >  
> >  /* Structure to hold all the function pointer to the DVI Controller. */
> >  struct dvi_ctrl_device {
> > -	PFN_DVICTRL_INIT		pfnInit;
> > -	PFN_DVICTRL_RESETCHIP		pfnResetChip;
> > -	PFN_DVICTRL_GETCHIPSTRING	pfnGetChipString;
> > -	PFN_DVICTRL_GETVENDORID		pfnGetVendorId;
> > -	PFN_DVICTRL_GETDEVICEID		pfnGetDeviceId;
> > -	PFN_DVICTRL_SETPOWER		pfnSetPower;
> > -	PFN_DVICTRL_HOTPLUGDETECTION	pfnEnableHotPlugDetection;
> > -	PFN_DVICTRL_ISCONNECTED		pfnIsConnected;
> > -	PFN_DVICTRL_CHECKINTERRUPT	pfnCheckInterrupt;
> > -	PFN_DVICTRL_CLEARINTERRUPT	pfnClearInterrupt;
> > +	PFN_DVICTRL_INIT		pfn_init;
> 
> "pfn_" means "pointer to a function" which is not needed at all.  Just
> make this be "init".
>

I changed that in one of the next few patches, but now I realize I should have
combined the two changes.

> And the whole crazy "PFN_DVICTRL_INIT" also is not needed, just put the
> real function prototype in here so that we don't have to unwind the mess
> to look it up.
> 
> So, this line would look like:
> 	void (*init)(void);
> 
> Much smaller, more obvious, matches the kernel coding style, and is way
> easier to understand exactly what is happening here.
> 
> Typedefs can be used to hide complexity, but here they are just adding
> it, for no good reason at all.
> 
> I appreciate long patch series being sent out, but maybe make them
> smaller so you do not have to redo 49 patches because you are asked to
> make a change on the very first patch like here.  Perhaps stick to 20
> max for a bit until you get the process down and understand more about
> what the kernel programming style is?
> 
> thanks,
> 
> greg k-h

Sounds good. Thank you for the feedback. I will work more on this.

-Pavle
