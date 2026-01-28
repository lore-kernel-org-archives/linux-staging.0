Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3E288CA3
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606905; cv=none; b=rxsV52J1fcc01gvHNb0H0/j9ggt94CHtjo9fPkuTV42hSaa8q2MeYxvW63l7EIhdnNiGrlAiSuWpmMON69Ch1tUMtNSjgXs+7sgl2FJ3QkMm91e5WIhNW44EcLajPc5xLoAEXlWRhkPHsUBzawPXIZTp29cPSqQLSwChFg7WzJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606905; c=relaxed/simple;
	bh=kPcbbevVhJlCEBzXzO406NdwUd7Cj27M4P7lSigLkdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fi8eLU/C9YosroadUULyzVoggaWwM18d31sCBSP1msBcZnEeIBDS2QMNY2j01gLP6pcYy/x8c0qF8DMELN3B7fqOtEcYVOuux5oezf6MowyipYDMglzEW6fs1+v3+73FrLJdMk+3qsa5z9StFZu7yjtLz+iNmFVpdK4WAlhYlWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XDhBIU9j; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XDhBIU9j"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b884a84e622so1093412766b.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 05:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769606901; x=1770211701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZagjdEHQ21hUp48jB8mdfWlYbNhCwoXWZ/IjA+v/NaQ=;
        b=XDhBIU9jbPdPnDF90mVALWFmPaCeK0trzLT5PVYxLkpAquHr8tpdNqrkNCwGH5wUpH
         cNLh8kYWzbN/MOcZEgNjEV7xMPfrMO9fT+ReO/ottSp/LJIP70o0d3x0m9QihRrsl2eL
         LiojAIWVREqpD4vcP9x/f+OZhE2CZPFzrtGUC+Ijn+brWaBnWWql5zsGoKlQ1tn+FXTo
         Pb/N9tt6ynTBqFJjxXSUrISX48u6Jtit3bdJZyJCjHa4AE3FpZZfeexm8s7FJL55Px1U
         nj6ihSj+RGdIEtgTVgUYR0H8oSpzrDSxNBwITzybSBuAmeZdplUmaHc1O/zQc0ETaUuK
         vrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606901; x=1770211701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZagjdEHQ21hUp48jB8mdfWlYbNhCwoXWZ/IjA+v/NaQ=;
        b=I3Ao0W7xhxF4Hkhohyq/RJDMQIwzC9Y19d3GN7SRMh4VhcdKYCF4l/suLLgWa73DNk
         sFRJFj8+7bri3rZhbeyEfIpUk5IfAIiiU56c1D9uE/AVQnIGVk1GiaQ+ZhMN5ZR1xNzm
         vLviGV2tXHs0oEqtVbUwoUBQqRwiKII/CTfvxWP7BH+YstuirY0VUxW33ulgvt/OttoD
         lscwr3TCuJAzILNzIlDgSXiYm7mRY/swLK7ZxyOENulIVVUfv58jcsNk4c190EbOz+at
         20pvQgZ0pz/j8O7avxxsQ7rqhwLcTkXVLIlMRU4m5E4xTo2G3qeZYmiN8iM6ObVNEoPN
         uCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHQTasmCspOXzU0HyjT9HsGveejks7UhpdtFDDVvjR/HmAOL4DYBBUrvDNzdoUkD+42eG8L3w8ONiMavLM@lists.linux.dev
X-Gm-Message-State: AOJu0YyWcY+IuA3oTRSSlxcz7c+3JcxAtJLSv2qgKoxmpeuC/3XH0b2b
	0CMYIZlPbc/I27kCb7RSI/kSR/SIHZZTtKeJQ/OGO/Oh5GzsLBVZVXiAysvArrizpMo=
X-Gm-Gg: AZuq6aJrnFKExhxJxegxOewZP2ZlZ0mmRIp2I6MsOTas4msfGzy2cpTBszKjkqpusnZ
	0JfZIp3BV1Evsw/0/oKWL3/V0FZZ6VKMd0TMx82HkdoXyppDpmTBkOe824HsG/aBsTh3a7YtkLA
	QuLfyVI9czDxwEnZSm3Ff+5njhJLAyViSOQ5jO8eEUbDANLxVtMgvADFWe+n4IRqZZk/n/OZ1Bg
	oc7ln6oJWXohv6SP3PNkFKKFaqSWaS8kfRdh5u/NGqq0sK6G7dzI0yW4LIKkCJZQIfJyYr7wiwn
	5o9ejdVDLsfsbY5lntWUxJ98FaYwF6Tbs78+52PCWHb9PZCK7JmpCQFAfqDsY1O9qhCytcjX2Ax
	+PVZ3GSuJjGCDjCquMYkGV9CfDmA6QPEO+U81eLMcsC4cisrn3DdlOPDqAkBrNiWmBqzxvHIvHl
	JgJfv34aG7u81lZZJ6
X-Received: by 2002:a17:907:3e0c:b0:b88:38e9:8f89 with SMTP id a640c23a62f3a-b8daae2b120mr380653366b.0.1769606901119;
        Wed, 28 Jan 2026 05:28:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbecea68dsm131504166b.0.2026.01.28.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:28:20 -0800 (PST)
Date: Wed, 28 Jan 2026 16:28:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ChanSoo Shin <csshin9928@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Improve damage_range to mark only changed rows
Message-ID: <aXoO8Yn9JibNVs-b@stanley.mountain>
References: <20260128130503.868466-1-csshin9928@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128130503.868466-1-csshin9928@gmail.com>

On Wed, Jan 28, 2026 at 10:05:03PM +0900, ChanSoo Shin wrote:
> Instead of marking the entire display as dirty, calculate
> start_row and end_row based on off/len and mark only those rows.
> This improves performance for partial framebuffer updates.
> 
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---

This is v3 but it's not marked or described.

Have you tested this patch?  What was the speed up?

regards,
dan carpenter

