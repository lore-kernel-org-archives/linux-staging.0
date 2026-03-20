Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92E73328E3;
	Fri, 20 Mar 2026 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992201; cv=none; b=GazLWXTNzN68JUAB7maGRBYHFB4xexLWGROYEVDgxb5SRAIhENyr9PXQ4Ykz02c56y8dje4X0pPBiYUzjYMC9NkjppZWoJ7fWFqLn6z72ZINrqqQDoeybW79yQBZlAeLoyx2NSFsarZZayVXVCRg6jYns1hFWfgSGSZrUZcC34Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992201; c=relaxed/simple;
	bh=kHjaEvj1NvL9nG3xnKoHXBi0upsoxXvVlvDbxb83YJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jy9y1CdJNRv31zH4ICkgEuZ41kW9+bL9TrsUpauFDIDbX26FZNs/Dm1za+/1VypZj+7t9YeltRlU+QswPhfJ7M50DiIOSOSS8cdihZfYbRGd50YctrX5Iod1dVPsJN5A/V4dwHFASS3Ukcgzfp0Cez2zJCdrKhyYyMT938DfqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LREsvub1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LREsvub1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC4DC4CEF7;
	Fri, 20 Mar 2026 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773992201;
	bh=kHjaEvj1NvL9nG3xnKoHXBi0upsoxXvVlvDbxb83YJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LREsvub1h0XMrhstu6i5UcTV4MH6PP26Z5zSqIDbC2SVXnjfXP7MB47DfLVyrD5Bf
	 9PMHy7nALL2NwdPX5Zgb9PJ7f4kfU7CB4EqBrgIp6HwgvVU+vOCzektZpvx93fl6sp
	 DXCHQcRrq2QpnFhNWJIwgP4zzCyhfhyYWfXuzEIo=
Date: Fri, 20 Mar 2026 08:36:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH] staging: rtl8723bs: change error handling to use
 standard errno
Message-ID: <2026032009-dares-scavenger-3d52@gregkh>
References: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320072951.54045-1-omer.e.idrissi@gmail.com>

On Fri, Mar 20, 2026 at 08:29:50AM +0100, Omer El Idrissi wrote:
> Replace non-standard return values with descriptive
> linux kernel error codes in probe path.
> Also replace the variable name 'status' with 'ret'
> to be more consistent with other kernel code
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 +++++++++++++-------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..ff0ebcb59c68 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -345,38 +345,46 @@ static int rtw_drv_init(
>  	struct sdio_func *func,
>  	const struct sdio_device_id *id)
>  {
> -	int status = _FAIL;
> +	int ret;
>  	struct adapter *if1 = NULL;
>  	struct dvobj_priv *dvobj;
>  
>  	dvobj = sdio_dvobj_init(func);
> -	if (!dvobj)
> +	if (!dvobj) {
> +		ret = -ENOMEM;

why is this an "out of memory" error?

thanks,

greg k-h
