Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E94155757;
	Mon, 23 Feb 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856725; cv=none; b=h+H4/fRwfskWV0dapjUCZRlyJ+qecBIBiseR4zShBPGZT1YJhGgBY7NEJjd4TL29emX1JpYGSbosk2MEs2IOfv1i3XHA7wUPR40VucvIO49/yyiNHCIUYtqKpiaWq9+ApS27ZLncP2Ihrm03Y0+0FnRNAoNdvOAr7ny8I7fzrP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856725; c=relaxed/simple;
	bh=1jlr66bnGvm/bUEX57Br9eX3xkspzQKsMa70Fv7Y1Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJCX4twWm5OhuHcAUWxaBV6geXgaWD0bQfCLRHTyTnKI7AALOlEdXJnTqO7LdrpaBbe23FD7KyAwSJiHuQDA3QCQ/1v06GuRKj7KXNt+4pKQWOECjtf3Nk1jZUz9JXGImOaKFVFHQeuSQrumrcnxjEZFanuJ72M9FkaDQu4UJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1SJUP9dL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1SJUP9dL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E6BC116C6;
	Mon, 23 Feb 2026 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771856725;
	bh=1jlr66bnGvm/bUEX57Br9eX3xkspzQKsMa70Fv7Y1Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1SJUP9dLmf53MyGdEJd/K/PDnTdTrcgA0owZlL5vdIip7YRrAwV2pKvidggH16sqm
	 jjbQVepAv3TvupHUDiYZU/Jgh3ib73cicZECUgLSG6rtfcm1p+6CG7fXHe33dMTzMU
	 wRknLv25H7oyYMFXC1Uxwu7F37XzRu1XmcYPus34=
Date: Mon, 23 Feb 2026 15:25:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wojciech <wojciech.develop@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, ethantidmore06@gmail.com,
	arthur.stupa@gmail.com, horstaufmental@gmail.com,
	kaizhetan@yahoo.com
Subject: Re: [PATCH] staging: rtl8723bs: cleanup rtw_io.c
Message-ID: <2026022348-kosher-material-a483@gregkh>
References: <CALGt97_zniC2O12ge7-5tHTXQL+4PGgw8fwdx4jMTb-AEYQeLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALGt97_zniC2O12ge7-5tHTXQL+4PGgw8fwdx4jMTb-AEYQeLA@mail.gmail.com>

On Sat, Feb 21, 2026 at 02:56:13PM +0100, Wojciech wrote:
> Replace tabs with a space in return statements and declarations.
> Remove dead code and redundant vendor comments.
> No functional changes.
> 
> Signed-off-by: Wojciech S. <wojciech.develop@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_io.c | 49 ++++---------------------
>  1 file changed, 7 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c
> b/drivers/staging/rtl8723bs/core/rtw_io.c
> index 965c3cfea103..4b36a39946f1 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_io.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_io.c
> @@ -1,35 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/******************************************************************************
> - *
> - * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
> - *
> - ******************************************************************************/
> -/*
> - * The purpose of rtw_io.c
> - *
> - * a. provides the API
> - *
> - * b. provides the protocol engine
> - *
> - * c. provides the software interface between caller and the hardware interface
> - *
> - *
> - * Compiler Flag Option:
> - *
> - * 1. CONFIG_SDIO_HCI:
> - *  a. USE_SYNC_IRP:  Only sync operations are provided.
> - *  b. USE_ASYNC_IRP:Both sync/async operations are provided.
> - *
> - *  jackson@realtek.com.tw
> - */
> 
>  #include <drv_types.h>
> 
>  u8 rtw_read8(struct adapter *adapter, u32 addr)
>  {
> - /* struct io_queue *pio_queue = (struct io_queue *)adapter->pio_queue; */
>   struct io_priv *pio_priv = &adapter->iopriv;
> - struct intf_hdl *pintfhdl = &pio_priv->intf;
> + struct intf_hdl *pintfhdl = &pio_priv->intf;
>   u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
