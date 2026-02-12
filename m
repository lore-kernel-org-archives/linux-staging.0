Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBE12D46D0
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884771; cv=none; b=FEWs/gHzpjbZEwfkCPPc6B+wc4JP/w2O3PJmhPZk17vWrwyh4ZsgmQQtXQxEUzRvmymz4oC/RJchJYTzxico71jJ8AllXCyTDhXxWp7naUzsMU0Wkp2kujsq9THbTyFOaxrqrLnWRTxnjwRtj7ecli3xppvMS7qBEEPZiaUt3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884771; c=relaxed/simple;
	bh=K8b8fVXuvD+K7Vcl/7agRj4patNYqjGXeCCPIbTaj2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jA62JD33dvzQyE3OkEHrtMglDJteFJfzdE44WWuf2E0tRHR7a8+tgHwz+f+TIVQCcbWIVJ8+eFYLPa2gpT6D0Tmqc6Sg0g3duHszfK0FK6zixgTY3Y21RPQ755oNiWESHAEP1pybBJs339bVl5w+GKs5nYYMpYgvatfrYL3hPKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrN2+ucV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrN2+ucV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so24804345e9.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770884768; x=1771489568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zT2dht2hz0jBf1LuUubwPN377HTtpsDFeMSzN0AmRmk=;
        b=DrN2+ucVB1uGpyHzcfL7ArnFuBknwhsx4IJxm9kE27fEMJWdMD3NT27FEFGWBJtntx
         /ESA8YiDrohtsoehmvO0tAyF8d342qPDa5rnQSvodi990E0wejkzP+DT3NRc3mJTU3zP
         wmDQ+oD58dSnbBbsLS4u7MgF8D8X4OyoAtU3dF32EKlHcRvuGjpGy99vLH7dAMvBT1/R
         tVGJKb9me4NOyoI4VtQzf3q82AtUfddU7EU6W67mLLO+/yEjXMuFK3V23RG2dM59TJ3L
         eQuxUdaeKiNgklUePbhMAcE6aDOEC8OdipFL0XGYHD1HggzAGBcg+iu/6t5TjO2BoawS
         D4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770884768; x=1771489568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT2dht2hz0jBf1LuUubwPN377HTtpsDFeMSzN0AmRmk=;
        b=RZtSniFDoHDOmETNfJrPwzKehPTnxv6cDvJMHOE0vA0FzFiJG2m6+0qfdPZmmjuq9p
         NVvtJZMfaT84vOSVcMWGPZD1yfzad0Il2WemvJMPIF/6BGeeXyKUAGirlcVqk7DMlIa2
         rLQzkss94TnJABwJ5tOG7berCUiQ9STqUhc/S5FTWbJXgDpyiDckDuds5R9bRF5TuLed
         A34s8CCD3RUKioh7+u3LvCsZ8C6fVbglQ0Pp0TJKLtieBasiXEYHmn3ALIEpgeF8zlGy
         gc4KBi2hQfNhtTzoHTsMwkFPjVITsC7FU9sIMix0iiU9A3a966KfaMbO4bNugJck/XGq
         oHHg==
X-Gm-Message-State: AOJu0YxnlvJMyRD9w6AKo8InXbBgJNA0HNU4vgxbqPQTzndP0rFWmqyJ
	hN8Gq4cCNsoySbRjB5MWPij4w7rOESD3mBlHRMpXh2lyyjqI1OQhh4Ds
X-Gm-Gg: AZuq6aLiJpedwdVwY8T3SWYuJV0ayM9QMlB5E11xmSe6zuU5dChfYlwxWXQ3pJxWy0h
	/9gai0oJn/hdvTtUuBnJkWys8TGEpxcPJx7Qqae30Dkxwo/UZjL6wk3lgPNhLrz/2c5J2lBl/fA
	/q3/EL65UwPpQzKmf0DrB7xuN2c0iNrRgjdpnvlMYFLkwkWVFYZi5PKzUA4estA4nTmxV+Zp+HI
	FVf46irgK0AJuOB0P2bvzWT324skfoqdt72BHQpQrjdQnStfVsrnL/OmBxeNaKMrUHR+ctWCA43
	Tl6nA05WIb0qzAfPQph3BkuWUd2x2Z4rK/dCUX90LxS5Y9u0O4FIieAwP1F/4AeEbRssAWm/VW4
	PJ6kSm+7Sjj4Sbv1wuoDkmU336dTx/i7FppO+l7s00rQDqhTq/vYaRt8JEaWVCj7jnBMvjuHFCL
	2ViauM6yJKdXHRHzsjpxbMWSgU0e6aHwzym6mc6A==
X-Received: by 2002:a05:600c:c0d1:10b0:480:3bba:1ca9 with SMTP id 5b1f17b1804b1-483670f9d35mr12869265e9.4.1770884768334;
        Thu, 12 Feb 2026 00:26:08 -0800 (PST)
Received: from sarah-VirtualBox.Dlink ([147.234.64.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a627c96sm59341245e9.2.2026.02.12.00.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:26:07 -0800 (PST)
From: Sarah Gershuni <sarah556726@gmail.com>
To: gregkh@linuxfoundation.org,
	sarah556726@gmail.com,
	dan.carpenter@linaro.org,
	arthur.stupa@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8723bs: tidy up rtw_io.c formatting
Date: Thu, 12 Feb 2026 10:23:55 +0200
Message-ID: <20260212082358.3403-1-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series resolves checkpatch.pl warnings in rtw_io.c.

All changes are style-only with no functional impact.

Patch 1 removes redundant parentheses.
Patch 2 fixes blank line style issues.
Patch 3 fixes overlong lines.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>

Sarah Gershuni (3):
  staging: rtl8723bs: remove unnecessary parentheses in rtw_io.c
  staging: rtl8723bs: fix blank line style issues in rtw_io.c
  staging: rtl8723bs: fix long lines in rtw_io.c

 drivers/staging/rtl8723bs/core/rtw_io.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.43.0

