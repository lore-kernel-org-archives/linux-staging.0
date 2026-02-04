Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7543E959B
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203481; cv=none; b=mAEWZoSc774W9QkYUa3ZVdf0UgXpY6d8eocnvqfR6ZLZWIgd6brr5jiQq5LsgNv+m+g74Lkc3zfp0Kb3fYeV/i3C3TuKXNoenYxQ5tKiPWj3/Dv/Adb7355xh0RJWfgHkuYwk84rgEIk6e9diL7VUSOo0r0IAQc5XQPEyjm1ry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203481; c=relaxed/simple;
	bh=jOoLb5UmrN94BtrDDOGkQJWrM24D2AE105Br1ixzEKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdDYM6papqKa8TSBPgTSoKkdB0wqZ2PKp0LfVqPabrqaoA8woOdwYOVME7DImy1AhBODo0VecZl7fPIawD7hAOmqhDAlfq5Ca8MjHK0dqQS4imaPt9THDgpZ+IbyWs7ddjncICc24IEQYo1muvSgmxQ6Nm+eQH4ygWyMwCqQXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dkb39QB9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dkb39QB9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso66763155e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770203479; x=1770808279; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D6pD+wRMkpV8A1lHcdvyDOrZ0scIHltp3YZgaHXqsL8=;
        b=Dkb39QB9WT1/6upPCb7ZsUpN3M19+76Ss3IYZleTyyTteRXXOBSA4hZZCgS0Cdwz69
         Rtmo3JSPYyL/YyWLwjyFC29IA0fq7zx1wpc0+YliGyD/JVrt4nPl7zhHRkK07VbvGWv3
         oeODb26XQVJT4tRCyG/TwIh2B/Hs40mKgUanqnmPadUgHFyHZQfTrSSuQXSqBbKUAB6S
         u6CZbh7Gngqw4aTQs95OD5xoJaM2DQxwi2+vuX92jK0q/U0XdqK6ICsJ6RobQf5xQuUV
         C0HRD6SKJlqiKgMhUSrPRchJDng2UtlcL4B7X9ZaWLcsMIw+YmkLedpyaEMhS+TSOiMJ
         jy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770203479; x=1770808279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6pD+wRMkpV8A1lHcdvyDOrZ0scIHltp3YZgaHXqsL8=;
        b=XHasZ/SXPr89XA5f8uNS4xP5rfnxlKLcqZFL8TohIYYMSkXeNoJ+uWUv0Nv3zVVk3D
         4odjEqGss3fNrNQHTYTzSyluqEAigBGKN05VnSVtJCK6QldBCe63i5iTjo+sAMbSeB3I
         nNGAz32DrU9VKve97S/qrWD24W440IXEjELZ6+3xPXCEV8bQJE/8eA/y85v8X1EV5Sct
         EcCu66v8BRvi5ayCmOEYV/H+1arc8uILH60YlhLgMjY/EkaeJO9+bt+2EtSUZX2Uvrxe
         MeLvJqlXeAA36/Xyqy/XlJn66El3E9I7RsqoKEAVazQX9HjFXYty3MYh5VrmZZfdVfIk
         K7NA==
X-Forwarded-Encrypted: i=1; AJvYcCW/cEQ1EcXdHOsVr2VnGd8WLya7ntC+dpnwrN+O4Dun9hKxkojU4mZAQObkoB/RMcgzhySj1eJrwJslWWsZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh6gbCm8s32ZVWCi44KQvFWUQWD6sIbtbu/5vRNY3HcrejD3jp
	h2iHrudxiUD6YJKX8eSnqDUIIIUo4ndVAeV6e6Oxyvx/0pi+61rIa6NdCV8uXiE2zvU=
X-Gm-Gg: AZuq6aLe6ZS1Z40XsAK/IyonPPB/s45ZUa0vskDzTZvMWLS5+wk1j31mraSJfdj9Fvd
	evTEo1+35CA/Zxb5xSFiWbczAC/sauDttU7A0iukHpI3BdSRMMtcf9RfGnz6AZbJVQkb1NlcWY5
	u5CjV3pbFM47p5YTerkevU8MwcxFbHyuGJWO27ExxrsXDAf//eQ6bmVgpRvXYzowhbDL7DY2EtN
	gDOi+NFFtrO3sctow++5OYfSA8j3Y6RfPKxzy8orX97cntxae/XfdNgqhar/MZBOlt50cdKoqe8
	BQ5JeF8a2DPTz8HI66ckfe2A4JrcvN30LguUYODew6UIFiIAz8TJGoymziyvzIP7Y+YHvFUia1V
	Gq8P13aGIFD0+VDhF3oTIor67LzzYe5MyFM5+LkgrUGDbA/0Ra2v8VeNmqsGba+oNvDstQOENRY
	1PZGM05w5704wDt7Cg
X-Received: by 2002:a05:600c:8b0f:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-4830e98ab89mr33412735e9.33.1770203478825;
        Wed, 04 Feb 2026 03:11:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483108d79c9sm38085435e9.1.2026.02.04.03.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:11:18 -0800 (PST)
Date: Wed, 4 Feb 2026 14:11:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] staging: sm750fb: use strcmp() for exact option
 matching
Message-ID: <aYMpU3aWAwJjHqlR@stanley.mountain>
References: <20260204101536.3311-1-iprintercanon@gmail.com>
 <20260204101536.3311-2-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204101536.3311-2-iprintercanon@gmail.com>

On Wed, Feb 04, 2026 at 10:15:34AM +0000, Artem Lytkin wrote:
> Replace strncmp(opt, "...", strlen("...")) with strcmp() in option
> parsing functions. Options from strsep() are complete null-terminated
> tokens, so prefix matching via strncmp() could cause false positives
> for options like "noaccelXYZ" matching "noaccel".
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---

You've changed how the code works and this is a bugfix.  It should have
a Fixes tag.

regards,
dan carpenter

