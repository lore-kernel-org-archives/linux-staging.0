Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B702C81
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 13:23:52 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g2so19001456wme.4
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xK9DNZI2WxuIz+Ctgl2vXcWcIENDorkB7WicrZ5sMlw=;
        b=D2jt52BW4x4UxWlPWIeJILigF+dk35bbQBWylH2BYt9nYqPexh7mFTEru41QxZwN+O
         UHut3BOS91CHPbXg07iVYWFqs4M6XrrjFpzFzxaA63EkYAIR8VM4vwdns8mZVepmfonc
         Joshy7f06L3vP1zPh1ybGSHok0GjxN+1KHpeOnqs6fEDuDAJQW2MusejKeaEZgK0KKk/
         RjlcisnP4yilFg5Nq5xZlYkmHCguyJQDikhfTTtXCUrNGUPPrRkOhUCyImEf8xmHYEpA
         qDHcnnEgZCFfvYYpj/ZwGY6JVWcMhpte1zpejzNRmuTDcjIrwt2j797AS7szY+pCNQAM
         Qbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xK9DNZI2WxuIz+Ctgl2vXcWcIENDorkB7WicrZ5sMlw=;
        b=z55L98ERxxe/pMqJOogbTnW21amFA5dNNcCbp1e0FYZt2FOTbHeU8mnDSpMppb8RR4
         l9plU9CMW1rFoqpRpDLAroHv6J8YutEOWkRoJnxcWIrEugFycw6AcnE2plhObyow/lFu
         dy08exOJKj72fXrpoq9ENLVdKygaLpUsfgNAAbYVXdfL5zZKZ8IrHvLHU2XEbmBX6tar
         4cKuPnyEIVqqXNxflxcoedLagIT/fjm+6aytdh4sRTN6xICit6T/jyNIcC3Qxd3Kr1uP
         2W8bq2tg8BqDDrf9sD/W1AZn5qKU2suXfBTL6V01rQOaPG/ikJZTisqIdTo37Yn1pS7V
         yGCg==
X-Gm-Message-State: AOAM530DP8a/6L3cHml9GipvYxPNbHI5lqZpjrWV8zV8KohnTGAkWCxb
	RmdygDajVitd1ozFswQgehw=
X-Google-Smtp-Source: ABdhPJzA1mhv83/9w7/Y0vUlp7/KoKz3Whha9WKlXxhTN+u0wOhzDSF+ciF2aRR4xM8TA5VKHzYNzA==
X-Received: by 2002:adf:bc42:: with SMTP id a2mr52925368wrh.4.1634736231141;
        Wed, 20 Oct 2021 06:23:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l5sm2064106wru.24.2021.10.20.06.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 06:23:50 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v2] staging: vt6655: Rename `by_preamble_type` parameter
Date: Wed, 20 Oct 2021 14:23:26 +0100
Message-Id: <20211020132326.417059-1-karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop Hungarian notation prefix in the first parameter of
`bb_get_frame_time` function. Update the comment to
reflect that change.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
v2:
* Update the change log: delete description of why `byPreambleType`
  rename influenced that change and reference to an already merged commit

 drivers/staging/vt6655/baseband.c | 6 +++---
 drivers/staging/vt6655/baseband.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 5efca92f1f18..8f9177db6663 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -1691,7 +1691,7 @@ static const unsigned short awc_frame_time[MAX_RATE] = {
  *
  * Parameters:
  *  In:
- *      by_preamble_type  - Preamble Type
+ *      preamble_type     - Preamble Type
  *      by_pkt_type        - PK_TYPE_11A, PK_TYPE_11B, PK_TYPE_11GB, PK_TYPE_11GA
  *      cb_frame_length   - Baseband Type
  *      tx_rate           - Tx Rate
@@ -1700,7 +1700,7 @@ static const unsigned short awc_frame_time[MAX_RATE] = {
  * Return Value: FrameTime
  *
  */
-unsigned int bb_get_frame_time(unsigned char by_preamble_type,
+unsigned int bb_get_frame_time(unsigned char preamble_type,
 			       unsigned char by_pkt_type,
 			       unsigned int cb_frame_length,
 			       unsigned short tx_rate)
@@ -1717,7 +1717,7 @@ unsigned int bb_get_frame_time(unsigned char by_preamble_type,
 	rate = (unsigned int)awc_frame_time[rate_idx];
 
 	if (rate_idx <= 3) {		    /* CCK mode */
-		if (by_preamble_type == 1) /* Short */
+		if (preamble_type == 1) /* Short */
 			preamble = 96;
 		else
 			preamble = 192;
diff --git a/drivers/staging/vt6655/baseband.h b/drivers/staging/vt6655/baseband.h
index 0a30afaa7cc3..15b2802ed727 100644
--- a/drivers/staging/vt6655/baseband.h
+++ b/drivers/staging/vt6655/baseband.h
@@ -44,7 +44,7 @@
 #define TOP_RATE_2M         0x00200000
 #define TOP_RATE_1M         0x00100000
 
-unsigned int bb_get_frame_time(unsigned char by_preamble_type,
+unsigned int bb_get_frame_time(unsigned char preamble_type,
 			       unsigned char by_pkt_type,
 			       unsigned int cb_frame_length,
 			       unsigned short w_rate);
-- 
2.30.2

