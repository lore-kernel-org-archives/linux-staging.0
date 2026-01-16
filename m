Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BF51F63CD;
	Fri, 16 Jan 2026 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568881; cv=none; b=iNl8uo/T3U/6wNMKEKSrkRVD+SegQGyHTjh9qBXFg7dQ6bU6bk2qxJmyDF6BWggIkFJPSeyXjcrdjfY5J1uUI13y86KBPdN6QkUxMWAfIvUwEy79TkIeIgtfBmRDASgRhWpIpDS3AG7PDmq4l7cgKs6hRgHsJGWS0JffZiQjuOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568881; c=relaxed/simple;
	bh=eRDCD1F2KAXs3UtyszBNnqODUutCNL+ZiX6suxEk3vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kh32Jiece6KlN/RfOKB1gCMPaabUBZHhkKTQIlgRnYu/m+jTSHN6CXlrdnacyRfQUTh+NlznbvjiEMxH9/pTEpwZR6dsP4MnmDcMmXMny3RdTndW6umvbnWrvI+LFBqV/WqAL62cdX1FBLaIe2RafjZKOgASzOEt+0AYXDF8Mp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dBtrlLrc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dBtrlLrc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB14FC116C6;
	Fri, 16 Jan 2026 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768568881;
	bh=eRDCD1F2KAXs3UtyszBNnqODUutCNL+ZiX6suxEk3vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBtrlLrc1tmyjKaLLASMzKLDsZjemXiCEI30Ei7F0l9wXX7RKZ58582TlZE+KgoWu
	 ETUR4iSogn3dsjwSGRGK2aBCRbssgs5b6nTLJpebcKMvD2sFsGcU1QtZJLaUTl5/PO
	 XgfSPgjqBAT7691ynC9/CzlEdsDHbNcxYB0MOJLs=
Date: Fri, 16 Jan 2026 14:07:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Archit Anant <architanant5@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: fix spacing around operators
Message-ID: <2026011631-hungry-uncouth-0d0b@gregkh>
References: <20260114094949.14825-1-architanant5@gmail.com>
 <20260114094949.14825-2-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114094949.14825-2-architanant5@gmail.com>

On Wed, Jan 14, 2026 at 03:19:47PM +0530, Archit Anant wrote:
> From: ArchitAnant <architanant5@gmail.com>
> 
> Add missing spaces around mathematical and logical operators
> (+, -, /, |, ?, :) to comply with the Linux kernel coding style.
> 
> Issue identified by checkpatch.pl.
> 
> Signed-off-by: ArchitAnant <architanant5@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 28 ++++++++++++------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ef2d92b5588a..03274738c94e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -175,7 +175,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>  	if (!pcmdpriv->cmd_allocated_buf)
>  		return -ENOMEM;
>  
> -	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
> +	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));

Why are there additional ' ' around the first '+' character?

thanks,

greg k-h
