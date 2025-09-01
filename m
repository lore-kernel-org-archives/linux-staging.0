Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF624DCF9
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756731436; cv=none; b=rjf50BIS9gNs3zo/2MdhXns5/+egBrxEqI1jlWywGUx7S4yzdWvzmy2qJzlA05G/jnkkxwwaOxwV0KaWPI3YvWe2pLtZuoHeGVDI4iahlWRl3RippjGE/Jh0JBap2WVVRoCL23zncEkUZk3RIcqzTbUk3S9zbM/Uovcy4jNC3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756731436; c=relaxed/simple;
	bh=LA2Cde+xwNLHGVNxK+nOoJLLEK4E0j9VLsGVDb7DoCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDDQk6CCCt8htTGXTnj4RqxtgSI2F3B55lQr5JOwE+neKw4TxCJ1vaBQFoC+g3e1NS7+3NsOXZGqSzwBAhp+VH3OzZC3lOA876AuxBRtoI+Y3BDWSbpq2/jIdmW8Kr+sCoGYwfpldUkg2690LPArpKbI4HLBzrc3w6f9aSd04fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wiHZhLz3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wiHZhLz3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ce47d1f1f8so2905388f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731433; x=1757336233; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6CcZZgmXTEgXi67UOd8flewdG478TxsuC7DDhDV9EhI=;
        b=wiHZhLz358prIerLF1RByodw79saXo0/9iDa6CtTpGRjgQnKW8G928OPl4uJob5rRB
         NRrkUvmL/BkrEKqwliUysykX0G969gC74Fkx1BWazZlP2gaijoeaW6kCXZry2zziQseA
         YaEAqxuQW7xJf1Mc46mN0Ky19xRCLI9FkfJ44QhN8YxfkocB9L4WeKHYuEcKCr3ZBlSB
         ixbglRMpjt0PqU1rYBJeRugbFneikxcYY7zVyW45p1jHPOWj1i5JXS3Bud9z0KUW/ODB
         ww/OTx7NdzudJUxsM63D8Vm4Ppn9TniCMjvBZeoZ2QwbK2EI7BKnDXaZntpjX9XIxtfj
         jvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731433; x=1757336233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CcZZgmXTEgXi67UOd8flewdG478TxsuC7DDhDV9EhI=;
        b=Mkb7UclOPu4dZZtTl6rxsvr/QzdJWEmneW4hP5l84oAizXTC0UojCgO9Fb+gUW/6Qi
         eE42lgRDhrz6N6vhDoGhCAMUmpTaMnkfsufdJD3N0hku39hxM2rCUV9pa3bHy90AEBD+
         /OkV0EL8IBFSH+yi8Tt7ZHkxIc19agTPsUh2EFR+K8zluerSssUi3agskydXMOQZ2FM0
         F+sE4o6GJqiLXqCARvNTsKgiN/KtiOpXGn4kWg3XAPshKng6yAf406RJiTElaxDQgldu
         H/Vu0fD4zlle0nqywQqQEgzQjFqjaHZvUePHREcjNJow257krFFUkat/5AEHh6J8y2bW
         qNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvpm50x5yVKXTPgOdhO2zOr52oqMlU3EiH2FopPm31ciuU7ngGJYuyK1swaML7cY2C7TqT0npwoqK/nK2Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9FXdJRxWxI6VPJABdyg58+HYVJUKzuM/w/I20IvjRyquWeait
	eCS6PLumTFhlo6L1VWJjiBMQmQMko6E5Ok+77RceH2uNRmTxjVrGo2pjO86Sfb8wLjM=
X-Gm-Gg: ASbGncsvD1shnPZcmFV3RRLhHOQHz2bgDzUst53pxttTY+FED1JkUJsuAuA7T7rNZBO
	TU/73BvQEMpjtv37H6N+ssvV4HsZ6rQHpvAoqRSnyC51YriIoNYolkQpYP7VzwPebmf28ua8SeN
	BppUMDoFzyhZcML1t1lyHop0Jsl2kLXq0wIq6Q59ecr0tf1O1u5aSwmrc8c0Xu65q1zMni6r5C/
	FKLRdaxpKWth4UnhAWRBGjdMWTOEeNPCmgErKKDDqCz5o5Wbpsfn9VYnZxAl2gSn9Qj8EKOTT3j
	u0I9WQHJE2eVd+XEj+slMTJhngVuk5oyRSoFqAEb/zb04AQbGH3zBO5gUv17kb0FRiPz6SRrBW5
	pxq5sxFlh3BB+/XwSIMEhFHFq72c/NczAEbu9LQ==
X-Google-Smtp-Source: AGHT+IFGr7/8/ZT9kzcrMvxG5Dy4K+Li2LIxqb9UOtAyrwkmZc8eBIyFR7BB1vat/tRDTqmJKwd0jQ==
X-Received: by 2002:a05:6000:4013:b0:3b7:94a2:87e8 with SMTP id ffacd0b85a97d-3d1dcb75006mr6117687f8f.18.1756731432991;
        Mon, 01 Sep 2025 05:57:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b87b38fcfsm51362895e9.0.2025.09.01.05.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:57:12 -0700 (PDT)
Date: Mon, 1 Sep 2025 15:57:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Subject: Re: [PATCH v2] staging: iio: adc: ad7816: add mutex to serialize
 SPI/GPIO operations
Message-ID: <aLWYJKSDjNajmAlh@stanley.mountain>
References: <20250901065445.8787-1-moahmmad.hosseinii@gmail.com>
 <aLV0LBxD0KIHPSmo@stanley.mountain>
 <aLWULUIcYEz3N-Rx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLWULUIcYEz3N-Rx@smile.fi.intel.com>

On Mon, Sep 01, 2025 at 03:40:13PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 01, 2025 at 01:23:40PM +0300, Dan Carpenter wrote:
> > On Mon, Sep 01, 2025 at 10:24:45AM +0330, Mohammad Amin Hosseini wrote:
> > > From: mohammad amin hosseini <moahmmad.hosseinii@gmail.com>
> > > 
> > > The ad7816 driver was accessing SPI and GPIO lines without
> > > synchronization, which could lead to race conditions when accessed
> > > concurrently from multiple contexts. This might result in corrupted
> > > readings or inconsistent GPIO states.
> > > 
> > > Introduce an io_lock mutex in the driver structure to serialize:
> > > - SPI transactions in ad7816_spi_read() and ad7816_spi_write()
> > > - GPIO pin toggling sequences
> > > - Updates to device state via sysfs store functions (mode, channel, oti)
> > > 
> > > The mutex ensures proper mutual exclusion and prevents race
> > > conditions under concurrent access.
> 
> ...
> 
> > > +	mutex_lock(&chip->io_lock);
> > >  	chip->channel_id = data;
> > > +	mutex_unlock(&chip->io_lock);
> 
> > > +	mutex_lock(&chip->io_lock);
> > >  	chip->oti_data[chip->channel_id] = data;
> > > +	mutex_unlock(&chip->io_lock);
> 
> > I'm not really knowledgeable to review the others, if they are
> > required or how the locking is supposed to work.  But these aren't
> > correct because we're only locking around the writers and not the
> > readers so it could still race.
> 
> Readers are in spi_write(), or what do you imply by this comment?
> I.o.w. I do not see the issue with the idea of locking and how it's
> done (I haven't checked all of the details, though).

Sorry, I meant we don't have locking in ad7816_show_oti(), for example.

regards,
dan carpenter
