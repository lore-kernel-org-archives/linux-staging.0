Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38370353EDF
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660813; cv=none; b=CAoq85J2/4mV5/hCqNKb7PIFZZrRG9U5DHl0WktJZkjRlsX3GSRaD5EaLuCKijtQFBeLqeJYsxP7GI/e72kbiXkb4/Dq/ZujxoICtVQQNaeCDZKeKTzN672qiZXDQTrjyJtDEh3AKkKzuZu0YfV5ktmiBVrZ8v/svhf0SHVSL3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660813; c=relaxed/simple;
	bh=19RKWm2TvHXQjaVd9wrtTt2aCydxEIrRty/M6oCetH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zld3C+k4PcXrBur8zFEbzCYBiGwS90bfKXH364hOKwG9XkKOWk8/fLfVOCoU1QR3iArzaQjv65ws4ZNw5pS6XYnwyc17RmWQ2WeRfccsHQXjG4GbYj+am9sq/IPZtPNe6E0MbRkQ7dBYsCBPlGpUq69CASXcoA5FYvtCG9yxrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5I6aOBH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5I6aOBH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso3873095e9.1
        for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 22:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660810; x=1791265610; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=B5I6aOBH4Mrw1tk6tZoQ4pXkfDj4Y+BmY5FpmlbmDqMcuMlCWkr1E6D7QBVHLh+aMK
         W3V//7Tx0p8FOEJLgpYhc5ihnT4G1Au2O36WLyn5AZ+nY78ZNmjteiPk/KZuBOAeED37
         q7zXdDXmNq0mhntZK5+Z2Ts5ym2brgs/SVvMFLIQoBi1grFAz5p1pROsypvdZo2oXNKD
         lFgecZl34BjhuNGxMdRmcS6tIQZfcRtuk9WlLVfPIR3K9xsW5ODAcul+/iwo+NSv1/wd
         lcwKIGwqSEKOzo078ZI+ar8gMFrXPm9ZPvMVt+dhgPZ4v3/8k59yX6SmZ3+BJrPks8rx
         1UjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660810; x=1791265610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=yDMVcq/c3LH3PHHuV2qY3Eil+oV2bxhNCrgPZilQj95nw1R2sNfR7umKz+k95SDA6g
         KszFUjzDP1asvoJ4Zo6TSNTHpc3/nSDCLSJK8Ln3vhedFvHgpsB+JmqYBg3hZXf85/Dp
         xHUNeUx4oA9zoAHpene4dAZkrlQHYP8vTJQHf1Qh6gKbVjEwrA7Mt1KeQj21Td3ypJoh
         LBtuovqt9WweKbaKFzUkTsPVm40B5cKTInVmB0fiwgvtWyKRo11YRfN1z9Xe1+5PiKgj
         W/xqefiJm69JSuatZ8p52hPZjBG8AFzYy4RsdqgszwH6EYd+Q59Kb2znnr+BVkXqEas8
         C5/g==
X-Forwarded-Encrypted: i=1; AKwUvBys5MFH/vXH3dJ1L2DahB9VlhtmAPm2F1sJeeotMr2+eQGknQt9t5XYVM7uGkxEi969Aoywqb2YJhHNnZ5R@lists.linux.dev
X-Gm-Message-State: AFuF++lIGkz2KbprQ0UYimmzv6LCG9BweeSmWJ54bkIxCQmyvMDl+oZK
	lrERzBhruxjMGlAp7cdlo6VXGgXVWV63PieO6PHp/hIRYIKoj7FPe+9+
X-Gm-Gg: AYBFou269/aHHgGo22NVgxXKdkuqoPAAI5HG5acXZTWN4OXz4gOW6PfU3m+dZ6ar9mk
	p3PM2gDNFHGJnxz5VkmTNmWIkFenu7glVK5RnJzxD1faNj+axInYj9hG7Cl2YMgGIYqmpUzlPHQ
	0dUgYIuELiftSdmgOXEXW1mgB7cDCJsrC+Ud2U3z6oo/u1lomra/hRBfRMLirhee5k0WE1o+7p/
	u11710GyNtuqQ1KiM0aIUZQa8Yf6DnbkyQIw5vMfBAunyggdxXrhRrsBLIc+cToEJtaNL+wcRfB
	ccbfgYNVr7vpcam718WTHyk2LiBoY6DD/j4P+hfcjziktmITXC1/wMn5fNDZyYO5JwiwDs8pqYz
	eoNFxUiCKXv9391TM7u/0KumvEbRdPyzjbbkZ5nTGKg58p6B3uvbAXWMevChVqRphMxM7Yfhd2r
	vNLzm7/ZScTuKdJsxDaKQgBYyFA404UmyjcSDYe2i6ZNQllMB5kSxguoMSABaa0DA+PUE=
X-Received: by 2002:a05:600c:1550:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-4a00d778f09mr19426275e9.15.1790660810212;
        Mon, 28 Sep 2026 22:46:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d45ce1csm32021415e9.3.2026.09.28.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:46:49 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:46:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Freidkin <freidkin@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned
 canvas
Message-ID: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928165045.642354-1-freidkin@gmail.com>

On Mon, Sep 28, 2026 at 07:50:45PM +0300, Michael Freidkin wrote:
> The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
> (amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
> get_output_size() derives sizeimage from the raw width x height.
> 
> When the width is not a multiple of 32 the planes are too small for the
> advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
> 736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
> The decoder writes past the buffer, and importing the capture dma-buf
> into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
> sound over a black screen. 1280x720 and 1920x1080 are not affected.
> 
> Size the planes from the aligned canvas the hardware actually uses.
> 
> Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
> 720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
> AddFB2 errors.
> 
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Michael Freidkin <freidkin@gmail.com>

Reviewed-by: Dan Carpenter <error27@gmail.com>

It would probably be more reliable to just ALIGN() the width and
height at the start so we don't have to do it over and over again.

regards,
dan carpenter

