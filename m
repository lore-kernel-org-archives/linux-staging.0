Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD20175D53
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756732111; cv=none; b=QUjOmFc5Mq/cyXsGNPpgctlCcAcZspcW6yqxCMXV3GkaR8yCm9JmI9uf7pOv1C9jhpz9104+DTVhgL78H/FXq6uvR2hdzIAqFN808FR8lg/KFC9OaTm/hjFj4auxlukp0Q8CFIfP4/H0Qhz7xsoz+1UpvaYnSmQqbYflraoN7oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756732111; c=relaxed/simple;
	bh=Gd3KXw1QQlS7MLd0apcsH+QWeJY2pnkwbuUIF6wyLYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgfNdXeL8nm41Qd28dybLbJ1Qw5xAuF4Wmx4UG5LmChX/smvF/BsbDHnU5YPkgA9wiyptNCA4sXlbNWSih7khEJ/Jp22zUgwP1MQHWX/ZN+yuaARtg6j7g7J3cyFb3FKyYSE8oolo2x1/LFGrCQvItqtw9NjleDQ/FjJTpg77oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ax1pe9XW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ax1pe9XW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3d19699240dso1499348f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756732107; x=1757336907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DaBqxA3nVfiucrNs4TUyEScLqswLf3VZ8Gyi43Fij2o=;
        b=ax1pe9XW1PQ5/ShCXUuOF/2ZX2Uw44LOXP21IzEjUudhKMu3+oQL6usKZHyo4isovP
         NjLP15wFrfaIHL2/rcNZjms2oNp/lvjmgf/7fBsqeXi5OnwsnlIwjHsmr1xWwfbvLQJu
         8TNMIk0JYTV6H+rFD42xmwQGkGlhh0v+kbCdDPFlQrNyffOCYDMEpFfoOeqkvkDQY5d/
         8Vxtj3qroaxsEXKfge9ya6a3GF9aVNK2yociR6lHjSaeZZDqZnPcUiQ06M6Up0XCizJF
         liI3HsarcnCCCggDc9f5ABbuq+3/gctw/yMzc+983+k7w5h6zigocM+zZi0A97ZO3ALJ
         UbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732107; x=1757336907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaBqxA3nVfiucrNs4TUyEScLqswLf3VZ8Gyi43Fij2o=;
        b=R/KOwIfh+faSVEkXDz6qM751j/QfavKnlDo3VHyEixtIbyTCmq24OqYS8e+x/mVKYJ
         17g+Pslc52eWcarOo4a7E0HzsKWfhJAo5t/ZrL6/A2soT0Ujpr0++OwpqNaopq4wSVJf
         4Hd63PYd9DzRbaBKKoAI/YIP/mfIa3kmjgXzUUAJB7sX1W0X08yQL9EqejEYgwrLFKA1
         K4ZqjVcgX9FRFv4u44D11L/LUgzcyozTwM65+kn8mYSUw50Fgq7hElkEtpPf3C/DUnlZ
         +DFaGpLh/e0E0XxK5b7cs+xX2irITtKe/jY+4C0d2O1+Uay3ZW4EZXn8JZpOnUeKWSbB
         94qw==
X-Forwarded-Encrypted: i=1; AJvYcCUSHjjI8QQN1imKxyjaDBHvFTcM36l1PA9autmqSmra72sTZRHexOYd31OXl5QFq0b+I7MKdaswT5PAxXbF@lists.linux.dev
X-Gm-Message-State: AOJu0YzvnI4ERiLyWFeEXc39Ps5YQAY5ru/a36BSNpw+9LmDLtuL1Q8r
	qgNQEWI1bT4hXCYoPJDAKzd1o7X+rjKDOi3RsnvRJmFPp8pQXUH2GT6URNGtD4MFmes=
X-Gm-Gg: ASbGncv5xdo4++1bAz/2OK2nTuGoOhNCcuNycYjVKszx4GEtec+SiHrFmOyabIhrINZ
	jXQdBVXX0blOh8wmat4k1qkyohEDL7wY61d3QUF3NncczWJU5ox69mX9JEDokIZR9UvTJG+HVK1
	ATZIO/soNDhQDhrD8F8Kae1RKxVxLEdDg6GBLWF+L3soQdM0VxAXpBYI6RWnvn7JD30pZecP+Aq
	vRzjW4RIRbYwG8tOrz5biofT+2qBAz9kWx4O3z0cSSZ0vQALxVkvvyhYMNGE/H1rPCmMHNAVUk4
	tU471OTKcBPjapdktydx57NxEyEJb1VCfOShjipSBym1BKUXDBIrNP8bnMFzrGLa9Oq1dw4JfLs
	/pO78uZkYJw4Ah4sMzoGp4xXUI17Z/gNu7EPTbg==
X-Google-Smtp-Source: AGHT+IHoO22NHnLmGCEAuykdmrXfYz5c61cYkp/gae0iHULEguoVzXfknO0ldVQ3ZbksBt1rycB8NA==
X-Received: by 2002:a05:6000:26d3:b0:3c8:2667:4e25 with SMTP id ffacd0b85a97d-3d1b26d6cd7mr7464741f8f.31.1756732106826;
        Mon, 01 Sep 2025 06:08:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf33add294sm16137899f8f.29.2025.09.01.06.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:08:26 -0700 (PDT)
Date: Mon, 1 Sep 2025 16:08:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: add mutex to serialize
 SPI/GPIO operations
Message-ID: <aLWaxoBLEVWlfzN7@stanley.mountain>
References: <20250901065445.8787-1-moahmmad.hosseinii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901065445.8787-1-moahmmad.hosseinii@gmail.com>

On Mon, Sep 01, 2025 at 10:24:45AM +0330, Mohammad Amin Hosseini wrote:
> @@ -200,7 +204,9 @@ static ssize_t ad7816_store_channel(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> +	mutex_lock(&chip->io_lock);
>  	chip->channel_id = data;
> +	mutex_unlock(&chip->io_lock);
>  
>  	return len;
>  }

Unrelated, but what is the point of setting chip->channel_id to
AD7816_CS_MASK?  The only time where that is used is in
ad7816_spi_read() when we do:

	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));

So it's something in the hardware spec, I guess, but it isn't
documented.

regards,
dan carpenter
