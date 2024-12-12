Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4021632F2
	for <linux-staging@lists.linux.dev>; Thu, 12 Dec 2024 05:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733982157; cv=none; b=WQh3p1WL2bU1a7UDMNQQv4yFTD8NhTQI9c9jtLB2re9mQmsEJ4prh74fm5pCxW9OKNeblSRI6v2Whsp3NRPzTnYX6ltLBgc3WzLdEBRtvn2OB0jxgrmyAUO8F6iX3WxwfIn9I2KTi1wiaXzQMDluHrtnxAvYIgNl2h4Cn7blpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733982157; c=relaxed/simple;
	bh=gcWZF19+DRzGzwl8aVWSk1HUkyqc588yBy6aNF+LLvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxGURh8zOwnNb6/oHJ0WPYS7GKLF53wbhOpKPw0ktSqdhXM1pJAmr7V/ws1T0fSy445EQHQ5FAgoiu/zBMHdHtMyDruAYjn7GcU/zOw2GFyLhmeTA9iX0tRCal6/LBW6iiRevvudPnC0toK4XDtb7WX5BmKzwPRGqxW3qTCX65M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkbU87Pw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkbU87Pw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434ab938e37so1151515e9.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 21:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733982153; x=1734586953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSoY8FmmkeLy1cIzhiayaqEXOMLeH2MO/C02Ui4iNR8=;
        b=JkbU87PwAGOywsFPNWITjeNG+spfNZyBloZF425vi+BrrBvFvUj/JHhM41Mgs3p0Xp
         amOne1Ixlig0NnufOfSu9UVtasMRDowli5xH61a69b8AnyV6S9S2O55uUzhEgiXz5K28
         IGJlAyTSU8Z5Swi/Cw/gMX/F6JrpsPIRKFSHh40Iz5VG6hfQ4r0lx7EsrF/hQwrjTFLq
         309SJTuWVlcjr1aRKjuCLqUyRAAxUq94w1oOwnaWYM4WPjJ7eS77e0vvjX4qI+6CbuoI
         btMkxsTPtHH3ui8Km91s7oxjO/kVT6CIpoJ2YoJttdrCslC1EqEuHR9ljKeykjMdCyyz
         a19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733982153; x=1734586953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSoY8FmmkeLy1cIzhiayaqEXOMLeH2MO/C02Ui4iNR8=;
        b=r2jO27Kud41EwxV6hnD4nLBoCcE6q+2u2jsjEanapJSC6v9YLBU8wmUYcSQkvF9KCh
         OBP9aY/jVeP35VsALURWj7jgXNTXg/EeoRIlRNw4ma4FTxKEsZryR58/hpxxnHNuU0Xm
         KC6A7RSVp38X59460122CI9pRj/z7HkVuAgSMGg2ObB2tP48/K9q3hjAKOOytf8aH0UF
         +s/YYm/Z7aN48bPHM/dq2KUXHP/xdv+pGbPU4E6kbsrdy1zNwQhudSNZ3ehyyhrIQPwL
         oqvVA+zGnlNiQwm0GqBIQbcFk3/iVDR0PD6A+5JODpRiStTGsk93tHSSh/aXG72UwVfr
         TJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCX8nN7DJ2MPJCb5gMXn+5uZWImZ5CZrw/n8TEmYoKCIU4xvAJGuTmriGc/CUo7No0HkrMVnJSiLx5ApyGay@lists.linux.dev
X-Gm-Message-State: AOJu0YxJjqiFM2aNOm6Juw5FBdjiYXqSjghGx5asYQCJEeZ13PpPxc2X
	rM19IQRF57FknM+hOKTvhlX00XuJiB3CpI8hBLgaZShdm3/b71XeIvEqj1ytcDQ=
X-Gm-Gg: ASbGncvPNBQNHYGsxMHFQ27arxCMajl0Y+/X0E3G+qHWrNyJiZg2q/EhZklcIe0eOdB
	iUHkQ31Pm6nbov2QS8hLfxMY3TYeXsUQk1OolZFKLX2lKlFOaMylrBwdQ/pJkP1mD3b5xbkgab9
	wDoCBbeh9ItGvBTiL0cVN8HXfBKtSm5ID53K4Es27TKM4K1HL1JB/UkCIfBxv0wN2EWwGy3l9tf
	2MYaTVJzOTAc2tpTxYBO7oqW4rl7fupCQHJkZ9IW6NulNRqqd/Qdd5ZbMA6Pg==
X-Google-Smtp-Source: AGHT+IHrSg7hk/G4icQhSNLkWSliDmfnvtcZ0Hc/oR6N1zAGQ9eaOtiBf/S4QxnV0x+Y88vzskH6Iw==
X-Received: by 2002:a5d:6c6a:0:b0:385:fc97:9c71 with SMTP id ffacd0b85a97d-3864ce895a8mr3702933f8f.12.1733982152823;
        Wed, 11 Dec 2024 21:42:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550555sm5552355e9.5.2024.12.11.21.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 21:42:32 -0800 (PST)
Date: Thu, 12 Dec 2024 08:42:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] staging: rtl8723bs: remove code depending on cflag
Message-ID: <2eba9c05-4efc-4060-8cdf-26f701ba9794@stanley.mountain>
References: <20241211233415.37702-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211233415.37702-1-rodrigo.gobbi.7@gmail.com>

On Wed, Dec 11, 2024 at 08:26:38PM -0300, Rodrigo Gobbi wrote:
> The proposal is to remove the code isolated with DBG_RX_SIGNAL_DISPLAY_RAW_DATA and
> all the related code since it was not compiling and there is no information about it's usage.
> 
> v5 is just joining 2th and 3th patches from v4.
> Tks again and regards.
> ---
> Changelog
> v4: https://lore.kernel.org/linux-staging/20241210210741.17101-1-rodrigo.gobbi.7@gmail.com/
> v3: https://lore.kernel.org/linux-staging/20241206230110.11893-1-rodrigo.gobbi.7@gmail.com/
> v2: https://lore.kernel.org/lkml/20241125225308.8702-1-rodrigo.gobbi.7@gmail.com/t/#mf22f30a9c689bd793988d7e7a58c0b119206116c
> v1: https://lore.kernel.org/linux-staging/2024112500-authentic-primarily-b5da@gregkh/T/#mea4fba3775a1015f345dfe322854c55db0cddf43

Perfect.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

