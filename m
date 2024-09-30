Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9026C188006
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692622; cv=none; b=BlNHIuOKmx9YfL1hq2D0u23F7Hq5O5eE4TPng75G4Q8zInQGt0snkAcVUP1IjpodiqKh8FLGUTnBzyspv4a66ddHzLbGgVd7a5RjBMlQbnmWwLNtLueBzC6Ootc8NaZm59+/ZQQo5Nt5VO4fmzxXaLF7V1UqsPNBDOHbzM3D7+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692622; c=relaxed/simple;
	bh=VGRUhIz4Vn1P2La+6gVKCXPca/yCRduCeFQ5hZhM0SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a05cdqzjoREFhl0COUxCK87guGonolb6G8m530K6HR3BuGn2Oyves8mcNRWNdXcsy9wf+OMcw9uRmDJWZYHZzg+l7pacvaI4N6/Z4yWkXHAcOPi8MgTJKuKWSaZVr1FTPIW/2E6w+qJgR3doeOGVP+POdI8PP1kW8S34lSd4tAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzUNrRkN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzUNrRkN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c718bb04a3so5527807a12.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727692619; x=1728297419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMdMSE9py3RjyD6QCh1eR0VuWp5bQ3RLbcnII21K+jM=;
        b=XzUNrRkNT0MIZA9Myiv6Zhx8JR7KntkrPXav65Rl871wtYNZ5wFd0AqbCDVuSVd8uy
         vjk2X8Cqb/cyPmuJd8oFiNhfc7t+7GyvnCjRdoaoDhaNShHIbE/THW4tRDr8qcAsTYMs
         S3AGdNqG7Gd8YzpZ8PNblTA4dfXoq2jeIdeFPNXTreSPul6qEzA3NaUsWHRCnRO7vdoD
         WPwcT7tECoHv8W66z4y+meZ5Q6kl8NMVXHbJtu4ptNbGNSUAQDXcPx8U9hYKmF58FWfW
         DsC2YhsW2z/L7facnFsEyKfoAQssV0aBt031/gnE6mGYKeo+812+9C5+HWpSGDmDbbYe
         D3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692619; x=1728297419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMdMSE9py3RjyD6QCh1eR0VuWp5bQ3RLbcnII21K+jM=;
        b=OUfzseuD+WBkDt6ITOPAygffU4r3o650m8csC8Fx26kD0fxSaCeMY57cHQSZ+//4PH
         NPxt5olU6q7I7uxWHiaZT5PFMOU3O2cYHgSNS6h8PG1CfG+C041UhbB9I9BgcPFTxus0
         dJxs1J8uL6/nHPPnuk+RF21pwSKx6iE8QvwuBd0j6nAAiA9UBPuTiv5msC6AihBLuVGQ
         cWnQTNM0DLZm20KqXa+sN2ZTc/sc1H69d1GhGCJ2Ksbq424T1A90ol0yOLpKNnPyGNVI
         tl/l5swClZ2/IyIboY9x8v4bM0w86U2af/+u4+CKfZx3Yla7nmeDvmsXrmxGxbQNX85+
         PKvg==
X-Forwarded-Encrypted: i=1; AJvYcCULA1hkn7DTGUt4x9uEyYhRs5lt+mo6X07PHjDlIezBd/lMWCqmp0+e+9hDNm/k2HQXM6W1hf1mJhYKIb5s@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt5IgJYo382aQkoihfWvn7/Zy2NQPdc+yd8pZscIoKRS+F50qh
	LveoAe69Gc9iUnIUqOS++QTtwvAn4jaYnrzhUvEf29ZKNrwW06h1d1RMtrEBPDk=
X-Google-Smtp-Source: AGHT+IHQ1cmTo4UbLbfQql8P7BUCjSn6i5rykafHKyXfrRh0KuZAMOMWuZyLvKaN1xkt7Fee6L9LCQ==
X-Received: by 2002:a17:907:781:b0:a86:894e:cd09 with SMTP id a640c23a62f3a-a93c48e80c8mr1302865466b.9.1727692618860;
        Mon, 30 Sep 2024 03:36:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2777bc4sm522635966b.14.2024.09.30.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:36:58 -0700 (PDT)
Date: Mon, 30 Sep 2024 13:36:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] staging: Fix atomicity violation in get_serial_info()
Message-ID: <bddd479b-8fa3-4e39-8ca5-f7f133a8b298@stanley.mountain>
References: <20240930101403.24131-1-chenqiuji666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930101403.24131-1-chenqiuji666@gmail.com>

On Mon, Sep 30, 2024 at 06:14:03PM +0800, Qiu-ji Chen wrote:
> Atomicity violation occurs during consecutive reads of the members of 
> gb_tty. Consider a scenario where, because the consecutive reads of gb_tty
> members are not protected by a lock, the value of gb_tty may still be 
> changing during the read process. 
> 
> gb_tty->port.close_delay and gb_tty->port.closing_wait are updated
> together, such as in the set_serial_info() function. If during the
> read process, gb_tty->port.close_delay and gb_tty->port.closing_wait
> are still being updated, it is possible that gb_tty->port.close_delay
> is updated while gb_tty->port.closing_wait is not. In this case,
> the code first reads gb_tty->port.close_delay and then
> gb_tty->port.closing_wait. A new gb_tty->port.close_delay and an
> old gb_tty->port.closing_wait could be read. Such values, whether
> before or after the update, should not coexist as they represent an
> intermediate state.
> 
> This could result in a mismatch of the values read for gb_tty->minor, 
> gb_tty->port.close_delay, and gb_tty->port.closing_wait, which in turn 
> could cause ss->close_delay and ss->closing_wait to be mismatched.
> 
> To address this issue, we have enclosed all sequential read operations of 
> the gb_tty variable within a lock. This ensures that the value of gb_tty 
> remains unchanged throughout the process, guaranteeing its validity.
> 
> This possible bug is found by an experimental static analysis tool
> developed by our team. This tool analyzes the locking APIs
> to extract function pairs that can be concurrently executed, and then
> analyzes the instructions in the paired functions to identify possible
> concurrency bugs including data races and atomicity violations.
> 

Ideally a commit message should say what the bug looks like to the user.
Obviously when you're doing static analysis and not using the code, it's more
difficult to tell the impact.

I would say that this commit message is confusing and makes it seem like a
bigger deal than it is.  The "ss" struct is information that we're going to send
to the user.  It's not used again in the kernel.

Could you re-write the commit message to say something like, "Our static checker
found a bug where set serial takes a mutex and get serial doesn't.  Fortunately,
the impact of this is relatively minor.  It doesn't cause a crash or anything.
If the user races set serial and get serial there is a chance that the get
serial information will be garbage."

regards,
dan carpenter


