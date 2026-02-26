Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DEA399021
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097658; cv=none; b=r224wuhS9PZEq+bG4R82w8GG1fF5Lzy7jIlRBiBZI3Jhp8X+fq02BQdleYciPTF9iBjQp3OcjuEs9yLeakbH2cCWhPsEwOjkBqdC8fbf8TLombx5To2Wq2gU70wxyAf4GNNYeD2Pr/gAhcXEnLV4eNeNtu7hdUP3XV6Sz1I+3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097658; c=relaxed/simple;
	bh=8qs6x4Pv9y+qF2DuVeJ8w+TpvkUvEUks+sRLZeSXwYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3JRF5HlvjUtwC8OdeZuJ8NpebyQ/ohX3x4lYZbT/UW/CTIc9c/dTQc2AdIbPOxNm8U1ba91yliEwtF2lWmVmngbwCvmqb1wcvsnRffxicRhte6yJiDavy81v7DxRb5HjYDY/uVmr3n88e00MmBikkBWfF3l6nQuMqcYjkNkMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JXAi+/uM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXAi+/uM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-436e8758b91so375388f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772097655; x=1772702455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SEN2Mxya0NO2eS3wMKqR810X2FDpQZBHPAnpB8bwU1I=;
        b=JXAi+/uM//jdiKziws42BZVlkJTbgsRxEfbANy2swTFICIqfjsHy6HSMCr85UGuS91
         F0lTcVcwSOrdsHayWCLuHHssCcuLr44cEZGVC6lucZaN4/2qmKhWk4BSFx7AiHZwaNwc
         OYZGiXhEs+PBgboytgSE8YCIL2yQW+BTid6I93rps+hR6JJGgWQABch44x5tdReWHOvz
         six09ZNU0wYW6HvyUycbE8tz1Yn0VdfGY9vWlDL+QkVk+fwytLjEIU4XtPoHOSGGIPRH
         A+odUdDz2Q9Yg7lJN5RH0zJeAEzfOXiKvwFkC5DL+KQs/d4tIvwzgJwuRgwwQoyH8t8v
         eKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772097655; x=1772702455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEN2Mxya0NO2eS3wMKqR810X2FDpQZBHPAnpB8bwU1I=;
        b=M7r/2GKEKKgjeRCahgn4O20HipCBDe9jE5KgSJI9nPFds17WWTUJHoNHy58fjWAvxO
         67NLHOgAKqWR20B0hPB+yUwZxp4vVRRXZwy7EzOmznkykmj3wpuxIcx32aoxIPqnMAJe
         kQZu4Ql0JNbn7LFh+zZexczt1H2W+Om5G4mom9lDAiJwIZVvn63D8SANaf4vNxk8FKO1
         Ax32AM08VOaWVsAJlJc+qxArV+vWcTTG17r1nAKwS2rH7k6dI+FufGvV7VESAvhbSjqP
         LSUUtgvf0mvUOc4ZJ/jQ3ESLUi4x3XnaF9SajYEUKfa+rEicFetyyK+fwjgjkrrf517N
         hGtg==
X-Forwarded-Encrypted: i=1; AJvYcCUWk789VtoLxDFTFuP1OmZPNJUCYZe/gNMOwMZI3MF1WzcdPOSExlNbgbConxH/XuNZkP2DCQOtcitbADWe@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/nA36mCaLa3CWenp6NWtzCxSTF8AAnJ3HMUWQXS1PrjcyuH9W
	VLJ9PLBSTHahdxnD1SJpIFRujAQ9J/e6nLrZJRwS9K/wMJM0ev7VCkYh63OM/37ONyo=
X-Gm-Gg: ATEYQzwbkJzr2yXMkBWN6sNPB7Ob7SRVFQVDNH6lQaCG8KgqNGUfbXMFvivuoz+4eLF
	Zj3B6bDyqFCZDXQhqBwYUmKKH0MlQX9S70Pg2ItMQFlLWerKOzzd8g51ImphmvXoSnEBU5JD0S/
	mWTIWPotBx/f9qZ5M5bOed69zfLdvF0vXT3M40m6MAuLZYPmvOd3r7Fm6OOtrliyOv6MKUwND9c
	EUAuEaOEjfXopUED59YZpMdzTiQo7IDuJ48C7E7fXNBUv6WAHoI43q5ZNX2VjhFqk5uSW5LgNvL
	dnFRIoHR6NyAa9z6Nk9LLcuYCeOKZdkI7w/ONBNLPo1rSaDPpz32jJW0Ob7+2IWKUnmhE0t2kRT
	7qJuC5090XE6bUMzPVxxdUVaWUjT5BCvkpxqrZlbd/QaB7O+oyzhp8mn2IigOPO6YRdkkTHLNzJ
	CKmQuYpOEdy+LSBNZbrteU1acbXgMI
X-Received: by 2002:a05:6000:288d:b0:436:1a2e:9f1c with SMTP id ffacd0b85a97d-439942aa2c7mr6219113f8f.19.1772097655070;
        Thu, 26 Feb 2026 01:20:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm36575369f8f.34.2026.02.26.01.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:20:54 -0800 (PST)
Date: Thu, 26 Feb 2026 12:20:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruslan Valiyev <linuxoid@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adc: ad7816: add timeout to busy-wait loop
Message-ID: <aaAQc036akWiJ4uQ@stanley.mountain>
References: <20260226052615.65734-1-linuxoid@gmail.com>
 <aZ_9x4q5BZRJi3ue@smile.fi.intel.com>
 <20260226082535.69503-1-linuxoid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226082535.69503-1-linuxoid@gmail.com>

On Thu, Feb 26, 2026 at 08:25:35AM +0000, Ruslan Valiyev wrote:
> On Thu, Feb 26, 2026 at 05:26:15AM +0000, Andy Shevchenko wrote:
> > Have you able to test this?
> 
> No, I don't have AD7816 hardware, compile-tested only.
> 
> > Have you investigated the code? It was an atomic, now it's sleeping.
> > This is a huge behavioural change. See my first Q.
> 
> You're right, the sleeping change was unnecessary. ad7816_spi_read()
> is only called from ad7816_show_value(), a sysfs show callback, so
> it runs in process context. But for a wait of at most 27 us per the
> datasheet, there's no benefit to sleeping. The atomic variant adds
> the timeout protection while preserving the original busy-wait
> semantics.
> 

So this is only from reading the datasheet and the code?  I had assumed
this was something you experienced yourself in real life.

regards,
dan carpenter

