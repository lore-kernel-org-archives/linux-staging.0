Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78A1FAF17
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073364; cv=none; b=eUM9XQ7P5vKaacWbey0agm4HPS7LUR+dyi+h+Qd3WOcrHkgh2yNLga5lzjuqKqGsaPNVy+n6By5Lawf828dFuVZZSzuRQpE5OhP2QS4BWZh+O0639ZvuFUJM0vFsEKYxsfnFX06bGsGRTP5HobQ0XoW2u3d6pLRJTUwfV0F+/do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073364; c=relaxed/simple;
	bh=vW6bLjcy/pl0fAh7JW84G9l9ES/1yZCeylRd6BjSsNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QwCnMO5NMfjnvEbQorhZFuYUIoWpzqWXeeS3Naje3zLp4CyFND7OH4mwKwyhs9rE5lYs+avxL1CNPC0Z/pYV7EQzbV9sgJpgTksjdKUh0pi95S/2/so6u6xDQYBG9l1AfHOjpf6PvVqlZAFTZwCaEinhZ0gCgdDcnlNCWFbeG6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPyMcRiV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPyMcRiV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cbcd71012so38333925ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729073362; x=1729678162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQpuP9fIuZ2xvwadQMd8xjOFC7uTJ2t0OgVhVU5345M=;
        b=CPyMcRiV/xrJo2fXQCqiG8F8yMAv0qnvCDnyrrbGAUC84wC7VpQQpxLycvp6rNnG8w
         NEwMDPQFcpKfqL2ssywI10RUP3d2DpgCTfJeHxpgNMXmVyw/bI6LAepIhNpmCQDbH0d6
         pw6WWB3uVBHBBt9lQI9OiYejffS2JbEMDmImWoCaEv4QlY9eJ4vJwfLrqNK2EOWcnKt3
         SZfO2ZWt0x6hFfWfXZIKcZsEifxMlA2iJH8RJ4sN20kzpKyuIyvv1X35ORLz17HRG777
         NFVecD6pW3DwJ5IowD45Qd1k8JXtHI9WLLlL+8kn5xNcmkVHXc6tcaEJHjnUcs7x2n7K
         sqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073362; x=1729678162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQpuP9fIuZ2xvwadQMd8xjOFC7uTJ2t0OgVhVU5345M=;
        b=fcSvIMU/ZV5D30MhHhNYHX+q6bOTR1nV4uBjdh8E+otfTlfGDpcic+IlhuKnwgQsta
         aNel3yBEik6A2lCxeRiYHT1rfT5bLMgcYWv1kvzxj+IGUUFiKJK30GVsGXT+rNlzbeN0
         /BC8tLbN7UnDMUGYjvyqUV2qgG/g3hMHu+/0s1BdQUZfOkNO/kCAfMNoCI0YXzB7LXDe
         nCJt30hJsm9R3TkASWKHgHkEvsGB2zg+kIb9J1FZQIuEt++lF6Uwy19tO5v4CPUN07nK
         5z/5vLGhpz1B5VjLjEY5cArtHQEuSdVNXkxpkXZehNSZm/6LcUeabjUXs7HfPB1yH702
         OVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDWa0FJPZFo3xRKi9ne6Sj6IZ/24Z/8WmFOkzqurpRFF71zgy2LSz2C6VS1ptrQRb2/DhJ/V5qpjzoKdEj@lists.linux.dev
X-Gm-Message-State: AOJu0YzTk2Zz4y/XO3EeSpeSXwJJcL7DsCp8GRgaYDRp4CQBN8bk6NRG
	PygAoDOUSl2fTo5u0wSOCizb7Kco80AdHu3wesaCfVIgnL7/L3IpqLu3I/ix
X-Google-Smtp-Source: AGHT+IF4xzsvzpE2nMgoZxvSCdgyzQYghTx0/iF0GHrYaGhy8YZPVt+SYZiydNbibKmAzBA5RCJKmQ==
X-Received: by 2002:a17:902:e548:b0:20c:968e:4dcd with SMTP id d9443c01a7336-20cbb1a9879mr269031385ad.7.1729073362535;
        Wed, 16 Oct 2024 03:09:22 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1806c6a9sm25560355ad.302.2024.10.16.03.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:09:21 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH v2] staging: gpib: Remove unneeded semicolon.
Date: Wed, 16 Oct 2024 15:39:14 +0530
Message-Id: <20241016100914.1617475-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch cleans up the GPIB driver by removing unneeded semicolons.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/gpib/tms9914/tms9914.c | 4 ++--
 drivers/staging/gpib/tnt4882/mite.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index aa2308cf5477..6d75294412d8 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -439,7 +439,7 @@ static int wait_for_read_byte(gpib_board_t *board, struct tms9914_priv *priv)
 				     test_bit(TIMO_NUM, &board->status))) {
 		pr_debug("gpib: pio read wait interrupted\n");
 		return -ERESTARTSYS;
-	};
+	}
 	if (test_bit(TIMO_NUM, &board->status))
 		return -ETIMEDOUT;
 
@@ -473,7 +473,7 @@ static inline uint8_t tms9914_read_data_in(gpib_board_t *board, struct tms9914_p
 	default:
 		pr_err("%s: bug! bad holdoff mode %i\n", __func__, priv->holdoff_mode);
 		break;
-	};
+	}
 	spin_unlock_irqrestore(&board->spinlock, flags);
 
 	return data;
diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/staging/gpib/tnt4882/mite.c
index adb656a5eb2c..882cc4bc122e 100644
--- a/drivers/staging/gpib/tnt4882/mite.c
+++ b/drivers/staging/gpib/tnt4882/mite.c
@@ -82,7 +82,7 @@ int mite_setup(struct mite_struct *mite)
 	if (pci_request_regions(mite->pcidev, "mite")) {
 		pr_err("mite: failed to request mite io regions.\n");
 		return -EIO;
-	};
+	}
 	addr = pci_resource_start(mite->pcidev, 0);
 	mite->mite_phys_addr = addr;
 	mite->mite_io_addr = ioremap(addr, pci_resource_len(mite->pcidev, 0));
-- 
2.34.1

