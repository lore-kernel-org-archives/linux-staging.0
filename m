Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E0205E25
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601312; cv=none; b=XP5hVpf+yVS8larB4j0+FMP4/KRpwWzCdbQ7uM3Ih+X4yiFuq4badgc2RwFFW0pIb7u28a44JXn6XBKM7mYYPBVavNzYdNRrBeOFdv5X41zYPxjuawaIC1NRj/3gpIP/Bn2UEORWZZI/x2FLNCjxBqC04Mb7eo46BLQmkM+PPGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601312; c=relaxed/simple;
	bh=PXNg2izECdZqLH5eteW2kxT1B8Pnh6OxK9bdrd2/Ewg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV8gdvWVjtCA2CB0fLtRVGb+07dek7tE6uC2zff+9JLzI/GHuXPd73NzSSmr9U6FF+9n33mod5PtgBuFujQy1aN+jhXwc1BRevDGKY+yWum3QuEqbuFfeEEbdkKoE+ULFTmU3XprLBMMX+pb7zmv3kzTgxGkUAxGi0lk85f0eB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SFBXl00v; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SFBXl00v"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb5810d39so4498600f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769601309; x=1770206109; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NIZARC7cWLedCY7/Et8vUQyK6E+5feyX/hh/mMWrN5g=;
        b=SFBXl00vHaMD6iJkcbzPlROtr++YzLhcDzeEZK1+MzcBdR2LeLO2WPl5hYLaKt1IJ3
         TW8qVrExQGYosGYRMVkMJQFiwNsethDT0OZ9kybzlQvas3ajNZ6MD+BjgesLnPzRAbl1
         dPYilnquuysuWBhHt5hf/eS0Klur6kQ9BGQsqTM7Bvjsqi2U1/3Cpz2Tp8H53YlU/EsO
         ydy/RYReZXRnaSOQUhhXp1mjgbIfMm8TkSvO794WMdnPMoMJhmeoFTq0LpbZXAOnrxas
         8BX2iQqFhNwUYxJPgJV3bIrlSbD7DGfCfC+9qoGkeXuLoBKlGZ6AFYFHkgXXKIYkjeP9
         6QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769601309; x=1770206109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIZARC7cWLedCY7/Et8vUQyK6E+5feyX/hh/mMWrN5g=;
        b=l79lGNOo1jWlm0gVEH1fKD2sTVIO5kz4/kqvVl7EHtQg8kQDVF7Z7hbsslo0dm9lXI
         JWwRuz1gQdp3+0F7Q1eHVbGG+9RfE+NpxRnhNItTyFIhcJEBAvcqd6+s+LiLsrmad+O6
         7bBxX4F7HtVz1HxeAuhHkRh1MR9+aKEAcWCvFBAajU40d+0mDRPolErf4jwj162NqD5f
         2MEImFEzihfvFTfRSGfjKDbnfvN8kvH/W9OKT+TCBNDD7+H78Ca4fBeRgpabGMVWTQii
         ZLmMV0cwg3yiRx7cwju3zgy8iyITlMDUVIn5qFIhiWvIscBtQn1RE/8iJWLdxpwPccRV
         zAmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPLzxGgRABy6BkbPZysRl3dD6f3laPWeuP0s3hA6C7eTKgiVRXSVL/FU97knH+GjFEVwyKWtTpGk5G/Rv5@lists.linux.dev
X-Gm-Message-State: AOJu0YwM+lTKiUrHQiWoTNN5/sMhPR+y1QfSJoJeyELwTnqZ3Xmn7SWk
	VAzO2oIT3MphvZ3KXkfaI6wGo9/q+h3nVX88bfEeCIqGDRMGYRAZZIqkV6Fj3zePoBY=
X-Gm-Gg: AZuq6aKFCeKmeCqymfGofEhW8FnVNdeluvnBy1E/RYFvpR/GxX79ebhglbcDW/BiCU9
	XFUMlxUCp2KFHuLElMxcHwsL2z/iF6x+USziKLQHUff9xsVVMqUZ7S4HD7IX45NFp4jxIRUBWfA
	DV0CY30lOuLoD7nmK2C6cQmKHI11TmGEUV12bZ/M4R+iosgMTdkQTP3+Au7a2V6BxYKj/t1ulkB
	+qZkllRL9OsSrfSCjPzFDZNHpO2V1Tw7A2BHt2MlQotDWifclAxvZA5YKiLflR+R2blYQDqOvXe
	mS+JyMovC5C1CKR7i7tpp1baMQiNWUwI+30TqILwZGg6b3ZP5s7A5UqcB2pguhCp1JFfRxfq7fd
	AlbZ0x9cqF8VIz5ASk9v9Jwcp+cWfZPnYs4hnuwMCoLH15hjzHetWzmQnb564g1CTi1xYBN8ZmF
	NgEP9TWo4s5WeE71VmchL8Us4hg/4=
X-Received: by 2002:a5d:5c84:0:b0:42f:bc44:1908 with SMTP id ffacd0b85a97d-435dd0514f8mr6071296f8f.6.1769601308968;
        Wed, 28 Jan 2026 03:55:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e474csm6545107f8f.2.2026.01.28.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:55:08 -0800 (PST)
Date: Wed, 28 Jan 2026 14:55:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Madhumitha Sundar <madhuananda18@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: replace magic number with jiffies
 timeout
Message-ID: <aXn5GXXHSZtq66d7@stanley.mountain>
References: <20260127154056.74855-1-madhuananda18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127154056.74855-1-madhuananda18@gmail.com>

On Tue, Jan 27, 2026 at 03:40:56PM +0000, Madhumitha Sundar wrote:
> The hardware wait loop in hw_sm750_de_wait used a hardcoded loop
> counter (0x10000000), which depends on CPU speed and is unreliable.
> 
> Replace the loop counter with a jiffies-based timeout (1 second)
> using time_before(). This ensures consistent delays across architectures.
> 
> Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
> ---

This feels like an AI patch?  AI patches need to be disclosed.

Anyway, we couldn't merge something like this without testing.

regards,
dan carpenter


