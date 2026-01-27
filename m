Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE435DCE6;
	Tue, 27 Jan 2026 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524835; cv=none; b=lp7r8CtkVRAD7RGHjQ8LBfYUOw4bo8DWFErM4I7lEX8G5haXxNiLCDSnxhYv7a5CHsPkHD1ydGPE/mYFms6Vn4m7ju/mE/R1ibBRLJ9lfeJrEvYpL5dGZdUHjMRVVsbdxc4aogT2GZPfxWSqPNLqqj36eybSbiWCF/fhMUc4J6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524835; c=relaxed/simple;
	bh=o0bgYZ1rsCMJ95+/C4JVndZuf6BGn3Lrr1ddWuyL9nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLjjeKAA2KZvQWC0pG6JBm9qm5v5Zf7hVOM4Vz6QJCbOKyGKB/vjdnRDm1sGsgc6cbCPQ2g/qc5hJpaf8IjatQE81f3Zs+0RNU9Oj46jHsjTnSBodoZ8n6pB6Vnouu03j9EiMprcfjjV/+qg6UANyjrNc3rlPUlgp6YmOJ6VIHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1GEG8Ixn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1GEG8Ixn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65024C116C6;
	Tue, 27 Jan 2026 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769524834;
	bh=o0bgYZ1rsCMJ95+/C4JVndZuf6BGn3Lrr1ddWuyL9nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1GEG8IxnYnl9MHNFAYvjcAfFEzOI3yj46zRlkRdDfzlA8XQhTHUeUx6m+24GfLNGS
	 csjjh7Qq7aBIjHtcfiQqKrknd4gnP/DHAGjnz1G6onjEObj/XQMirJGByQbE/fcaJ3
	 9DjDJQR3Xzb1HlE/WxtiEn7/E1UXCkaCqBim3izo=
Date: Tue, 27 Jan 2026 15:40:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] staging: rtl8723bs: fix line length check
Message-ID: <2026012713-bovine-tricolor-d747@gregkh>
References: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
 <ff17af4290ee04d9a6c57777c7387c782bb779e7.1768736361.git.mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff17af4290ee04d9a6c57777c7387c782bb779e7.1768736361.git.mahad.ibrahim.dev@gmail.com>

On Sun, Jan 18, 2026 at 04:54:45PM +0500, Mahad Ibrahim wrote:
> Fix checkpatch.pl check regarding:
> - Line length of X exceeds 100 columns
> 
> Redistribute comments to multiple lines to adhere to kernel coding
> standards.
> 
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
> index b7176a992518..fb108492efac 100644
> --- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
> +++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
> @@ -60,7 +60,8 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
>  		if ((cond1 & BIT3) != 0) /* APA */
>  			bitMask |= 0xFF000000;
>  
> -		if ((cond2 & bitMask) == (driver2 & bitMask)) /*  BoardType of each RF path is matched */
> +		/*  BoardType of each RF path is matched */

Why the extra space after /* and before BoardType?

thanks,

greg k-h
