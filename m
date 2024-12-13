Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7817B500
	for <linux-staging@lists.linux.dev>; Fri, 13 Dec 2024 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734073333; cv=none; b=pHDVQ0z4mAgqO4fWKsNLu1Tmo+jkCbnweynwvRIRjOiVa5B+crqzkoCAQikgJFG9Z7KtEO4El9EJ4qxRfHCkCFt5hXZC4TsdThy6wjQoW18IVMWck2nWTYuAjLJzbmI0bJOeE3ed0DYk6Heb0b/psDwIxfEdUn88dpi8ip1iHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734073333; c=relaxed/simple;
	bh=UjhnknRyDJNzYPOotnxU7GzyFJZx+ejiEGfMpctiaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnW3krjRLFkns+Q1SHgFtRo0R6MR9asZsEeEKTZEUR+rxTzhLeGEOyU/Lt2sgkNuSK74drHgKOtm4REgajnlvOIFTtnHkqeMd8MfpskREqOVEiQjeIoI9doUwbAU8hxg6UXRLo74LBGodGGrheJeXWXkxVPInNHkdhgotWg32WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/67jZBu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/67jZBu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso213775766b.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Dec 2024 23:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734073329; x=1734678129; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhAnuKdh/c/FDEIjNH1nfvyxGXfQoHAQpf3lf/9fwIQ=;
        b=q/67jZBuQWWeg41vYzwal6WjOL8k7zQeC/gGesUTZxUfy7H23DVX8Nl8FEzOTAhpx5
         7MCAPLINvY6aAlOwWhRqJWguJHM+Qq6PbV7/35Vcwss4H2mNvWQgx6mjYr1yyiiFIp9A
         gwxNGzlH6PlHsVikpGgEs+c5sSKzH6mslcbPEZaHOdG3bRC9Ow+LlwPJZUQCe/JyY2dx
         XNBiSVjcNW5uDj1bRT2ndwfDQNCwhRDpzP/79YbrrhbmDBRzEui/K3CLAMRRu+fV9cXJ
         YKMbzV7ULiAjAX++hkuOYBRM2z1jsUSNniCVzmSfrEd8a+nVjYcpbkhFrTRct/ofb0IY
         G/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734073329; x=1734678129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhAnuKdh/c/FDEIjNH1nfvyxGXfQoHAQpf3lf/9fwIQ=;
        b=FbdTBJrQ0J+gXZNcwFd0aos2fNWoGlMQcCtM8iDSQmUn2xwB+XxX/cgNwhCu31QR2O
         bxGgLz1m8pURP2uKLZd8xhxMNnTzfyXZUJ/HWEXaYn8A0gpd6UtNJhXySgoWvV7P5eTi
         85Qq0PMFuUeUSv7dkH9fm/t0WsCNz41jkAu6MMaGoPwsoo/XGIBtcSeT86dIwOtZqCFW
         jToEtRqQa5stADrI3MjooUghe+rlGDO213MvivWBDOmjqnFEu5UJgJPeIt7RiDVayL0b
         aJPftlkpnyuXu8ED/ya7L2yzQ4PMy312gqYaVE7kMYIIwerCjtix9LwCJfKKbt6VAeL7
         K0zg==
X-Forwarded-Encrypted: i=1; AJvYcCVHS+edd5boPjp2xzelcpqwUkm6bJkMJdGEUMFoXzpXreFMe1M52W5O2R3S0QPImXWBpY+OTfhigvISyW0P@lists.linux.dev
X-Gm-Message-State: AOJu0Yw62ns8OoqrjbgGoDBMhvTadCqn+Dx5svB1qRgQmsK2hYqUW8tK
	5Ydc8V1qs3dXAwTPoYv7MTo9silNCjhcPXWlKtzVmfbcdFcMhbTY5QjdzVX+EF8=
X-Gm-Gg: ASbGncuxfRxGPgwho1OyfzTO8je1PpfPqs3JCrC02P4olyKVmVwUQAHko4e48lI+FOG
	4s5JQqIV0X+YWnaawQBL4wSF/o40P5++iYrOvHqxQziCs/TW3axsisGKDhpUaGCtEDJP26svJNl
	Yi9573L0bN9ZbvOqKtNfpWdBcxkpN+8IuXwbCiBIKhSQ1IKuChdyOzjEnheFMA7OaNJYsVs+tSo
	QW3FfIdhjeZCBwV4aWRCc5dBsSALOyvGr4TBqA4oohsGAPmaInhJHp+StK3Tg==
X-Google-Smtp-Source: AGHT+IGnFALcx3AK2oJWGNjVHqlmqxe7d7X/VuJSfnDCsCITz+vzufCQ7Qs0N6+tbf4icQ6Bd2wWaA==
X-Received: by 2002:a17:907:720d:b0:aa6:93c4:c685 with SMTP id a640c23a62f3a-aab7799a226mr147669666b.23.1734073329413;
        Thu, 12 Dec 2024 23:02:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68c4b52b8sm640634466b.52.2024.12.12.23.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 23:02:08 -0800 (PST)
Date: Fri, 13 Dec 2024 10:02:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: eisantosh95@gmail.com
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Everest K.C." <everestkc@everestkc.com.np>,
	Kees Bakker <kees@ijzerbout.nl>, Arnd Bergmann <arnd@arndb.de>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Replace semaphore with completion for
 one-time signaling
Message-ID: <675aedb1-b7dd-4565-b028-1a718fe3fb09@stanley.mountain>
References: <20241212162112.13083-1-eisantosh95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212162112.13083-1-eisantosh95@gmail.com>

On Thu, Dec 12, 2024 at 09:51:04PM +0530, eisantosh95@gmail.com wrote:
> From: Santosh Mahto <eisantosh95@gmail.com>
> 
> Replaced 'down_interruptible()' and 'up()' calls
> with 'wait_for_completion_interruptible()' and
> 'complete()' respectively. The completion API
> simplifies the code and adheres to kernel best
> practices for synchronization primitive
> 
> Signed-off-by: Santosh Mahto <eisantosh95@gmail.com>

Looks okay to me.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


