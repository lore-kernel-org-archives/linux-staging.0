Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6A657CB
	for <linux-staging@lists.linux.dev>; Tue, 19 Mar 2024 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710861919; cv=none; b=ECgBjMuh3XKkbGm9AZ3wShwiGPZHXvX0vzwAUilO3YKA+c2QNCDrrlodCijl90PB+tBjkqyjOLcYyRxMjvJFe85tP/nVh+a9/XndAl/Pp9RRfz6ZmDNRnB64+hW6wFNoIyv62F6DTEZredZ1He8SJJoFQPwI69k38hzLIuISZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710861919; c=relaxed/simple;
	bh=j/tOewZO+xITdwu8fyyevSlxd4rQDWIvMngL14Mt4g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJO7nkD2cKX4r4QjQq8OzWZqW1aFN+VRoo5IeHw++uOzGbUF88ezQ/ft19Vqkipg3WRDDo7+3WMrraJR0v8XBI0IzT+DtFtJMb9L26JBkRn4vlbIt1XFHlkaIvyngm87qWlXW8lJ/FTd4mXcXK+yygCcaXREbbE6HLFaCuF+Tio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3reLW6j; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3reLW6j"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-414617882b3so10362275e9.3
        for <linux-staging@lists.linux.dev>; Tue, 19 Mar 2024 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710861916; x=1711466716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/tOewZO+xITdwu8fyyevSlxd4rQDWIvMngL14Mt4g4=;
        b=P3reLW6jONHuGCvHBSREscA9C6K4WnQZ3zCxBzr4Zp+RNjZMRoh8ZQ5lIJnrRnoePE
         DXo3PSNyj/5jKDz5LjErPNsMeDcAwLYK9cGwQeW/ZO8nyQA5UMlS7HuZim+QRQBUmhfL
         MVjCdxPALfdebjG80h3fWTOcor274uBPvj9lzX3mdYyjw0Ek7kFk5PP7hyxsCqvo7S0Q
         xCXsUkDE+6ysBE8udn8q7ejPKrmWK5THBXLayYki9Z0PH5kCXl/KrQQK3l/WJdlEpAKQ
         IESjEZR6rAmcrr9DAf+uGv2qCM/m4Llh1EcH0icIZYdl6bAUPN+H+6p1Bsu1sGT5Xai6
         RQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710861916; x=1711466716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/tOewZO+xITdwu8fyyevSlxd4rQDWIvMngL14Mt4g4=;
        b=Jz0I+uMozHx14kdmtVpLR/3JK2j39xYNG9ttVq0PdJ8vQOQfcihw92LqsWF0pq9no5
         o1Hdcd18YqCKFPVJ6yp1uyMN5KggRShywwQ6i7TO6lbYfEIj7PtB2hSqhBv/3GWcJFff
         p0kvmy0BJddIcy2jkl9Gju/vz8eyv2HV6yN7lZSEIZ+7TnDT1mTzKe9PWE3cHd75+X6Z
         w9F6nTyGA+vD0KRrBHA9P4wbX9mhorjp5PsEl0loqTLyYQGwqhY4cmyy5xhVHEtzSMD3
         Dfpj0GPLr0V+TdU6NQdZ4+J1gx3l/YyVya0qClOCHdwbjezEIb84nzLIiYJ7eqJ2iynT
         6d1w==
X-Forwarded-Encrypted: i=1; AJvYcCVdblkiwWK3zUF+oKyP0i2xyWSI2fWgBkYh+sU0siEU1/RPg3wQnmuXh9ROkCBGvKqb4jvZG5XQuU4RIN8hPOta7E1oeHqUSP1colDixQ==
X-Gm-Message-State: AOJu0YxYRanGU2X+tXGwR9KdQBTBZljeC8scxMbh4n/JPCGgXeW/phyN
	GCfOXa7/gZGHIl9HU0uQRi00vkKeGv1ue1fBy/NRYMRg210Ka6FjejqZtKF+U/4=
X-Google-Smtp-Source: AGHT+IGuxUp4tJ3tduUZ1jDdJJOXB/6Dyq+c61cZG82qzzk9ozWfJDBWCF1r7b5Ii/MqZJEtyixx8Q==
X-Received: by 2002:a05:600c:4689:b0:413:f4b5:dcec with SMTP id p9-20020a05600c468900b00413f4b5dcecmr10850776wmo.40.1710861916490;
        Tue, 19 Mar 2024 08:25:16 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id k4-20020adfe3c4000000b0033e48db23bdsm12595322wrm.100.2024.03.19.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 08:25:15 -0700 (PDT)
Date: Tue, 19 Mar 2024 15:25:13 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, andy@kernel.org,
	geert@linux-m68k.org, dan.carpenter@linaro.org, sam@ravnborg.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/6] backlight: omap1: Replace FB_BLANK_ states with
 simple on/off
Message-ID: <20240319152513.GA9963@aspen.lan>
References: <20240319093915.31778-1-tzimmermann@suse.de>
 <20240319093915.31778-4-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319093915.31778-4-tzimmermann@suse.de>

On Tue, Mar 19, 2024 at 10:37:22AM +0100, Thomas Zimmermann wrote:
> The backlight is on for fb_blank eq FB_BLANK_UNBLANK, or off for
> any other value in fb_blank. But the field fb_blank in struct
> backlight_properties is deprecated and should not be used any
> longer.
>
> Replace the test for fb_blank in omap's backlight code with a
> simple boolean parameter and push the test into the update_status
> helper. Instead of reading fb_blank directly, decode the backlight
> device's status with backlight_is_blank().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
