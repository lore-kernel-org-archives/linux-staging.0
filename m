Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E22BE62B
	for <linux-staging@lists.linux.dev>; Fri, 15 Aug 2025 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755288251; cv=none; b=RVmU3mLou/jBmWEd2d6tV7gA2zTzzH5RHkqgUl5e6Y1FMItvXHye+9+9Q/60Y5S+0bJLhCKWfGF5C/x+0JjMcd2xqoVb3IxaJ6J/9tUi+bakM9IanymilDvg8TaygdkuGaA5M+qZ+a+iNGELQC0y45nQrnHQbwpRrSZO+Q9I8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755288251; c=relaxed/simple;
	bh=AYbiIeF6iptLsGoDj6CX8UYKKLMHp5WQuDxStj51bMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlpMle7Aj+h4BDmaUMuYeF09WMkFOXcG3Da0r2PSK6ol/RZzWbLLRp4dINxeR0YYLY4maTIfZj3clmQNhSYvlPvgbwFhtrY9fBH+xdxZ+RXU+mCUNVgkZa84vM+DHg/Cxj6C6kHNtOt7/Ys4DT8gw+NHupYuTxiFliUHqqXH/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZGURZgY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZGURZgY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso2064890f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 15 Aug 2025 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755288248; x=1755893048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dVp3c/mL+kWmyAxnHEJ2Rjfw36Df5+7d/WFZD+6RK8=;
        b=sZGURZgYbyAQZct7MFmOb9USZnABZEsmVuDXi9u9Owsl6lzMXOIL+071DFcExVJZIn
         OPX4gyH7hDSk17mM5zQXvwZM9XixRbOmHG0Z2BdsubzazEGSCKGI7Cotdx7yABl0OAOb
         GUkmqwP5pAAI+JzG3IxVGjFhggB62apeuYi19aLR8o8ZkI5E6E2wovYt7TBKB43pbAni
         Q8+DyOoRCUYswNUy3mPtWl9UT0VC11VZ0yGTNEkHjig1wgaO/7uwbgSXLh8wy836U3QZ
         GdzlHRE7wgBNa65/G/mg9PVJLdzwSwi2hwCkiTqFjDLR6g516Ul7xo7DIYwfRJspNFUG
         rAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288248; x=1755893048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dVp3c/mL+kWmyAxnHEJ2Rjfw36Df5+7d/WFZD+6RK8=;
        b=GJo+Tqd395Z/gc4DtznxkiToQ7MOEv+ei4Mxx6HfaBLbi/87JzkkREfZ1AdCgFDxAY
         ZrWxCTm68OCz23D6SltT74kADQ9uG/tMBnnb2IHQMg5Qx/yE7hF1RKMLZAXfRmLa+Zg5
         ymzea5Ohb3g/I8x/6h7DslnLaK60dpNPaHhPlv7aykaqsW1Z2cJ57+gVQHwR+HT+VMkt
         qT0IOxwsHz2GfKfjoK9vHU/RJqIZu3NBVXxIF/ybZvaEsXiuEAQbBYohS1Qi3KJJdVEM
         DN9u97D4g61MAo8qe75j62Wzg7wBFweKg2k3n7m9KdCN607UjiWAJSu3orb2I19Ex8Vn
         awlA==
X-Forwarded-Encrypted: i=1; AJvYcCVXJiLoRuTDV1A+5uyOWPTjqTPqphFiZi9P6dT7ETD0g0pPFxOOTwquU5ynWMb37uzX0DRdDO7UIBuqvWHs@lists.linux.dev
X-Gm-Message-State: AOJu0YyyH3UP6hN5L4VADgoz+nSH1UDSGJ5BxX7u5r3jAeG4MB81ODlc
	pvpTiCdlfv/IwEkSyPPT6PX5uOUUq+XO6LkEhRSSJbAmrhxQ03ET9K1mB94UsOlUw6Y=
X-Gm-Gg: ASbGncv280RFOyRQhM76FTswtNMkiHf8Znb0iFV8rCkMCb4OhtOhLYxoTn9wEXHvH1h
	8cZ1LBRtqpQmA2T078zF5XAdshQO42B+MJLB5Hwann5rCbfRfBiKBgeXoaEE24lzpc3KyaK5XjQ
	Im2oDmv9ERyjF+yr3eYcCHNopOZPIO9uqvL0WhLZYAiLcvLj87LNIUtMZWwCOYKjuY7uGhav4y9
	kiaJEI7ZwAvaL/YuWwaqvF7LAkzsFUCKzICYO/RewOUKGtxj6J+fLbUsmsR8cZx+xbMAK8//GSC
	/yDeY9Ihv1whbi8k2c36i7OFJDGCUAgzS+O+5slB1sjrLOC+8jmNOno7H8FdNdkMGvVhObH8qKK
	K/UT5MqfJdNmED20OuqjmP+h7Bkk=
X-Google-Smtp-Source: AGHT+IFeT3WqPGdZuR7vMkj7YvcRJntIuG00A/c4v4eSx+o5nUwQFOtRCUjiC2QXYMDK3VHtd0TfNQ==
X-Received: by 2002:a5d:5f91:0:b0:3b7:8146:4642 with SMTP id ffacd0b85a97d-3bb670ffc24mr2519110f8f.20.1755288248212;
        Fri, 15 Aug 2025 13:04:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb680798dcsm3060951f8f.54.2025.08.15.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:04:07 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:04:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] media: atomisp: Add lock asserts for mutex protection
Message-ID: <aJ-StLSBnHmHHGUX@stanley.mountain>
References: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>

On Fri, Aug 15, 2025 at 09:24:11PM +0300, Abdelrahman Fekry wrote:
> Add lockdep_assert_held(&isp->mutex) to critical functions accessing
> shared device state. This enforces proper locking and detects violations.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> 
> ---
> v2:
> - Fix Typos
> - tested by building the driver
> 
> v1: https://lore.kernel.org/all/20250815170901.32105-1-abdelrahmanfekry375@gmail.com/

Same comments.  Best to wait a day between resends.

regards,
dan carpenter

