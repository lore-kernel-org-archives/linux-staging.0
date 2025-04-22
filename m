Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72131E5B61
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304271; cv=none; b=XPB2uI8yjaHIu93MucksNooTNRWJhRHwwj9jP7W3E0N9DhoTc1FUgzMPNTCsS4AgZ6ueivFFnOM60ffaE2zWa802ppm+jPezgNbtOIbO+QSSKLZlS8L1SYmkaB310hEtHILy77sN18lFcEWA1BLlEJHX17mOmEDGSyZcYGvKtAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304271; c=relaxed/simple;
	bh=pL9CVghxG1ZKZG1MuX1QtZhXgzKhXTo0AK7d0/+p3xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xbjq5BFlJ61Z3udVTYCRST6tftSsNAj1u+rE5EDS10pmZNKmTu4QpQUy6ZHLpZrbb6Gsa6RpmTRe9hHHHGnXyEwR5P4wRruXVtJ1jMoQEbk2bHgHvOzRq3uDfwXqBPFD/Gk5X4WY13o0Z1pHObSFDyOkp1d6U9bm+IuFwfb8yUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S+hJdr87; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+hJdr87"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so40672645e9.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 23:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304268; x=1745909068; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQPImNugkItyfP+G4uJ4TvGScdbcNscFNsfQCd9dZNE=;
        b=S+hJdr87KAzYsPFGf0rjuZyXLkf9Nh3CrrftWpGIokaproPxCN7mDjYzmT04F9YiAE
         NLMSVA8H0HE9DjU0jwYqI6tSG+nSWArcCtaOqUXH6bzaDLdfE4eHrFd7it6fEWQle432
         wyCPwdPKt+SkQZ6A6HdbIRIM2kcr3XX/S0yYMdlxuDD4vBVhc+Ha9StpPK1kQfbwtyNp
         PjpCLj9V30iZy3CLmsv0pYpZnxL+inGwCDlNEr5yMdLa0XGWanhLFDjAlVhgsKgW+Jw9
         n8IPNdu5hfo3KpS9Gh9K1XJU9zhvFDkUIQ/T2S6gbBZeMU2anJppB9bwA8b67TJHrJGg
         yQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304268; x=1745909068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQPImNugkItyfP+G4uJ4TvGScdbcNscFNsfQCd9dZNE=;
        b=wuEOuP0OI8h2DSxJei3U/ggmaM4CNE0qSs6ocrqiuJtYJ+Envbud4blt/rcFi/5P/v
         rp5cdH8fKsfyGsJkiEgEXCswmPil1VXsSUMdDtcnPr+v4vhwio3qAuNVCg6WkLFjIg2I
         SSS1esQu03PhbX3czOte8961V43Pu6uu02NNBmLaSjBxBPYIlsqRp7bG7qCd9hlEvjmX
         Dkc8WvEJwhC6nZIDtOSz4TiOfzR6fUK/PL4Eoa6aWAu6GOSFNjjXCqph6fXdgmW3ygLS
         bGaAFeBVWIsfl7GS2UwsJz125NhDcPBREKOiBtPbEC4uLA7DdQCvxhJiCc14b8NVfH6a
         5mqg==
X-Forwarded-Encrypted: i=1; AJvYcCWiadJLQMy4EWYzNRnAnGFH0F5dcQwZNUDHzHnLDyMXOfbqrEiK+iNqePSAOROTuzzVSgBq0U1CMUXAXNik@lists.linux.dev
X-Gm-Message-State: AOJu0YyTyJhUAf2+UvEGp+DEzhw88IusWwapZ2+ubcdTtvuLgntEUd0m
	ukWsnQ+MPASLm7/Q+63J4x0+qgrKeXjs5A6NRw1CSGPH2pOwOtcpdI8qoffreKw=
X-Gm-Gg: ASbGncvMeFasv/odnHJJrEw82t77Oh86YDqG3xKzJV9Ktx8fvKszxI9Kofs+qYJp2AK
	xonohaqDsDZPjaGgxOoxg2n+Dj5Fr9xqfbnPArWfvdnWLe159vIhITJdbcY7gyWfTwO4pFSdr+f
	dsp72DFjSGYOzUZzNu8k2jeOOKUHfTpgvk7Kj+dpRxZnIk7u1XmLvetm4h50yHuNwudjrC6XMkS
	nThhfFTG3OkIQzclP8MNKbvhoJq4nSvgGiLFsWIRSRBESJkG3LSKgZMln71C0Ktfuv04SGm/2Ix
	0T0oRtHI1rE2yR9+EA//u0EM3VfC4VPFrGrEkgAyZpOqrw==
X-Google-Smtp-Source: AGHT+IHUNJ5wQ9P52XuaZE0IU0Ci7qmgXOj8IWWiW+Ga6WWO0mvjKQK2WDhvuSV7fUR8QE54qZimKg==
X-Received: by 2002:a05:600c:5023:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-4406ab7efadmr141939785e9.2.1745304268110;
        Mon, 21 Apr 2025 23:44:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5cf2easm160870545e9.31.2025.04.21.23.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:44:27 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:44:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	sonic.zhang@analog.com, vapier@gentoo.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 5/5] staging: iio: adc: ad7816: Simplify channel
 validation using chip_info
Message-ID: <a8aeef26-929d-4601-9eb5-9011d73aa36d@stanley.mountain>
References: <20250419135638.810070-1-gshahrouzi@gmail.com>
 <20250419135638.810070-6-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419135638.810070-6-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 09:56:38AM -0400, Gabriel Shahrouzi wrote:
> Refactor the channel validation logic within ad7816_store_channel() to
> leverage the max_channels field previously introduced in the
> ad7816_chip_info structure.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>

Could you add the ->max_channels struct member here?  This patch would be
easier to review if it had all the ->max_channels information in one place
so we didn't have to jump back to patch 3 to verify that it's correct.

regards,
dan carpenter

