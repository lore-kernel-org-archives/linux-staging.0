Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA1313E36;
	Mon, 30 Mar 2026 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886465; cv=none; b=m2sA/4mZ7j7/1y8lrohw8ChmcfTwSmCGnwYOGxFZvqO8kS7EzCaTGo937oojKd5XmcGWD9tAFhvb47klpaepZxify3rYl5PECgoWKNdTN1EBiNiSU6IBzxYCbYyiHupm1dl7sS46xrZDRb6XaQWhDfek6+YuLnXFrE5AlGf6JEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886465; c=relaxed/simple;
	bh=zI2Ix6o7dQnqs0G49rY9DAWe4EttoOxsqMbZm2znV1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InvNTJm+8i4OMTEfemWFFnSxfW8wOGMjxpvIoNZkxlojrrv+eyqdTYIrA++EKEK4wT0P3pwwTJY1pqLPIZHQ9p6mrTdex/X8uBfRceqzO6PjGbkWsUNE+xb+33C7SXlJDOrjxlw+kMszwjpXv8k9S8fsS1p/rJEEzuYRBm2AihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I+yAbdod; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I+yAbdod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CBAC4CEF7;
	Mon, 30 Mar 2026 16:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886465;
	bh=zI2Ix6o7dQnqs0G49rY9DAWe4EttoOxsqMbZm2znV1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+yAbdodk3EOi6nGSwZfy4fa9Lmyaq5pfTUoZdKZUG4KlBZkIcaEAqtmwG2Fx4xI1
	 Bgk5LgjubygXxfMrSHC9+68WgPNWCGcQmzHsbz5dayOP/K87WmjHSf4RmH5OPYKt2Z
	 ZdA7ndTGki8uHBkPPWmtuTfa9sYQJsYK7X06xeQM=
Date: Mon, 30 Mar 2026 18:01:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix coding style issues in
 core:rtw_wlan_util.c
Message-ID: <2026033039-augmented-hydrant-0f4d@gregkh>
References: <20260326014221.525368-1-marcosandrade95963@gmail.com>
 <20260326014221.525368-2-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326014221.525368-2-marcosandrade95963@gmail.com>

On Thu, Mar 26, 2026 at 01:42:20AM +0000, Marcos Andrade wrote:
> The 'enable' parameter in Switch_DM_Func() is of type u8. Explicitly
> comparing it to 'true' (which evaluates to 1) is error-prone. If the
> function is ever called with any non-zero value other than 1, the
> condition will evaluate to false, incorrectly clearing the hardware
> register instead of setting it.
> 
> Evaluate the condition implicitly to ensure that any non-zero value
> correctly triggers the set operation.
> 
> This change also resolves the following check reported by
> checkpatch.pl.
> 
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 3242978da36c..41868dda3838 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -236,7 +236,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
>  
>  void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
>  {
> -	if (enable == true)
> +	if (enable)

Why not just fix the parameter to be boolean instead?  That is the
correct fix, right?

thanks,

greg k-h
