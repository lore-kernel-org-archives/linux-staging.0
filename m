Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE228C87D;
	Sat, 10 Jan 2026 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768075247; cv=none; b=YAjlHzlLABAzRaZqr16/4lQFN+ymxyAHHIMxUeMb6Eg6MHer5Zc8mjjkkf4Klf/cv+QfWPN+0KUxUVHdxJNdHU11GlmvbQczAASGX6NVgVIZaAKtVyz+6qdAGNxujk9Y0NY2Pj0yTEA6mJVRdfYXM4WVDdeDZBgApOC4ibU+EbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768075247; c=relaxed/simple;
	bh=Tl58TEcgqqFezm815BkYRI8vN4PfMAbZMr/wqyUYLrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdis6hR9mBUwce3xtd29+Ka+gmUfKbGR2f/zsA6iZ8fRdbzIbqXhTTVaXtFVRJGxXJ5FzrEuL/QZQXVxtniEHPLfa/D7O9GFThy8XGDwhn/j2jBRZ3EC8N95J9VliJitBSZKhNkaNEurNOTzMEy/lB7eGFdpna2DlwgtLk7uYt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=beHRKSzq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="beHRKSzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE4AC116D0;
	Sat, 10 Jan 2026 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768075247;
	bh=Tl58TEcgqqFezm815BkYRI8vN4PfMAbZMr/wqyUYLrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beHRKSzqdrlucr649ERhfh24HLihUp8a53XusmFNtYTvDzv9mkQecEHcvUj7fPa91
	 dAteXEZUrwDbUok2/ht6S9VJdNXLYhdEOzLjCmpI2cHmNM6Fk1i36PmljMDg1FdNbA
	 qi6mcmd1X3LLIFUbvJ/WeR4ksgTxj9tcfekmBkPE=
Date: Sat, 10 Jan 2026 14:24:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: 2023060904@ycu.edu.cn
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	guagua210311@qq.com
Subject: Re: [PATCH 2/3] rtl8723bs: sdio: Use local error_count instead of
 global variable
Message-ID: <2026011047-monoxide-tidings-190c@gregkh>
References: <20260110101801.5820-1-2023060904@ycu.edu.cn>
 <A23D22DD90AB07AE+20260110101801.5820-3-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A23D22DD90AB07AE+20260110101801.5820-3-2023060904@ycu.edu.cn>

On Sat, Jan 10, 2026 at 06:17:59PM +0800, 2023060904@ycu.edu.cn wrote:
> From: changjunzheng <guagua210311@qq.com>
> 
> Replace the global continual_io_error variable with a local error_count in
> sd_read32 and sd_write32 functions. This eliminates cross-function dependency
> on the global variable and keeps the error counting logic isolated to each
> IO operation.
> 
> Changelog v3 -> v4:
> 1. Split the single v3 patch into 4 logical patches (per Greg KH's request)
> 2. Fix all coding style errors (trailing spaces, missing assignment spaces, indentation)
> 3. Add clear, purpose-driven commit messages for each patch
> 4. Add version changelog as required by kernel documentation
> 
> Signed-off-by: changjunzheng <guagua210311@qq.com>
> ---
>  .../staging/rtl8723bs/os_dep/sdio_ops_linux.c    | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
> index 5dc00e9117ae..571a2c6fc37a 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
> @@ -207,7 +207,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
>  
>  	if (err && *err) {
>  		int i;
> -
> +		int error_count = 0;
>  		*err = 0;
>  		for (i = 0; i < SD_IO_TRY_CNT; i++) {
>  			if (claim_needed)
> @@ -217,13 +217,13 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
>  				sdio_release_host(func);
>  
>  			if (*err == 0) {
> -				rtw_reset_continual_io_error(psdiodev);
> +				error_count=0;

Always run checkpatch.pl on your submissions so that you don't get
grumpy maintainers asking you why you didn't run checkpatch.pl on your
submission :)
