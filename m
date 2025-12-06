Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E018D658
	for <linux-staging@lists.linux.dev>; Sat,  6 Dec 2025 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765000144; cv=none; b=ApICi0AcD1c4SFPtNv2daexhx91wM4a9IgLLwdgWlfKHQH4cbFUxmVbhOX6jLemZwvW92p9wM7ckYLL+Ic8Y/UM9woiAejc9wSYDnpPZYOiabgSPsZ80QHgXBNBR8903pwDGUERKEHRTdHxphmI9EhyhY7BN0Z2d/sDAhVZpvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765000144; c=relaxed/simple;
	bh=o2coofrVs1zJomFeinBd2SFMvIp0p05SWzZkRVLf+OA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VmQ7WcRkiDIuoF5TPlIUZpi7x9Zr4CkwjzbfH3KmEuxdlYIBmuQS/35JdXlfzL2FMv+fm9JmszY0ovVhy2J+82yAj3thDYXi42fiw208GHMB+PT4+63vdHp9lLQbuwJ2U7C8Ga2Ba72LDkPCNlfUkxGzzD93d6+c7LOKc1842ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qm2dLucG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm2dLucG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2984dfae043so28984155ad.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Dec 2025 21:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765000143; x=1765604943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+5FbX5Ffi+j43ikWdc2hYKbS6cIVP11o/IGFWxUamw=;
        b=Qm2dLucGw+gGC1uUc8zossgSHR0dHmfZ68n665VcTChUcarX1NmpHu9hCZS4lkTt70
         y6Eu5QfMopCs/Ap010p/sggnQm/H4/WvOJU/iU3Ny9suWPw81XH6X30ALUaQN+d5oz1W
         cKO0TQIhyZPyifLSCAslqRi+wLuc4xk41xkeFgBZJEKnRtxOHYQoNhK+J4cGqnlFjsB7
         OJx0j+abrcIxn6Mj07O/xSiIDJsgoaQA0MhASOqHgBLizCcA3apRkqJ9u9NoAqeXep9P
         F5CRh0Ovt+U8bZFmMvg7no4sVKXDVA55jwc+i55zU1fNO7GDCG8zAyqeVfHpLyrPWMoB
         6sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765000143; x=1765604943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+5FbX5Ffi+j43ikWdc2hYKbS6cIVP11o/IGFWxUamw=;
        b=V+HbN4PkJfkh3/Nr9FCqjllwGIWixkqhUC+TVTytQZw6rNfSqE9CPyAVH9V7LUOK3p
         rYu2Kcf3t/5giZtCRzMoNszQFppoGkmyczSiWd/vHn5bp/YnLHDmqyqbXhE+/LiMtmz9
         UxGFIGVcR8inwy7p57C32GzNsxdW5LEe9wyJzbq1Ajcqlf5j6GvOttQGTAT8llBcGKot
         WrhVBuwrqdYGxXY70xxUFF2bW7aqjALJtaGnlt+3HWdrBLumvjtTOz8kddNR5zEwAMYI
         gBBokP1QI/hg6xxYO7l3hrW8sNOfK7CAmzmF+ZmTQav52iuCigovSKN5vjGzqCfT3PyS
         Hi/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj9Q+4p2L/KG7oFpw924ALWwRwZgMk/dpXfrHDwPO3q9TGOwvKPWrgaoFZHCrlceSi/uBC3qMg96LN1Kmo@lists.linux.dev
X-Gm-Message-State: AOJu0Yzin9uatOV3HkP33HMKYVitqn3yv55IezUZA71OkSJlGS45+Q5s
	5C94XTHPJBc2167NH3w3eEFZ/MUB6iTxcm+dsNgmab+H00GRC/DE5koAnU43VnQ6
X-Gm-Gg: ASbGnctQQLF20JMq4nkjw7j2awN+VuY870Bg/M59ZwYMIrl/oyMdyfBlqNjkd3KAUCR
	NN3qCybdbkEoyaVmBM9fw6kZlfJSWrC+zyr00mhWfiBEzfyTbwLnmJ+JFdtsndLP54TKlePFOFf
	Obe9EHjW9yDPNS8eOlizMDkh1JwG3m4jXHcBs/tW2j6Is8AJqyYc3uR9mwxMejQ8ex2mJv4BpP8
	zLuXEg3pnL8c/ATe0kgM3hk847kV8ofazfbt+fKSjzaCzivdTZspdeXlFGOM0jflCS0wSlewckw
	sIVadz//iogp+YEE78aO9Dvq6DfdhzoZM5wVG42WAOTttQM9zXPBcaPsr7sZXwGCDahFWZYO0D4
	yClGX1WgH1MOfJ7Hn2QZIzXjHBxWspl6pXcU5nvx/tQqJh/Q7YeFK11I8lmEyZdNsEjt6UMruIz
	j8q5nTl89ccjL38tZIoFUUsZ5YfVfU8V0=
X-Google-Smtp-Source: AGHT+IGfWF7c2l+UxfYzOKmNOmjZspZVkTKFm9uM2+JEgBwMh4W018TL8R2geZ+WaGGdnvFYesbq7w==
X-Received: by 2002:a17:902:f693:b0:275:81ca:2c5 with SMTP id d9443c01a7336-29df5de7aa4mr12038745ad.59.1765000142810;
        Fri, 05 Dec 2025 21:49:02 -0800 (PST)
Received: from localhost.localdomain ([103.98.63.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf52fsm65466005ad.39.2025.12.05.21.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 21:49:02 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v1] staging: iio: frequency: ad9832: replace long/short with u32/u16
Date: Sat,  6 Dec 2025 05:48:31 +0000
Message-ID: <20251206054831.26045-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cleanup the AD9832 header by explicitly including <linux/types.h> and
replacing ambiguous integer types with fixed-width kernel types:

- unsigned long → u32
- unsigned short → u16

This improves type clarity and ensures consistent behavior across
architectures.

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.h b/drivers/staging/iio/frequency/ad9832.h
index d0d840edb8d2..d59ad0627a9b 100644
--- a/drivers/staging/iio/frequency/ad9832.h
+++ b/drivers/staging/iio/frequency/ad9832.h
@@ -6,6 +6,7 @@
  */
 #ifndef IIO_DDS_AD9832_H_
 #define IIO_DDS_AD9832_H_
+#include <linux/types.h>
 
 /*
  * TODO: struct ad9832_platform_data needs to go into include/linux/iio
@@ -22,12 +23,12 @@
  */
 
 struct ad9832_platform_data {
-	unsigned long		freq0;
-	unsigned long		freq1;
-	unsigned short		phase0;
-	unsigned short		phase1;
-	unsigned short		phase2;
-	unsigned short		phase3;
+	u32 freq0;
+	u32 freq1;
+	u16 phase0;
+	u16 phase1;
+	u16 phase2;
+	u16 phase3;
 };
 
 #endif /* IIO_DDS_AD9832_H_ */
-- 
2.43.0

