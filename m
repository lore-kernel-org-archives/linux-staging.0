Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF065672
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 06:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713160966; cv=none; b=GU2s4cyGCRy1xi96wFZ5ao4ebQ0uagAIwQMaZ2C2WEjdPd7tWE3Z2BAoy+HjlNPBrB8vOyn81dmqSrcwnqt6jUmqXQQmmZQ/ETUrUl9fhgALXLOdiIFSVv/2EbCg3jCbstPsSxmcdTlfvVsSjFQUjA3FJXuq6qwKg5O4mFYD12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713160966; c=relaxed/simple;
	bh=9kIdkk7cASoemAnUbv7nOShQL+l/0S9YmpIl5aDhKnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sp2tla0ZMJqf2LQk3hYU/NvokTQ17K8FmIvrBWVdyKsnaYn3gY5EEN1G5LH+Y1bedlXMwoQYhiDUMGMj/WxBsIUB7Ehw6Epqvhnwz+AEANFgywtrHwj7oX6i27PP1ydYdnZa+7o2MXZEBpj7UVqVZyjidkclJ7r/Z0oV6nF1bjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w15QVp9F; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w15QVp9F"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d0162fa1so3362367e87.3
        for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 23:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713160963; x=1713765763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ckDj/bgqCVkgxX+2gSDXoFFTHJGwFqjcNIY+pad7XOU=;
        b=w15QVp9Fbzli53EK0A1m/OzfU8p9oJotSAqSzvufe0prrr7oBG86i7dibdOCGEF0dS
         gmi/j3sS2CzdwP4KSZZwvT1UO6hq94XR/K4+gxUsQV4ZeV5Q9WtoAQVClCYNfKZJaVHD
         DQralGlCiUx+Wxf5R/IG5XMvMKG1ozVfSuTPRixO55jIimuZ2CQNTvl0uCuyOpsCiHn0
         L7toqUJ8Ma43yw063tuzimTRwyWwc29EsXGsxLsKJLpgV3xgdEUwfyjwKXNmxT6UPSWV
         yuVv83aCiyDeRB15hwOeESaRoalEZLKTfxRGJQNTId646NIC+pGNfZ6J8S+LAaPIsES7
         f3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713160963; x=1713765763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckDj/bgqCVkgxX+2gSDXoFFTHJGwFqjcNIY+pad7XOU=;
        b=u5U2wKyjF/1LqqBfQ+x9qVHx3YVS3ORLewp8gjPRuUmVm+caHqhQCOkdrAMle/NTIT
         +Ech2uC7yZ9vYJICq3Sd5lThIe/FdkeFJmMQaTGNQxGOQ7q2+J5A1k/Sxwa4ViUA7oY6
         fFYXziNY0g8TTd9SdsUJESTsnN9Rixt2F54TIoC2zkvFtFsQOtKBaN99AoB8afh69zZl
         S+96DKxFw6xDIZ2uTDzKyYJ/4ACz+DAeIRkoHoO6d1KMUhgbjaSxEhM1s/lMXMQeohwI
         WdBmWGBi+2ynWPGKuAxnHpA+yDggGfPVwkYERvw9SHM+YeyI/zxNlPcYq6OlfxoMB+xh
         24cw==
X-Forwarded-Encrypted: i=1; AJvYcCV2P5NYfscXnE1BUW5sR44/wIqVvJTZdMqPXGqRZjGtSW1YnIYaWLbkxL5qtik51OWl5KUB+BK+laYkV/TcCVEQcnUpbKq6wc4cJzUSXA==
X-Gm-Message-State: AOJu0Yx9JZFwF++R5wopUMc0Qsb1vcMcltfNOa56l5XFQfWOjJFSvbm5
	hPADa61acTusQqu2N5U2hPcT4nxdNhS4GSDkp4AWr/oW1DccjgZeYZ3lOiAqBfg=
X-Google-Smtp-Source: AGHT+IEDMXh7pPyTthpm66a/ouSkP9+4gJ9y2nLrcAgmRpWUaMeddCR+q+i01TRwJpnKFKYuh8gu+Q==
X-Received: by 2002:ac2:4ac8:0:b0:516:d1af:adc1 with SMTP id m8-20020ac24ac8000000b00516d1afadc1mr6400030lfp.9.1713160962907;
        Sun, 14 Apr 2024 23:02:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709064a4a00b00a51bf97e63esm5024500ejv.190.2024.04.14.23.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 23:02:42 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:02:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sumadhura Kalyan <opensourcecond@gmail.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] staging: vc04_services: Re-align function parameters
Message-ID: <bea0a328-a27b-46b2-8893-1943d0404a29@moroto.mountain>
References: <20240414144614.125672-1-opensourcecond@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414144614.125672-1-opensourcecond@gmail.com>

On Sun, Apr 14, 2024 at 08:16:14PM +0530, Sumadhura Kalyan wrote:
> From: sumadhura kalyan <opensourcecond@gmail.com>
        ^^^^^^^^^^^^^^^^
This will mess things up.

> 
> Checkpatch complains that:
> 
> CHECK: Lines should not end with a '('
> +typedef void (*vchiq_mmal_buffer_cb)(
> 
> Re-align the function parameters to make checkpatch happy.
> 
> Signed-off-by: Sumadhura Kalyan <opensourcecond@gmail.com>
> ---
> 
> v1 -> v2: Repharse the subject line.

Need more changelog here.

regards,
dan carpenter

