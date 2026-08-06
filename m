Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06247DD74
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031180; cv=none; b=fPzmBnWMzBM4r7B9otFiHhF175c2xu40KDg4ImKyvfRHLPgbA1m883xhC0oZmiDnZiD90MwbtzDMT/aGhmrlzQEZSDdB3AvFKOmn90Hg8jX86yr4kfXMaPXDfnYfrMxB/IXqSdfQwu7Ll5WhSxj1apPTa5hlplTACsGqzVZyYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031180; c=relaxed/simple;
	bh=ymL6RwEbGB4PlaAt8yrHgDcdfiXnNmhoaPlmILJdrFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQUgwjLnVEzMI/TSJ81D1tfWyp4gtABcovODrifC9vG8Q8pO6TnfXalA/BRrq5VavlwoOJTiLz4MqDMWHVlobfdIl38W2y08UTWTbwEBPBTLiY/LN+V24p7hx+x8btI1Vb7vqzdXlNPzHcTzblijz36xXou2HnM+UZ5LtuqprkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJy1ijj6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJy1ijj6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso25714605ad.2
        for <linux-staging@lists.linux.dev>; Thu, 06 Aug 2026 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786031178; x=1786635978; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KX8YvRjvaZLSMvU+BOz9xHu5Ihsc1l7itWzs2U84KMc=;
        b=oJy1ijj6+SBnKSQoefU64S2X9jpAF0FAODvwoDVlcdMp3xRHrtMHnHLstrtEQqzLtH
         vHPkeWJ2yPJChaJyy18N07wfmloutgBESeCAJq7Ede6pDtPvqUpmGVogK1h1nZZtLcRj
         LhhNhOn69ZK8QccyIgL4rBB8lsyEl7zkKJgPCl062CsZAQulNm74fG3Q/3ItIGLO00nx
         uc4nyLKhOQncJ6lBMtyqHTZ56Q4k8JZQt6YkZzupSW7QIKo2RU+e5ogS/lbjCizZ13YK
         FUIcy9C5NexghiUVjGXGZxt9wdxPGcT0I4q2apD0z75M78502Td77To9dlbdhdL4cJNn
         3qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031178; x=1786635978;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KX8YvRjvaZLSMvU+BOz9xHu5Ihsc1l7itWzs2U84KMc=;
        b=c6yZAOEbJ1WHF+G4ZP2tlTqmF3aGZ8JnIyeSxXIC0WBmOznjrbVXZCGsIiSTZTbx2m
         brigAmGndQsFnH9LtKtW0yUgb0I0zdXGwFyksQewtiOEDrv7Z7fxrBIZ7paFX39MOFKe
         qZ8jKrCZg+i+6JDMQFcxmPWPYt6hLIqqJLDs3qMzRb5qkrKzDI4O5rtc7icrRzETuICN
         nlKfWaUnMEvAz6LXNnJfllg5HxBK4hDpMqAWHNlIs8hvTQzkDDaL269NqtMJPkPrDks3
         grZcN2JgST6uyUBvoiiAK+XcOr37nYBrUCGGryfW1XUdGV8wxr+VizO7NT9bH+989xaZ
         JPKA==
X-Forwarded-Encrypted: i=1; AHgh+RpLVPteJS7HlY64oWwYt+YlK1B9jHqIQ7+3Xb2UCifEBO5kZooqUpWocamEfkPkL8qyYDqRWQrGcGZ5D0I2@lists.linux.dev
X-Gm-Message-State: AOJu0YzCDjRV1ADLTBxZXWEk/p1l7fktYDCGrNW+2CjPNFEtggQfpM4g
	HT/JIXSgL2yDuRTtYMh32OWLoiPx8L417IGXmcwARiZ8kN/+8cCwuSZXe43sTMVzWmA=
X-Gm-Gg: AR+sD11z4/n0ROgBpG4WpCavs8SCkTWkd5H/SI2ZpriPtVQyXAasIzONQ96JGte9t6y
	jd7t75803Nk9dyXm44zPp/aavSGbWT2gnXjOGwaHwxvyLoxPbREwdWUHPiIuNVcjoLj02cRF4RN
	ctdHeFl8E8VAWKo/h6dpIb1DwYcYgyVtGfM/uHdv6e3A5uToqgskPzyLv84BXG8q2KK7PwpX0cG
	K24rqzjt7RI9REalBBkA2uEtCz1Yx1xLRj2NQBN59v39bUxBp6kPjBvTj92yMOLkSyWrOfmGYRW
	t0m1RRr2Pc5XlnMTrjt1A5S0ka/MxZqF+tHKOU+YqeBENtWPCRUp58g8ivqZNAxvrfjafNfh3HT
	2+3bFUlpc7i+wxjdD58S6iNtJt0a/b/hMI09aJWdyAUHJOaRO8whlBiYvOjnBGsWUp08UMmzv7G
	ayII/gbUyHb4B2+rxHEkfjvh9nlqk8dS8MMH20oC4D5xsJl/g21YwvrB8=
X-Received: by 2002:a17:903:2392:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2d106da9160mr30968025ad.15.1786031177845;
        Thu, 06 Aug 2026 08:46:17 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa491747sm33444285ad.39.2026.08.06.08.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:46:17 -0700 (PDT)
Date: Thu, 6 Aug 2026 18:46:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: singh.supreet14@gmail.com
Cc: Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: spilib: Handle SPI device types
 with a switch statement
Message-ID: <anSsQqjXux9MBsbe@stanley.mountain>
References: <20260805111958.114209-1-singh.supreet14@gmail.com>
 <20260806101118.146685-1-singh.supreet14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806101118.146685-1-singh.supreet14@gmail.com>

On Thu, Aug 06, 2026 at 03:41:18PM +0530, singh.supreet14@gmail.com wrote:
> From: Supreet Singh <singh.supreet14@gmail.com>
> 
> Replace the if/else chain that selects the SPI device type with a switch
> statement. This makes the code easier to extend when additional device
> types are introduced and improves readability.
> 
> 

Delete the extra blank line.

> Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
> ---
> Changes in v2:
> - Restore the temporary variable spidev
> - Use the contributor's full name in the From and Signed-off-by lines.
> 
>  drivers/staging/greybus/spilib.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index e4d1ae8308aa..d1b7ca9c4ee3 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -458,17 +458,22 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
>  
>  	dev_type = response.device_type;
>  
> -	if (dev_type == GB_SPI_SPI_DEV)
> +	switch (dev_type) {
> +	case GB_SPI_SPI_DEV:
>  		strscpy(spi_board.modalias, "spidev",
>  			sizeof(spi_board.modalias));
> -	else if (dev_type == GB_SPI_SPI_NOR)
> +		break;
> +	case GB_SPI_SPI_NOR:
>  		strscpy(spi_board.modalias, "spi-nor",
>  			sizeof(spi_board.modalias));
> -	else if (dev_type == GB_SPI_SPI_MODALIAS)
> +		break;
> +	case GB_SPI_SPI_MODALIAS:
>  		memcpy(spi_board.modalias, response.name,
> -		       sizeof(spi_board.modalias));
> -	else
> +		sizeof(spi_board.modalias));

This line is indented badly now.

regards,
dan carpenter

> +		break;
> +	default:
>  		return -EINVAL;
> +	}
