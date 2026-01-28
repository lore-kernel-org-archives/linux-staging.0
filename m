Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D852980A8
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 11:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600816; cv=none; b=uNBBYon7MF6D4s5KxqCSdh2Idx48H2uIBLXV+B7LlLHY/WZAiMlVMJflNYPMVIU/rGr51BZWTKxp9gd+jvH7MujFEzp56oCdQzvPmjMf+qjAVWotD7y8an4zIz43fgprzkxnBIX8D/j6MdrZ2359CC21TLa8tPlL7qnW+fP63u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600816; c=relaxed/simple;
	bh=/1B77Aa5R+WBSByqnqrIhirli+RecJNNuUsY+wsM0nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgJaM0XSC2JTFzQHsZ0q6BU0vQt6jd+c1Wh2TlVg5JkUu2WjM4cbEgzRFG+v13EawhjxOlef/LGBUIVhRSpcyNd+BHT47GQhU04rAYkrsB8+yX0EsB4t/Z3/mdvOpCFwdlT7z+F7z4Tsu0PEPBEj1x1zfX6Y8uAy36GMpBAeFlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSua6Ooo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSua6Ooo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee07570deso51940655e9.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 03:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769600813; x=1770205613; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khJXybkcVVzB8mqgpRU1gLtvPugBIJAWbxW5cUcew3s=;
        b=hSua6OooCrzzAYr5oCea9FF0NmqJU3eP0qhs6xjUzGwLv2Ihd8KztxutdlP2FpL60d
         qNamMZ9pQDF9q2l0aAyPs2t3LDMl6NkTLa4HflF9rmQhUXbclVTWCXtFpeY/ekZ72X50
         mMMF7MElexyiK2PE+Ucxxw0KCRnS665Z2tCpJslOQepXf3PhkpDcX39KilUdaIaQJ9oO
         UmjnfgfkimYX95PRo/pYwAGVJp+NVIlpFM3jvalx/0Jx0lAGO6rKy9ZuoswuQX5xh+BV
         2uQ9uM1CU7//yTkHfNVYRecBubSNBOoSPw4e7S/s9ZvIpoPUnt65yVkYHf8tezp1kA86
         Omkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600813; x=1770205613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khJXybkcVVzB8mqgpRU1gLtvPugBIJAWbxW5cUcew3s=;
        b=lB3Eb8EOwpqOCFmu48mC84fwD5A3sPiEqZwZH14LQ11HE1e3Wpb2BQjhOD5YiZuX5E
         femuQHtNj0ArcUEm2mYQOQe8JzsL4EsZl3OihBHdaPbfYCWoe5J0D23UcpstQj42Bvik
         3FekRAOVhZ52ZT1Fce9QzkYODDh2gr2KUHJQoQXJDrpD0yDUOqNom5CBBjpAZ3R3MuqT
         iaULz8jqOBOSaoQM3uDnwfhJiECDeXLC6yWSZvBAa3jMr+tPA2Y/IIY/7dchaEhhJWKN
         mQYSTJ7iet2uRvASeTLpfS9ZeA27cWHFSTqA2JPgLjz+EvomE+l3tohOs5uY8JwH2toG
         SnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0mj/+r7AJJrCJ1NgpVoDcnPBYKNHiWGxOsh8buAGaIOx+jrgW7uNrNqrojrtTdHlUnuoHegDoK3xpObSW@lists.linux.dev
X-Gm-Message-State: AOJu0YzZjXk1TmUUoiutYMITwBoLKhVSDZQ/LwfzVbEX2i4WZ/AXaDSW
	QIRfYjSqyRaFBDL60nyVKyz5pZFtXOmFw4m5O3aEespDHFItuYgLpk99zVactr/OY9U=
X-Gm-Gg: AZuq6aIOLGYCbsG+OlNYCcrMsri16AKD9xVsI2x+sroimQtJoprAmIXmzxqIH8YhR3Q
	E+LH2EwSKKY8pMJmXfH91vkEHz/18emktVTtggC37mAeIzTlaNPUjsmXJ2cLw/w9A0Z2AA/Iw1e
	zvqSg6bL0qXJWSyOV8MJsbbTBX0PYf1Jir7hLI1ga3/MBGgHw36+vZoa1saR7DBnOZdj4gd1wvO
	B8H5htX2N2YNz3YdImqDf666V/kw2nLac2a4HY/3CJZXYGVgPbhFdJAk/4bUIDNJdTAjGLRHco+
	TIOHjPf9E+pVAV6iKjkInmdi3BGHLpHY3o+qAs76q4bM5zarYj3UbomBHHzBBnKIiqfHKGUCBGY
	GrNWSsZL72fbi4veHOejKxx3iScNYQm8vlm4In92Oc9KFaHjmRr/d3GrCNB6hRbrebyd67tVOx7
	v9kG5ZZrBAg7rb09Fh
X-Received: by 2002:a05:600c:a08c:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-48069c43e80mr67128725e9.16.1769600813044;
        Wed, 28 Jan 2026 03:46:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm6549747f8f.41.2026.01.28.03.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:46:52 -0800 (PST)
Date: Wed, 28 Jan 2026 14:46:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Madhumitha Sundar <madhuananda18@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: replace magic number with defined
 constant
Message-ID: <aXn3KAIpVDr8la1o@stanley.mountain>
References: <20260127132758.49650-1-madhuananda18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127132758.49650-1-madhuananda18@gmail.com>

On Tue, Jan 27, 2026 at 01:27:58PM +0000, Madhumitha Sundar wrote:
> The hardware wait loop in hw_sm750_de_wait uses a hardcoded magic
> number (0x10000000) for the timeout counter.
> 
> Define a constant SM750_MAX_LOOP in sm750.h and use it to improve
> code readability and maintainability.

Timeout counters have no special meaning.  They aren't intended to be
re-used in multiple places.

There is a kind of bug where people think we exit with the counter set
to zero but actually we exit with it set the -1.  Normally, when I see
this sort of bug, I change the timer from cnt-- to --cnt which changes
loop from iterating 100 times to iterating 99 times.  It's fine.  No
one cares if about the exact number, just the approximate range.

The original was more clear.

regards,
dan carpenter

