Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5D12E1CD
	for <linux-staging@lists.linux.dev>; Wed, 23 Apr 2025 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745381080; cv=none; b=fg2dMjyU6MHPKOVpnIQgmb+f0W//I6EcSCRnrDWpxQIUM0ldeBg2AZMMy/IQyABwJvYT/Fkwn2iByKQmwTmM1MhDIs3HHl+kkVIsbm6l8cl8mzaCg/Kl8SAdbMixHqQsWj8d93zj9HpkzNgJUYCYiQiTZp5t95UmqUxGENUHd5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745381080; c=relaxed/simple;
	bh=QLYcfn/WeBs9woCLnGnDrcxCf0Rs5lnjMgdmyrn4CQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QGQGsfZRGNiEW5GYVZLgu91+taTdosAjKzOEy0AFYhqwTukWvhmWtQM6J5NodrxKtQ5W3UMrLATUAfvOUXsKvC75fmc20bfxOQ5JBdDCnc3V7UIekoZVc0cb9hqY3UAqsp0JfX6i7xyQeDYfPdSbjHoHwpnDuJ+aEIenG6uW4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REXyS1Yl; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REXyS1Yl"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b078bb16607so705639a12.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 21:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745381078; x=1745985878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JaNc0pkR0bONw547U5Qqvy297DCGp0lAzMaANoLdgt0=;
        b=REXyS1YlDxSN1EftNkvO4gWmjFGZcXbUtu0xOXAPWiL4eyoGoKKWWuOGij2XGnUsB1
         Fw/bVHA+pe4gy5CR963IdRsyasSikmFBNXd7qTlJj7cAOWEg8+BlkJX+Bb96pan+A7AB
         eDMag5EsgsSpfS6sflkff36/jyHj2aQAOC/KtfQwQrnw1Su4NpZrwtvR5QAQkuHrGpZD
         pRJiT61l6Pe/stWscDbqbYcPt+W2zVhgMyLamNzsHKi9mw1RkFzAQ7I3xtf5RD3JKNtC
         vg+wQQlsJhtXXYeOgVQC6aQiijXFhZ4NwYzjAjjQvSlShtCqoS4kcK5PaGGwiotV0K6A
         8oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745381078; x=1745985878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaNc0pkR0bONw547U5Qqvy297DCGp0lAzMaANoLdgt0=;
        b=Y6ZqAthKoCeGUN6lAG/JEwoJeE8zWHUXeS8xry/eJsi//Z3TqCMIA9u8uMkTm7eavz
         x7vQsGewZW//5MJKcSOrzFF4AwQaccKUBnYfDTQp3iNbDrj+yKp45s00qQvn/7YfKKXA
         UFMWihONtH+LxV+kPyQafS4cByFA3qIh6cpXh3Y0VYo5IR2h9SVxICpk4m4EaGwWey0B
         NlmfdaDxoKy3TjpAO6TvRq/gQQItKhupKeuPvaaeOckN1kAJnF3GIuoyJRWC/IKCH/Me
         FFUbS0cgUGGIOhGv8du+2g3we32CQqkzuekmwXSjBQGnxnQzqI2s8SXY50vI+wJYnpJK
         ITfA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYEA/Dm8RAcqG3r84Ck2PPBPfX9ZYESL+toMJ1aZUlWqzCBwvtUskZ2f7oHe1i4a34MNsgpaGAOMVqO0b@lists.linux.dev
X-Gm-Message-State: AOJu0YxMC+7BDazOLSD13uV+g0JPue49EHPCTUXMs3VKfa+02ijVkZBN
	JsVaSFQqHqPT4MvwM8taG6KxlExXo/KOV4WRNCCwCQZtUPR9hROb
X-Gm-Gg: ASbGncvXnA79nodDYnwbAPATePcHcQ35B/19akzFnBvEDEbL7E2Xlhfg44YO+yVJ7O+
	ua7MGjQkWbxTPPUB+OcaypbMv8I9Vpm1/QyvNwRBt3TwVvPnPyKQNQtbWK7vYFl49uXkQzHML2c
	7k+HASjwPntE3UGdbRugsg+xG5xQRlCDETIyaY/RBbq2r3oF5n9JyeKTJ1dKAwsarpkjp8osHyg
	7PI98h9sQeMcpD3zzoZylD7UYpPrE4fb8JFRzUmjNhgIABq+seziQuKsm97X06oNXEpooUlA0MI
	UDJHS7/W+nWbRDhhTGTfhC4v42dYQTbGbAmLAKLG0HVq1wpsZGuASCmP6Uf4BOlBTv2CoQbSYrr
	ZinkLdBXDt11qQh1HaNL58K4JCDVN82CQKTeAp4ZAvCM8GiQz/xhBIPXpdEK3D10ssw==
X-Google-Smtp-Source: AGHT+IG+cMoMirYyItPads7DUv0VZo+s/pmJuZ7P26NAWUahDz4I33xxAF22GJJJXZCUJqkkMjo7ew==
X-Received: by 2002:a05:6a00:3a10:b0:730:8c9d:5842 with SMTP id d2e1a72fcca58-73e11762d53mr881535b3a.5.1745381078569;
        Tue, 22 Apr 2025 21:04:38 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaeb5c1sm9475900b3a.165.2025.04.22.21.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 21:04:38 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH] staging: sm750fb: change `enum dpms` to snake_case
Date: Tue, 22 Apr 2025 21:03:45 -0700
Message-Id: <20250423040345.11323-1-ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the entries in `enum dpms` to snake_case in order to conform to
kernel code styles as reported by checkpatch.pl

CHECK: Avoid CamelCase: <crtDPMS_ON>

CHECK: Avoid CamelCase: <crtDPMS_STANDBY>

CHECK: Avoid CamelCase: <crtDPMS_SUSPEND>

CHECK: Avoid CamelCase: <crtDPMS_OFF>

Signed-off-by: Eric Florin <ericflorin.kernel@gmail.com>
---
 drivers/staging/sm750fb/ddk750_power.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 63c9e8b6ffb3..5cbb11986bb8 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -3,10 +3,10 @@
 #define DDK750_POWER_H__
 
 enum dpms {
-	crtDPMS_ON = 0x0,
-	crtDPMS_STANDBY = 0x1,
-	crtDPMS_SUSPEND = 0x2,
-	crtDPMS_OFF = 0x3,
+	CRT_DPMS_ON = 0x0,
+	CRT_DPMS_STANDBY = 0x1,
+	CRT_DPMS_SUSPEND = 0x2,
+	CRT_DPMS_OFF = 0x3,
 };
 
 #define set_DAC(off) {							\
-- 
2.39.5

