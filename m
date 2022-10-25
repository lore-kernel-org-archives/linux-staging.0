Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E927B;
	Tue, 25 Oct 2022 23:38:20 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id p8so25262736lfu.11;
        Tue, 25 Oct 2022 16:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lBB9ttth4eSvyWXw/F4NyKEvhAfegcmcryN6aA811E=;
        b=iWjbB1MkJ8RdSGc1z4wf+4T1ykM7kFl5KvHpIftG9RAiamzCimo1+PPA58KNIfOF9k
         zN/2StTMzeXZg6QWr0FRwCHL75FDBNEwS6V8xSMBJg8ie7w/QlTIjyLcg/k0KjeaTNuU
         an7NAL6mwIXVorwvVF7/MU5qPbPDMmaEucLxXyDPETHvEkkzo9Z/J+SBToqqT42MX1od
         VCuyJ+HSoL1w8774Br39u2PBO26YO22OdM9UBJPBB1xKajeerVm2Jh9FtZN0+6x1e2Nv
         pobkJqamcVygUlnU6Y4uxhHwjW75iL2DUJYnLTFqxJMKr4l8qyFSnsrNuQgws0gn5Bm2
         4GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lBB9ttth4eSvyWXw/F4NyKEvhAfegcmcryN6aA811E=;
        b=0dfZOtOdebbIMhagL/kVCqhiR0zGgOd/UYG3Vt4WGBZOAXn+J2UJnE7IqXrgbTRrYk
         27/g1uDOCTepvRq4JpOjfellJfgNs5YJOA+Q1UKtS9Y3VUcaYOwBhPkReCKgRboHgukj
         giumPKdretOfMRjI99j8kinM1QunLa1LiXwKUJT94stfMdhtno1lM1/HyIUAXBVeKj7H
         zqt4krs2b+4iwTABP5Hc/oa91JzYcw4v3uazMb0F2eV4r5tgVOuxB9QIMy3G4eT+EM85
         HCQswGeDl3z5m+nCBl/KGNUNSdUutIuhK3qgPl3jeJTxlKmDvOKxTYi/P9rq2TqTdJd2
         7PHw==
X-Gm-Message-State: ACrzQf2U53yKT34J509gA1WHxzIauPEOOlkl6uTAHAYRxHwmne0TlhHw
	fW3AtgttGuoAMpCWDgk6Enw=
X-Google-Smtp-Source: AMsMyM6hKY1Be5hoWquevsFoyovMmI3SbUuUpyGkvJLYhauoAYKbzJI171InzQXsBuI4ozqn5bZyAQ==
X-Received: by 2002:ac2:5e35:0:b0:4a4:754f:e2d5 with SMTP id o21-20020ac25e35000000b004a4754fe2d5mr16858525lfg.77.1666741099189;
        Tue, 25 Oct 2022 16:38:19 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:37:57 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 10/17] staging: vt6655: changed variable name: s_vGenerateTxParameter
Date: Tue, 25 Oct 2022 23:37:06 +0000
Message-Id: <1663fb051fe1a25189bb578e1e6bcde7f9ad39d4.1666740522.git.tanjubrunostar0@gmail.com>
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

change variable names s_vGenerateTxParameter to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 63 ++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 3d28cbfec618..fa11677ce119 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -10,7 +10,7 @@
  * Date: May 20, 2003
  *
  * Functions:
- *      s_vGenerateTxParameter - Generate tx dma required parameter.
+ *      s_vgenerate_tx_parameter - Generate tx dma required parameter.
  *      vGenerateMACHeader - Translate 802.3 to 802.11 header
  *      cbGetFragCount - Calculate fragment number count
  *      csBeacon_xmit - beacon tx function
@@ -95,23 +95,24 @@ static void s_v_fill_rts_head(struct vnt_private *p_device,
 			      unsigned short wCurrentRate,
 			      unsigned char by_fb_option);
 
-static void s_vGenerateTxParameter(struct vnt_private *p_device,
-				   unsigned char by_pkt_type,
-				   struct vnt_tx_fifo_head *,
-				   void *pvRrvTime,
-				   void *pv_rts,
-				   void *pvCTS,
-				   unsigned int	cbFrameSize,
-				   bool bNeedACK,
-				   unsigned int	uDMAIdx,
-				   void *psEthHeader,
-				   unsigned short wCurrentRate);
-
-static unsigned int
-s_cbFillTxBufHead(struct vnt_private *p_device, unsigned char by_pkt_type,
-		  unsigned char *pbyTxBufferAddr,
-		  unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
-		  unsigned int uNodeIndex);
+static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
+				     unsigned char by_pkt_type,
+				     struct vnt_tx_fifo_head *,
+				     void *pvRrvTime,
+				     void *pv_rts,
+				     void *pvCTS,
+				     unsigned int	cbFrameSize,
+				     bool bNeedACK,
+				     unsigned int	uDMAIdx,
+				     void *psEthHeader,
+				     unsigned short wCurrentRate);
+
+static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
+				      unsigned char by_pkt_type,
+				      unsigned char *pbyTxBufferAddr,
+				      unsigned int uDMAIdx,
+				      struct vnt_tx_desc *pHeadTD,
+				      unsigned int uNodeIndex);
 
 static __le16 s_uFillDataHead(struct vnt_private *p_device,
 			      unsigned char by_pkt_type,
@@ -936,17 +937,17 @@ static void s_vFillCTSHead(struct vnt_private *p_device,
  -
  * unsigned int cbFrameSize, Hdr+Payload+FCS
  */
-static void s_vGenerateTxParameter(struct vnt_private *p_device,
-				   unsigned char by_pkt_type,
-				   struct vnt_tx_fifo_head *tx_buffer_head,
-				   void *pvRrvTime,
-				   void *pv_rts,
-				   void *pvCTS,
-				   unsigned int cbFrameSize,
-				   bool bNeedACK,
-				   unsigned int uDMAIdx,
-				   void *psEthHeader,
-				   unsigned short wCurrentRate)
+static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
+				     unsigned char by_pkt_type,
+				     struct vnt_tx_fifo_head *tx_buffer_head,
+				     void *pvRrvTime,
+				     void *pv_rts,
+				     void *pvCTS,
+				     unsigned int cbFrameSize,
+				     bool bNeedACK,
+				     unsigned int uDMAIdx,
+				     void *psEthHeader,
+				     unsigned short wCurrentRate)
 {
 	u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
 	bool b_dis_crc = false;
@@ -1223,8 +1224,8 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
 	memset((void *)(pbyTxBufferAddr + wTxBufSize), 0, (cbHeaderLength - wTxBufSize));
 
 	/* Fill FIFO,RrvTime,RTS,and CTS */
-	s_vGenerateTxParameter(p_device, by_pkt_type, tx_buffer_head, pvRrvTime, pv_rts, pvCTS,
-			       cbFrameSize, bNeedACK, uDMAIdx, hdr, p_device->wCurrentRate);
+	s_vgenerate_tx_parameter(p_device, by_pkt_type, tx_buffer_head, pvRrvTime, pv_rts, pvCTS,
+				 cbFrameSize, bNeedACK, uDMAIdx, hdr, p_device->wCurrentRate);
 	/* Fill DataHead */
 	uDuration = s_uFillDataHead(p_device, by_pkt_type, pvTxDataHd, cbFrameSize, uDMAIdx,
 				    bNeedACK, 0, 0, uMACfragNum, by_fb_option,
-- 
2.34.1

