Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742F158D66
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071936; cv=none; b=IRhh+V5trW0JlwC6H4LYe0gz3sEQVZM93aIENg4ai6c4GZYXhhf99cvMfhfv5nm7n47ZqPSDv40+TnUKWnaoR976QNYpUTqfFf1I7/3sZn7PrUljAvGKO8FBnmSJi+QNuM7siALu8ZKbSzwIpwV3ecLpUOqa01x9EUhffartuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071936; c=relaxed/simple;
	bh=6ysg+o0Q0vjgeb3Ub2WmvlFjV3vQ+V2XEH/LWmQtAJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UWe5d1F6PSsfwWX7qd9Fqt0+y/BOla8Jrx3bXelalueK8g7BD5LFfrTr0ZiFPNFlquncZA081p10K0xFVCI2uPCLKk/xMnSB0R59eNyrIWwUSC/WDQO5FiT5WPyCSaDgW4YszM1IGJxe/aTIWvJjU4dU8fG/75nUDYxAVJzIVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDR5qHFp; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDR5qHFp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d6f26ff33so3375792f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071934; x=1709676734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j82VF811BuKi5ly+pi6Q+j5FxiMcza1ds+iHobKFqbw=;
        b=bDR5qHFpTkaWtZjKgXaP1ctlC7nvRbxn9s3WRf/S6olcYq8t7olvQRVvpFAo2xTLJl
         BSc19F5P95mo+2xvuniaN/1fIVbXt8dTotQCHnhdx2HagFbQW+pQFMwF8PurZBEokE6K
         owd8jWLsD1+7NMKhkg9zqltlZjKvTKmsOOX+UOfyXf67atRZWM6Mk7EXLq2Pt4f3wD97
         jWFkVB4b/MM0PSovx5TTZOLHHtq37/rvezaj/qyoZWB9Rc3H0I1LNDQom26SZfLUYY8a
         Hy0lSRYv8R7scDIG0a8Gm4s0SaMCB8eJgBotuTwZASRDBY6N12fnFUjHCqx/E+NWhmGi
         wkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071934; x=1709676734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j82VF811BuKi5ly+pi6Q+j5FxiMcza1ds+iHobKFqbw=;
        b=Efsb+5QbaeSdElu6kwVgYo2sexoYwuWfEhdprNWyI+fEhTJV+UxxvfTqMMJVhwHdg6
         XGUxo2wnnJsG2BVpHLm7vFdrWtpIFXpPzoipVt/6sqGdaJtP3L+P4nevB28QH5ITxxqi
         Q13dOH3ASUH69l3Crv4Mqs4leigJDCSs6YzUh4IFMNyCtvA4jJ7+WcrXQeAI6z3yJ5Ah
         PeQu1OJ1DPvovV/WiydIoB20oNWjh+fpRUlyO80giu5ZG6iQD7rwJz7Lv2PylM9afQp4
         Gs89Ujg5/Ut/8BwDOdEyOde210hSsjKhV1Mnw5otX0akYSjfTTFWi2lpr/mng4BQe5R/
         yPSw==
X-Gm-Message-State: AOJu0YxnD4PSBjzAUemqSYERgpfMROnuGXFbsgrmVG5jE/dfY7MMah7r
	GjU1LjDHVb9p6lQyRk+57GoB2x2dghZUmGkaCvMov0lU9BZCsy7x
X-Google-Smtp-Source: AGHT+IGKOwBFZBio91HCw6G8GEOtwtrKmMJBdogmVmJ/wrYIKDudLLJDvyLlRZFFy9gkK+Mz6s+upw==
X-Received: by 2002:a05:6000:4e6:b0:33d:20d8:76fd with SMTP id cr6-20020a05600004e600b0033d20d876fdmr6793984wrb.28.1709071933801;
        Tue, 27 Feb 2024 14:12:13 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a056000010800b0033d202abf01sm12415560wrx.28.2024.02.27.14.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:12:13 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] staging: pi433: Move FIFO_THRESHOLD define to source file
Date: Wed, 28 Feb 2024 00:12:04 +0200
Message-Id: <20240227221204.534131-6-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221204.534131-1-ikobh7@gmail.com>
References: <20240227221204.534131-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIFO_THRESHOLD is only being used in pi433_if.c source files.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 0ec3130225db..b6c4917d515e 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -49,6 +49,7 @@
 #define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
 #define MSG_FIFO_SIZE		65536   /* 65536 = 2^16  */
+#define FIFO_THRESHOLD	15		/* bytes */
 #define NUM_DIO			2
 
 static dev_t pi433_dev;
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index e63e87fd6cce..76f0f9896a52 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -12,7 +12,6 @@
 #include "rf69_registers.h"
 
 #define FIFO_SIZE	66		/* bytes */
-#define FIFO_THRESHOLD	15		/* bytes */
 
 u8 rf69_read_reg(struct spi_device *spi, u8 addr);
 int rf69_get_version(struct spi_device *spi);
-- 
2.34.1

