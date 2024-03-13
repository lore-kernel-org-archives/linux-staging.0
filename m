Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AF26024B
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710351197; cv=none; b=ca5IgBPg0TuyOev5goO4/AtC9tZ3/M+V+Pwizs55Z7N1Gtl2cIKhAATH/eigyJZL46conaGQINxx0dxujpJtREXOvBFbk0BCE5FHdomVCrB3a/Tx49zITPJ/OUHZ6m4dQKVUSOfWLvgq8Y2DKSTuQtcntqrA39iD0nRh2PSYzsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710351197; c=relaxed/simple;
	bh=CubIZf+/omKUsb3lOARefyB/2NtkoeTUL3xuMU6Y8/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V00akfbO+ZEp5lJQxEnen8/w6HXi8Uxhwtex7fOxA8SGzr57/CeWUoQJJU9U57axsaLOAeuj7ofx02wQJ2kfd2YOEly6WhUNK+HjY9sx+EcYIhfE+EudMuzRvJElekih67yDKpVDJu5vNyiKSDfYk+1LdBlXB8cBMBK+prbj218=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pd4iY1se; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pd4iY1se"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56838e00367so125576a12.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710351194; x=1710955994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9xJXU/djE+6AamWsghHa5QQd0IYVhNMehUxy5z/IImY=;
        b=Pd4iY1seduMJagTFfuSgfYkIzWxUZF0bmlEQCv5G/JzxjnOSi9vuVTtGKGxsYga0Eg
         iXCuY3bVu9P5EG32881bX6R3qtJuT1rUi8Aea4rzaZOzBw7E9aEjV7ka63gXkQJtwb58
         NsfiqQKL6hfo/RadFvGyCpvxOjSy2oeGv4ISBKNLKo9BXBQcaS9ngnNYrEQjhF16pjPj
         E+7CURskaG8DKWB+VivYZF33/8hqSZImedlyPIgmKMtqKfZIthaeWclA5vElp0CXK7y0
         ZIi9Y7HZbdIh9Ou1nCd3pAs8Dq/o/JyZbGVi+o8l3YCbGexm0kvgihh226H6ojythQw6
         rKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351194; x=1710955994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xJXU/djE+6AamWsghHa5QQd0IYVhNMehUxy5z/IImY=;
        b=QJfcbs8JzSEL7F98U1FfhqMjbNvZjC5iK0j8qPr6N7lt4YmvowOTh+oymxAKhnSGxL
         N0fQAriO0CtCJERXikVcOHrJWKdKfjJBboNiGJaIgqyasMX7eZ/Ongq8nr3ck5A8JeuZ
         yEDgbL8fNRHuFXyxfqj8q8saa2hMxCiYTO8q+ZHDUIs6lS0eJDTysf02ZfzR3t/DFyv5
         4OyO9c0upflmIrhTqQsXB0BwKV0fesRWvZ7u7HjhGofuxrNMogEEpD1KX/CYZl497B/h
         pe+wqPg50pdAo0gGyDlqd7YGdxu0Slvd/JT16LN+SR7/+1toDiNbqSTU3+1z37EQAYDF
         anKA==
X-Forwarded-Encrypted: i=1; AJvYcCXC0kXEVUL0kFJf7OTtHBemDIsgxn9oSl0gAx6v0H43lGmUi2FHVBRudbNNU6KQp1JSicr+7mbW37Zb2+/Sx5K1/mKscA6ZRpDRubzpVA==
X-Gm-Message-State: AOJu0YyBCDGRE0y28S6G7/tj51vq3D4H7UDGSz57m6MU1O4c8RnPIUYC
	L1nmqDGQmjSjvmdLq/IfnrmfIhYOJyB7CukZ7LUjtRntzMTELZURPWAuHr/viIo=
X-Google-Smtp-Source: AGHT+IGWVrwxwMFG8QtjiHohVmMptNb7CchWBc6WHbIGEiRSXUj1DaCqpwulZHiaYzSMSsRwqF5bPw==
X-Received: by 2002:a17:906:2e86:b0:a45:4416:1fbd with SMTP id o6-20020a1709062e8600b00a4544161fbdmr4184614eji.39.1710351194341;
        Wed, 13 Mar 2024 10:33:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx26-20020a170906fcda00b00a45a687b52asm5011259ejb.213.2024.03.13.10.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:13 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:33:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	deller@gmx.de, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/6] staging/fbtft: Remove reference to fb_blank
Message-ID: <a30fe590-23c0-4fc8-ac2a-577a2fa15e97@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-6-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-6-tzimmermann@suse.de>

On Wed, Mar 13, 2024 at 04:45:04PM +0100, Thomas Zimmermann wrote:
> The field fb_blank in struct backlight_properties is deprecated and
> should not be used. Don't output its value in the driver's debug print.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/staging/fbtft/fb_ssd1351.c | 4 +---
>  drivers/staging/fbtft/fbtft-core.c | 5 ++---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

