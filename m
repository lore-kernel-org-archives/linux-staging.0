Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D013B5B4
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 06:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728887990; cv=none; b=kRHt4YAH96YmtB1YjT8QmUgnA6rZ4Abn1rkdw1Km7OXhtBEExj4lSeiyE/+7vp86QZ88aTZgf910V/gqXzc3zpkB6Br8Ow5uLEmLCpcNr2UuLeCB6jLOsMuKELT5+xYNwp38p448elQQBXil5Npp3c1j4hgyTAwHb2E9jRcvRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728887990; c=relaxed/simple;
	bh=FQphEFLBshXmaOE3JlV8b4bsc8E8MCSy4Ag9EHta9/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9fR1s0wc1xOEh0oL1aLOUMlXglzqvtJyCU9a/7FFeCU0HQxTNcjvQXWy85SOIOnai7hJLoEQJ1/NFRDtV8Wc85ira4wo/YLQeSN1IQnPS2qXmOgwP2YXVxxikHay3MhkW8F9OX30N2YTICSquwyjPrAcnCPuue9tyi2FQy8wqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pX1ZyK4Y; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pX1ZyK4Y"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a994ecf79e7so620853866b.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728887987; x=1729492787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TRglJQJqC3kB/kH32ye3qji7yvxN38IgBxBdJmfg+rI=;
        b=pX1ZyK4Ysr0JMs8u/M3z2AusKR2DQ3sA0QGIPr+tY0QWPZG+tAkaVSia7uKsLEkmkD
         hD3ZnA628+u3z0vKTcCU8T2Ask3gurKZ/iIRTxEEiEdKgDFF2uEQDdwS0DUT+/2RKVcK
         b3i9jB2Q6nm8KZ4iLSXuHt31H8unvjPJsppgN5xvOxCWtBxJV9Fbth5SN7Dc3lhyGa4q
         iokIexAjFecBXHdO6QGSXXsgPyzc5JSllwbNh8NsmThuXqhoXPpgV+ZHzJrD+pXlHQSd
         yZijtp8yCrdrL70hd7+K1E4Xkg5QjYWzn5RnVj+K+JN3YO4WMCQhcWA9ER6iOV92dxDN
         nRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728887987; x=1729492787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRglJQJqC3kB/kH32ye3qji7yvxN38IgBxBdJmfg+rI=;
        b=p2JrWOUjlhvuvUTeKbtTs/Q1+Uj/qWlPAayAoBGxqN+LE+N0FbTmqa1xsR+EKPpvzU
         wZM3rKFWnYAhiLmE2bDvV5ksCAxOhQUbIfCTtM2Aqs+Jw6eZKIrTxP+gZHgjSeiUi/Zz
         NKFFYMXScT9tVavwSRudDhKeJPcpzBbco+C7HISvq+AbbKJ8FsUeswMkOTJfu0B994kB
         Yb3Xvhnmp5RFgMi7HExcjNrpwTtDFDsgOzCq38khJJToW4pk2cIOUM2b+Z7oKAgYcS/E
         kxrKwACcdqt19m8CZV9OXAPDX/5FPSKoghlylNc4cAG4FivCSgy+x9ksVXy+KRUijraF
         wLUw==
X-Forwarded-Encrypted: i=1; AJvYcCXjoJ2q3Bo4GVTj77gLU3TKXVC+mCcGOBAqAuMhSGjpZuszVHnq1yb22oz0oTs3z30PQRc/a7mpbahqGNkJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6CaInMf0uEA0iWjx66Ls13EXSh5HdDtByzDOT1Ec4+0C1IctT
	HUxJY1Daa69T59N/5yUtLOync8cJhcfj9p/tWhJZMBI8jPIey3Ja9KYopLmiouo=
X-Google-Smtp-Source: AGHT+IGEOBmGpibQOzzCmzYJ/UdGfI18YNbVf3R8nb5+9YuL5TW0UD8qfNB6tNPfAZALkQ3UkrXf3A==
X-Received: by 2002:a17:907:3f99:b0:a99:f4fd:31c8 with SMTP id a640c23a62f3a-a99f4fd33b7mr460434866b.22.1728887987168;
        Sun, 13 Oct 2024 23:39:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99e97b13b6sm294033366b.151.2024.10.13.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 23:39:46 -0700 (PDT)
Date: Mon, 14 Oct 2024 09:39:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: vchiq_arm: Utilise devm_kzalloc() for
 allocation
Message-ID: <43471db1-f34b-4e4c-af58-4fc0f45248bd@stanley.mountain>
References: <20241014061256.21858-1-umang.jain@ideasonboard.com>
 <20241014061256.21858-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014061256.21858-2-umang.jain@ideasonboard.com>

On Mon, Oct 14, 2024 at 11:42:55AM +0530, Umang Jain wrote:
> The struct vchiq_arm_state 'platform_state' is currently allocated
> dynamically using kzalloc(). Unfortunately, it is never freed and is
> subjected to memory leaks in the error handling paths of the probe()
> function.
> 
> To address the issue, use device resource management helper
> devm_kzalloc(), to ensure cleanup after its allocation.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---

Checkpatch warns that:

WARNING: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

(I'm the person who created this checkpatch warning.)  Fixes tags aren't just
for regressions they're for any bug fixes.  So the Fixes tag here should point
to when the driver was introduced.

Even if the Fixes tag points to the first git commit, it's useful information
so, please, always include it.

regards,
dan carpenter

