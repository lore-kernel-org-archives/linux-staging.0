Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65491822DF
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720024190; cv=none; b=EPDDl22N1g9vqPtC6+ZrtpGbD95OpKBYoc7lGtb56TJVvdBGQH84PoAI5KniTLeK1mlKM9NyiRtsK5oXo86wz5cGYxdNY8rTbv1OMLKdhpXUh7C+EW7ENKe8uTinzB9+KAXvlJcyK4ZqD+Nge6c1Z+7ZsCLp9QuyrMqtx1hOxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720024190; c=relaxed/simple;
	bh=aNIR/KnDS/D87sfRG4FlVLnAx/6qwlwcseVvnzirxcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDBfPdB5F68cH31/NkzTytcvgm2rFOVkcwjp7gf2fWn2rRTPcPQIkEMXCRtgO1oU+kH/jtosRanoEmUTg5P++o8JTaIo7+q1yDeOmqGfWdHho0e44CnhYVcXX/aIU3Jrjit55WlDBZRSqlPMGDOXUEz/azfSVhDUyCM9S9L9mBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jyyg1WZL; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jyyg1WZL"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5c1d2f7ab69so2636346eaf.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Jul 2024 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720024187; x=1720628987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y5O6q9Z7NTtFmEDBkDLtJJ7YaO922XTE0oE8J7a41lQ=;
        b=Jyyg1WZLAjDFybh4ON1JPhEDcK+yr8A0osN58y5KNHd1iC8as75+eQ9J0fk16SInGL
         UpRUGzBqn/pQ2obyzMq0xtUjxQqnEWdvl9FVyt3/6xLOdmECHL85HeL8FBG2xTeyWtcB
         3Nlxnhl9zeJMVM75Ui2Qgkj70xnSLNMwZRtysct9P6hByOZQgJYEh4cp7fqE6cfmYyem
         UjZDoe2SfUNkCkKZLNXqhsOG7gvLITE3DBdcIe9ESa7Zbk+oYhR5mRLOUPm5LOJOh2C9
         Q4hjPMiV1y6m99vJSSuyXllq6mUZ0cNwiWneJQ+UyxaSnQPkcWfqT8mLypqpX95wzVbe
         uxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024187; x=1720628987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5O6q9Z7NTtFmEDBkDLtJJ7YaO922XTE0oE8J7a41lQ=;
        b=mN11glZ0no3C6AaiV/7r0Oh+2kanTxUolzLESswZkQk/4p5sAikhciVszCi38mJ6I0
         esIhrGEx5UnoYR3wZYJvaYdehU2J6rDriVSiR7UJZOvG+5/+cvO2a0jIaA3vOtoAn5Q9
         2p2qbWLLqsIu+AQ5rtQjCkcT/OgPutZhqvHtzgNIYuhU5D6DUzcM1zK5dA8cxPC0RTMf
         AfkHfD5UPf/K0Wz0tMd2m3tBmzkf9Q5qZ0TnwwabjGRthbngMhGlEyuZvjiWLgSgF8EJ
         3dhys/ZaUVa6CiFF1nQqS71qIy0AKyDI3UkUj2l0xF6oEm2bRufmJQS5phQuNn8x3+/+
         vKbA==
X-Forwarded-Encrypted: i=1; AJvYcCVh4m/7mgO7QAB3Ymk62arZ5HQwE5L6Cgz3+G6HUfSzUTq3KQ7DVg18nSSARg+6WsR/leN5966O5W6UHTBbzqDj0jDXUCASOcnJ6yd6yA==
X-Gm-Message-State: AOJu0YyJfJsrcuWQuvXFjdX50OadFgZC2asCd17KegY/Flts6fdZrqTa
	Gc5pM9UhX8cZZmQ6fM1q/RX7wi/Ah1rQYk+blrq5MZFFACbmto3cTxKv/DLD+5M=
X-Google-Smtp-Source: AGHT+IFnI1l9XwT1ZvBLQOIlT5uXSniB7GOrgNmzGE2z+XTz39WZu8FlxPvNO7AijOn9ZpJCHUmshg==
X-Received: by 2002:a4a:5b43:0:b0:5c2:2a09:86fc with SMTP id 006d021491bc7-5c43905bd7fmr13341957eaf.5.1720024186912;
        Wed, 03 Jul 2024 09:29:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f98c:6a49:dd6f:a36d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c414833f9dsm1542775eaf.15.2024.07.03.09.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:29:46 -0700 (PDT)
Date: Wed, 3 Jul 2024 18:29:43 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Datta Shubhrajyoti <shubhrajyoti@ti.com>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] staging: iio: frequency: ad9834: Validate frequency
 parameter value
Message-ID: <59cc60a1-f6d6-4f9f-bc36-6b06315eaee4@suswa.mountain>
References: <20240703104734.12034-1-amishin@t-argos.ru>
 <20240703154506.25584-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703154506.25584-1-amishin@t-argos.ru>

On Wed, Jul 03, 2024 at 06:45:06PM +0300, Aleksandr Mishin wrote:
> In ad9834_write_frequency() clk_get_rate() can return 0. In such case
> ad9834_calc_freqreg() call will lead to division by zero. Checking
> 'if (fout > (clk_freq / 2))' doesn't protect in case of 'fout' is 0.
> ad9834_write_frequency() is called from ad9834_write(), where fout is
> taken from text buffer, which can contain any value.
> 
> Modify parameters checking.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 12b9d5bf76bf ("Staging: IIO: DDS: AD9833 / AD9834 driver")
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
> v1->v2: Check if clk_freq == 0 directly instead of fout == 0
>  as suggested by Dan


Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

