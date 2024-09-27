Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CAD1BC9F7
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431850; cv=none; b=YTHtqfmOIpRJgPKz5N1na3VmHSXNamBdkUjH+xC2v/sf4IYucDN7JppaHhO9xsUn1C5Jr2N2Z6BZKbmF9FRy0wQyFNZlWLNPN41w3RSB3S0KpR+SJnZlo85wUiC2cV5OtQdocbqJa1TBk15wi2b3fzGCPbsbcMr26X6cntB4+Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431850; c=relaxed/simple;
	bh=82V/weC2dG7OB/opVXdY0JQstq8r5ZG2HazKjLEYZz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKNGezzjzzyft9WmDDlB6aUXbZTTmdPjLwAps6hvCvR7gzSy1GNcOuPPAvrgM29vbxpDameBbluHuQR/+IeZtuG+UUYDVbB6uyYQ6NIgIAitOxVayAep0j5PG2FxC0/zyrp7Xziu+i+xz9+9ikhpwFmaQJSGXZZRAksWSDq9e+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gi273xNl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gi273xNl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso18979165e9.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727431847; x=1728036647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qihw7+w8108Risk6Cj7+yuN4HLwBR7iDJgyzm7bJIQ0=;
        b=Gi273xNlmihY5ol54RTcUeRYs1HgixnXowu9EECkgqQ3VDS3AEHNTPnet06Lby15hq
         EBPfTzBi3mqLVaY14Zhq2uswydy/yBYYmPBdzddZoHqjGVR+gLJ1ipZiBlzNIkfB/UZd
         a9a8LeyZpSfclr4kmogyDhPKmGmzoudd/UiWwS3XFkJ/EmrmkpZXS+i3VulFhqAflMTd
         XUVBkPR5qcEBJ0V0zT644rI5o6nPnI77pft+kp6fLFJy/2vVVxMwKf1iIPpttWWtU5wC
         1mzeqpyImKI/ATUL8a7WLA9oDkuiRgebteCAwiYfpCPvqQsfa38+uyaICkVhm/HxOwMR
         tMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431847; x=1728036647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qihw7+w8108Risk6Cj7+yuN4HLwBR7iDJgyzm7bJIQ0=;
        b=iNp7pYNvHtOxHP0fnEBjRXQSJiDKpJih6u29ZMamRcVK8C9qkJodsyW+uU6Jm/TiTI
         uQsMw1/YUvYCPdUu6YxDHaErQ4b6TgWvGU84i6J1pYPdfEZXNrpjuhiiUc7Qyh6tLC6E
         Sm9mEEdZOG3YNv1XyP9/jh+ooRsvDfTzoLL7jUss71tgABNnYC01P3ucjVv9+OvFC9YX
         dG8dp8RH2EWSfPrMmHgzc1WpuDlPqzBs8Ide/g0sxm46eBRKXBL4ck702PCkpeU11Vyu
         uukMMU0mN3SytnHQ3MvP4UMZAfDIX/xbEKYn/x9gFd8uVWwmSNzHdsxE6kdxCSTfrAit
         otpg==
X-Forwarded-Encrypted: i=1; AJvYcCXGPqb5sv4apL5u5lbkUwLbzit9a0peUOPS03d0ZZrGcdBILFk0OSmf2644WtVGXyHMC4mnTqBrBZpARdQO@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv0sgakcFKCiDAynK0EvE4MfXQDhGTHSSzy9SNN7E1kjL8Rj48
	oFkTXh5AGJsdhS7IiIWJyomPlSZM/ADZvvaGWuFY0OxfEIuAIgCEN0n5a37DhvU=
X-Google-Smtp-Source: AGHT+IHcgcyQYD74PprfDGjdFD8bGNs61lZ/QrBpu1J/emsL5e6sSlWoWQavNAXIDSV+FDiS4Uirog==
X-Received: by 2002:a05:600c:3550:b0:42c:b7ae:4c97 with SMTP id 5b1f17b1804b1-42f52200f17mr36164135e9.11.1727431847307;
        Fri, 27 Sep 2024 03:10:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13a28sm21924985e9.29.2024.09.27.03.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:10:46 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:10:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/3] media: atomisp: Use max() macros
Message-ID: <aad1bee3-594a-40db-b81e-f7917ab1a408@stanley.mountain>
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
 <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-cocci-6-12-v2-3-1c6ad931959b@chromium.org>

The commit message doesn't make sense.  Please, wait for a day before resending
patches.  There is no rush.

regards,
dan carpenter

