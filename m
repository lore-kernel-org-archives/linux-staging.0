Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3FD154AC
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVt4COiB"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso1485512a12.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396743; x=1699001543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+UmcifUD+EOeaauItVXeb4cJhVMVx5fQNibExuj5hw=;
        b=mVt4COiBwncE2bX5YIhBDq0FbUcnMYTBMENRORN0ygW5ONENT+aAsgTZdmK5rIFeE+
         A5szZrY3OFKGKAR20plJzBrfYdUisvA3oAblA6BGF9msLNXgKB5oBgPjRIvZDfcmg2Rq
         xx8QBjm3qnktWV0/MYJeLyepAYshTD8O4/P6PaoO2lHpuPBg3iDHlMfbwpFWhRbzAOxr
         h5qKs2aizs1NiVZtvsKBm8BN+MkVm2C7HFaC3z5Ix5SuSVTkBRvICVqUZLtojWNm9hZR
         e0/W9vYqolRX1ZrJSttZXktebBGcmM1KcmTO8QTDFjkl1fdOjEpAY0VYKYXjUG4JVfLy
         s9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396743; x=1699001543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+UmcifUD+EOeaauItVXeb4cJhVMVx5fQNibExuj5hw=;
        b=Bq4d1QNm3wYMrbCy5cLfWUzVJhimvJl1hMnbfOAHpXOreeh6+h78P6dnsjVBXtjSor
         nct+JftePZZKuIFw5U7End93KU45VIw9AF36adZzr7YOPV1zZrg/asjfU1NMNIyynDra
         BgMQ9XSIVIvh1VvFIJHzaxemWxnZ0zTPVwocMN8fG8HZ27SP0QpXbMNNO7cEeiuewTWg
         iJD6YSXJTejFYjooHaRuAQqrh406SlIQosNOBgrrvqeuNteL130aV/CbRD6VdB5e3hFX
         /eF4oh5q4lybS94gPwku1bEvURdxA92jZCxNpEePIcPNCqU52YcwVsexiYAow9v4tE0M
         v2VA==
X-Gm-Message-State: AOJu0Ywxhr+WyAxCv363Yh7zmRw3+R/MOvAJevKFqsE9e4OuotEyawXS
	FGuFAYW8yjfT0DPOVG0P15o=
X-Google-Smtp-Source: AGHT+IHKSMAkF7Pnsgz+EZNOdMuZuvgKbEfnL8usPRl2qxpvh5sqXTqT/gMvwUTwyVWatDl9cfV6pA==
X-Received: by 2002:a05:6a21:4988:b0:15e:9c50:73ee with SMTP id ax8-20020a056a21498800b0015e9c5073eemr2409644pzc.53.1698396743302;
        Fri, 27 Oct 2023 01:52:23 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:22 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 03/10] staging: vt6655: Type encoding info dropped from variable name "pbyTxRate"
Date: Fri, 27 Oct 2023 14:21:52 +0530
Message-Id: <409a80898ccbb398c31f222dc29cea4725a0cfb3.1698396278.git.opensource206@gmail.com>
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

variable name "pbyTxRate" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 2968be1f8d4e..4ee9b48de2c2 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -75,83 +75,83 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  *      wRate           - Tx Rate
  *      byPktType       - Tx Packet type
  *  Out:
- *      pbyTxRate       - pointer to RSPINF TxRate field
+ *      tx_rate         - pointer to RSPINF TxRate field
  *      pbyRsvTime      - pointer to RSPINF RsvTime field
  *
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
 				       u8 bb_type,
-				       unsigned char *pbyTxRate,
+				       unsigned char *tx_rate,
 				       unsigned char *pbyRsvTime)
 {
 	switch (rate) {
 	case RATE_6M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x9B;
+			*tx_rate = 0x9B;
 			*pbyRsvTime = 44;
 		} else {
-			*pbyTxRate = 0x8B;
+			*tx_rate = 0x8B;
 			*pbyRsvTime = 50;
 		}
 		break;
 
 	case RATE_9M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x9F;
+			*tx_rate = 0x9F;
 			*pbyRsvTime = 36;
 		} else {
-			*pbyTxRate = 0x8F;
+			*tx_rate = 0x8F;
 			*pbyRsvTime = 42;
 		}
 		break;
 
 	case RATE_12M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x9A;
+			*tx_rate = 0x9A;
 			*pbyRsvTime = 32;
 		} else {
-			*pbyTxRate = 0x8A;
+			*tx_rate = 0x8A;
 			*pbyRsvTime = 38;
 		}
 		break;
 
 	case RATE_18M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x9E;
+			*tx_rate = 0x9E;
 			*pbyRsvTime = 28;
 		} else {
-			*pbyTxRate = 0x8E;
+			*tx_rate = 0x8E;
 			*pbyRsvTime = 34;
 		}
 		break;
 
 	case RATE_36M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x9D;
+			*tx_rate = 0x9D;
 			*pbyRsvTime = 24;
 		} else {
-			*pbyTxRate = 0x8D;
+			*tx_rate = 0x8D;
 			*pbyRsvTime = 30;
 		}
 		break;
 
 	case RATE_48M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x98;
+			*tx_rate = 0x98;
 			*pbyRsvTime = 24;
 		} else {
-			*pbyTxRate = 0x88;
+			*tx_rate = 0x88;
 			*pbyRsvTime = 30;
 		}
 		break;
 
 	case RATE_54M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x9C;
+			*tx_rate = 0x9C;
 			*pbyRsvTime = 24;
 		} else {
-			*pbyTxRate = 0x8C;
+			*tx_rate = 0x8C;
 			*pbyRsvTime = 30;
 		}
 		break;
@@ -159,10 +159,10 @@ static void calculate_ofdmr_parameter(unsigned char rate,
 	case RATE_24M:
 	default:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
-			*pbyTxRate = 0x99;
+			*tx_rate = 0x99;
 			*pbyRsvTime = 28;
 		} else {
-			*pbyTxRate = 0x89;
+			*tx_rate = 0x89;
 			*pbyRsvTime = 34;
 		}
 		break;
-- 
2.34.1

