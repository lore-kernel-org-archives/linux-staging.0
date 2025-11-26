Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C731A7F8
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147543; cv=none; b=qFy839hpNZJUKmIs3IKmjzv6YcCyt5w3mDh4soL+8VZCnacERZo44lfpuY0lft2+EB+BQKAKf/JN/ieXeziyCdYdxFI2JARBN+NowM89lquBTrYXyeKuZfWz+EB8vI0LWMoSJPL4c5z4Fv/dt4GO7HhuSLfyG4sx1oxPnbNBwPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147543; c=relaxed/simple;
	bh=nU9T+5BRaB/fG6RWKtMtWKMNEJMLJZh0XG1iyTeeGec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIbRiiyxMZJFfLpkNKp9ffnCvJZCpxftIY5/Fj4PydC2CAFRyfpifUWs3cy1BIoLcb90LKY/DO2pMMxJCNZ1YndWXXGnqM9jbH3+hXdbbEf+6WQBzHbUN9A0soKfqftKZ1YeiyBUcdUTecHh165NRTdriFcA9QwJLrgBhl6leZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wiN2dqXH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wiN2dqXH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b427cda88so4347038f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 00:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764147538; x=1764752338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/42H8lhYTk9A336jJOzqFf4ArqhwdfQJRSwAMTmYgKw=;
        b=wiN2dqXH7tYLmIjC5tZnQE5iQ+S90b0aibMcZglekX7NmF21fEyaWVzmpKzSWXsk02
         awpf++ta9Kf6xEsUUNGk8m/bk6ubyuD6jXTPCHZvVj5u8v8BHMLRn3ONkwjd/UPpyted
         uPSdTTpiK7p0H42kgO1zvp5oC5ELynxLUCYbdPhmRD5loBXIWjzL/WzeuqneRnlA+P1/
         VzOIkQQbfO1fCnO666m95cduIHGSo7ywQbfqTAYPvr32MnlSf8roFAV9l5iJLWqHB/5r
         iJc6nXqPqsGEF3SYFGi/KOD433XCcMN5LjbVqMcpbam9x/UxNfL4R3fo/xyNBOHmDtWy
         ukDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147538; x=1764752338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/42H8lhYTk9A336jJOzqFf4ArqhwdfQJRSwAMTmYgKw=;
        b=O2H6Zk/yiv8cc1PJgwFBr2gQjyPDVJcbgtkNyyuD/Rj33tdZ6KEHFSW5FIxCrO8a92
         D2anY4RydaygNFYF2qc9o23T9Mx1jb5z65nkQgshMp9T9NcpH4ppdvoFrKa0+ofLqf32
         TWdyAZsCmd6WtQKAYeT/IQdIzKrs1yoUskpll/Z7n2WHW/I/9BGpm+8rMGi1HFoy+QMt
         bAr96YgjufL7GhOh2eS5fL0+krzSI0CqiRPL3pMQPVbdc8P4Fp2FHai8WargAF0G6aIE
         AsrigZoBVa28iVkxdK2njWZV9gW/jQeR4vGWfcsaiK2thqFWrqDD/So+ys3f2kYyH+1m
         g5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZFMe+VaJ2SZMTCDt6Ox+my1pzUJlePdD9FqZN1WI65GaI1e12THtYBQOScO/KQb9SXiMO4uR+PFLCzUY@lists.linux.dev
X-Gm-Message-State: AOJu0YxovtNOg74Dqvd/ofTRkd4WsHDJ56G5yoij5H6ASvutWS9eK0qZ
	XSrpQoHhnNDlHlN7ddowsD8QldFX69ZhvocvxUDjKcSayYa44yBQCUqPX+EoSgshU4Y=
X-Gm-Gg: ASbGncv1pAZWdypuB340zNJYWge0ztBxgYNKLzhm/7TrzsXtbDOLXYk4wcCjUU2O61Y
	9c2Gj8T5WOb+v/ue2zM7ba/XCb3mo1efjzFKF+I+rQ27QxCW26cjLurF9Qo9NPJ2Xd83s/pokQ5
	AMZimwvV797E7sI4DWgJ/PRE693ZpzNLcaqATPu3fmVNckH8q+yV3YT4YKG5SjdLlzCw6sOlY3M
	qksKwrLmbuTBBvD/oV9486at4o/QuagVLAeiL54zwUkSl2stHMI6b/AeIKMVwpBzDMOkEvNK8WO
	rII/02oO8HhqrJuJXeqSYCU1kywYJH1IU6ssyrqTA7MYxattBBRKUB1iaDuiJIqY8K03D4GWUin
	9Rjpyo0WN5Z9IYZPiFWeAotVIyEn7avdYOFQbwZ3OLnOf3fPI9d5mIMMM1mHUep/5TGV6HzZ1+C
	I3K8xgRYWNQrY9doQ5
X-Google-Smtp-Source: AGHT+IFv1Ops8n0OeoStz9TaphopQIFsUQ0FZ2Z6R6T+mCfhb8iJ7KwfJE3DEPeRt9VhmuTMP2gI6A==
X-Received: by 2002:a5d:5848:0:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42cc1d0c9d6mr20256329f8f.47.1764147538171;
        Wed, 26 Nov 2025 00:58:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fba20esm39223866f8f.37.2025.11.26.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:58:57 -0800 (PST)
Date: Wed, 26 Nov 2025 11:58:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: tegra: vi: replace devm_kzalloc with kzalloc
 in probe
Message-ID: <aSbBTPXdk2wXQm7R@stanley.mountain>
References: <20251126065242.12186-1-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126065242.12186-1-dharanitharan725@gmail.com>

On Wed, Nov 26, 2025 at 06:52:42AM +0000, Dharanitharan R wrote:
> Replace devm_kzalloc() (line 1881) with kzalloc() in tegra_vi_probe()
> since memory must be freed manually in error paths. Freed via kfree() in
> rpm_disable, as recommended in the file comment (line 1204).
> 

drivers/staging/media/tegra-video/vi.c
  1197  static int tegra_vi_channel_alloc(struct tegra_vi *vi, unsigned int port_num,
  1198                                    struct device_node *node, unsigned int lanes)
  1199  {
  1200          struct tegra_vi_channel *chan;
  1201          unsigned int i;
  1202  
  1203          /*
  1204           * Do not use devm_kzalloc as memory is freed immediately
  1205           * when device instance is unbound but application might still
  1206           * be holding the device node open. Channel memory allocated
  1207           * with kzalloc is freed during video device release callback.
  1208           */
  1209          chan = kzalloc(sizeof(*chan), GFP_KERNEL);
  1210          if (!chan)
  1211                  return -ENOMEM;
  1212  

The comment is specific to "chan".

Your patch introduces a number of memory leaks and it's not
correct.

regards,
dan carpenter

