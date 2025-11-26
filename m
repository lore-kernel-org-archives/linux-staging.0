Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A4283CB5
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178308; cv=none; b=lz/qGNCXHKXRmxCda2Ul2qJUMrxHTknhkMiD/nILes4V4a2gbPTY4NGxwm1PKxvR84NQDk9laSm9zfosxH+SUPJ+VWuCPXZNvn+FkXHJRQ8tIeh4zCINn4NfCPvCaOf0l4i420ofbF8PJBby1OwHVYyUsaSjZpcIp1Sz3oKnN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178308; c=relaxed/simple;
	bh=IE5z4OvGiYEGzC+Kr7fttHt7SjwSQj2thsO6nWhQc/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bq8a7Atxp/X4MZKTjIgHbpKPB+PbG6ZBi78MtKXMWcSZm6AGpQEgqa738XdngcAXsrS/mkVSlp9L3mZd+je24h4tUUj9M8qckcyz0bskHen9l0aGmHGJ4XMZyiT0vx9rh8had+m6j+RIE0LhvUamhDpJC+acj3Xte0k9dDfu5rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlknplVd; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlknplVd"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34374febdefso6966485a91.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 09:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764178306; x=1764783106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c4/sSUtAzeeE/CPUt+VgxJgLPTQv0pFS+vjCRTY0Hb8=;
        b=RlknplVdNxcE/2A9E4HaPXclJPey7MtiuIv9dFulQtXw4AvALc9ekVlbNyGIini1bt
         eDFVvsRClrS0s7TBLTQrgve2CFM4LDvmX1r+pWuJw0ncYyv+3rHreMxff+T1VYMYPFIk
         RtgB3kLSXxAhC3d0mN275sY1MzEM2Z8ZIjWJxig+krJLCAx93om4szvMqS6BtYwYepO5
         +NRm8SZPsYy/yRMria/NTvMSJMY6kTqKCeRNpEz0AWsNOB438w95t+2v8+mAqQjz9cby
         5I1VTNlG3rcM2nEDZiwmHqmpYLbeo7bdb4jL62hoF17FH75g/4HK1MasITqUoVk5iugq
         DO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178306; x=1764783106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4/sSUtAzeeE/CPUt+VgxJgLPTQv0pFS+vjCRTY0Hb8=;
        b=WwTda1ijILJP9Cpd65CcYD5IqgMTtDkoug8Z+CKXzSdL43I+gqX3NksT3QFp52tGjn
         +OKuJkawCQqYn8mYR+bKyvRwwhzNOuiMrJoOiVMyrVAeiqeeDrxgVsxs+FfYMnpOzUb7
         MRqPc0ky8XYoSG5OvtBSp1XdqEcZS9Rpfg+IijLk9zIv3ocAFewB3lXlxLcvwPVMIs72
         8zCpoZCxIF3fhcn8Rg32DL/Jg44VLc9p/rQ/VsB7a8CVVhIbM7qSQYgoNbDvm1q9EK7J
         0vRiZeAUoROlRN/ZyGD7d23oPhZLgK3t+mhhLHWqXuwXTdSOSFbLVj1BC40SWckwbeRN
         +7NA==
X-Forwarded-Encrypted: i=1; AJvYcCWFxHiIhDHp8c3I2sgjzCqaqew2c1TFUFMQ5Ww0IF3ioF8MiL8tgiv7OwbXOUYCfA+Jn0tXXPEO7o9leYij@lists.linux.dev
X-Gm-Message-State: AOJu0YzAx0vSdR+6bRYGBk+z8ny16yqadN63IJkfZR/gqXaGkhyKmHTV
	Y+WxvfTbgsToP9X4aec11wlLMjO27BwV/9dfI/hGiXz/10uKM727Gm+J
X-Gm-Gg: ASbGncttDmJl30QJ4xsKLDPaxNvgnSJl2Y0MXEj26GL3G3cxdO9pPL4d9StJ3IQuZDK
	6Wv4WtOPPypksehsjiTq4NKH5dYrCy3IQO/VxpXSRcXIAPVXM/Mn+su4Hc+/rB8rGfNPqBuVgZO
	SWDF2HSd4cX2NpuVUTXVPsE3B6wLVEux2CBgCyigiAGCQlt4yLvKKTG4hOe2Ga6zfHtlQJN3HZb
	kvkIif9KMEbTZr7eDDHuBBp3BtlTugVQqHrl+Zbq6EWVbn8bsRAu34r1uPCTHEh8gszKRryXvYU
	78vhFsszpkARwVw87S8skSX277ptkEWz0wY0rXqa8AsqPfzAEwVjfLT4iMMsu57Gmke1yC5bFgP
	6c6g/3lGUI4YRwxippzqKJBfY0242SdZuLU9vOUP1LlSfqsuIQfsR6AYLfEvHFAFJvWqDSNGRgP
	uahQo=
X-Google-Smtp-Source: AGHT+IGmSZrWXkGjKRQ08kgRrUu9jLFZVy3RiKBpX6yBXrMNsmGVSdERFQKyVY2RQgM4kuZ3M5MZTA==
X-Received: by 2002:a17:90b:48c5:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-34733f3eb64mr19804008a91.28.1764178305606;
        Wed, 26 Nov 2025 09:31:45 -0800 (PST)
Received: from essd ([49.37.219.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7a6105sm3150195a91.10.2025.11.26.09.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:31:44 -0800 (PST)
Date: Wed, 26 Nov 2025 23:01:38 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] most: usb: remove double cleanup of interface on
 registration failure
Message-ID: <gavusoqf5ad2xmimbtuuxnp7znm5z57srcqaf3xodenc2wggt5@otqxmfdkogrd>
References: <20251125225606.70719-1-knavaneeth786@gmail.com>
 <20251125225606.70719-3-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125225606.70719-3-knavaneeth786@gmail.com>

On Tue, Nov 25, 2025 at 10:56:06PM +0000, Navaneeth K wrote:
> Since most_register_interface() now correctly handles cleanup (calling
> put_device on failure), the manual cleanup in hdm_probe() would cause
> a double-free.
> 
> Remove the manual cleanup labels and return the error code directly.

This exact change has already been done by Johan Hovold in the following
patch: https://lore.kernel.org/all/20251029093029.28922-1-johan@kernel.org/

I find that patch in Linux-next. It must have been already applied.
and so you can drop this patch.

Regards,
Nihaal
