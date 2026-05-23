Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388CE946A;
	Sat, 23 May 2026 04:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779509879; cv=none; b=LOIZ8NfUB+s9YJtECv+RFNR2PrP6V/PdWUb0w2AAwps/YSXZEoySQJqs8bMj2I0h0OspvcMZeAJ8LB9o3W+dZ+7BPBmcRE6wtLqVgACbJ4Y7RThulFeSn95ginLC/7QuRtIJgf2K7E0B5F6hZoe8CQ0q017BxMYBzS8mB3kTyC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779509879; c=relaxed/simple;
	bh=lIYWZIXKTO3Cm0yqoE3StMI2Gzk/jQuGgcI1sgsXhf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWtLGJjXjv/u/fZMhk3ppw9TV4rqJq551Cj4MPRIHJtpbWpkK3mjZrVGDx4tjKyoQPcjwJzN0QTcSnWdJsD6ErbipSj9sS38V4N2avvCTnviZFyWMvoSXN9Ovxm3HF1SDjC2aPQCtRPzX116EhLsV25CksTE7Ln6mfxlxJ4IyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DdGpWgml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DdGpWgml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D831F000E9;
	Sat, 23 May 2026 04:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779509877;
	bh=6w4y/ZFqg4zV3E1mcAXyLU+MB/sHOfMv2BK+wqeqB8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DdGpWgmlxq/u4pwL6rBMM3F0xsJmtAl3+H+UU2pNww5q9G4aXoIXneDO5z+H5iIxw
	 lH09cNVHb6cPnAd+yJE04qYuraFF4L4Z5aq2MdNGGPActyq8qwg70CeCYJetGuRRK/
	 aP6Rel/5BVULaoI9DPs5XERIVZQaZ6uV68wYCj4Q=
Date: Sat, 23 May 2026 06:18:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliwier Iwan <oliwieriwan@mailbox.org>
Cc: linux-staging@lists.linux.dev, straube.linux@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in hal_com.c
Message-ID: <2026052349-sitcom-gauging-698b@gregkh>
References: <20260522141130.169249-1-oliwieriwan@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522141130.169249-1-oliwieriwan@mailbox.org>

On Fri, May 22, 2026 at 03:11:30PM +0100, Oliwier Iwan wrote:
> Fix multiple checkpatch warnings:
> - Place constant on right side of comparison
> - Remove space before tab in block comments
> - Align '*' on each line of block comments
> - Fix misaligned closing brace
> 
> Signed-off-by: Oliwier Iwan <oliwieriwan@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c | 38 ++++++++++++-------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 728a2171fbcb..4b4bfa80e37c 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
>  	pHalData->bDisableSWChannelPlan = false;
>  	chnlPlan = def_channel_plan;
>  
> -	if (0xFF == hw_channel_plan)
> +	if (hw_channel_plan == 0xFF)
>  		auto_load_fail = true;
>  
>  	if (!auto_load_fail) {
> @@ -362,7 +362,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  
>  	if (bWIFICfg) { /* WMM */
>  
> -		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> +		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
>  		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
>  		/* 0:ep_0 num, 1:ep_1 num */
>  
> @@ -403,7 +403,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  
>  	if (bWIFICfg) { /* for WMM */
>  
> -		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> +		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
>  		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
>  		/* 0:H, 1:N, 2:L */
>  
> @@ -420,7 +420,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  	} else { /* typical setting */
>  
>  
> -		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> +		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
>  		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
>  		/* 0:H, 1:N, 2:L */
>  
> @@ -478,10 +478,10 @@ void rtw_init_hal_com_default_value(struct adapter *Adapter)
>  }
>  
>  /*
> -* C2H event format:
> -* Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
> -* BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
> -*/
> + * C2H event format:
> + * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
> + * BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
> + */
>  
>  void c2h_evt_clear(struct adapter *adapter)
>  {
> @@ -489,10 +489,10 @@ void c2h_evt_clear(struct adapter *adapter)
>  }
>  
>  /*
> -* C2H event format:
> -* Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
> -* BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
> -*/
> + * C2H event format:
> + * Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
> + * BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
> + */
>  s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
>  {
>  	s32 ret = _FAIL;
> @@ -526,9 +526,9 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
>  
>  clear_evt:
>  	/*
> -	* Clear event to notify FW we have read the command.
> -	* If this field isn't clear, the FW won't update the next command message.
> -	*/
> +	 * Clear event to notify FW we have read the command.
> +	 * If this field isn't clear, the FW won't update the next command message.
> +	 */
>  	c2h_evt_clear(adapter);
>  exit:
>  	return ret;
> @@ -625,9 +625,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
>  		break;
>  	case HW_VAR_DM_FUNC_CLR:
>  		/*
> -		* input is already a mask to clear function
> -		* don't invert it again! George, Lucas@20130513
> -		*/
> +		 * input is already a mask to clear function
> +		 * don't invert it again! George, Lucas@20130513
> +		 */
>  		odm->SupportAbility &= *((u32 *)val);
>  		break;
>  	case HW_VAR_AMPDU_MIN_SPACE:
> @@ -736,7 +736,7 @@ void SetHalODMVar(
>  				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
>  
>  				/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
> -		    }
> +			}
>  		}
>  		break;
>  	case HAL_ODM_P2P_STATE:
> -- 
> 2.54.0
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
