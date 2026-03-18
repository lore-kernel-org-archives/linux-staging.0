Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891D3B4E95;
	Wed, 18 Mar 2026 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848577; cv=none; b=D8e8UoLjyJw6hYbUDtAIu5zn/q9sn76XwTiDHLA66rU30bnvb7zGLRoNZKYKX37T5fZbCEOiLqo2ligQWe6q7kl9xwgIBI49T8MUu+gd4V8C7AdrBXCZV+ioM5OOuHM4PYklloyisFMpW93cPDaDq8BTkfcTG6MYo8exNbA6TfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848577; c=relaxed/simple;
	bh=hIyNQcPTSLvcfoItM9GXLaALNkNO0wVF0l4LslDZGG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZDn4XMEoyR1K/UUBYaN3fhzsq1hqn4mebu/MsIgz+U9/HxoQPhsEMF9NE4PGLlV72uKvrxV4raJfy9FKhXcHfiUFeYY8Wb7POk3NKgv9QMkNUEyQWWyl0/kJU5Q3IJgIAa64TaXZNXjYmfOIIp1lWKYcPSo5ayQhDjaCpswAxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YwSYr4UY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YwSYr4UY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD19C2BCAF;
	Wed, 18 Mar 2026 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773848577;
	bh=hIyNQcPTSLvcfoItM9GXLaALNkNO0wVF0l4LslDZGG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwSYr4UYMfrHxtLL96QZZRO9kZP3t5k3b2oXFI++idmGge4D/EHKWpWNmtdY6Xxti
	 HRmYXcmhYbzzW9HZT4oiTdLe+nFfzL41oRwe3pfYwFJgtZ4+nfEd+/8DWuv/FmvEZz
	 EcmGiq8friSRpD/iJmsfdB6bxvfzbt4hcAjzJvvY=
Date: Wed, 18 Mar 2026 16:42:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Azamat Rakhim <azamatrakhim8@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: replace rtl8192c_recv.h with
 rtl8723b_recv.h
Message-ID: <2026031834-unstitch-trading-3189@gregkh>
References: <20260314190704.11945-1-azamatrakhim8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314190704.11945-1-azamatrakhim8@gmail.com>

On Sun, Mar 15, 2026 at 12:07:04AM +0500, Azamat Rakhim wrote:
> Move the used definitions into rtl8723b_recv.h and delete
> rtl8192c_recv.h.
> 
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
> ---
>  .../staging/rtl8723bs/include/rtl8192c_recv.h | 37 -------------------
>  .../staging/rtl8723bs/include/rtl8723b_recv.h | 21 ++++++++++-
>  2 files changed, 20 insertions(+), 38 deletions(-)
>  delete mode 100644 drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> deleted file mode 100644
> index e2e9aa03ffdf..000000000000
> --- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/******************************************************************************
> - *
> - * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
> - *
> - ******************************************************************************/
> -#ifndef _RTL8192C_RECV_H_
> -#define _RTL8192C_RECV_H_
> -
> -#define MAX_RECVBUF_SZ (10240)
> -
> -struct phy_stat {
> -	unsigned int phydw0;
> -
> -	unsigned int phydw1;
> -
> -	unsigned int phydw2;
> -
> -	unsigned int phydw3;
> -
> -	unsigned int phydw4;
> -
> -	unsigned int phydw5;
> -
> -	unsigned int phydw6;
> -
> -	unsigned int phydw7;
> -};
> -
> -/*  Rx smooth factor */
> -#define	Rx_Smooth_Factor (20)
> -
> -
> -void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
> -void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
> -
> -#endif
> diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
> index 783f64de0aec..e05f4975b6ca 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
> @@ -7,7 +7,26 @@
>  #ifndef __RTL8723B_RECV_H__
>  #define __RTL8723B_RECV_H__
>  
> -#include <rtl8192c_recv.h>
> +#define MAX_RECVBUF_SZ (10240)
> +#define	Rx_Smooth_Factor (20)
> +
> +struct phy_stat {
> +	unsigned int phydw0;
> +
> +	unsigned int phydw1;
> +
> +	unsigned int phydw2;
> +
> +	unsigned int phydw3;
> +
> +	unsigned int phydw4;
> +
> +	unsigned int phydw5;
> +
> +	unsigned int phydw6;
> +
> +	unsigned int phydw7;
> +};
>  
>  struct rxreport_8723b {
>  	/* DWORD 0 */
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
