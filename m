Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0753A7
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741220812; cv=none; b=VMcHTLoNSKecpxUjC81ohItocn11L9FnWqmmJIH09o0+Oa2nk/xKL5WL6wADocToArbcJB9Hrd5+0iV99gxRB+aqKdI7byrGVgw4KQPQZR1dGAFzhX5tGEGq/lqQr2SFOvY6AW/fpyPa79rVF005gWvNJj0DHz9by+BVPsxKljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741220812; c=relaxed/simple;
	bh=yZ98bLrAKhuf14tkuG1jhA6uOEIAz+pZcMMQ8oJaCJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d/HeTPj/uwKrfuXoIRWkmy7+lXiclTsw4r49HeGEHcsV+N1AkH7BfiecemMUdVOB/+OKssCWTnuEO8PIJ095u4E4lYal9MpxDBrORdOVL7+zdBUT2Azu86lp71kBHHx187jVlR46UAYQn7pqC5lCnmAhRsD6qgL8CClsJFy4L20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNUzQwYY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNUzQwYY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fe848040b1so255727a91.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 16:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741220810; x=1741825610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ98bLrAKhuf14tkuG1jhA6uOEIAz+pZcMMQ8oJaCJE=;
        b=PNUzQwYYoeke7vUnPgrNysyWz3wUllCehz0mL34Rmp3+JIJ6mNyP8cn6See6JK31Ef
         0JOJJoLpzg6bZwTlJHQj9d+PJbbKW47AgDF5+BQ1WonwknpAzya4CQsZt7gaZSj143Dn
         HsSdIuwVI8noox+3JPBoBNH16an7MdEWmsJ9T7F9Vw+rvW3WEFTm+jSB6uh+MjAhMoZu
         UHcKBQFrxlsvwLBwPkXZSLiH29/Fk85V2/YuERmfdqbSxsbdI4qwBULNQF1oxP2g24S3
         oBgdQVBjhnIQwmWMevSPyhbx2FN/iV9CwaAgFo47z8jEsx7C5GmdTs48cGkBj9isY267
         nx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741220810; x=1741825610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ98bLrAKhuf14tkuG1jhA6uOEIAz+pZcMMQ8oJaCJE=;
        b=xEwvg1izM1gzh12hlfR0mtJNotTd/5/Qgzd2BKrjdb41pf+NMe4awyFIR/vakTMUFP
         8l2ywYlFweE7WA5F1LuUkeV83EJH9XUgj4Pr+rSxw7ttG9Xxa7lJb8okoYr8tBQEUtUX
         WiGYN+A2xH0U5jNpv7IoQRnkcJhlzapRq9ba14LfaBWP/6af8XAca9Ww51Vrh3fFIVRo
         KmqTBDK4SLrFqlKnhNbY1eWKza9QOyreJvYOJiM5ZdWVyWScRNgbF3Z6G5/RQAJrHLXZ
         XOBK+2yuNV+yyUXNc8rnPJiLyscUeM4iF5FVb381f+CVEcZYb7NZB2EWPyqa/B0dtvvd
         giHg==
X-Forwarded-Encrypted: i=1; AJvYcCUAaHpf6xO1NEE3MJYlKXIMlIQXpJWGGsuP08rCQ1KjjOf73NbpyoJJRC5nSsGOwNiWgf/aftV9bVHCFZ9f@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7Zq4tNtu0dGSDx9IiIPKGAkJOakk+8VUOwqsBReaKQcORFj+b
	EHwNzNRHH2FZ8Aa7qjDcc5SkdDA/t1e4j0Tmlax/pQBlbnNZpOBv
X-Gm-Gg: ASbGncs8G5FKuZskpsDqfB8lTLg0GGLj+FVR06FVzCeaAjLvWO/wVEncqoXBWLLghWv
	cgeNGmhApvBZUJEyuwCYf002wwbWFwNr4S1jXyJpxGkrfa8+vTwVCA53OyjbHozK1ESdXY/K1lW
	Ajb4Iv4PxyY2SpYdBG+U2EsXEskPi0buAw9ZO7J6Un48tiOv3j5i9Ldq8THXJETDIEQSBzTU6Kk
	4SmIH4iEJZVZ7KcVlflXCUcxNmM3ETtvhTmugx8H/BbBRP6fVuuDaF6LileuP5PGGCmQefz2Qvj
	gcq4UxobrF+Qb6hsL7spHdnT9OFvdx8IhAQn5x+BrM0u+2WoseydtpQbzNA+goKn0d4=
X-Google-Smtp-Source: AGHT+IEWPHAFmZck3hGQPAHqipw2baiO89OR7YV8iIf976lkc/Lk939v272GzxvMmp80brDi5W/utw==
X-Received: by 2002:a17:90b:6cb:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-2ff49753458mr9642304a91.17.1741220809838;
        Wed, 05 Mar 2025 16:26:49 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:857:3077:7768:d8a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa5166sm184395ad.219.2025.03.05.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:26:49 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC]: Getting ADIS16203 out of staging
Date: Thu,  6 Mar 2025 05:56:45 +0530
Message-Id: <20250306002645.1555569-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADIS16203 and ADIS16201 are very similar in functionality whilst the
major difference between the accuracy in ADIS16201, I wonder if they
can be merged together into single driver, whilst also implementing
platform_device support in them.

I want to work on this, provided some opinions for me to work with
or to have a separate driver for both of them.

I see that there has been some discussion regarding the same at [1].

[1]: https://lore.kernel.org/linux-iio/20230124094450.0000272b@Huawei.com

Sincerely,
Saalim Quadri
