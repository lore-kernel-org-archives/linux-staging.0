Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680612FB29
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302823; cv=none; b=c3fLOx1vEGN0zLE65Z9O1TByT5b0dw+j84lWgBolf77kDds//TB6OjhI4SnoqhRbwh/zGO3tp7bBJQzVLt6YDyYq9evXFEsTKfpFdXpyp8pYxi3ojzorXsi8FHyw5zbKf7p8Eqh361TfvSCmdZo5rZnEzTA/U5xkK9iISiTl1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302823; c=relaxed/simple;
	bh=6A7E8mEhs3KXYwrM2uDEBEWNmZfL2jIWrfVNakhFg2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c6LPOztzwfTTwNuMBM5u11WS4XBEeRMYRqhM2+3u051eZuYH2PVa3DDsq+svsAQtiba3WKBg08dILlG11zN+AeRuzK5x0MDyER2gTlZslVy5cMnO+VKs8Q6KlQEtPMSADUaMFezyKQO8P31rws1bc2KPzfRMawqcjbpE89Jh1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUG/kEHl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUG/kEHl"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516c87a511bso1932474e87.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302819; x=1712907619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll9cx3RyF2mwcmQbJn6nm/vNnPUvqbUfuPvzuxeiac4=;
        b=GUG/kEHl4l4O8DL+J5lGPFexlnXOQjxOwXT4xLVKc+9wIvn/zRhsStGULAZJ4gD0Q9
         MA152jpb7V4B204rs2TXbMDifRclwjf39i+3oPvH5mZ/PX+GeXB7WelQ3BlY6m0L6wmh
         54KC3IjNWKMZf8GGB1PP8OInxnwiseW2w//TqGyLNqEp4itlYbbd+hoeV78Q73B7IeMT
         pKSV6Tz7Q0RPcnxrNgAuhWfRtfmy9h0mGTYz2aUXv46QHunhmZZs8ygWWPskB1BncdoZ
         QbMHoDiInWSLoJHILuY2t/XDl8kYvHs4dNRjD8qtUe/uyat4rQpekWBdFf8+JV7O6NdN
         LcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302819; x=1712907619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll9cx3RyF2mwcmQbJn6nm/vNnPUvqbUfuPvzuxeiac4=;
        b=OB8Ck1t4972mXL2nQTFbDpPy0UCk6nrifUAZNdRd8Cg2nkDH9KrUJVh9ayYe3nLGiQ
         iJA0j6QFQfdt879GXG5sYb41qVCSThkU+vwoRvoBudJGsnsewSdH7uDdgkI2WzVrhG6m
         mXKRqSVUe4RHrNWmEGFlDwl2/DkKjDMBPe1eKs9rP07sufkIBICgWQw8hdFR3NeTLfIK
         /0WOaXinb6NGDpqldvIILvJLxlvJvNyiX//s70dGePDslNX01XiM4JQi2NO3lG421yHp
         rui2ZjF1qVJCmv5HY5UURvXJbsVxFAjjpxZ4BsSQLkuwpDR6MUJ7K7U46TqjsZPz5/M0
         uK/w==
X-Gm-Message-State: AOJu0Yy1mwGacRdHE/AC4HqZOaSlNUTAk5gQ1iacHiSPM1M1WQ9FjXpb
	vLeTN0IUywijHD9XjcnT4MylUnd4nXP3gKx59TEDRxfl+hdjCW8H
X-Google-Smtp-Source: AGHT+IFvXxRBKHpmPMp/cqVHJIstyDR+r0Bs5N44IFJVlWHFI8nUvyiKYx/SyYNlgH/fII+G4opQQg==
X-Received: by 2002:ac2:550d:0:b0:516:a1ce:6a20 with SMTP id j13-20020ac2550d000000b00516a1ce6a20mr394762lfk.24.1712302819247;
        Fri, 05 Apr 2024 00:40:19 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm1311643wrm.95.2024.04.05.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:40:18 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] staging: pi433: Reorder pi433_exit cleanup calls.
Date: Fri,  5 Apr 2024 10:40:00 +0300
Message-Id: <20240405074000.3481217-8-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405074000.3481217-1-ikobh7@gmail.com>
References: <20240405074000.3481217-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_remove was called out of order.
Ensure pi433 init & exit have reverse function calls order.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 77e37a5bd1a2..67b945a41067 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1427,9 +1427,9 @@ module_init(pi433_init);
 static void __exit pi433_exit(void)
 {
 	spi_unregister_driver(&pi433_spi_driver);
+	debugfs_remove(root_dir);
 	class_unregister(&pi433_class);
 	unregister_chrdev(MAJOR(pi433_devt), pi433_spi_driver.driver.name);
-	debugfs_remove(root_dir);
 }
 module_exit(pi433_exit);
 
-- 
2.34.1

