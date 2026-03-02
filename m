Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546FC194A6C
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439290; cv=none; b=aIhMJt7o1T+C/Yvo0+j07dGKeX4w4lHkD7S4qDclrzUZ/mnbBE2kLX1CuyhCswIBzw8F5t3wQwqO68zcgLiqMbsQCCFKYEZYRlqqjbFeew9fGuu2SuZ1E/t2O2FkjCzihD4PZ3O59WjsELeWv1+T3rLXrYeWWYuAmOsRpR7OGZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439290; c=relaxed/simple;
	bh=lz3cnQOauPjZmYg8e+5RVkR/QJhvlZNAo36Q1Qg9dvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGNx6SZz6+eneo9pBgPnrUQtfiU7CqwYfsgkNoLHMa8NBmgjxEIivedPYVmNVkU2Cj759qGpG/tXo0iLzGDcUq0WH31s21yZT6yKkKpY2nrJ9h2pZYaCsaxN3WqV6PDpCCiJMUgK4xqbLpf5I3Mw1by2tiYZZteRVxJazVxkGKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T4r0UfDl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T4r0UfDl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483abed83b6so33310155e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 00:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772439288; x=1773044088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yu2n08ukpuv8/AnRi9vz4EEYR2Gjh+fXTU0wtRCF+2o=;
        b=T4r0UfDldZ8Fkak3k6NwgY0i1yaKgxq2lqND8tFKt2UiLZKGFYq+hj33bhxg2YkowZ
         5UaStI3ZOSxsvz0VeLf3Er+8NXmFMDJ1ow888H6jhKbH1UxA5ZotXVJ+f8eM2+I2kJi8
         tFCrJz7cG84DX0+1YZR4KvhWQkA1AybkxU9gS5IMKko625ZPYwmS+0ccWnG3/YU3aOKg
         /RCXpohiIPJekTKPlzHSoAR+nRiM8r4X5bcLv2HW/T9dxq0GOiNIQobQwIjsg7gYAEdt
         nlIz+Z/Pg4rC7DxgtqUv2jv3Vfu9F5lFvm/DwDIYJiFWQBXA5UbqCu/1OMSYEmC53KaJ
         S6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439288; x=1773044088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu2n08ukpuv8/AnRi9vz4EEYR2Gjh+fXTU0wtRCF+2o=;
        b=NU/HORwReG6TbNKqZ6CMcTEU6QDezc2xIfIGAh9gu/xqIjfGLoVOSCFQfR/b/ee21Q
         Ga+RpjRxzjPU4Eer8J6jQJGh2vIbTGhY3vFO+w7d9Af/JraySfX1xoexcymqplnlKzZx
         4b52wqBsWTbetrwl51PRXUv/86+PtFrfUYzlFFfgYHoxGVczxvav+OABvpBOmELWmFkb
         QCPnBnRDMCDc6fEQTLZ4buLnhNXR5OstMuAPcSNfPttz71rUZoJqR8EbMoGazmCcgWX8
         +RGfQhyiIV3JhQ1zq2hbe0TwMwhRqZucKxeZnvhyVeo4Ym8226kBftzZSSu2XgqGgwl8
         AISA==
X-Forwarded-Encrypted: i=1; AJvYcCUIPhAtCNRWvy+SmIraKCZzvkMAbBrh7+SuiDvETZLV5LxOWCojv4xp1a+uw3tXmXYsoO9PN2wiVq2MAdDK@lists.linux.dev
X-Gm-Message-State: AOJu0YzSw2VtF7VRN7IQ5b/k6pgZMWiI36FW0xc5kbDkBk0GpKO2hlRt
	Wa6cjC/W4ZEuaSvRLDmLMDpY3YqZDXeBAOPyCoYfwSk7FY13eQhOuAC/+68iueWVoeE=
X-Gm-Gg: ATEYQzw8MXQrYGRm534OmEcmWl6iImsqzHEU7GyoUsQDyPq2whirvbLc3oYIoRoWihy
	4mj0LlQ3IvrJx/qFtoEqeyX0LoS4YPQDo24SRj18u7Jmsh86t4MRB27+e5e78vrXC2NMsnaIEl3
	E6fU/WYnUdZwkwWGjPX2fcgvjLBsDsgHzO+3CMdG4EHtryPVx/HFS+77HFPeHiBwG/K8PeogmbM
	osb/TnNIbHEFVOySWP+SjqwQ5NuGRYSRrVYsGtihh/+0GTHiwCJnm703vmaVezXa80DPdaTafd6
	P/TfnQ3sXMMFmmUm0kFW/K/8Eco+4kFkdXQjCftpXbCUzuSmTDlYmCi2a0WYIk+CbfWS7M5oz7t
	Y6mpk1BO5AiYvu6+x0peUJ2jGllR/rVQ2ItAWbmZtV0CAfT+A1jj4rHpYse41kK524lHmGmhFKZ
	ICY88d4a2bQqHf8WMBmK0dhWGuoaAs/83OB7Y1lHw=
X-Received: by 2002:a05:600c:8b84:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-483c9bb1adbmr197069225e9.15.1772439287676;
        Mon, 02 Mar 2026 00:14:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df90sm402663625e9.14.2026.03.02.00.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:14:47 -0800 (PST)
Date: Mon, 2 Mar 2026 11:14:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH v2 01/10] staging: axis-fifo: fix alignment and line
 length in wait_event_interruptible
Message-ID: <aaVG9EJUtdGBZ1IS@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>

On Sun, Mar 01, 2026 at 09:48:06PM +0000, Josh Law wrote:
> From: Josh Law <objecting@objecting.org>
> 
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---

There isn't a commit message here so we can't merge it.  But also I would
like to see a 0/10 header email which talks about how you have tested
these.

Most of these are straight forward to review but a couple are more
complicated.

regards,
dan carpenter

