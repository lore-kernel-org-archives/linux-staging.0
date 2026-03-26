Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CFE34CFC4
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514369; cv=none; b=G726p1Vb5SlEVkLLulcYpbKTkWH0BHolt0/vXAl8Sit/ZeCEBF5K8D0u64aJrFYOm15zeSaOpsMnLw2Pi83nZekqlvwEkMD1Ug4YcSWBjTckF35A5fbG02hMNOmHJxZzmnwlKxEHtJ9WZj710FgTv6R1hhGULIEY+JqhE/Dij9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514369; c=relaxed/simple;
	bh=BdnnQQqHYCujt7wgN+UgU4N+94sN5A5HwIsOvnCdc14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njLL4Kgr+CiPrK+bBPUEtTYIXXNI4/HWhX0qvhjbZZDOqTMXIB0bm8YcPS8pdLJCntNnv9LY21bmBXTuZEewznnUi2BmfRljnbTkE7xFG7JmF2ytwJavKzhEu8j7VmVvskKfPmSXITSDddLnL9+1IrkpskZdTxEK1jMdvG+SqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDl0q+hR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDl0q+hR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6471335e9.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774514367; x=1775119167; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBHIKjGZDQYwqktWgoWqWbyzVzuD2Kcb8EQgt8K2gjs=;
        b=DDl0q+hRzQDeF/+nFb+cUHUsLz1IvH4bcjFG94ZX4EvH9Pc/t81RqDECnvj3AUVqs8
         beDYtaSRkRZOp64+IOrf3Yy8vZ8lARV8IUjXbKuhwmtjk/q/lQ2om66SHnSNLjE5kSGu
         4jdUDS809KAJiIhxE1FbGCVwHE/WMY+0KcUdxfX97BCQUXYEMPyDzdnsOPoHtz8g0QG9
         ihzoSUJG6a3iBAw6fFHoJWaDVF7LAGQY3SMaHdhIdugvlL3qd2XJKEoZfE02uuVk3p6w
         apx2ctBLrKBOECUzbOEi8MNQR2CloNQWjaxEDgyrSBIM4k0b+I7Ad6Ih2o/7opUeoTWf
         bZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514367; x=1775119167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBHIKjGZDQYwqktWgoWqWbyzVzuD2Kcb8EQgt8K2gjs=;
        b=O1Xue6h3UdU/Fs8Yk+0BVF66F+I6q6jJL4NGOQ4715amzBuj0bkBqwOugxk8BMEapz
         7MZT7Jo3r+cs/do71gTC6umIL/ZFKHi9o6F+ezsBzn4vUnklJ+fvQCtxcVWqNVDN/gkZ
         gFZXg6tJh9MWvjqKfSUkh/lLQkHaYIl0rvVYopch8Y9wtQcc+0liSsVy5k+9cQ1XM2Hh
         YWL4roUUpp2Ll+qcsbhxRDFMtpajqGN8C2ZbbgVUHi/KUBX+73JLShUMAKdVOGUQS3CT
         tb6OnM6Fk4i76GR4NkYae+2H8qNKTbh4Nj6V06QK5EFwMuxzsJC34luxBQRmcHJGumWk
         2JRg==
X-Forwarded-Encrypted: i=1; AJvYcCU3eJ7O7a3XPxUMMpm2FpDVQyzesREqxL7WkapMHe/Hg8EJibxqkDmFjBWuIR8JCkOMMOAgjZjA2AowOTQC@lists.linux.dev
X-Gm-Message-State: AOJu0YzKfb+Bluv3ZcqXUjaQaXVTIXkAmQu76vcidtEuvHdVzT8Tbv6R
	6pjSpFHX8Ss8d759W5vY6J+X2ZaQCDDhPGj5ILsDCixtNqyvdDxbOSueEJq/5AVlD4ZrEJAgNnV
	1bNlz
X-Gm-Gg: ATEYQzwkBxHvycBaMCyKAM4M1fAsT/r4o2CZuoscC/7GWV7Hzqgua3nLcX6hszY8WOf
	inlyZcaQoXHN512lqPAJ13mJPiLt9tLlY6q6H8UHnLfiE5baYEyDXRjB+2AdHxeVhQu6+VpHYhJ
	mZLP9pSnTSm35Z5nHfwVgRc7shslkdVwW5ogOL4809WwjeMd3tnvin6w/DSbmwjkP4DcLPwYLyV
	5zKKeqCfBGtDmAkSyzRrAVvXz1MtHEfo4Ouc3OZUkn8I/YgnR2Bpl86sYdpOXIG4hR5JQes0zgI
	0ilcsNemZb58ciKY7iabemmEgdt5O0C+HceKea8mPQZva2QC4vYE0VOKaOfLr+mN4AKvbalFvK1
	RQkAfybB/8nQaPALM3YALJjnlqBedJO0ws0Pcw+2BRuArCbZ9CE8t/gq+qLo5rKSzPUCvSX1wsy
	YDgxW26BnYfMVRfjeaHP4b8PryCdho
X-Received: by 2002:a05:600c:a409:b0:485:439b:683f with SMTP id 5b1f17b1804b1-48716042aaamr75459225e9.20.1774514366979;
        Thu, 26 Mar 2026 01:39:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090bbcbsm20170685e9.4.2026.03.26.01.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:39:26 -0700 (PDT)
Date: Thu, 26 Mar 2026 11:39:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idriss@gmail.com>
Subject: Re: [PATCH v3 0/4] clean up error handling
Message-ID: <acTwujeiZ5VnnZeM@stanley.mountain>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326081627.5841-1-omer.e.idrissi@gmail.com>

Sorry, I'm going to ask that you send these one last time. It should
just be 2 patches.  patch 1 stays the same, and patches 2, 3 and 4 get
squashed into the same patch.

The thing is that right now we're changing sdio_init() and then
cleaning up the callers.  We should change it and clean up the callers
all in one go.  One thing per patch means "One complete thing" not
"half a thing per patch".  It makes it easier to review when it's done
in one go, because otherwise, when I'm reviewing patch 2, I have to
check all the callers anyway.

regards,
dan carpenter

