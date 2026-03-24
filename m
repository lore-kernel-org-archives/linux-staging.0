Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1A3AC0FA
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335297; cv=none; b=brSD+VrMius56HDrWjUbcl7jZ2f6S0/MN+YLOkYnm5153qLRMooXCf/ht3nrGQweTv91Dfaidn5wM/jh+9v5pO+XSVOFhTR4dryrU5vu5kk66FbG7oBkH5P43/BGCU/O/792TZpMekdYlKXyMXMmJoIKzusZ0AIluJZXZi4s8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335297; c=relaxed/simple;
	bh=NDkAUulz92or6SHe0cmVKX9YZQFIYO0IG0xBOsSpVXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnINGzLpqlLBILwRMwT4l+xQUqb32WLfIOqYc9fsM27dUaHUSh1fGgzlohitQe/TB6O5TK6l1XwLGsblF8ZmEeRNcT66QtLHvrzQ9bUIqiMUIggSRkwV0jYwuOuxVAF/GozqTMU5VrdLU0Mp2TllymeL4JoVyLOmHOe1JWAFVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mOHx0S42; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOHx0S42"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso6525595e9.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 23:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774335286; x=1774940086; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPUaA59pdNnBCOk4jPCDwDOf4gfKfaoGM4M2GudrdT0=;
        b=mOHx0S42E0jrwkQc2DTfiC4Xi/pXCazkmFl8AKka/JYSEl2pA6OwB2vXBIs6q5Y7Y0
         xwY0A5pnff0eb3rJHvotwHETqWWJSh4B2ETChkjBftIf1L7eS8prMP9jNSqNZiIlyzft
         r2J655aU1XbyBh5BIq7EUsYnh1pESCdfuTg40O5CoEEVChDDSr+h+othA7kyFqCNSYrm
         9RtHEVD+sjxdYhxm/0SPbJJ7GI1OTB1kdsNof/masL98noy4CaHde9agwvhdLM8Gcmxd
         693SDg8kc1i4TlPe6vK1WIcxWjDUsgrSRH79qdrLyR06Zw+ZguzedeR14HS8+GMR9ztF
         Hz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774335286; x=1774940086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPUaA59pdNnBCOk4jPCDwDOf4gfKfaoGM4M2GudrdT0=;
        b=aRLKq4T8OKxh448WTDaTgc71buZFFqkZ7Iwu5LmZ2gKBOF2qdSypeHqIIwx/Spp1QL
         sZGjnkZs10G76C7TH8g4vj0UJLDC6XdwJbcHxb3GmekpeO2vQsohUtKbw+uBD7Rk1WGW
         W3Jn5B8WtOrNlwlfKFXyiuwK3j2nZ+uQXXsxcJCn6TViMr2LFg45K3uOjti79tvE3HWu
         znX2b4CextLCyXlnSOzphdQJ3mO2VF0W+v+orZpooht4CraZYRUfbxoWzNIYGCnvppNu
         GjS2jP73xegBMckVuJkPdrrcPYSqynJqxfpRZfbUyq6FUZ89HPJvQUQoPPSFavq5G1/w
         E5SA==
X-Forwarded-Encrypted: i=1; AJvYcCWx2IcWnsxQr/YpBbe31EaFxJn5J1UuEgje2WQ/A9V+dE3vuJigUayOEx71YiTW12R4vJDX0LR9alrZya+v@lists.linux.dev
X-Gm-Message-State: AOJu0YzHltFP2Wsc9DfDSKJMVCbuypafyPTH3/LWMXlB4tn/lRS5MNk6
	WpnxfYKRNeXlwsUixvb/qIMrLmwPSzUjYpXWkQ2CoUZk/smW25enxW8A9+cj2HKg0ZQ=
X-Gm-Gg: ATEYQzzJ5wJfdhfIyexb3hmO1+3xdWz3BuTJXoY4dqghqPUFS1F9JUQfQApcOoi7ID7
	R1yuvKKMaSdY46oFyNmVlFQi9P/9PltYP50lpt7/JTTF04o5zg3Tliu3O/3lt8Z+QlvkHaff49i
	FnMAICxMeGbfFgOZO+CGZAiWbxPR3v6qHWM9/kyzPRMU1S0qCr52w6x54MV4607xz7Nr7/WIQc1
	Mg1YoTU9bomjVJ+dyDSwAtumG/9QkJ2Ry97F2Y8cVumC8iSvXqn6Nze2HJtakFJUmceoJa5Yaa9
	oURpbYTTcw/wDRIVSYD+en6xRSo8tup0Zp7IsElMPlWa0i72+aah5DNYWwfvallm7myyhtzab9C
	Wi9+gXEwyA8rDfceeEDTk5JYNT05EaGQVlwuagWMDceIofJvRMWCpJjt625GDgXG0P0TujEitFJ
	UdmhqkVWaP5I6uQX4PRJWFh6tDtMst
X-Received: by 2002:a05:600c:42d2:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-48703064edcmr85729855e9.33.1774335286244;
        Mon, 23 Mar 2026 23:54:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711764625sm28507835e9.14.2026.03.23.23.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:54:45 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:54:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>
Cc: gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	luka.gejak@linux.dev, straube.linux@gmail.com
Subject: Re: [PATCH v7] staging: rtl8723bs: remove commented-out code
Message-ID: <acI1M_djkY5NRe0p@stanley.mountain>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <20260324040718.7777-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324040718.7777-1-aadarshmandal9354@gmail.com>

On Tue, Mar 24, 2026 at 09:37:18AM +0530, Aadarsh Mandal wrote:
> Remove code that is not used anywhere in driver.
> 
> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> ---
> v6:
>  - No change.
> v5:
>  - No change.

Why are you resending with no change?

Also you're not working against staging-next.

regards,
dan carpenter

