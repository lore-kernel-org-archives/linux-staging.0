Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2D185E4A;
	Fri, 16 Jan 2026 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568821; cv=none; b=dhA2YqgH251Kqyt8V7DjWYVrA1LuWjfIfHPYg3loKixljB+ymnP+qj7buR2R9Uetin4rS8kXC8APwfQs/f5E0DMfbdKlEQwQIyEidn7Z2QkC/n9TfrW4ZBeQ8hrTYPWvwqoHjcblEPllYnAKz62eAINiJosJPXCJHyMxbN0CGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568821; c=relaxed/simple;
	bh=IbnOCUNgoa3043qjP8pewcJkcq5ku7hLKg03eZtyGYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT56q+ghb5uCQDzxF2aCURjsuWsnVFuqGySVGTJ0x/aQ7Xr/RPs4IIVPqle6L9suVkl4Fi9LQQOXE3k7k76tzcteAKAI4HmoCqMDvTFIMhutPCyz8RsYJ028aI/geJ+cT6zEamyLyzj/23IoGf13c4MeL2T10TXuKMXMJVIx/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F6IRny/X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F6IRny/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DDBC116C6;
	Fri, 16 Jan 2026 13:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768568821;
	bh=IbnOCUNgoa3043qjP8pewcJkcq5ku7hLKg03eZtyGYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6IRny/XY//nPZ/qS4A0R4pvLtal7K32QFfb0VjUAq49MbpA9bbJ8THlRPx/IKDIN
	 6ZMU30MePtd0i+YIMhQ82fihnR3qNwbrPqch0tVF+7GeLV1nEczdrd+x+EKvuC/iwg
	 0MvD37kwSy+LdcPKUlMogMUKWL2iiF1C19J3d/24=
Date: Fri, 16 Jan 2026 14:06:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: core/rtw_mlme_ext.c: flatten
 indentation with early loop continue in OnAssocReq()
Message-ID: <2026011632-fastball-lukewarm-e7a7@gregkh>
References: <20260113211433.89512-1-william.hansen.baird@gmail.com>
 <20260113211433.89512-2-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113211433.89512-2-william.hansen.baird@gmail.com>

On Tue, Jan 13, 2026 at 04:14:33PM -0500, William Hansen-Baird wrote:
> Replace large if (memcmp(p+2, WMM_IE, 6)) inside the for (;;) loop,
> which ends with a break, with an early continue.
> This reduces deep nesting and is purely stylistic.
> 
> Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 61 ++++++++++---------
>  1 file changed, 31 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index d3b395894d4b..4eb28577fb6a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1184,46 +1184,47 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  			if (!p)
>  				break;
>  
> -			if (!memcmp(p+2, WMM_IE, 6)) {
> +			if (memcmp(p+2, WMM_IE, 6)) {
> +				p = p + ie_len + 2;
> +				continue;

Ah, here's the loop, sorry about the previous review comment.

Ugh, what a mess.  I'll take this now, hopefully it all still works :)

thanks,

greg k-h
