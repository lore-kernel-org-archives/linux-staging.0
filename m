Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE922B8B0
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 06:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768716361; cv=none; b=HxwBT6QrliTYr//cQrRG0v0zw/NnuO+qvott9AT5CbLQ2wnWQZH6LHOX4MoiqqDSVsqArBIc+myFIyvPgZslimW8wi3F9vQsU8SzOgco3aQC+UBqjtAVkjL5tKDrTrGFshZO9b9F4aNXpEaWcp/fUgcoErLCzSxKpEyzKQvXCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768716361; c=relaxed/simple;
	bh=DTng1IM9qxTQ9P+1W1sNhYSuHNuMSfrrQUoYLnM9yGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TXYbzSa/MxXi61IZhGX+KI5RwZX4E5d5TaiOdE4xmk64t5jE9oYnYSdew9QE2MIWSl1EY5Ms2NoL5uQje3v6LkOwUMxQoZ8PPpvv7i4HeV4qgK0n5a/dVpspm1RPFc/OKEH9hNJ/QcyfBi5nLALf7Cypbm+ughF6DMH/nUzASvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3SukR35; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3SukR35"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0833b5aeeso33361955ad.1
        for <linux-staging@lists.linux.dev>; Sat, 17 Jan 2026 22:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768716359; x=1769321159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6FzxRFLeOKaSIAzZCWUzvAinLwuzb0B6VsJ0iN19ZkQ=;
        b=h3SukR35fegsQf3Uz+6Jl6omh7UdRaNT+DZ/VzYRXekXrhUw0d2egiUzzpLGvd4Nl1
         PMSg+TZmObjRUY1W53h2cYPjqnpqOHYbLgaCyzj1VaCMpXxoD1LTDT+QEBaHXB/Zt8Hj
         yvUWCRutNAjBII5auVtX6CTcSCs8cwgio2Vhnp4s7i2Ac/HUqdDJun1LLBQ8mHOtgTI+
         z3znrhYRGst+xDvYa5OCaroZZAp2atObOQJEN0tJ7Q6yKt/11nEHDpr/EEVtEqsBp4HU
         XaVjWtpk8FF8EOUSTR94ccs1v4vLWxDxcuSXZz6TYul1qaES3dsVsnDmEWdthud0SfJa
         S7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768716359; x=1769321159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FzxRFLeOKaSIAzZCWUzvAinLwuzb0B6VsJ0iN19ZkQ=;
        b=E20/zBUGelYlUlOR5qWYP486NrctqcK5KF9gt+yNl0dx9J3qpd5xNu0/0c6O5uHlH3
         HfHf4seIb39IQYZKeGE6GofHVWvGl5PCs7PYYS56d6lSagQzisM0jV0DUoGXtczHrYNl
         o4ck7wz8GuHDxg+XtOXFRx8jH0qZUfj8VAIhQBNVm2s98lBC7TbZD+5wQZnzvWOy1UYz
         SOoXbVjFtW0urH3Ur3xNvHic/LiRR1yF5ZtJvL8P25SOGnDRMKkKO1wh5uw8WTI9mgZA
         jyPUA+oVALOMszI1MU0ueHDmSmiauvROu8lZ+eoHjYGI7yv5dPdlUTPAxFXonzCfHQ1y
         8fhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5vYkAJVheAQiLa6Yj3licSRzJhxD8Q69WZcsfHm3mJ3dLJ/yM1qZuGvPpo+X7lf1eMIRmEYyQCxx3rjrs@lists.linux.dev
X-Gm-Message-State: AOJu0YyRbkVaZD8SBxxQUL6kY4va8kxdQayTYwNW3LTFeUQC6SfUp72n
	4IF2WHnD4uharhmC88+o7dPTLfHBQoTCk89tTX1hsezFjs/CuLfFicSc
X-Gm-Gg: AY/fxX7PtRwkiS5v2e7s4X3dKz7TMAy35iSPYr5FuZy2/vQLqJTFFZhpNxUjmG4SAxb
	W8w1EYlg/cOrGoqAeXTW4i30sCPKgPsj2pkpK36wrdtXD3vABVIgffQNYFrw2chTQyEGTzSFHI6
	JLemcLAggIkp1GxWio9knwd1CkRo4Czmmb04tyCSNzOmH08aqVc2itbFOQf91d0OrCw21pzdUEm
	odVLdLfGkF2yq5xPJAG8UNvn4rCx2kgO+RLX1NTxuXg84XxmdZc/NKeHAA4JDOEeDHrAop4/i5P
	4PncgHGwqsZLxJjeT5kVNm33pbI5l0X4878UPh4Ic4Az8S4yoMfIDiq1ROOKt2QS4pVd9ktWwFD
	qH1ibzK4vAT+WLZkR+dYjTtvDb1mYH0ci6Dj3KYyqJc5L+ZOfxPbiyCwwdJk4JaWCzQyXXDwYZ2
	/ll+YVs7xQInXYSiSu0zgQLAQtVbkgQuDsLxUjk3yd
X-Received: by 2002:a17:902:d48c:b0:295:425a:350e with SMTP id d9443c01a7336-2a718858410mr58956395ad.8.1768716359312;
        Sat, 17 Jan 2026 22:05:59 -0800 (PST)
Received: from debian.ari ([152.56.157.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527305490fsm5730026a91.1.2026.01.17.22.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 22:05:58 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org
Cc: gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH 0/1] staging: greybus: fw-core: use %pe for error printing
Date: Sun, 18 Jan 2026 11:35:47 +0530
Message-Id: <20260118060548.24548-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch modernizes error printing in the Greybus firmware core driver.

It replaces the old 'PTR_ERR' + '%ld' pattern with the newer '%pe'
format specifier, which prints error names instead of numbers, 
making it easy for debuging.

Archit Anant (1):
  staging: greybus: fw-core: use %pe for error printing

 drivers/staging/greybus/fw-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.5

