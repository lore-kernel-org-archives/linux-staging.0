Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76914A9C
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTgEuBOZ"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-581b6b93bd1so1024044eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396745; x=1699001545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hvuzSc5vilro8Nl+ASMbdyW2rK3NnJIlPBZvpWvELE=;
        b=nTgEuBOZNWS287ECEiJmh6mx0JYVglcX+mJ2bTQ5pWsh4NSo12PmUcUYwZ6bqZTFLK
         RPSuDeyuJpwtF4ceSSZfNjTYZ+frcl7nn6Nzxbo1JIudeuUvhuxq05IEWGJmYdOuKquK
         76BwmeD4nMxJ9+4PYdCa0pHtY9M5cY0KqxiD9rV2XI1IoEqnoQksWLDbaqJy5YLwfoIa
         1KmTL2PNfJgmPgXT4scoGG+2DbP1qoXhbjCwIZAAqtYlrcm3/uhOb6tYidFYAJJknWn4
         lFg7TTuyz/ZZrodeLpiUsvo/xqeY7NzaiigqncWXKdDQ5kgG2fHXtHjpddm4Emi+o0YF
         cvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396745; x=1699001545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hvuzSc5vilro8Nl+ASMbdyW2rK3NnJIlPBZvpWvELE=;
        b=femc4Xk24QUXnTERCKPxxLzLyB8MgimmIfG9Ytg5+aH/q7KriA8uziGT3YafV+zObQ
         qS03Ay0j+zqVXRf6L59+lHDkl2B2iASKEuHsQDBXnWsRTchYQ4Cwz15iBYnr0OAF0yZ8
         UCDkerhvstGQaJziv9we1jcLI1DTZhSP7+WDXI9d32b+NZZAFbo5oBgFfUOmX2cOv9hb
         Ug/T7JUPlxNjFLOetXjV0XArLd5CMV4oiVUw4vIc4piRAL1GAR8P0RzOHtXtbjQyfReY
         4qmrHi0aavMDoByCeMsewQsSomTRWeu58aq+f6CAcwxTuk7dGAXVV5o3fSw6Yj4mj8FG
         otMw==
X-Gm-Message-State: AOJu0YxqrqTpUQ4zJ9Z99qvDQKMpJEHj0knZ+PTU53UwyvqwFrZCgqQS
	GhpO3IpEgufURUhrpzqRVJ0=
X-Google-Smtp-Source: AGHT+IGf6zPdvcvYt954KqsgKkQXumjS1Tias1/G35Qzq9nEIdmjDKsb/zeSeCAoLOlnppXDiKw+ag==
X-Received: by 2002:a05:6358:1a82:b0:168:cfc5:82c with SMTP id gm2-20020a0563581a8200b00168cfc5082cmr1907627rwb.13.1698396745346;
        Fri, 27 Oct 2023 01:52:25 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:24 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 04/10] staging: vt6655: Type encoding info dropped from variable name "pbyRsvTime"
Date: Fri, 27 Oct 2023 14:21:53 +0530
Message-Id: <137b6c433e2d11b6ce99043f1fedf208789e380c.1698396278.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698396278.git.opensource206@gmail.com>
References: <cover.1698396278.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "pbyRsvTime" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 4ee9b48de2c2..5fdfc4dc70cc 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -76,83 +76,83 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  *      byPktType       - Tx Packet type
  *  Out:
  *      tx_rate         - pointer to RSPINF TxRate field
- *      pbyRsvTime      - pointer to RSPINF RsvTime field
+ *      rsv_time        - pointer to RSPINF RsvTime field
  *
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
 				       u8 bb_type,
 				       unsigned char *tx_rate,
-				       unsigned char *pbyRsvTime)
+				       unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x9B;
-			*pbyRsvTime = 44;
+			*rsv_time = 44;
 		} else {
 			*tx_rate = 0x8B;
-			*pbyRsvTime = 50;
+			*rsv_time = 50;
 		}
 		break;
 
 	case RATE_9M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x9F;
-			*pbyRsvTime = 36;
+			*rsv_time = 36;
 		} else {
 			*tx_rate = 0x8F;
-			*pbyRsvTime = 42;
+			*rsv_time = 42;
 		}
 		break;
 
 	case RATE_12M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x9A;
-			*pbyRsvTime = 32;
+			*rsv_time = 32;
 		} else {
 			*tx_rate = 0x8A;
-			*pbyRsvTime = 38;
+			*rsv_time = 38;
 		}
 		break;
 
 	case RATE_18M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x9E;
-			*pbyRsvTime = 28;
+			*rsv_time = 28;
 		} else {
 			*tx_rate = 0x8E;
-			*pbyRsvTime = 34;
+			*rsv_time = 34;
 		}
 		break;
 
 	case RATE_36M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x9D;
-			*pbyRsvTime = 24;
+			*rsv_time = 24;
 		} else {
 			*tx_rate = 0x8D;
-			*pbyRsvTime = 30;
+			*rsv_time = 30;
 		}
 		break;
 
 	case RATE_48M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x98;
-			*pbyRsvTime = 24;
+			*rsv_time = 24;
 		} else {
 			*tx_rate = 0x88;
-			*pbyRsvTime = 30;
+			*rsv_time = 30;
 		}
 		break;
 
 	case RATE_54M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x9C;
-			*pbyRsvTime = 24;
+			*rsv_time = 24;
 		} else {
 			*tx_rate = 0x8C;
-			*pbyRsvTime = 30;
+			*rsv_time = 30;
 		}
 		break;
 
@@ -160,10 +160,10 @@ static void calculate_ofdmr_parameter(unsigned char rate,
 	default:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*tx_rate = 0x99;
-			*pbyRsvTime = 28;
+			*rsv_time = 28;
 		} else {
 			*tx_rate = 0x89;
-			*pbyRsvTime = 34;
+			*rsv_time = 34;
 		}
 		break;
 	}
-- 
2.34.1

