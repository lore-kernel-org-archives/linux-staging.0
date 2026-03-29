Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656FB1DEFE8
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774766630; cv=none; b=QG6UUabuvyWv0tk4SpK6eaNcIlwJs+8uy43AQVdl0qilQiV9JsOdMX1t+nUu9SJHz6UEvsc+GhpgBnTpNlyQ5nFrNsjNvOeBSg+YZ1tuoarqYDNNq+D64vKXcG/5FVjqCEE6vn6xZvkIDPjdZPBUkbTKqO8Daq9ZR0LNS79HMw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774766630; c=relaxed/simple;
	bh=YI7zBwABcyr6p7wx0NC7aVRMBoJG+jtEk4RwQYsug9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujeCudqEC+7lrISFQcm0pyuW4aKTilH/uzWY9kYNR1y3BSZKdEpeq3fFmOA/H9SO8zIjTFIAW0r9uUpSevnxNbPnEo/pCUhjuxaDmC9sr/EOY3B5964nEGovF6G1D5U+N87HF1nZB2P6vL/XVp5WYDGFHEUZbrUxqdKI8Wwt8bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwhPdLEd; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwhPdLEd"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so2889843f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774766628; x=1775371428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gimlAGZky6Wgy52EhlGdMoyap1XIsWTkf1RMAPCDnG0=;
        b=hwhPdLEd2oNV5GdWim6pcloJqyOeumdXv75KXkyE8CsA1UDhV2nVEhm2CKWl+QKb5E
         scgkLbM6ylqkixQJelgCF5vHYWJkqVXo35rF9TZ8vfw93g5I/xN92mTAPVun7GMMzjvu
         3dLmne1RS08tMi3PY1mp06e44BJ4AJSNhP9Vb3p5cJUXInbUCqLwVFHHZxPq0AL8RWNY
         t4aMt7Gnt1QlyXvyLT2fTG43G1AsKuXPgKZcAMzZbfJ9irqEyZVtecCwxxH6qZOfhbVQ
         7hdo+S7UN2cZubwVhhB/w9d7bc2wwdc9atvFM60DFmPpK6SK1q3msA3XroU3DZmmuTRg
         B6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774766628; x=1775371428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gimlAGZky6Wgy52EhlGdMoyap1XIsWTkf1RMAPCDnG0=;
        b=UOJ4xhvZs8SUibOJ5OGETgWMwY0tZeNj9I0f+jepf4vrm3i8qhxnKPPqVSndTLSvVF
         xxJ62uapLStJcUfj9oJzMWkJfUMemcX9xcJHGPIO+vsyfB7RsVGjuWguJBXo2s/G4yye
         OvcPeYxw8cC2Zv7sHVQnLZONsGWBarNtGI9dz+2Mni6sdLvCUl+CE/9bUvQe4aKAmTfJ
         imc8aZaX5HXARc3mPgLauPkuifm1h4DSWWWQlQ/Fjmshne4FKhgM6+0zGc6gRqjt0yl6
         BtFVhq74kw0a8tYRQ19LHRnayzFG5UWuu0SgNrd0bRMFBsk+UOX6pjGSXMLYJZ0bTTp+
         zXWw==
X-Forwarded-Encrypted: i=1; AJvYcCW1rWmKxzUP13S1Vf6a8XZx+mNgcP1Ua8YPjZzRkiaujVcREYPqGWH8U60Dhq4X6Rnm8FNq6MEgUoYTmYk2@lists.linux.dev
X-Gm-Message-State: AOJu0YwiEKlLV7sAuSwGn8Zw1J7aRZztRgnXY5KzoSEa7xdBdWC2OVb5
	gWhycVApabFmU1Zyz5CIQcp0R90mYQbehFxkzEP00ARLaTCd8t+EDOi8l+InhwSR
X-Gm-Gg: ATEYQzzZ2JQ2mOOoUT7aONfnidM6AwLI/bUAV8rYv7rLvcqVupPnRQlXfjU9o5H0BXm
	l03UJsVx3TbhiNY7TAJFXRVNtOMOS7oduA028ELq7CugnZb0zdVn/bgoMOQgsnHeO1r7trynSEr
	I02mWE4dko0893RY8G5+DtAen7zP21R948FWjkSStNF94P+lDgBXU8T48fdZHWKpM/aFFKOIOFb
	LS3m+RmbrWmfKFd7kXe0PtJeK7hfATiqTM2h3z2r/W0GAADXoMWHH2fUKwhDdRZHczRD3Gxh54v
	juuJ9W4nRtvb8kpjCntUIN7YKVJei/np0ThTRtoqvjcrW0oHoufvi901FqflEk/2Xr0imS+gBG7
	+gASlo5xY0XU9V1Kn+Yp0Z/E6b4ZqRJ8p00p9S3VZ8t+Rt5ym6+HX6pleONH3FxlyZcCAl1F9IH
	RNQ+DoZ88EaZ28RKMMXf5ponPHr2lmuNg=
X-Received: by 2002:a05:6000:1ac8:b0:439:d755:a895 with SMTP id ffacd0b85a97d-43b9ea085c5mr12969253f8f.42.1774766627633;
        Sat, 28 Mar 2026 23:43:47 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm9959636f8f.30.2026.03.28.23.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:43:47 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: david@cardinalsystem.net
Cc: andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: rename variables to snake_case
Date: Sun, 29 Mar 2026 09:43:34 +0300
Message-ID: <20260329064334.13617-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327203636.24891-1-david@cardinalsystem.net>
References: <20260327203636.24891-1-david@cardinalsystem.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on Fri, 27 Mar 2026 16:36:36 -0400, David Holland wrote:
> From: David Holland <david@cardinalsystem.net>

You don't need that.

> The Linux kernel coding style guidelines prohibit the use of CamelCase
> variable names. All variables should be snakecase.
> 
> Rename the 'ChipVersion' parameter to 'chip_version' and the
> 'AutoLoadFail' parameter to 'auto_load_fail' in hal_com.c to adhere to
> the standard snakecase naming convention.
> 
> Signed-off-by: David Holland <david@cardinalsystem.net>
> ---
> 
> Hey everyone,
> 
> This is my first attempt at submitting a patch into the Linux kernel. I always wanted to try to get my own patch submitted into the kernel so I was scrolling through the codebase and found some incorrect naming styles. I corrected the variables name that were using camelCase to use the traditional snakecase.
> 
> Thanks for reviewing,
> David

Wrap your lines, please.

Thanks,
Bera
