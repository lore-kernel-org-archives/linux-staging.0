Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C713D50C
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728822085; cv=none; b=mB+uOA+MiyKELvgAQDIWGygE28Es2QdGcD+JGSLozqUGEQTELaYUJu9yPWnccuxgsO7JUW7dL1H620zLXNbvvQ2ttmvlJ5UnN6p4l8o6ihNVDri97vXyUKnXApqHS1LsrCGFW+wJJNjX8QO1peDX9VJCmEQtNwQmKO3GdVKfxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728822085; c=relaxed/simple;
	bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx5jiYRleGp5yGkdO9OPzj0en88xTd2s9axlqgac3sJpq3BFVw3BbG+Y21Wwpf/O6mo8ZMgiHeOdtwnLwHdypf/HjDGqlm8wuyskmp+xhTg/jwISaDIudbtv4HSP+Ng9C4tJgEYSl2J6MRHp5bJknmadkGQADWg8v1ESGBbkipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8f8JsNr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8f8JsNr"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c94dd7e1c0so2823772a12.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728822082; x=1729426882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
        b=L8f8JsNrF5cixSYkvAd9OTTQw0dzJ1gf6RcUer4CKC3F1PdKUDdBtZ7n25J8chQkYf
         +zzzTeQqCsR3jgx2CitBbPQQjmyFSxLyGGyJFkGeRvQbW42MlCOSxuaWDJ5Qugk5oeg7
         K/YckevTDpvJwiVYY6S0u0cexiSH/NUOGKldQoPW/uHUQbyDUgPlwgB28GCGKZRneCfb
         ANHP+h1mPaJS1YxFMGnTP1AB+ACguoYO1KS5Hw/RD5+1iFaVd/PWdA6/6M+9eI1QFsF8
         3dhi/yoiAmioWEjScIcjai/qIncTHBCM6GW0NvEDRwB0jaI/aVYV7+biyfDv8erC9bL5
         5fYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728822082; x=1729426882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+75GZfgqCTSngT1o86/FOgcbVTQ54B8Ve4TR4ZuSP0=;
        b=p6hzA5S2CKOhq6XzttpSPE+mjKmjPaNRHyU3A8++z369dHCo0knQsbCUOi+gw6Y4sD
         yYSf5saqciP6udOkqejVjBzSmAz7J+K4ZwJME+Zbw4x6Q12RUnSfie77wlfPAcO86tUt
         S1P2Efo+TolgwcpexGzJWsc9cf7bcv1Zqme6Y9B3jTSQb2LK/a5GR9guD4FyP2SIujz4
         sSGGEkeMHBQBgJOylRtKFOn+4vl3YySmAIpCVdgYav9yP9ekO9o70Zg6bYfwe4+yhvf2
         jo075DZMgLEAzAXj4szPf8ZXIpBO/lWeCsFNt9IWZAD22Sj+lxbWWNjvnlLC26nn6tE9
         axQg==
X-Forwarded-Encrypted: i=1; AJvYcCUhLECG7ugP9s82g+t2BbUkF6svNzSpvzFjNf40zNxnxuGCoPjYq1I4vjivnaP14C+TGQVPkibkKRsuSarG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3zOpWCtQSc4hT8zQ2MUcR5Ij948rRHBhQG7n38HFDenIDYLsF
	II3ZzNdf34B3J1CPdKUwdsZz48sc6qD8xQucyebOsJrpwNX7JjAKoMs9FmKs81c=
X-Google-Smtp-Source: AGHT+IHwnAL9xXNdFniy9d7/1k/UksIia33BwEpaaf5KGVD17AwvwJ1zNUNytvvKW5zXwkRvyM6o3A==
X-Received: by 2002:a17:907:3da3:b0:a99:742c:5b5 with SMTP id a640c23a62f3a-a99e3b20d4amr575334866b.13.1728822082533;
        Sun, 13 Oct 2024 05:21:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0e80050bsm7152066b.185.2024.10.13.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 05:21:22 -0700 (PDT)
Date: Sun, 13 Oct 2024 15:21:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v4 0/6] staging: vchiq: Lower indentation at various
Message-ID: <fcc69d9a-ebcf-4d74-affb-b08f07b7b081@stanley.mountain>
References: <20241013112128.397249-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013112128.397249-1-umang.jain@ideasonboard.com>

LGTM.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

