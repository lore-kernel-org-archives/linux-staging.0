Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B112E8E08
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039052; cv=none; b=VYBtswzxPC6Dxeh1YVQ8Sd68GzaZw9/kfT8xqhcG6KVzPExmxl/tM2SKVHMThKjLOB6s7Tf/jK1n+W86FEKiYTTaphSIeL6XfF+o35PINJc2VIOdz3n/34+Lp6Z2DMNluUp36Sbv5XKu5fPtxGiqc8OWDEGtPR7HSz01M7+qxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039052; c=relaxed/simple;
	bh=LcnRDVEnZy6QHKQQxsP/nvCacp9OQV2gpAzUNBJMFr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbcCLee23veNilCHvUVAMJ7eI0P3tG06VyZLPJuGCv+mn0Yf7kXxSV2lBPJdSgkMrHTUTEEyIJct8glUdhgd+HSC+I/655ER4lEmaJY5o80NMeNlrzoNQDplKiLnjIMMSuJdQ6xJ5eFx6D1YqRciM19RSen9R/FIIpOSjKR3dQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A2tXb510; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A2tXb510"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ebb72384dbso704212fac.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751039049; x=1751643849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=A2tXb510DGJ5FXH4TII9ksJCZMcAA4BnrJyM/zYjAxnzHanmySrTDypXKmj5bz3Wh8
         AGCnyF6F3tAMytcvCv3f0oLoaBb/OIVfbaOwjIoSeTMfw58G6081j1K69TLWDpQMHTZH
         nEb89nrlFnim0Nc0X2x4BrrtN+cGpTZ3+jDSJUGS1nk1gaP0aUgUltE+n3PaBMnzJzaZ
         yuUGa1YUFafvsWMrH0ee31Sw+c690ECdJM1nTXvZzooefgN6LMtESurxsfN/6yRDH6vz
         HUL2lwQFsAliVKvl+9OP/Z0uALMy6LiMUBXWUF9YEoYs/Th/g0kFRIXUMf1RgH2SHPpO
         g19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039049; x=1751643849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=T+7uyF4pT5eMwG3t8O7PUS5/sRp/I4zeDqSRb2nBxh7PCX7VzC3AjoG/V21t9kVpT+
         ThQ7jkyRT4/U8xaE+/EmCMgeMqdYfMJS/+IikNr+YJ/Qnd6H7zjIzstcBjQP2smkHXvY
         P/gZESJpDIlFC3aSz0WFQBNDE6jZ0uhwyYBC1to47e0WfOZl1fav9vfxNCPrjEXvgl1Z
         J9IS0/sjRVGAjCl5b/OlzmLQSjIrtnnEvGiCG7sSf/xJytVE9ZBZ+zgjyY4vV1VBjN1S
         a7Y4YAr7BeplLe4mZWZ067zTMmSdzdL88E1MKC5qPfxFTeftCRqgRswd8MqS+0Oj8zda
         muOw==
X-Forwarded-Encrypted: i=1; AJvYcCXGzvTixGdeMU3HCs5tb6ELb7UE2sRpbvTJ2pJXfdtTEHLus7M4OWOACU4wGpOWY87GjcFPXzole4FVk2Sd@lists.linux.dev
X-Gm-Message-State: AOJu0YwYTBNXdCmTIq1gQJlTXbRSeXSXEC1/Vf7DUvdCFYeECjHjiV3e
	xuOt7R6VanUWrxoE2K2LqG0zAT4DAuJ5+fucoh/z1HwDZX2FzDn6K0a59JxPUKQbaJY=
X-Gm-Gg: ASbGncts00xTNRAmId/rElQmYOXqVqU29Sw9Fgsotz1PVGUjqiTdchBouS+UqNeql+A
	PEoOEm4apxZZSMgRhz2wp8kp+VOj0zeMQhXp3TCzWhLcMYATMufmWaks/NOoTM8mjkt8+ubAoIh
	zhMXRZCUQhkLLW5wX34hsxDqBd9zjmbAP9zj6tDaCeK4pDx79XmP/y3KBAMZTUZT1PiMPYhBHJt
	L0HVcgJ+k5E29zDQuq0BAqeYHuyYlgAXepXqAglkb9She7snAGN61uC2ZWG+63diWcHGDGec42g
	eDFoGVSrtg4B9iMtoAW9Vf50XjfjiN7dsYUvX3ANcypcR8ylyB+jZqssnSOtiZ6TU+xbvQ==
X-Google-Smtp-Source: AGHT+IHhU09H+nMf0lfOpqCHxF+Y0NTLulCnQbm0DdYiPRfdIF593CXffYxkSUXy1F9j48/+OHfs/A==
X-Received: by 2002:a05:6870:a10b:b0:29e:5897:e9d1 with SMTP id 586e51a60fabf-2efed7a51d7mr2326653fac.39.1751039049549;
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4f0f7d4sm911929fac.18.2025.06.27.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:44:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v5] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <e7dfe490-abfc-49da-8beb-50ce02678c86@suswa.mountain>
References: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>

On Fri, Jun 27, 2025 at 01:06:04PM +0300, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI, and need to be removed before this
> driver may be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


