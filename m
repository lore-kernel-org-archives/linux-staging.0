Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EEF32FA28
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769845129; cv=none; b=RcABZo2EITrHd31aYR9vQ6vpxfN8S4QKSyjwbB1cet9EBqqXMfj45fGe1WzuDCH3yF+awzJhlV+DsR+KDuOtdbsEr4alT2J5aWw3QeHzROUZQs4E9MyvZipsd0uQQp4ZAfInb+P0e6cpxLjqnQPhwnBiR41j0+E5d10xOI1Mqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769845129; c=relaxed/simple;
	bh=7aqbCCJ3cNIjap2RyyMRc23UzcYoh2GgCZUUzwZRJe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNCYjNXdDsHvC+/ZIfCpRor+tVRTHGwYd7Q+zu7KISB4pAlNeZprhBznxN7se6H6eYEVMSnzdCTbZt61Hgb9iCJ8Ua/AfT4bs8+Gp9kEnh3gOHTtSTF1wXlb2Il4SfFRIz1etWETgLLyHnpU5mznW1o/cta2vKsFXSqxieVDKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTbo6xD4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTbo6xD4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b7381d2d95so1600940eec.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 23:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769845127; x=1770449927; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOS1jVACnptxdFytd8AcMZXdBxmvVr3DfIRt4sfvRMc=;
        b=LTbo6xD4/XJU+oei/h/Qjn9slaLpF7EXLd6TtwIk4LGcVJ3DRN2K0T2z0s0CqwyyfF
         I4fyD3KKt7VG9s72PR4Ep21bN6QiLlwyjWUPfqpUYdHzcyhHsaxq6493FnuawfxtZXNs
         SbkhUVbUDjA72w7RpFLW+E6TzsrZplTXK64C7JfBL2hjAkAoyxohFF35xxTgQiCmRTnu
         QS0ksKo2x7/kaLDM8qL7saqnZ2vbMmbXkqiULk4NhEKB5k2JkNz935BKSyahEldfkC9n
         j5eH/As+akS19PiIobgL2cEYgn1u1uLVPc89yI/anWUPlPHM6yRT+Keu9Uh7bNmxwkim
         HJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769845127; x=1770449927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOS1jVACnptxdFytd8AcMZXdBxmvVr3DfIRt4sfvRMc=;
        b=eUImpt1wJ5ZjGtCph0cnPbSJhllgBj5A8M/vfC+zyWt6m9cbF69usYrBFaJbryN+P9
         G47aK7kpAqojlIwwWW7aoJS6UBndJNWOeIg8OaaIuzuJ+Q8U9iVVOgzRpWy8sqGYZLC4
         8/H+dadn+ZnwJSQtNxm01wWROoelZdyCZbKx5a3/HTYt8VbATg3l7tkRHmqXxvSjCkku
         dVuoOlG3iawWfnGyjs/Mhdzvs9M360XtSpWLYYAwH6jEfh3945ppOmP6iPFRozAFeeSJ
         uibqLn8V8kK7u32syVWyenjNBkYRYV/iyho94FLKlEyNfE6sHNG+ohR+joV211Te4+Vx
         t87Q==
X-Forwarded-Encrypted: i=1; AJvYcCUG5jYVBxb/N8LINYju3z8pEPR5/xpU66hRRl9Ag5enpyoOySJi79xhHE63qiKEyZLIgYzj0Y38mtQwxxaB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw386aCDF+S9ZeP9mP8ltAl5qSd9tblhonPGkNJEZVsXx7UbtE1
	cwDNazeOL6/c8OQAYZG4okIGXn2c2nWKCPMPQD1CyzJuXvg7aMRBqWkb
