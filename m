Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE33081A9
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722302; cv=none; b=JsdooPZNHzDXCwWXfeC2WVVuPZ/deX1FkKNO80w8bzis/ZESNgGpDTioIkRj8sIyzbKS1fZ++puWtuxK63PisJdl/5G2pqD7tR9lKRVdK/JRIlI6Iwwk7KxoUP/Lk5qoGkXBLABhKt31HtDASr6s3VaVvcc6RQ6MT8ZwuDw1k/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722302; c=relaxed/simple;
	bh=3G7Ld1qpychcmtTgTNSsdZQiAfnbhqLqy04YO6fvdYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKZ542T1I64oMTHwfthAtLW+rlDk8sG+HheRTTaS/K3p9/x0AJfFuH/OB1FD0ZZS4HfdLDEUvvVcgr+kIueuSPSZ8AW6oghvcn4XQCD+rvcF5KYVojxQ4V7smoBSRE/BVJcQ7nX+dWE/DTYByHMFEZoaSHfqCkTwroASgD8x+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKllEnRJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKllEnRJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3cf48ec9fa4so2061958f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756722299; x=1757327099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3G7Ld1qpychcmtTgTNSsdZQiAfnbhqLqy04YO6fvdYc=;
        b=xKllEnRJj6jJMQNas0Of2RiSfAMNWRq0Estq8br6cnyaZCV3Hd/Y7Tfg6EPZnZXuGI
         MXfnr8pFgH2pDWwEYdNFcRLwcw4rQMH9JEBKHD930Nmm6HLBbCpG/WeRNvQqTDJLq+NH
         98n31vpKicK+cDIqPSiFaExGIVMeJwWlvccxelDkSz/OfMB24m3/HYXS48qkvJltvC3N
         64qVWf2n1Mmbquj+2nM8dbJ5fr/CmM/R3YJRLPc1lqZ5oe4GC293gkmPgZA4LPsxIoUy
         MuzU/JyrsL2uOD9ReBmGA2bt2qwEZ5P0Nlf0csfr4+RAFuX9wy2neRHCzb8iSZSps+gi
         ThEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722299; x=1757327099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3G7Ld1qpychcmtTgTNSsdZQiAfnbhqLqy04YO6fvdYc=;
        b=Co6GSIWrX6+KHvHAPqCOXcLd++qzmE7Bwv3bD0RxI0Y2I743cimZO4npf+QKB0Dpid
         Sg4rlubwNzrzc6LFcGYF3qAGROpzhxyn1oAPwak2KCTmBNRpN5qb17Tjv+k9ea/kk7Z6
         Z5nLno/LW2FgCVKu34ghc1T1V/FVeTrF0kRoR+Jwx7zofLmCwlN6KcvvoxyxhRnFnWQC
         aApS+zia+Pc668gvNvxqoLXmSZylwKlW64EsWOSECapnLXFYOMnDgWc1CkAeV9OkiXee
         MpjGseAuS/U7G1i3kxpGIje63XAgheAH3KGnFLa3NY0q/Pafn2cM1/wwttoRy3yo1CVm
         iFog==
X-Forwarded-Encrypted: i=1; AJvYcCWrlL06A6GZ6ArMjk3Ar6GxZuUIZphDg15TPGbb/JFKSGC/zhTpjB9iustONC3SLkyVdvf2Tw+dGwP/bJds@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc3bnbK5RhAPWdBBmwuw0Z47yOvJxAEaBrq9y2xZpH+eziH/z9
	uV1QimGvv1qdvC9pw04Hk4rbDfrZSLiVKfbmn+6vJiXfwm9+J8JJ5IR03OHu3mSrrqs=
X-Gm-Gg: ASbGncvXfJfrhcqYUt81Vf0eM7rBdaDHO7AYL5k8gFn1jR5OvGt793YCpDnIBEi0JKK
	exROWzJuBvBTvH47XFdVuNFao73GTsvM8CfD4llF45ZvJCgTZIaV6CUjzK2KPhzI0Ho8MTm2Mdb
	4yIAjrX+D8sXA8GxtmgW5EKlC8Trp89/CWMrbfjEfBcs608XKVikNG0WlqenzFW06fGIPhshHm6
	UjwgrXUzXFfUC0BYTnihLHmpcdFgFS0OTbLdAhRLg89CeIxMOIi/OrP/wM893M1D8fdwtKVEgJ5
	FT/t9Gir90bBKUJ0FoV62bf3zWMQaUYd7Y2Vk/TzEX7FQX7UYxswptUydX7UoIei+NOgbonQShb
	qLhQ4zrnoAevPuEALIDGAIsJxCa8U02PcqOBayg==
X-Google-Smtp-Source: AGHT+IEec6vgPDcCrTDqOTyHepBVzBKIfJKmIoOvk/faBhoaRvzUBEt6+Jlp+ejld3jTxV+5QEbZEg==
X-Received: by 2002:a05:6000:1ace:b0:3c4:497f:ecd0 with SMTP id ffacd0b85a97d-3d1de4ba70dmr4550881f8f.31.1756722299510;
        Mon, 01 Sep 2025 03:24:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf275d2717sm14784721f8f.15.2025.09.01.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:24:58 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:24:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Subject: Re: [PATCH v3] staging: iio: adc: ad7816: add mutex to serialize
 SPI/GPIO operations
Message-ID: <aLV0d9sLbVRZdozH@stanley.mountain>
References: <20250901073750.22687-1-moahmmad.hosseinii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901073750.22687-1-moahmmad.hosseinii@gmail.com>

Please wait a day between resends to allow everyone to review the patch.
Same comments apply as to v2.

regards,
dan carpenter

