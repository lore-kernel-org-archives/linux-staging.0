Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027891F4174
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772688829; cv=none; b=YHDMEtZ8MfNiY4k8VoeYGwUeVx/4XTBuvosz8fHYv37cj4bwQ6WhXskVTiPoyGEx12e+sFsn/4C/IDvXlJuj+hvAqMB7sjEpp3ogeoR0d70YZnoifbsYGBBEjvMYOqefEJfH59KK1jetN7yyHGjZauugkDH6j+mO03FZ3AjlQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772688829; c=relaxed/simple;
	bh=wj6XVJR7daBU7N60b0ABVb/8u/aeymIukhxPfV3iPe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irme+QLGtSN0kFtTsOGzsBose2bYGIB+QNa9v5qAC7r3Aw53Eb6pS8H7xAVg0ugXPuIJhm1aQO6jnHzTwad2NHRz5rBndiMfPBH5TLlxjOYJV0Cyl+epARFzAt2WXNpySLynuWwETm8xzWo5jtD45T7W76IMgvT2YgpCpPDsrIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2JKB/pu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2JKB/pu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b1900bso2876775f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 21:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772688826; x=1773293626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhxvhu2T/q45ENXvH+eUJLMEREATBu6EpqQKx+HGiRE=;
        b=B2JKB/puu6KnWAYzD9lwEWxJC35OrzyD3qJj2J4+hyFt1O6e9qLOii5HM+BV05P3R+
         baUUC2KwNi/0fkqAxWuTEa4USsjJXcRN4ZxO6mhes7vyg8vOy2XlWcr6xFr+c3QFHJEz
         BPPx2B8KV7fuAZjyaVAGHtJifCPEpL5VafbHyw5VbKP0yrR9ZLnrmBTPGp7WB5E/JMYF
         EKI7vJvbxCzU9P3pT+6x+0ELgoFyLS9vnEO8shOYEYX+BXnOGWOJkOzkExDJ35Kq81W/
         nNPW6/7+SHYgG6xsAEAeq6av1NcfORozyWlP2Y4PJ8+ynbR7XEsHXRbnJQ9e1tI1OuD3
         1gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772688826; x=1773293626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fhxvhu2T/q45ENXvH+eUJLMEREATBu6EpqQKx+HGiRE=;
        b=dyz2GAlk3nAdZvakIrWCfFTtiEllGTnYFN6+tHzNKt60PA2RDfotENv7i+UuM6kMWW
         VAeyAOfuiZ9CjCZXAJ4QRBLwEnKAsgmpIrYBMxfA//GPB0OAZGVnwHOZv8lT8NAUWAaq
         gdZN8EebVM3J9O8eJFWUuXPrsVx8CtZLWbo/VMKCp3u0VTK9vdtCdEtqfKmvCS1aOSMJ
         3IlHNPT6eNIEvV1tuJrSi69mHSDUgAESGkSOjY+N/9gFdpQPBZG3jNm4qgu2qiHfr2oQ
         rTAHkmhwpCL2rlIG0zc/5Ae4QzKMWZvh5kMJufmo2TqCuXZhsJwurv3wXdNIZQohrvSq
         CzBg==
X-Forwarded-Encrypted: i=1; AJvYcCUdxjS5URyss+MwLseAApra0p1Cd7rjcYGstUBJAVWv7B2kmPLaFsUS0XazzrojzQ+t03IDnpGFfeN4Ut8h@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu2DYmjoA5RwvqHe4iUy+nbXiSmnLpVbLG1Ah5OHu94/KcBrGT
	P4bdg1X/apo8YGZ7RiU2O5woVSopDu4gmcnxRELZiOiB6rYe5vtAoaz/ZYDWTtXpRbc=
X-Gm-Gg: ATEYQzxraTZBuG5I+udy3JxeIyMFbKt4QSU7mtAifM1KXzCOcjX+ySyXgcCAu/LG3Y1
	8HcZMEv2sD/jlxRyYNSIFhWul/SoM6DIk0yXY1YLQ88Dd50lBuqC/oBgC0yRuQMR8JNERYK49Z9
	LROtHTw77wom11pPYmqtzVJ5V6T2THOEg/H6NJVYrM+3vffk9h11QyhwUsXk+W3UELj7Lld9wyE
	5tPZgrpYyANxnMlIK9dVAN3zq0qx1yrn0JROZtMbNsodzA1qjys0cB/PLSC1aDYZLMnWjC4wqss
	N35vgGeVhmwF90/uri1xo0pTftj8nN/022CxylBs9JvdaC/Q+YwhRwnGmf+udyy43EkdAM7ZJeB
	GL2kW+N6jn0Ddn7XFoz9YDT9XwKvGsWH42FmG1ZVAlGBqq2DZzP3aKIX3lzkTOi5uM9Watu0RK5
	PinChOGrX7yTCjS2VvVnN/0JM/MmKS
X-Received: by 2002:a05:6000:2401:b0:439:ad72:9900 with SMTP id ffacd0b85a97d-439c7fffc62mr7932444f8f.29.1772688826250;
        Wed, 04 Mar 2026 21:33:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm40217958f8f.8.2026.03.04.21.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:33:45 -0800 (PST)
Date: Thu, 5 Mar 2026 08:33:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: sm750fb: hw_sm750le_de_wait: return
 -ETIMEDOUT on timeout
Message-ID: <aakVticYA5tHisbr@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304173529.192067-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304173529.192067-1-officialsohamkute@gmail.com>

On Wed, Mar 04, 2026 at 11:05:24PM +0530, Soham Kute wrote:
> Return -ETIMEDOUT instead of -1 when the DE engine poll loop
> times out. The callers check for non-zero return value and
> propagate the error code back to their callers.
> 

They don't propagate the error back.  The callers do:

drivers/staging/sm750fb/sm750_accel.c
    87  int sm750_hw_fillrect(struct lynx_accel *accel,
    88                        u32 base, u32 pitch, u32 Bpp,
    89                        u32 x, u32 y, u32 width, u32 height,
    90                        u32 color, u32 rop)
    91  {
    92          u32 de_ctrl;
    93  
    94          if (accel->de_wait() != 0) {
    95                  /*
    96                   * int time wait and always busy,seems hardware
    97                   * got something error
    98                   */
    99                  pr_debug("De engine always busy\n");
   100                  return -1;
   101          }

They return -1.  Propagating the errors means:

	ret = accel->de_wait();
	if (ret)
		return ret;

Also this is a v3 patch, it needs v3 in the subject and a little
description of what changed.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

