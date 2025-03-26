Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C7A1F8901
	for <linux-staging@lists.linux.dev>; Wed, 26 Mar 2025 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743022228; cv=none; b=UcCIj1Oka+pv/7RpFbhDYyiII/AJ6na0NpXfxci1CRM4BFNUK4ZplnQimLlBkCjtHZTBYk5qM4rr6wMXQ/TxZ72U70nUqHsB54dSMUuKkBby8KVyoRT3RTdDoTbMsCgUxknFFhWd0QcrFdjDM/pwT4bUUk1Sd6ZMj837ICWYoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743022228; c=relaxed/simple;
	bh=h3EYkjw7L9UGlc3Wubv0gpRSL0eQmUMaB71c0nEDWhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a+FJ4QAUk6zMXW4rl7UCpvLaO5HRmT66NP5gEAgS37NTEY3YFxuVVjyhyz+BBxrGzournkZkaQShp1tefnLrRq+rvybD9g62VN5EadurXQJ7vOGYRdMbQ1KOr1v90Q936yPBe7IdnlGIzfaVq11JtLaKOjKND/G2MSj7FrUm12A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTb3nf6l; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTb3nf6l"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2240b4de12bso8411745ad.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Mar 2025 13:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743022226; x=1743627026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bP6P38XoUK0rcAsKbIKLNxYLayd1+Nc9zo4Ms/5SEFE=;
        b=UTb3nf6lyq5xBIuvtBGmP2aOh0nOzj0V1c6hghkNbWQGSwuT146nppe9L77UecCve4
         sWak2eddQbRYV6kykMb7rFL+drSFC+HdtJLZgyclI6vy8cWjvayC3wDSyf6kEsX7LDbb
         V0EyBXxW/OiMKgfscB/IEBjRNgrKoVONNlTXW4lu7H0VchrxOLPlk78prTllMkP/pVUk
         F/BTHXngGZCCVjtkrCwtwBpn2HMEX3rLnINTwSZje4vuLhSncVlNHDdtGbjPJQGtkyJO
         UFRWmgpgJFhPv5kIgn3NnOggHXcq9IgGmRl8/EWB9P75Qr6Yb4pDgoCx4Uji8T0UWMPq
         GLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743022227; x=1743627027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP6P38XoUK0rcAsKbIKLNxYLayd1+Nc9zo4Ms/5SEFE=;
        b=oKCrCQr+09xtSfKDFHDeUxBlwLJdwejV0dznQoXncunqlS3W6FTL7m0BRN3qmJqDct
         4xzSNH5OOvHIfbwlKTm4qCwnY7+yy3RFCZMIirCnn4f6g/Z/am4bmj8WUKOP+BXyUnjm
         IdQBn8mGquXea0LmCk9vSGzM/GdIKXk04w3xHimB17MSkxHmM22u6hIwmpPE3Rfm9h7e
         0LSYWdVAqGVasFwl3EX5UqFNGXbJP/3CZlxGQMGZzxf6kjcvZF18MpsdEWeydCGqscRi
         emFa24VBKILvF0LRazYP3TPk94eUX7RnyT6EeZrGmTTFnmlc8FgowJjNVaznqns1YxRs
         B4hw==
X-Forwarded-Encrypted: i=1; AJvYcCW1OVUL3CAEUYgmI8EPeb+W+AL86KskisispbOfS441uRSZRSf0Dhnb+cwPWxVPzLREIeuL2hqttWyQbzFE@lists.linux.dev
X-Gm-Message-State: AOJu0YweB+dduHQHmZoi8L14dJIS6d6jXExkSlbeALqcqTzEDwSmKK6k
	2IhvguyYoP+amQPxXbkqRBpTjYC4x1tPK0/LBzz//SM7d8UUkBZ8
X-Gm-Gg: ASbGncv9AYOEITbuUwBkdV1YMQSsVqyB81OM0CXLzq11sMXlRDvjG/CwpC6LpmpVu7M
	mI3D193pBlYwUAo+sSASfcMw30c1O3FCG0cZWWEwUN+02f57IVnLJAbdw06QsZ+ZvBKUklNB/Zp
	ZIYaenc/KJ4IFqYmIvtRzJ+kA4sjV0Fo+8VDLWFp/gpNvlBe0mvatt3w++/YeUJ/HriJ0x3QBAM
	6L1sG6Okjy4ZR4BK/ziQ81Bx0miplIQzIWQzVzBgwxq+9w1prSj+eZlu1bMCcMM2ZtZebvcCdFp
	fuXHHjY0S06+rHWoDfPns3gFO7tJzip0slNV1IlrEABeznm39TvKckoU3vylVYjeyX8=
X-Google-Smtp-Source: AGHT+IFlu0ktIlK5C0YIvtzx4DrdXYfKxDAoyXP1J1wg91+68H9IPtUSEvVTlnjABJd7uNAwixBmQA==
X-Received: by 2002:a17:903:19ef:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-2280481cc28mr17439445ad.4.1743022226379;
        Wed, 26 Mar 2025 13:50:26 -0700 (PDT)
Received: from fedora.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f397a2sm115291155ad.48.2025.03.26.13.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:50:26 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	marcelo.schmitt1@gmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v2] iio: frequency: ad9832: Update bit manipulation macros to use FIELD_PREP and GENMASK
Date: Thu, 27 Mar 2025 01:50:07 +0530
Message-ID: <20250326204901.44337-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update AD9832_PHASE and RES_MASK to use FIELD_PREP and GENMASK for
clean bitmask generation and improved maintainability.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 The previous patch would not apply cleanly as I was not working on a
 clean branch
 v1->v2:
 Resolve previous patch application issues
 
 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..6e463488462a 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -59,7 +59,7 @@
 #define AD9832_CMD_SLEEPRESCLR	0xC
 
 #define AD9832_FREQ		BIT(11)
-#define AD9832_PHASE(x)		(((x) & 3) << 9)
+#define AD9832_PHASE(x)	FIELD_PREP(GENMASK(10, 9), x)
 #define AD9832_SYNC		BIT(13)
 #define AD9832_SELSRC		BIT(12)
 #define AD9832_SLEEP		BIT(13)
@@ -69,7 +69,7 @@
 #define ADD_SHIFT		8
 #define AD9832_FREQ_BITS	32
 #define AD9832_PHASE_BITS	12
-#define RES_MASK(bits)		((1 << (bits)) - 1)
+#define RES_MASK(bits)	GENMASK((bits) - 1, 0)
 
 /**
  * struct ad9832_state - driver instance specific data
-- 
2.49.0

