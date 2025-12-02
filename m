Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2430C63B
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670699; cv=none; b=s4FCmuZP8zcZrMRfUMEIUnBzHxl5BfrvZfqZD3riKVFwhysVWRvyMokC8B1OoR6s0ZfjqAFOlF0M/T7vhREsiYUeyO67phRSLov/CtwdaXeG8xm6CoIh2dLgmgdHC5xBs+Ps+JVBE+cKFm3nCcOFLbF3yZCSFO19gQ8fB91Sy7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670699; c=relaxed/simple;
	bh=MT9zrf/cg1JZkz6GyWLfeQ8v3g0Z2erfHfgpesvFVnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r83zY7aey1Gnct9Q7UVxHel3xNtmOJFQyveu03u+K4U9VidKNJ+shpsUS3nqDXbb+NYkK2+IBeJGhd07Tw7QcmKyINaT8il6j3dOwuMx9Z4WFhDcPOtgQTEqPUhIexK+HsJjsS0cWB9poWAp6ZH6n2f/u+Vj7YNIwaN+BkeUB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QByfGb/4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QByfGb/4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477aa218f20so35818605e9.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 02:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764670695; x=1765275495; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cAk3oLL8ROCJ57k2VQByXGpSqsygpTMtS752h0isB8=;
        b=QByfGb/4k8O2E/Ss0JD4Ah5lhAs37dq4+MmWUBMvT2ptRnwKk6Lv3xGfNyMF7h3vvZ
         sBIpSRY8izrJpJkRRHzhR/MkVm3E0brQex+UWK/tq1RaTcGFRr+g6+1eq44bvVhQkPwz
         MCJPw7Le7DnupG2qBXQRreD5pIo8nG/ZGyIzDpkzJjKq+Y3gk3dxvL0VO/RgK0xjGgx+
         nrwI5w1pb6tiePqx9pbZ2V5zb/gR7hoa+xxxgwrQoPKKbijNn3FmRsqZJLojd0ifvZO6
         3fQTZxmlnYOa5ib3z4+YpXAYYE63nPe4Voo1n96XyofOtHnxZPdbIFbQJtqjUekzKt7G
         FqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764670695; x=1765275495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cAk3oLL8ROCJ57k2VQByXGpSqsygpTMtS752h0isB8=;
        b=DyWoMD5R8qj5DJ05i8TuuLtrINMl52BaRDIiwRhRH6eu7rD7drgf47mhrZeTrcbbw0
         rf1ngyp436MIdGsBxvHAyu9t467wvFy/WB7+U40tjXd6T2awiEpzNYyGVwzY9YmG1iX8
         dWqlp3MFy+Nv0XV3W3gW6vMR0AZtXMQjF4Z0NhFKDhdCtYKD88/9X6zJDMlbTFgzE37H
         L4++ivRij18DLDCuoI+B9RZQThsk2cKc+Llc0CxdOu5VKsBoCVrFGB1gcNOJTZYhFqgP
         O6GnB/EQbO5BpY3XWJXi89uxHR0AeADoktO9L6bZFPJ5r/wf3v1CYlgnYs8KekZr/ZbC
         iFBA==
X-Forwarded-Encrypted: i=1; AJvYcCXvuUIszQyWU6K22Sy+rx1H4OkOqeU4UwVMY9tId0jxkjoivD/gF5A9JInBd6u6OnwZQQ7rCqfgwk8tOZIQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxpZodQ/iiMw3U8/fwShlVJ/cMqdszSmDzAVObObD+R5gy6dDfb
	qiG8C4cM05K4WRVUQwpKJYr1CepMeClB17J5FuNcMNBWYSjbl0PSw5SQy7Crm7E8QOI=
X-Gm-Gg: ASbGncvKrMzfPVVC9ZeRYFJ3ciKEjye8cJQ6V56Wm+W2qT/0h0wmoD76cOJb4w0l2MH
	BKPpHJNLjykC0x+LK6z18tJalXIWliqzqgj3X3aTyRfvxRrRbfydegp51Hz2ReOR7ug/S/pAM3w
	1zWwHqmTts79rpmx84se6htSU5C2Hp5+K724e91OIunQ5AXe1vT61V0cxoTzDh2chwRZ9QEvYFe
	wuwSAGvnDfhR5iiNhcLHiDQXh3FkR9pez2a6c8bqLvUmoqeRF2qluSbhtWlmb/VdxAspmobEUfQ
	W+kenblY4DcVm9M8jINpU3JxMTr+ZhI/1m+R97jd/atqu3qAydTi1n09SjkdwdFtJiLVIAlHkPG
	bSpHvOwSDHEFKL1qZVQVBahaQvCxVg1kpoBeUQYuAUdaJSX8+BhoTlnyb1WgKRs6WB7fOCjzEJ2
	qFXmAa6bLVeHBfUVeY
X-Google-Smtp-Source: AGHT+IHy3nFX0LKMVWLipxBkC1l1bBeysdgOp+AnUue/+gwsKv8yLm3DSpc6vz+WjLvbvqXoMhctiA==
X-Received: by 2002:a05:600c:3baa:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-477c01ecc7cmr422115765e9.34.1764670695027;
        Tue, 02 Dec 2025 02:18:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47927808a3esm12254865e9.1.2025.12.02.02.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 02:18:14 -0800 (PST)
Date: Tue, 2 Dec 2025 13:18:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: vchiq_bus: Check return value of
 of_dma_configure()
Message-ID: <aS684lo6j3ldvrPn@stanley.mountain>
References: <20251202095253.1640-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202095253.1640-1-vulab@iscas.ac.cn>

You're not working against the latest tree so this doesn't apply.

On Tue, Dec 02, 2025 at 05:52:52PM +0800, Haotian Zhang wrote:
> vchiq_device_register() ignores the return value of of_dma_configure(),
> which may return -EPROBE_DEFER when the IOMMU is not ready or other error
> codes. This allows device registration to proceed with incomplete DMA
> configuration.
> 

If of_dma_configure() returns -EPROBE_DEFER then this will just fail and
that's not really any better than the existing behavior...

regards,
dan carpenter

> Check of_dma_configure() return value and fail device registration
> on error.
> 
> Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

