Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A935772F
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520488; cv=none; b=RMTZUguLsIXvGq4fyXYDr1N/dQHvgZE4WCMC5iYQckmXgB9vf1z0dNudmUPgRiYB9SFcd+4IsLG6CnYcrRjGf99cM8ywrxIOQvBvN/VYMUrHyIFcbikQn82fovao5BQDQGbWopc1m5TaattHdIhJTbvQUwTF00eWS2SRlc4wacQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520488; c=relaxed/simple;
	bh=oFuZ/HRtloYM9iYhuq4BViSywKCjv8X7x4OXI/5MwlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qhk0JNAsEPaoJzWyQ7oBkkQ17YVKlu+z4VUeso+e+Ubn7Xn+6ibQe9TOfJMeV4GS/f88IywhDagI4dfMIQyYGaXRp9+jNhbn7iH1kxkSE4Cf+RW3cQZCegcBFngqUe8ZIn/QEZ0Lgc7lh139dyKQ1dYIvGsrHCebHU6NetdmjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djA9YnBV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djA9YnBV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359108fd24so3378226f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 05:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769520485; x=1770125285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt46RssgikEJSElwuUT//rA9kswfqTzUa3QvVRbgabw=;
        b=djA9YnBV2nzSUPG08OykiraEeAt0+hOLD4FPgNEzl5HpNkUwi+E3c7suqsRQ+hYguA
         Dk/PEGyy4wub4Q0qp/fm0y53IlnzQmT9zkI5S1EsbujBYEbYRh78251Yb0z39D7eJcNO
         pDoD0jCD44v1J3hGRL3WuidFRe4VSATCXm9gtGW2Zl04sD0JWnKHjZ1dMlHwTFBfRRpP
         WmUcnO7xMAaAznwH3U3AjaGjsLPfc92CRD3PtJHo29yX9mQkaAWju2LLKvAVnMNZvISn
         5rmAcr7fpmSmxgbvJzAh034RnRkSVdjcG7WQ1+oNEUTVFoAEEYb7w5EKuPZa9lklHxD1
         sa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520486; x=1770125286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt46RssgikEJSElwuUT//rA9kswfqTzUa3QvVRbgabw=;
        b=OzDemhcdpPr42z8eJn0UvHHmn7EpW3zfvuRexXcu2MW2o8qIIC2G8eyHmTiryEvEyi
         AlFxcQc8I1R3jj9z3Wva/dtqxSJKj6B8t1Blx4rUIT77bVJ+lUcyuH3HIcZBGxWvKCO6
         V8VlF/EDodGYO3CWIZW6sw5Scf0jjLq/o5xDQyW6oKvB+/PEnscOHMKoKICoOSybOXEo
         Xus2sW2M9fcl+zFNQ4A3Nr3fRyYG6YbtFoWYx4q8omyfcVwUAgnqDPDrSxMpuTDWl+pV
         9NQAiEkBSx7GjWVFvroHKNAOyUhExQ+jpCUsuNgZA3MX7ACyq24SGGY3m56vJnmpzeL5
         9AqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAm1QNjlxYR6rnemFT9UanNHAQCSt4YhuVIlxR3eB1s8u+MVdhPdHF+WJoiqsDW7vkiWR9p2lY8CC8HzKV@lists.linux.dev
X-Gm-Message-State: AOJu0YyB+Hw5mgUb7IUrdHPT9JBwwm2GFIGCI629X//V347lgikUQq+3
	l7rHPL8W8A3xys91DJOYlmBFML7GFSDbzs4EHeTzWGN5m3LkBh216TEA
X-Gm-Gg: AZuq6aKptcwLPNbHDF82Nz+1dL99At4n0Hj9hQl6KdsIvyTO8zeRF/BORNpXgetwTDA
	4blzJAOkEnM5cyFPyhn3GIEc3mgszuvZDigTiawwq+E+4nZnyD7A76WFife0UpA/La622Yj7ygh
	3JN1d5fWw5ZXMGI5fLHieQMTeFjEKZqWHbH0LnrtPMb527ZrF01PHQ9FYjaoymdFieARvU7BZD0
	okbDDcpp0W4FEIKBgfMJy6EDNX8+Izo3viUOYjGNZQSfiuPKPFQb6AQNiBww+sryBoeUKLyl9A3
	X1Mk79RQTObz+VePBnEJzCfFcvBKbbcM/ksiknN2LMPiJJuBwxznLg6W6Q0Na99OoEPlE7i55pf
	5YKzLbL6vBdANloUdl8Fo4C32wnBS5Ap8vMOeAMbgozFj0hqPpvZI2JwhcK4HDye/IIO4mTL/QE
	5hcCLulnjWWBVr7HnSfEk=
X-Received: by 2002:a5d:5d0a:0:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-435dd0a3e50mr2509020f8f.34.1769520485372;
        Tue, 27 Jan 2026 05:28:05 -0800 (PST)
Received: from Madhu.broadband ([83.106.123.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7ba0bsm38902304f8f.40.2026.01.27.05.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:28:05 -0800 (PST)
From: Madhumitha Sundar <madhuananda18@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhumitha Sundar <madhuananda18@gmail.com>
Subject: [PATCH] staging: sm750fb: replace magic number with defined constant
Date: Tue, 27 Jan 2026 13:27:58 +0000
Message-ID: <20260127132758.49650-1-madhuananda18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware wait loop in hw_sm750_de_wait uses a hardcoded magic
number (0x10000000) for the timeout counter.

Define a constant SM750_MAX_LOOP in sm750.h and use it to improve
code readability and maintainability.

Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
---
 drivers/staging/sm750fb/sm750.h    | 2 ++
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index fcb7d586e..ae07ceec1 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -12,6 +12,8 @@
 #define SM750LE_REVISION_ID ((unsigned char)0xfe)
 #endif
 
+#define SM750_MAX_LOOP 0x10000000
+
 enum sm750_pnltype {
 	sm750_24TFT = 0,	/* 24bit tft */
 	sm750_dualTFT = 2,	/* dual 18 bit tft */
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..f051bd75f 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -523,7 +523,7 @@ int hw_sm750le_de_wait(void)
 
 int hw_sm750_de_wait(void)
 {
-	int i = 0x10000000;
+	int i = SM750_MAX_LOOP;
 	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
 			    SYSTEM_CTRL_DE_FIFO_EMPTY |
 			    SYSTEM_CTRL_DE_MEM_FIFO_EMPTY;
-- 
2.43.0

