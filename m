Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0A26E711
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303135; cv=none; b=oT3cP+/xE4RpouQIcXmeb7dSZQ2lFwUY0tS+Ne+NwmfNVdg7IMlHxfRSAVOnM3WK2YCyKldU7hpA6FxCX+r57KOZ7sAO/GdWvg5gmjQ/JSHqhi4VwiVsHeKscWS7Nh4WQjwfEXXg30NfnFdNpr3SpZj+UDC0/lKbtTg+Nl5mU1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303135; c=relaxed/simple;
	bh=e4v8xfXE/l/P474t5VIGaSJsVAojhS5HP6Fh7dmKMvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rA6N1U9DhxWBy9lCmfdpP2GxYe3P/rrIemxyLJCxlZlqRu+Rq61XwBSZbPnDeAbYsGNzGw83CZ0AMVAfzfrQZVrb52o9rIvJ6uWkALxZsZDnL0Z4DYwczVXDvcwIz7ZvMvqYqmlbIbRJYfWhsM2K6gUJNcbNKKZAqZDNwryGl2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exqDIzaq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exqDIzaq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-658cc45847cso1593405a12.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 06:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770303133; x=1770907933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cp91ZxX/rH76xKPH5oL2GY8/xfVAUT2pLMth3HyyrWQ=;
        b=exqDIzaqWJ0jYCj7yeIK/oc9UQxpX9vYk/xis9b0TnjMZDMzGRAfdFwbZiEq6Gg9Kw
         AN/rHPN6QHv58dNSkscexF1WMkugsOiPE8ijtLYbDBk82pkvV66DoK/IAvu/LNpw4/GX
         sXLXjuY7MawgyDRajfCooYI+yfipa4xSugXwbhjkSomfbTBVv9Ia6Lu3GwN+1I13OzZk
         iIAUqQLz5TEJaUaoqPy1fWsze1heokauQIYjp9Yk+PKqREkrj0HxqiT0SblM1O9t0QX5
         YbdKoiAqrEeiWUtQ79fT5bC+CLbiEUPbyW7/EhSW0BYPWXxLw+BSgIC2jGLz/25Iau+H
         WSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303133; x=1770907933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp91ZxX/rH76xKPH5oL2GY8/xfVAUT2pLMth3HyyrWQ=;
        b=xB9qEQeJvvTtKIBfgRY2uH2OdB3lYpiEZUOS6Ka58IQe7lKPNI1N1zo9PaPIyiAKhJ
         ng5KUjAjs1wd5PFT9sbOCYyGt1zoSE1HF58Y9LoQnDRVf7Ysb9U34y4b2Rtlrvsll9ji
         dx2DQbSFaNz3kHS6sA1y4KrRCh5BPUrjqpvmj3UxlSPL+0MNYpP1dins8kT19BhGrLD3
         65FT5GFXxF5ziMhDx87UOwpyZloSmZUMa9CYAwr3pnNVEKx1NwqRKeJARBjuaxJL5S4g
         iJGRg2lf3xIbUiMCY/EcQ+wB+uC4K/9szmbQV8dcHAaojzWfvkedadhGMALgQOunFu9s
         UBtg==
X-Gm-Message-State: AOJu0Yx9f7NYSI5O+eXSPcB+y8mfuo2wJhvIOKq0qzinZ4yPmTR2ea+1
	njBDqGiuj38ajCJHZwqdfooRoP7ex17tDc61A5eKofZcAVQwYRGwOxJF
X-Gm-Gg: AZuq6aJQ1xfJF8u+xieRXqpP3OooDdocLGsaHSKEiqfmtghmiPhXrPc/KCpfKJm3C+K
	4XUapgGYVw2I5RKy3kTMIyaQq9+tjUAaiSKd+RRCcybkjV4J1mKa2IQbbB7nj7YJU0+DFY+0o+5
	YymJTiNoLn1261jMe9eRVsPCHyOxWCgMbyfkMukmsByE4rKqhzL36z5Wu5q4rzWl1tFwQQ28Unm
	xn1LUXDo0YKJcQZ4Wzf25V5NHA51LK9rGAPCdzy2x3r5DOaTCf+KMTSqn/36gL6ix3GlwUZqvsE
	zTZyaXPNcl7ragFv0+evODinGvYIDqyip+awt1sLKAtcTEi2yt1q67QXY4ColbiJy5dKK7kWnul
	9QOWiGHRPIpj0oMGzkbwV6OGaydz7FpuVJaT7Lw9z3QBvlcy3wRKexJPnuieNtHKsoRGNNQ4mqP
	7e1PM75VExj5suRxVfnvkhizrK5g==
X-Received: by 2002:a05:6402:354e:b0:659:5c63:e0f5 with SMTP id 4fb4d7f45d1cf-6595c63e254mr2511484a12.28.1770303132929;
        Thu, 05 Feb 2026 06:52:12 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a2166acsm2251025a12.18.2026.02.05.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:52:12 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove stale TODO item regarding %pM
Date: Thu,  5 Feb 2026 15:51:59 +0100
Message-ID: <20260205145159.185981-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO list asks to "find codes that can use %pM and %Nph formatting".

A grep of the driver directory shows that no manual MAC address formatting
(using "%02x:%02x:..) remains in the code, thus all instances appear to have
been converted to use "%pM".

Remove the stale entry from the TODO list.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
 drivers/staging/rtl8723bs/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index 050dcd0bffab..34c216e6da32 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,7 +1,6 @@
 TODO:
 - find and remove any code for other chips that is left over
 - convert any remaining unusual variable types
-- find codes that can use %pM and %Nph formatting
 - checkpatch.pl fixes - most of the remaining ones are lines too long. Many
   of them will require refactoring
 - merge Realtek's bugfixes and new features into the driver
-- 
2.53.0

