Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098911DFCE
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470255; cv=none; b=Y82S+7f6+LEIlFuL9pNjsp/tammGWPxBpS6Z68CFbbk7k9vMB7sbx+9Q+YgSPVYIA8xQJVxQFLDcuePZkVyy6Y8s7f1kNIy4bFr6kTteZamtxQ0LxlMtIZ21Pw5E8bswi2rzbsItK64OzqHGEy67bLywQBnqS1WxaZJ3QmxnjoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470255; c=relaxed/simple;
	bh=aN9DrsC6sf54ckexG38ElmpM/R4GUU/zUSXeDF8ptdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9PY+LGdmMmg45Gf0XPDPhJR2YMU4K74f0LxAw8jV6j506Cn0EcudrvtYm8ziJJ8u4Uzth81QmdAkv/3ALYyW9UCuqTjTTmclZx+Tum1ccF44wUgbATm1yPQ3kg2ZWna6JqARnSVRTMuqPMNR7X8Tpo+NY8YBZ3Cb+irXKxi9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R1Kz9nd1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R1Kz9nd1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C834C4CEE7;
	Sun, 26 Oct 2025 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761470254;
	bh=aN9DrsC6sf54ckexG38ElmpM/R4GUU/zUSXeDF8ptdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1Kz9nd1grcbgBEFc8rfHqz+HQX/eLCV0klCmUzZd8X58G8WPkcecO2ZOSbOfa3Qj
	 Xrrrx9bM3dqYrBIUQNwOJlhpvrf1fnbM2Gx60K6aunlnWbvlL77wxNHWCASVJ6LEXU
	 NLa3ilGSIJDybi1tYSQXiYx2RU2pIygS7qJC95N0=
Date: Sun, 26 Oct 2025 10:17:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rafiqul713 <rafiqul713@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace rtw_sprintf with scnprintf
Message-ID: <2025102639-pyramid-footless-7834@gregkh>
References: <20251026090438.116509-1-rafiqul713@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026090438.116509-1-rafiqul713@gmail.com>

On Sun, Oct 26, 2025 at 10:04:38AM +0100, rafiqul713 wrote:
> From: Rafiqul Islam <rafiqul713@gmail.com>
> 
> The rtw_sprintf macro used an old-style varargs macro. Replace it with scnprintf()
> to ensure buffer bounds are honoured and to align with kernel conventions.
> This change is a safe refactor (no functional change) and improves robustness
> against potential buffer overruns.
> 
> Tested: built driver tree (module build) and no runtime changes expected.
> 
> Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index 8b1634f4091e..019792d0595a 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -119,6 +119,6 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
>  /*
>   * Write formatted output to sized buffer
>   */
> -#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
> +#define rtw_sprintf(buf, size, fmt, ...) scnprintf(buf, size, fmt, ##__VA_ARGS__)

Why change this at all, it is not used anywhere, so why not just delete
this?

And this is the second version of this patch, it should have been "v2",
right?

thanks,

greg k-h
