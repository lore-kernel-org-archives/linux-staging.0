Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51719AD70
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553827; cv=none; b=ngzy0Ct7whffjZLBw0fTjzS41nEk6HmGMHnHPuq9PKS5WAde+FEKqoz75gz9bvqrqRTF0ggyeOahgyuBz9grc7gH/2ZVxKmlsTmTpSLVzxTDwnD+YVROCa+1ANLErwqW+7VKvL9BBvBZk8QAPa0jjwFdx4tsI45HvyxRDqqAubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553827; c=relaxed/simple;
	bh=/IucKzJr1pjGm8UzlqVDbC6DYKSJ1VXL16illXAKyr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPUOarynrYJ05KecPDUVOmbrWxVfKqRZoAnWhLN5Dc66DHitnteTytNEEiwN8/sCLhjxj/F9SdYHCWVmkRbITHSrG2CXzj/grKNXrWAlz653UHdZm1QfzZ4Rj6b+Du9U9aaStl19ho7Y6sxj/hRH+W6yDlf5kcZcHgPdWF32Bdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pR+m5MwD; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pR+m5MwD"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so59868401fa.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723553824; x=1724158624; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hfkyu+ccADY0k0FfxuRa1b4o2Bw2fvhvcVBZ4pCO39I=;
        b=pR+m5MwDwYzh0AN3ueoHpL9JGeSpbppHg/Qw3SK0injyNPUXjBAfJrEFp6hPiyCYa3
         oRJQAm9pQPqDQtma/utw3wd1Fn+Hxt8u/yx6cF39ZcGkljTusqmZYsI7zmD4n2d/GSxX
         aWcKmpDHsGtAVpfErOGM11TTnMAgDjtaRdSgP4zDTyo6oXQmCCxSXU+3Y5DNytD4/A5d
         EdaigVSU4XGC4srncB6RA+DhCFTp9jIUjuDL8/al7s3ez6aWYxHhrxYnq4UsMNY7uLq+
         T4MVqVSAgob+9sQEyeOaO8fE0yiijQJkzzhrdUpgHORP56SlNNWfpfm2alNOXCKfhGY9
         Tq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723553824; x=1724158624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfkyu+ccADY0k0FfxuRa1b4o2Bw2fvhvcVBZ4pCO39I=;
        b=E69QiNXBjX5KER06BVwXl/fjDhZZfF9H27vt5iFWTOLJDSdDV+Kqru5EvNKAy1NPxf
         TFv6i+ttAJl/nuZoM0JIYH13RE6R14WukIMnLuYD94VkA5RxUwRTis2kzMOo1Staj2PW
         ihY1/J/9q3mC2Bms8cCI556yK8BGR0cngLrosN4eblrYuAlEbtQ9B1XAF9PyEFh1E88j
         M4YVYiM6ljlLvBcW/UATDKiuX03X4+YCfjAUn95zz4e4DOX/TqSo+W7HpfnVt4xRFzrJ
         EH5B/XVNN32nDwSILsDzrsFXZQFFpii4MWe7PWTaKzWx4MIHE/f/upa/xVqdC20ZRjyn
         NFyw==
X-Forwarded-Encrypted: i=1; AJvYcCULh9wtK9YPBlX11/4o87Hah1b5pEPOR1aRAyeFU2WFA48rmLr+762Dv61RUgFrkhGD0aLZ6vdT83kavQYs9LWLBDnGYvsIGzoERUeC5w==
X-Gm-Message-State: AOJu0YyfOYqmHIDvOd+4GAmdh0N+99j9Hy32TxnrepkKHFoubwxmGkSR
	1EPGjzYmUvY65QAWSAoR+Do2bqT0hRLbBlrkci1/rgigVsi2xOVuTvvJ7rF2W7U=
X-Google-Smtp-Source: AGHT+IF8eG+A/qDyy+QvlE7p4WfVNrboSKHMAxVYe01bthgvvA+JzP9CUdv9MtoWOah02cUOZUIUwQ==
X-Received: by 2002:a05:651c:b29:b0:2ef:2281:2158 with SMTP id 38308e7fff4ca-2f2b7132d7dmr27774751fa.1.1723553824007;
        Tue, 13 Aug 2024 05:57:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f47b26sm68417366b.41.2024.08.13.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:57:03 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:56:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/6] media: i2c: s5c73m3: Move clk_prepare to its own
 function
Message-ID: <5282172f-f8b4-4706-af30-f5bf9a2a3f8a@stanley.mountain>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
 <20240813-smatch-clock-v1-3-664c84295b1c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813-smatch-clock-v1-3-664c84295b1c@chromium.org>

On Tue, Aug 13, 2024 at 12:13:50PM +0000, Ricardo Ribalda wrote:
> Smatch is very confused by a clk_prepare_enable() being called in an
> error-path. Fix this warning by moving the clk_prepare_enable() to its
> own function.
> 
> drivers/media/i2c/s5c73m3/s5c73m3-core.c:1425 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1425.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

To be honest, maybe I should remove the clk_prepare_enable/disable() from the
check_unwind.c.  Or at least move them into their own check so that I can
tweak this kind of thing more easily.

regards,
dan carpenter

