Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66F97B;
	Tue, 25 Oct 2022 23:39:24 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id g12so14800069lfh.3;
        Tue, 25 Oct 2022 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gmfQ841LKpP9QCVyPPMnd2eQzGH1p8rgK8Y5XRomgo=;
        b=YTmuRZFIcZVli7zhVelVT0g3PfnT8wjxDyEkrrLfyX+5+HGECvthmVBGulRNFLMoCo
         eSusTOBklBWWHLazqKRF9Z0ksJUaCQ/PdBuZKmnY1Uu2AZ9PuLXlx9+w0ORQZpu3aiJ+
         Luac4gPX2tInIseUdN1qHkoUaljhESq15Bm/V6lBVPTbj3fza9rhaK6tbnKdmNQ7/U9t
         dkUPVnC26YINzefoOmjFhtrypAgFmrtxOYl1JlDdNQ/HF1oNxKTaG1UfrW50H/6vtJ1H
         sUOMkq73xvpNUY/lD/kBWflPyN9xmKCe9sVKAZV/3Ute3dhwsSylSADqqGASqWVUAdk0
         gXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gmfQ841LKpP9QCVyPPMnd2eQzGH1p8rgK8Y5XRomgo=;
        b=4Uz4JX26XqAquptwu/HVf5fRBj5J0/Fr1G18p0DD1jdHmk8kQlyWzX8tX401J3X4JR
         wFki4spjn2600LTGQ+IrvhcZB/khwEf0CUtrlITb6KCs2x6uUY/rYeiAKqo7WR8Q7ral
         /TFdCzlTc/TeRN/OsGvO1PjUXNji7g9ONRQljIQEcl+tRLPG5jh5J8QCXYE4m2q+BBhm
         YRgIGnzms2ZJ0uKk11rmJLyMB3/dKGerFmVDE4uJxWYIRm0CPqPCXRsO2Z3tMR+5CAP+
         IDZ7Q9Gx4O2jm+9q1T7zHRqWAWzgQkBSWEXQMcZJdegMEFanF3J+Em0FbgGUiVWhW78q
         Tiyw==
X-Gm-Message-State: ACrzQf2+7uUi5nSx8hWhE0u68jk9bDRIaaC9gdFk1fqCMPiSjzNbDXyK
	atKeKTWJI1hB3oQPxxlQlA56YrjYGRpgDw==
X-Google-Smtp-Source: AMsMyM7xnOhYklUk/L6qn+lAmcei5pXO3NUS6ORAguJHkjet9pjpysYnr5824VxiKOFXUeyqvIjDyg==
X-Received: by 2002:a05:6512:340f:b0:4a2:a946:613e with SMTP id i15-20020a056512340f00b004a2a946613emr16309543lfr.230.1666741162864;
        Tue, 25 Oct 2022 16:39:22 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:39:20 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 16/17] staging: vt6655: changed variable name: s_cbFillTxBufHead
Date: Tue, 25 Oct 2022 23:37:12 +0000
Message-Id: <f1e8c3693937ab4d2d7c9765cea1432fa6000df1.1666740522.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666740522.git.tanjubrunostar0@gmail.com>
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

change variable names s_cbFillTxBufHead to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 6a54f234261a..90e7330680d9 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -15,7 +15,7 @@
  *      cbGetFragCount - Calculate fragment number count
  *      csBeacon_xmit - beacon tx function
  *      csMgmt_xmit - management tx function
- *      s_cbFillTxBufHead - fulfill tx dma buffer header
+ *      s_cb_fill_tx_buf_head - fulfill tx dma buffer header
  *      s_uGetDataDuration - get tx data required duration
  *      s_uFillDataHead- fulfill tx data duration header
  *      s_uGetRTSCTSDuration- get rtx/cts required duration
@@ -107,12 +107,12 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     void *ps_eth_header,
 				     unsigned short wCurrentRate);
 
-static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
-				      unsigned char by_pkt_type,
-				      unsigned char *pbyTxBufferAddr,
-				      unsigned int u_dma_idx,
-				      struct vnt_tx_desc *pHeadTD,
-				      unsigned int uNodeIndex);
+static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
+					  unsigned char by_pkt_type,
+					  unsigned char *pbyTxBufferAddr,
+					  unsigned int u_dma_idx,
+					  struct vnt_tx_desc *pHeadTD,
+					  unsigned int uNodeIndex);
 
 static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
@@ -1043,12 +1043,12 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 	}
 }
 
-static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
-				      unsigned char by_pkt_type,
-				      unsigned char *pbyTxBufferAddr,
-				      unsigned int u_dma_idx,
-				      struct vnt_tx_desc *pHeadTD,
-				      unsigned int is_pspoll)
+static unsigned int s_cb_fill_tx_buf_head(struct vnt_private *p_device,
+					  unsigned char by_pkt_type,
+					  unsigned char *pbyTxBufferAddr,
+					  unsigned int u_dma_idx,
+					  struct vnt_tx_desc *pHeadTD,
+					  unsigned int is_pspoll)
 {
 	struct vnt_td_info *td_info = pHeadTD->td_info;
 	struct sk_buff *skb = td_info->skb;
@@ -1442,8 +1442,8 @@ int vnt_generate_fifo_header(struct vnt_private *priv, u32 dma_idx,
 
 	tx_buffer_head->frag_ctl |= cpu_to_le16(FRAGCTL_NONFRAG);
 
-	s_cbFillTxBufHead(priv, pkt_type, (u8 *)tx_buffer_head,
-			  dma_idx, head_td, is_pspoll);
+	s_cb_fill_tx_buf_head(priv, pkt_type, (u8 *)tx_buffer_head,
+			      dma_idx, head_td, is_pspoll);
 
 	if (info->control.hw_key) {
 		tx_key = info->control.hw_key;
-- 
2.34.1

