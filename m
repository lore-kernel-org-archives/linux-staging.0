Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EFD18872A;
	Mon, 15 Jun 2026 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510233; cv=none; b=bcTWgOKClb3DKoZyI0F5rY6WfAhQ0cdT2aM7Bi7+fHGNSph277VuNPlVUspktiizoExFpfczyleQKmLVQSOUgG1cxoSD0R2X8tAjLXdz1a8OC5L/hmQ02fPmX0lmsFwSRNDl7ZHzewt62Cy+WXEMBmFcy9A95pxaC9eLbT0w5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510233; c=relaxed/simple;
	bh=mUBkpohXnhhybDfSJH6AbpZ+zf1y43Rg4KlBRBCSYxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvqVs7yzNCUs7gp68LviMRNx9E75Y5yEDgbzGLmOHfP9XR6z7TaJ0LRzZysVKm4P5XxWi49SK6SUMzrhdUnk9lRsS77O1sEkgo58JjqofOSN5NHjmZRxYIc3ODJwSplCvz5lh1l2iya5U/iKfSspGcpHHej2WK2vwLAM+lYsQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K9ewA/j+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K9ewA/j+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42631F000E9;
	Mon, 15 Jun 2026 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781510231;
	bh=6zm2KOtk7g62DkYhDBfMMzUoEBfhqmX9G3ep+9Vh1hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K9ewA/j+GMS+ptnwYONjl1ZU5eXdee3M0Lu4MDkorgArLJtXDsreXvY4WhWjoJXL5
	 VMeSggaKUmvJQjzqwMk1cUkOkk/n+3n+fz5PUouJrM+7utbPaQml9qMM3qMPiNQqsh
	 p1JAarfUjPXV1u4aw0xCrp7W7eZEXMv1M8ZiHJDg=
Date: Mon, 15 Jun 2026 09:56:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michail Tatas <michail.tatas@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Remove unused macro
Message-ID: <2026061510-backpack-skimmer-12bc@gregkh>
References: <ahdNZlYqnTO22tQq@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahdNZlYqnTO22tQq@michalis-linux>

On Wed, May 27, 2026 at 11:00:38PM +0300, Michail Tatas wrote:
> Remove unused macro as indicated by the compiler
> when building with make W=2

W=2 even works for staging drivers?  I wouldn't worry about that at all :)

> Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 4d085d3cd471..7442b1c4e86c 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -167,32 +167,6 @@ static DEVICE_ATTR_RO(name##_avg)
>  	gb_loopback_ro_stats_attr(field, max, u);		\
>  	gb_loopback_ro_avg_attr(field)
>  
> -#define gb_loopback_attr(field, type)					\
> -static ssize_t field##_show(struct device *dev,				\
> -			    struct device_attribute *attr,		\
> -			    char *buf)					\
> -{									\
> -	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
> -}									\
> -static ssize_t field##_store(struct device *dev,			\
> -			    struct device_attribute *attr,		\
> -			    const char *buf,				\
> -			    size_t len)					\
> -{									\
> -	int ret;							\
> -	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	mutex_lock(&gb->mutex);						\
> -	ret = sscanf(buf, "%"#type, &gb->field);			\
> -	if (ret != 1)							\
> -		len = -EINVAL;						\
> -	else								\
> -		gb_loopback_check_attr(gb, bundle);			\
> -	mutex_unlock(&gb->mutex);					\
> -	return len;							\
> -}									\
> -static DEVICE_ATTR_RW(field)

I see why this is present, it makes it more uniform.  That being said,
as it's not being used anywhere, I can understand the confusion even if
there is not any produced code difference at all.

I'll queue this up after -rc1 is out.

thanks,

greg k-h
