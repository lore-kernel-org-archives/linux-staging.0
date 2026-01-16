Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344925F988
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 05:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541477; cv=none; b=GDgWnetUuDV+/mqc5GF/v/PqtpjUNrho44qlbsqzubePkbrv+PhLHdmIyx2m7H0hN56HooTFELsQn4etT+69TG9u8TrHJ31efCeBwVQJvNADrbUM2LmqiuSKPfzoE+cS4cvWb/QEhrnk+HtM3WPR2UFTTiQtLodwkVCIlN8Bo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541477; c=relaxed/simple;
	bh=xRHmcUqiwt5aGmHpGO3wdgW0Kt5Jr0pOqKwaE5aXPQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awK6tvv8DjUosqYAyvOep84/p7HM1t2WJOHUeYe45n3jRKcyksogwLW3Pc8s3990UX7vJu3j6Uqzv4dabiqdZtB/YvgZUD6KkEFZge8h6DGuxmOxBY1fOEfwz0JRn5C3LWV9ogxMiuMjJsqwlALDaY+t6iwxMZS2cT1qzG67ExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdDaRsFq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdDaRsFq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so717476b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 21:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768541475; x=1769146275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9SOBfcyM7+q/rzXCsUruJpfL8CIieIYBOdaH7yXjlo=;
        b=OdDaRsFqPpouEMd2du5XFTbNfB8nyTgeBJRftzHGWjsdVpHCEFBCjQ8HWP2ccOoT/p
         S1VWC7fmUjGDJ+18UY5SsFQFccU0Y0zVQU8RQo7VE2gGZTJMg2cpT3kLMrcixsjxE5u/
         tZk1nhNb8k2737LPuA7bzT+1CtSnSn/OfNrLsjWTAToUXKx4H9FGr0mAuXpp84GHVAZK
         zBgkz6OnwbNggXL6ljtI2jNjVp2dFlgRwB/KK7FZ77XfYanxZbvoKTxyHoJtXNdVkqeu
         lFbXMNTsicxmPZMZthOvR+2W3zwEAqX5oqv2dOPW43I3kCKERHC3L0UVUTEnqfEEWO6x
         MZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768541475; x=1769146275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9SOBfcyM7+q/rzXCsUruJpfL8CIieIYBOdaH7yXjlo=;
        b=jEzMZwnBj35uj6JM8Gib9Uf5rxa2rG+ZQlm7nTJGmo7TIXw9O+VWQ5DDLT9UzkGh5/
         /zj/PKiPsjjOP4Me5uvQJ7bjotuyZCNy7QgXcwhrpCUo57dP0Q46T2A4yBKKp9Pjdeus
         1jdnv0ks6lptLlDFyRCogGuIyuEuF1DWppkZ5E7PWvRxV/uzSxAbGA4hmFPQrLryDyRj
         CasiHC0wXzShQZx1RCS+yucAuyPo6XCPpXQ9MtqVfeT6C2/BtV+Xf5fWg7oH45tndGWu
         jrWj76UvKpZu9D8uzdXFbStSugusGKi4AEwYM95soardtCb9pUb+F9u6df6Yvgi1sMUN
         e6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUcjCCBJJ73FS/GMljegbBYdOn4lbWEs/Vfkq/w6VSuRE3iZt9uecR7HCLXYn03nZQrBqa5MOH4VA97YM+i@lists.linux.dev
X-Gm-Message-State: AOJu0YwpNVIoLfvS9rgkpUdKU/e3px/0Ie0sXzDEwHG/E93wYOr3nGG/
	cDKREVSXEXWCloyB7ZQT9lKEK90E7gbR6DDEbE5EDNj+t+qVHD9PkKYY
X-Gm-Gg: AY/fxX7qeuHpk1FrKmxg+bANCd/Bs1Et1ohQRZcDg8i6lOJxY+GBhB97U1qfmjYK6Tl
	06FA9DbccuUQEz15RL0gW0toP3dFj3MV7J0lXjW8MK0jZnhBWlY3MUvgBRt0kH/ycgPI5DZ4frA
	vdGOvRmQaktMxZaSMPoX7ZTD1EwqIXwzracXwfGb/h+x1PBUIjVEAZCq6YoE8r+XZK0louCq4Xn
	mfhhRcVee2IUQM8r4+u97HfPqGaP8V2liAgxOHEnCQPl5cvDQczgk2NEEHd80c4EmDfkzhUa0oL
	AB/9aA/AuiYsTN2KM6h8/glxpnoh3ClTNn2pN07+pXVQWyYXNn1zhwUTMqHqe87ClHqvelViow2
	upkhLoPpI2O80gQZyFt6x5fu59cclgSaLuf2JsK1yUhghpcMgcK5yHCbqQu5I2QX8ATdiBnPMSQ
	Xhz4XalQFDk+QhAgaNuISs2PksRK9f
X-Received: by 2002:a05:6a20:12c1:b0:38d:ee4a:e833 with SMTP id adf61e73a8af0-38dfe7996dfmr2034542637.62.1768541475391;
        Thu, 15 Jan 2026 21:31:15 -0800 (PST)
Received: from snowman ([2401:4900:4ffd:9a9f:7003:5e9c:3fa9:4130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35274445a03sm297321a91.7.2026.01.15.21.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 21:31:14 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 0/4] staging: rtl8723bs: coding style and refactoring cleanups
Date: Fri, 16 Jan 2026 11:00:48 +0530
Message-ID: <20260116053052.4198-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs minor refactoring and
coding style cleanups in the rtl8723bs driver,
focusing on rtw_xmit.c and addressing checkpatch.pl
warnings.

---
Changelog:
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Fixed incorrect commit messages.

Note: I noticed this driver uses a custom N_BYTE_ALIGMENT macro for memory
alignment. Would it be acceptable if I send a follow-up patch converting
this to PTR_ALIGN since it's more commonly used in the kernel?

Khushal Chitturi (4):
  staging: rtl8723bs: fix operator and type cast spacing
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: rename CamelCase identifiers to snake_case
  staging: rtl8723bs: fix line length and alignment issues

 drivers/staging/rtl8723bs/core/rtw_cmd.c     |  17 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 238 +++++++++++--------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c   |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h |   6 +-
 5 files changed, 154 insertions(+), 111 deletions(-)

-- 
2.52.0