X-Gm-Gg: AZuq6aIGQZh+r06HLeB9DTtn4MWNt71QKbCawlsBGpZG/MOmz8HaLJ3JODuuWlcKW11
	ooqnMBMgiJ54ZsZU3W40u3VSy+tn/8K9HIPCVGPKBbZRGEdE87haSZPct3SakCslO6+H67P+D3E
	oqeB21nZJDyPndp+/B3hhjH075CXIfWDTwxXEkV0DTZEHxCv4Vlra6thFHHVivE0gEHJ72IRxbj
	1RCpaqvbb+OFtCrjdF+YkcsaDPnmDhJGxD+BAfObKYex/QQpWc2hUvZgNtcWgdMcT6QzvUvau1C
	kXpTSm6cOld4xfhyS3vVwX1MaypC8XgH+j+l57yHMl/aHAXattIlXJ9jqV9kcxsb9gTIZdowb3x
	4+zjWjle4d//TWFEmMakLfIIwuuRVkMtSP0o1euSc34IhBOCOSHXaMw1QgQK7qvA+ZJbGE9KyHA
	eglvzfE2qTwVRKmFKYc/1MtjBYkg==
X-Received: by 2002:a05:7301:678d:b0:2ae:5022:fe7c with SMTP id 5a478bee46e88-2b7b178aae9mr4054074eec.1.1769845127208;
        Fri, 30 Jan 2026 23:38:47 -0800 (PST)
Received: from [192.168.0.61] ([76.174.137.141])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm14337027eec.3.2026.01.30.23.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:38:45 -0800 (PST)
From: Michael Harris <michaelharriscode@gmail.com>
Date: Fri, 30 Jan 2026 23:38:27 -0800
Subject: [PATCH 1/2] staging: iio: adt7316: remove unused macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-adt7316-correct-macros-v1-1-8a71df1e42f1@gmail.com>
References: <20260130-adt7316-correct-macros-v1-0-8a71df1e42f1@gmail.com>
In-Reply-To: <20260130-adt7316-correct-macros-v1-0-8a71df1e42f1@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michael Harris <michaelharriscode@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769845124; l=1508;
 i=michaelharriscode@gmail.com; s=20260130; h=from:subject:message-id;
 bh=7aqbCCJ3cNIjap2RyyMRc23UzcYoh2GgCZUUzwZRJe0=;
 b=NGX7ge1pSXDuDL0B4/Jm5ajydDs0Q2K9iAfzSKgpTrREdkmczKC3zeyQxSkYevJqKa8MfDL55
 lvNtPIf++KpAYSoFmvZaOybeuggM4CDNtpkiAra1LiP4zqVw1Up/gym
X-Developer-Key: i=michaelharriscode@gmail.com; a=ed25519;
 pk=td/zQD3XANAhdG3Kf3mSetXiynk1Ql0eM4s0+eks5DU=

Delete macros that aren't in use

Signed-off-by: Michael Harris <michaelharriscode@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 8a9a8262c2bec34f3c3e79d8174f492b9a23fb70..4173c8822fff495e8c69d9cf6c11be9e9227a8c1 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -111,7 +111,6 @@
 #define ADT7316_AD_SINGLE_CH_MODE	0x10
 #define ADT7316_DISABLE_AVERAGING	0x20
 #define ADT7316_EN_SMBUS_TIMEOUT	0x40
-#define ADT7316_RESET			0x80
 
 /*
  * ADT7316 config3
@@ -154,7 +153,6 @@
 /*
  * ADT7316 value masks
  */
-#define ADT7316_VALUE_MASK		0xfff
 #define ADT7316_T_VALUE_SIGN		0x400
 #define ADT7316_T_VALUE_FLOAT_OFFSET	2
 #define ADT7316_T_VALUE_FLOAT_MASK	0x2
@@ -194,15 +192,6 @@ struct adt7316_chip_info {
  * Logic interrupt mask for user application to enable
  * interrupts.
  */
-#define ADT7316_IN_TEMP_HIGH_INT_MASK	0x1
-#define ADT7316_IN_TEMP_LOW_INT_MASK	0x2
-#define ADT7316_EX_TEMP_HIGH_INT_MASK	0x4
-#define ADT7316_EX_TEMP_LOW_INT_MASK	0x8
-#define ADT7316_EX_TEMP_FAULT_INT_MASK	0x10
-#define ADT7516_AIN1_INT_MASK		0x4
-#define ADT7516_AIN2_INT_MASK		0x20
-#define ADT7516_AIN3_INT_MASK		0x40
-#define ADT7516_AIN4_INT_MASK		0x80
 #define ADT7316_VDD_INT_MASK		0x100
 #define ADT7316_TEMP_INT_MASK		0x1F
 #define ADT7516_AIN_INT_MASK		0xE0

-- 
2.52.0

