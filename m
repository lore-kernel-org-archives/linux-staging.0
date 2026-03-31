Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EE4253F13;
	Tue, 31 Mar 2026 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933370; cv=none; b=vBJTPvE+nw29+c3iWf823YxqIsAEX8b0Qdf0+/rW//KIve2w1n9a8wDBUj/8ppa6eVJNeaG3RZal/2KYGyX+i2QuuygMyezY+188i7asaFrYIKmmhwJ/CK6vKgJybFnvo0F833/wQJi2GnV0JlnANssRn2CuO0BTRzeJf2/zzHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933370; c=relaxed/simple;
	bh=4X8HgN0NdofYlwlfLNTl8Lg5NPjEwEPcaj0nq5QTbNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3RcuVrz5vtw+YzjkT0YaDlPAlchNVD/76VR0s64f2oTdWuk8R+rvwMws8aS48/R1C2uhgSxuD4qxf9E34//iaYIQQuADuAd+zNQ5WBoP3kaX11ZqkKtCISQ1GaReUwZJofvFpCRUwioHAS9hsOMXRFX6DtDqpu3WjzuZbbM3wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pW1rFec9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pW1rFec9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC9BC19423;
	Tue, 31 Mar 2026 05:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774933369;
	bh=4X8HgN0NdofYlwlfLNTl8Lg5NPjEwEPcaj0nq5QTbNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW1rFec9L2cBws9u4BO0zTeAEI9T29teCF1ehrnHc+0nPz8v6ncE/AWAGBl8IwLSj
	 XD/gcEUiZScCC9xKnWuz8ZOYKPVNFevHlvKgBOiP78j7LQ90goqSFDVL6t/L6plBxW
	 A+J8I+HDfkBfqN7YhBkXS/hRUzXyNGkQFtcD2Rcs=
Date: Tue, 31 Mar 2026 07:02:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mashiro Chen <mashiro.chen@mailbox.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unused RTL8188E antenna
 selection macros
Message-ID: <2026033111-jittery-written-63e0@gregkh>
References: <20260331040023.45627-1-mashiro.chen@mailbox.org>
 <20260331045738.84449-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331045738.84449-1-mashiro.chen@mailbox.org>

On Tue, Mar 31, 2026 at 12:57:38PM +0800, Mashiro Chen wrote:
> Remove the SET_TX_DESC_ANTSEL_{A,B,C}_88E macros from odm_types.h.
> These are leftover dead code for the RTL8188E chip and have no callers
> in the rtl8723bs driver. The RTL8188E is a different chip family and
> has its own driver at drivers/net/wireless/realtek/rtl8xxxu
> 
> This addresses the TODO item "find and remove any code for other chips
> that is left over".
> 
> Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/hal/odm_types.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
> index 8168dc14e8796..0da662e1493a6 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_types.h
> +++ b/drivers/staging/rtl8723bs/hal/odm_types.h
> @@ -36,10 +36,6 @@ enum hal_status {
>  	#define	STA_INFO_T			struct sta_info
>  	#define	PSTA_INFO_T		struct sta_info *
>  
> -	#define SET_TX_DESC_ANTSEL_A_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 24, 1, __Value)
> -	#define SET_TX_DESC_ANTSEL_B_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+8, 25, 1, __Value)
> -	#define SET_TX_DESC_ANTSEL_C_88E(__pTxDesc, __Value) SET_BITS_TO_LE_4BYTE(__pTxDesc+28, 29, 1, __Value)
> -
>  	/* define useless flag to avoid compile warning */
>  	#define	USE_WORKITEM 0
>  	#define   FPGA_TWO_MAC_VERIFICATION	0
> -- 
> 2.53.0
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
