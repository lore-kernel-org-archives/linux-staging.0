Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68C27EFE3
	for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 05:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764223105; cv=none; b=tFrXXARKD9UyLaxoa5oUK0tcL6wXLeQ/JzybUEwSezgBhisaR0q2JasdTojbas6I01ktTvX8t85RAKiVZBmBGVaPSvzUTqXZh4SypdBE308LfIMvIABcy30EJ2Ua3TzFs5qnQOvDWf432mK+hAtut1W7YnDchCznYKQ8kUJloYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764223105; c=relaxed/simple;
	bh=7LVpe30vJ5eoFT90oqQVushjmVLn8Y3eCutASgYrWgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4opbLpDGBleKM9XLkfpM0+bM6YP2LLtHCpWILVaPqjibrIeJ3oavZoFHlXSMMRFtWBchn4N8mP75EFrTy+pjG7tQQNhg9JcmgZQgnquZG5syAGXUvGH977wxJ1O1Y5nUbYAGw0DQnJbKpvfkeZaYrA+N/QcE3wgE6XwoWo4g/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sihKc9ZM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sihKc9ZM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so2585585e9.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 21:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764223102; x=1764827902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpZ+31QXeywScZ1oMMavLBCGYpwbi/j08FH/25KvCIg=;
        b=sihKc9ZMDBZ1DDL+i+D8p5XnhFMjldPSleeFJQfpm7bf3JLPrpCTcbQLhEm4/Z2lpO
         gfPSZvhS4YRAbLp/9I0hs7w5c3fT6KUemyFbdppL3Fk2jW7TpdN7sk9PoakmaYdPBIWk
         XnF0hSmC1CiwNZUBbtrhmyhUDTJRO1DjJN02t2FwX8h796QtjuD5TSR3qs0H1UMgmrej
         rjPE03mnkkMMkZejg09/RHiXgDrWk4tW6Xca5WtwcpTGqQB8JngYLgVDnK9HsKxCjW6w
         aWnHxZ7Fk0tD7Sk2MM7FY5tPJar+OkEuC0pZ7eYcUaaMISljWsonLLmvlJvOsH7gb3ok
         WN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764223102; x=1764827902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpZ+31QXeywScZ1oMMavLBCGYpwbi/j08FH/25KvCIg=;
        b=X4xcqGKy5SrU5Nk7Nlz/CNI9OOEAXA2DdEhQXUl0NifDMAnWDagmRS49jSeD/DtP9x
         5q93t/22d5dFuEHlIyxwpZ2Dz23DZfx2tiM8sFJfbIsX1FGC66qaQ66MkGayNSkOpE78
         e8Rgo24zc7CjD6l1OjBElg1+m85sN1nBWa3l1dNRqFidKuNmwN23fHdcm3j2MbTuuSZc
         HdDjHlFkj9yqWf0q4clJquuFWk0/bKWzt6XioPiWFVoc3ZcpX+BCRhoKi7ddfyyLvfxY
         0uZwqE1u3XLCmJrZJqwhXMeNepau7eVNEkP31jc7+AGPBXb8MwakHHjEQp4uc11ltioG
         pVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnhz99USGLkWrEVpg/vMTDIXVBOl1OPSUTkLg1MppcFo/2mbky0etbTSJMHOaEndN3SwC35vQnOtdjzY61@lists.linux.dev
X-Gm-Message-State: AOJu0YxUQC6Chj8SyYIvGOJtwxnUpB/TBBzeeDv58/71aqFS5T1D+6i4
	j5BMGJuQiWeCD/T3+LIoXkcYWSxpH0WAF1bKjv84vmbVjMMqSkIK+b6+mcl4WFDlq+0=
X-Gm-Gg: ASbGncud33abNn5QZoU3Qj14JAePMMyM+CKkqPoIUcnA+Pii+gAH/uOJa4JYMBpjTtN
	zmrwoK7bHLXngub++yQzW4olzUx0pAluIxxAngzASHTPbH/Q9LEPy0V+yaJocDFM259UlJhilYL
	NedhUeooZh95+yL/YVxSzh9Rg12aXf42CdTRrOcpiYLAUaW3WYfNOgJQHclFiFyaQVvuO1yurRj
	hTCgp86rW9TgEr/Z17tKTNGa1kwV/YrRJsvfW/EeIPRDYzw/VwjQN2rIWuuD98Q84QTJP2TxJK7
	ZvIM8xxV5yw37o5F2RAnatPq/JxG8eO3J9bAmvRnHEpCwPVa3xnHbtdLaoR1YyL3iyVWebjsnwE
	hgU1Az5KdXo2V7b8ynP+Zn+4F34CmgIxTD62M5dRqDfYYYWmKDG7oaauEbBWZ8oDYKACVCMtDw0
	WLSy7zcYF/r1NEaBo8
X-Google-Smtp-Source: AGHT+IHoS+vHw7OgDV+LQl+ocDc+Q/1FYrfvu0OJINzDaReQZs2FHdj/Wq2gkWPzQem6oxrdv15fjw==
X-Received: by 2002:a05:600c:354c:b0:477:a977:b8c2 with SMTP id 5b1f17b1804b1-47904ae7322mr91438835e9.13.1764223101558;
        Wed, 26 Nov 2025 21:58:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4791116c0acsm13099835e9.7.2025.11.26.21.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 21:58:20 -0800 (PST)
Date: Thu, 27 Nov 2025 08:58:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Sadowski <tsdwski@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fluke_gpib: use kzalloc instead of kmalloc +
 memset
Message-ID: <aSfoeE0y_L0QHXw7@stanley.mountain>
References: <20251126204838.17767-1-tsdwski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126204838.17767-1-tsdwski@gmail.com>

On Wed, Nov 26, 2025 at 09:45:49PM +0100, Tomasz Sadowski wrote:
> v2:
>  - Add proper commit description
>  - No changes in patch
> 

This stuff needs to go under the --- cut off line.

> Use kzalloc() instead of kmalloc() + memset() to simplify memory allocation.
> 
> Also use sizeof(*board->private_data) instead of repeating the struct name.
> This avoids duplication and keeps the code correct if the struct name
> changes in the future.
> 
> Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
> ---
  ^^^

Here.

regards,
dan carpenter

