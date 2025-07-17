Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7AB2F85E1
	for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762613; cv=none; b=AbG58ovx5YpvyZ5gyLHQuDz5oMjHCSGH14AT+IofCy8YedfLZiX5hbAgIg/n4qT3Rw9ywKhwzCwBdgp7os3bWq3Z8f3n8dzDLa8AM+oILk8vB/03aFTPLQRwrrZSz8yA3AQOT+AEvdyUBdNKFcZnof8pr4SU2Cn19qmwIbSPqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762613; c=relaxed/simple;
	bh=i4AOCu/t+teVCBfAnuyDW57wdR/g54HBsrTynSNwcfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWeyPW/DtQeXfXRSToSgg2s9C0Oxohv5vsCuL4TKFowlpqTcjMot/j3qcV1YtUzmIoHvQp6Lz92rKKEASnn9ONfhcv5tn3he6Y1PGKqdy5Z8IRv+SmDqq3IN3qtQlub/VRVHP3e5zie6K0O2RpMYhOKicc5F0fEOQ21AhqLXFVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCVahSRF; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCVahSRF"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73e810dbf5aso6886a34.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762610; x=1753367410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9WyUNURTxDjhSFlDNytarMEzB5jWv8rhBlf3egCP8I=;
        b=ZCVahSRFNTISUNT9htYLDmjsrcnM3C4cBorOzTbl3E4in8i3SR73mfk0fQeZTbhJQJ
         Zon95K755nVaGGHA40roKr63Cdjy9TlvPwSj8Szo7Vc3hoaNhkUbedOv9t+cPptCyLJG
         PMHnZzwgSSTymalUzbO32qZoHdyAlxyvwogw0LGC0GpaYQaHNiS0OhhNPCtp3Jx1bsdz
         m4QTNgPdJVwfH8x6EltWMlRyYelXE5EY6uQSthJ0VNlhf7DEl0DeG7MmhCYTa27R4EZS
         Pif45knPJzrsQcT77q2gSu+cvEuF8w5wiolXG7Jf1v4tpe4CnzsuXwUcZLFAJFfq7w9Q
         4Ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762610; x=1753367410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9WyUNURTxDjhSFlDNytarMEzB5jWv8rhBlf3egCP8I=;
        b=E991YLJf0xFW42n8ALrcvJOMh8dl5mWpOG627oy7fSO0+PPTnuI8o1+bzbUnTqjg3e
         SGODGowKZrrY5+GflTcIVk1BkmKuD9jS0lEIQhVrFGV8cKebvM5eQRlGZtU7nsBCqlpu
         yfoY8RKlC8a7oVvQWnDeGRRNKY/NQYDuFIpILVKCEyCtyrVGeikitbd3bEcfXDQ1RU5y
         DLZfibVRHcu2YEJ0XXBSRDLqT2qbd33CreRWnIQUfkvKP0FehX2Oo9hFGTaiU6Ebleit
         glGygQn5zUbruF8EQaympXyPrF7FQfxrvOmVhqdesFXgw8zNuI1rtFECjrgb6YZe434f
         5cFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJeuEFVHo+YkdU1u/n5Gjwk/6iDq/KOXK30pfO1R87blR/5Qymq5ZGadDIfE1r5jv4vPuPQGStv4K6u0yI@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu1tMpu0QLiEOENIjFqo8MPpo+MAazxYWIxfdSpDVkpQkL6OiV
	jAs4LRAO4CPND/gLB/4IpbF+PbxQcsUWj73W4UzaTUp+WjLEHO2gBDHc9fOWayqWoQk=
X-Gm-Gg: ASbGncsbR5Kv/49Epv4pc2hkj+w2/K+8//Gd2y1/uAP4aeXK3jTKXGHbSF4Dcl4jQgy
	iQPpAZGqhGCOB6TAAhhDTIDjCO4iBnQQXNDHZFcMP8kfXeVr8YrsGVAzf/3Nq20OeMkieP8WnKU
	US8Xw8ck+iSFgjsv4TlDYekUPdCJxDsovssUVslPbNdpu/WDvfQBDuo8/ljoHrWVp4zAhd5gUKy
	hK/tMAZE5hzFEWwetrxZ358Q/UqfNq10VxP1HmuAVtZ6M4lBx3NN80I/3oktMs3frVCDiTNyhyn
	+2nYKKBWM2LaIFxH5U6dUlL2US1kTRGdx2GF+U3/Bt7C4mCEl/y5mYpSQ/KjYuk1/t6GXOHh/QL
	pGU0M/kneEDvsJ+C1IjqBYnXnfNGE
X-Google-Smtp-Source: AGHT+IHk7/gc9YLubk1Cjji23IU9exbggTb4A51g9DQ8a5fEshA2ox0UCblR1EaUtTw1t+IxEkNNCw==
X-Received: by 2002:a05:6830:2113:b0:73e:6bd0:ff93 with SMTP id 46e09a7af769-73e6bd14111mr4602096a34.12.1752762610529;
        Thu, 17 Jul 2025 07:30:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e5d9028c4sm2024909a34.59.2025.07.17.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:30:09 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:30:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in
 atomisp_s_fmt_cap
Message-ID: <3b926b78-b95c-440d-846d-bc9d95aee714@suswa.mountain>
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>

On Thu, Jul 17, 2025 at 03:42:34PM +0300, Abdelrahman Fekry wrote:
> The function atomisp_set_fmt() modifies shared device state and expects
> callers to hold the isp->mutex for synchronization. While most internal
> callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> 
> This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> pipe->frame_info may be modified concurrently without proper protection.
> 
> - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().
> 
> Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle")
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

