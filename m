Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158426;
	b=evN82B2Pgu2GLuE9xW1JYN7v4xWeU3XDbpsA2WXgcRfcQOT0ibFnxkKfeVusU5JxJ/C4
	 7A8ZaI+3DBhDMR63g4JEgXxPeFEJPMcJFSSVYsBZgMnnFft77AlO1/mU5iNkPV8Yo4rNL
	 UWMS8BBrT2G26D8rDoel7/3l+/N3cFdVibKZ8WMvvMtJhT1tvjDL+hKmZoSuEsVGyWcGf
	 jic1ZROSBmjjBR3TLOfDdhS6/d791jpdU56C5e0DTCE2QXTXqyRWNRGHm1pHV1z1eF8AF
	 k93bAiTjxLQR1nx58q6pNMtQ7WibFpXE1cBHsuL2ghByFqsCPgZR7gat56wYB6RCZNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jCqtAw/DPiVwOqfXQNFMLkFqF75XZNdIseDnEZBGtk4=;
	b=OjzQgmFi3rlz5bQ+fxPgTCTnVjxJuo0bA6hT65zzkCyyg2lMwlvmXqB5sLBAO58c/w55
	 jqo8ovRl87eVPynkIyRkMyZYD7Id71LOAuYZoiBn6uaPix91APl1Rr3L6Vk8Rg16p2xXT
	 i2eC0VovuvpzEyG+UVztMG2G0eM7R4Qyrn8BqCbGnpXD0k00vN5vVi3QqeRG+2uY7oNr/
	 7BecjDL10CBMy3BLTy2t2qjWllZPjoRVMFtZmgavEifVb0rrhp7bBZLezXhpZNns08+4h
	 +8hnrGKC9kf+M5meC5hvrjpf8D/7xIF4rDZNIchBfXqD4+L59XyVAMSFAs+Stx693gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OnC1WPmy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D019606A325;
	Fri, 20 Nov 2026 07:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OnC1WPmy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E3F1F000C4;
	Fri, 20 Nov 2026 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795158426;
	bh=jCqtAw/DPiVwOqfXQNFMLkFqF75XZNdIseDnEZBGtk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OnC1WPmyGFYjbP3cAWJ+C/VzIMi5umFlt/zctM++iYRxjGq5bbf+WAGb91/c2PTmY
	 VDMFOURIsr7uwDcS+xZ5pQG8m667qPvZu2jdta1bD1we0kA6ehk3R1P/D8j1NDmy+u
	 zjvu51uod8BfvWreF+/YfbyB5ijCBHRf1207rDDE=
Date: Fri, 20 Nov 2026 08:07:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Platon Miller <platon.ksenzenkokk@gmail.com>
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: light: Use sysfs_emit() instead of
 sprintf()
Message-ID: <2026112049-scouring-dimness-9d1d@gregkh>
References: <20261109230059.24572-1-platon.ksenzenkokk@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109230059.24572-1-platon.ksenzenkokk@gmail.com>

On Tue, Nov 10, 2026 at 12:00:59AM +0100, Platon Miller wrote:
> Use sysfs_emit() instead of sprintf() in sysfs show attributes
> (fade_##__dir##_show and color_show). sysfs_emit() is specifically
> designed for sysfs attributes, is PAGE_SIZE-aware, and avoids potential
> buffer overflows.
> 
> Signed-off-by: Platon Miller <platon.ksenzenkokk@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index cab02b5da..2689f9a75 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
>  	struct led_classdev *cdev = dev_get_drvdata(dev);		\
>  	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
>  									\
> -	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
> +	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
>  }									\
>  									\
>  static ssize_t fade_##__dir##_store(struct device *dev,			\
> @@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
>  	struct led_classdev *cdev = dev_get_drvdata(dev);
>  	struct gb_channel *channel = get_channel_from_cdev(cdev);
>  
> -	return sprintf(buf, "0x%08x\n", channel->color);
> +	return sysfs_emit(buf, "0x%08x\n", channel->color);

sprintf() is just fine to use here.

thanks,

greg k-h
