Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1F18A6CF;
	Sat, 19 Apr 2025 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745099114; cv=none; b=aV184ACQZCjwZzr67zIx5uxLEDSOQg4Ysfm8yMO6/9GdcIYRDfxOBngbt19Ckw9VtZgTn/zkYDy1Bh1RHOv7BL9pQj+S/gPS7DWbim4vzPV+syxYiSmCmts5aBig3H2rs1LPPQnoZXd6lPAOiVb10uYZyHreJlkEPtLORNR4Jls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745099114; c=relaxed/simple;
	bh=INlnN5WJZfb9/Dkj+fX69QLzu8VLQMwo3bg9bkWj6ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ou3IQp6uyoe03W+uVM96tGgnQNuSTnwkHZebVf29moNq1ze9CUik4n2Hn6BfAQ+eNY5/bE9Z3YdU9IKXVDUar5qTTiJXYR5UcKG+w2wPiyfBNmUpKAuibjyytX+RcVNP5yJCUi5J2wkXMoFbiRdtbY6lwgiypZDxJjaAQqHFxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt2Zwunc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt2Zwunc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2264aefc45dso48109125ad.0;
        Sat, 19 Apr 2025 14:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745099112; x=1745703912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6dedMB2aZL7JuxKdXCBVhen/b9c/wwkdTjJKn9OdME=;
        b=Pt2ZwuncO3/U8TxqcLoWBmt8SJR07L8h/Ueq4vTeov0aBpCWEuDuG16zMFH3yjbo0p
         mxupSosz8tjJNDq5lRRPZGe6UdwEeYPfLtboCpp5VZmtMIDjZEn0hPzxHHqNlYVMvkPG
         FOu/X8Xfr05uv+dBjCOrN0lPeh8E+iwdAheh0n5eRq/yCZFgu4wmhqQGe7nQHwTzBSa5
         DfBXCVl2cKxC0llMu81rtIczYXOgNoVCndv+9/MnurSdUHcrBxT2OUMVpyHZexVvSn6c
         zFXtAoG1XO/AdRwnTzSvnzW4uBOrl6ADZ3yvCnqPfRoXzQLhtHzj1pc4mQWuVU8hNSKJ
         +eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745099112; x=1745703912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6dedMB2aZL7JuxKdXCBVhen/b9c/wwkdTjJKn9OdME=;
        b=gN1VWi0zBvDKxAF9Lk1P59ol0tjrdccoOyFZusp8ROPMqlAobh6uyyQKERcBhBOlT5
         fb9LRXeR0NHbwu/wwdn2DVlswOkbIT3g9xovDu8WUJojG1mnzZ+HcE3Sab3kMQDv0VIN
         Xa9VUgi7drt7TgHjZT6q+nQhpd58Hj1War0MrR+BBgzQeQ7kTJEkTnFtayiVJ9RRRDdN
         22WbRpYszsFDBgt/gSxjV/5d2s+y+ObAmbS49EDBfClb+W00RHskyjbj4wwKfL/XvIfR
         56/DDFJY19vE/gbdq+TOFv9W9PVl2qOs9zNB8/f93GqGV+5tS7pvD13Lg8e1FGep//V7
         B9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVbFYj9Io6x1Dumw8FpDx//7Dpr8yWMMaO46dPTLubNNUDRQTz/dT1pXwbjyJo3e4n41muYcq3OwDuZQWFnNQ==@lists.linux.dev, AJvYcCXWrNJL2DyheNqTptRpzutj8YZT4b12GoentOfRtBeyOFdpk7s0uR93j6TnV2lgCLxQYvDEzxRxzjBMwFk2vkZF5lC10Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9KAoepu8pRHo+YGuDg8BuOepEP2BtuAXDuKJLWWt9X5J0QZbj
	ZfEPwdGHod/LYW8KiWqZSZpdnLEo/6znOZL1OH5v60rar39URhbN
X-Gm-Gg: ASbGncs9p/FMVUVAHgmqHZVsXGO/xGQbDAoN8tKOrRd/XRJ9GVLyL2aoCtPm4Zp4y6r
	oFaroKfA/Fn4D4fARMTzBmCCp+aD/8zmDf6YiF1cHR5yVv1xnV3l8/dswHuN1KC8TUo8rjDS5u5
	DY7k4oFyOlbRjqAm+GKGWoQjHlMXzsY+4USudl/WwToFbuMcR4270yowWoLwrVl3vF0fXbiOrqT
	JwbbjdhPCa1dQMNb9C6sYM/DmUYxPOVeCNAA/IRcRPzcss6I0+u6unr8fGCSWCGDcmhSUgEwfKL
	be3wBx7AEuo5MzIzE3XL8Kn1rtKswd7x2yPDFIzS1qa8SA0=
X-Google-Smtp-Source: AGHT+IHRl6n/PcvFmVqTKcKkKTKXFlF0vBC9rAGLMcXBhHukm2ZXzJDlZ8iPMEeKDYk4scJUsge3Ew==
X-Received: by 2002:a17:902:f78f:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22c535acabcmr115757225ad.28.1745099112451;
        Sat, 19 Apr 2025 14:45:12 -0700 (PDT)
Received: from localhost ([2804:30c:90e:1e00:5265:5254:2e32:7e5])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50fe0679sm38044845ad.249.2025.04.19.14.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 14:45:11 -0700 (PDT)
Date: Sat, 19 Apr 2025 18:46:22 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: frequency: Use SLEEP bit instead of RESET to
 disable output
Message-ID: <aAQZrhBLQCa0TjOJ@debian-BULLSEYE-live-builder-AMD64>
References: <20250417135434.568007-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417135434.568007-1-gshahrouzi@gmail.com>

On 04/17, Gabriel Shahrouzi wrote:
> According to the AD9832 datasheet (Table 10, D12 description), setting
> the RESET bit forces the phase accumulator to zero, which corresponds to
> a full-scale DC output, rather than disabling the output signal.
> 
> The correct way to disable the output and enter a low-power state is to
> set the AD9832_SLEEP bit (Table 10, D13 description), which powers down
> the internal DAC current sources and disables internal clocks.
> 
> Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
Looks okay.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

Unrelated to this patch but, if anybody be looking to work on getting this out
of staging, I think maybe this driver could use out_altvoltage_powerdown ABI
instead of this custom out_altvoltageX_out_enable.
Crazy thing this driver doesn't declare a single IIO channel.
Seems to be somewhat ancient IIO driver.

Regards,
Marcelo
