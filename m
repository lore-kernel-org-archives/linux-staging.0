Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780079FD;
	Mon, 14 Nov 2022 18:50:38 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id a15so14448388ljb.7;
        Mon, 14 Nov 2022 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JKVzVGrgZuMPpanGeTKxnchdaZhH7/pplUPKRtRDCY=;
        b=qJVHbvI7jWTAHYwuxERb3JVW2BaBACzZ7LhglYV9qrM4leUjcPwLdr10aQ/u/IBoiR
         M2tA98YrlkhIzn7Fe9ya7NG4LdEljO0j9ZOtqxnGztnstbLBcjyu/EeYh8g8sLda0qlf
         splnjHKQvSFfyj31XDBDxMjqXs4YNSnnwZ/R07V7Cqqp21bZmjQOzWwidsIzl/wi/Ibd
         Pq/uefIPJcZskHFPZSw/1p85HiA8oGTU9GU2myDIbOTlnJWn3UmRiqLEMyyIhyBUMQ8b
         ox4tWYK2fxOoRbD+49OBe66bttnVkQkTb4HvNb2LFSeTxSviRxFqtLPrm/gm4aJvgaKW
         QrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JKVzVGrgZuMPpanGeTKxnchdaZhH7/pplUPKRtRDCY=;
        b=zeGiaFYDGi1/Dogp2p1mq9kHrIFMbePfXlRicFOGV37K6m8pmT/tGXLu/n3rYKBocm
         qqRpaOd4zGSDdIDyLG3sK1hynesITIwIs45n7/tB/Z2oA+5pN9rWAFWGSLNFYR870Rg7
         kSHB+m59BbtZ7PkHKuIzUiiuJW7mmCb5hPHvt3nAMIX3IHxHNoPAy0A9mVD9SKn6C3n3
         ew4UJaBLt9G+aEa2e9uxhDi6DwHvl04JEYplJPwWrCtkPrrcoEEQQZFJWDksLN4cDxxi
         RHt6ZvSy6CGMQKB9Xe5qnWHDjews37fuCCOJ0jr3JckOqwMvc1Y2NvFvPlp7zX7z6WO6
         hi8Q==
X-Gm-Message-State: ANoB5pkXFdVXWBGrlWxLQXluE+MDMLMMwalUex/ceI15fjuzdFK4VAhV
	g3MEoDAiwbZVbPJoVi1p+ln5P29V+IKWTw==
X-Google-Smtp-Source: AA0mqf4qBmcviLwO5Ig2RcD8jcJqoAuq9R9LSkTZshbIAnJKi4daw2iHr2bEk/yGhrg9mShHBf0e2g==
X-Received: by 2002:a2e:54f:0:b0:26f:a90a:fd82 with SMTP id 76-20020a2e054f000000b0026fa90afd82mr4976074ljf.248.1668451835805;
        Mon, 14 Nov 2022 10:50:35 -0800 (PST)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id bg36-20020a05651c0ba400b002770eafaafbsm2137850ljb.99.2022.11.14.10.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 10:50:35 -0800 (PST)
Date: Mon, 14 Nov 2022 18:50:34 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: vt6655: change the function name
 s_vGenerateTxParameter
Message-ID: <Y3KN+kVLZ8gRzccm@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the use of Hungarian notation, which is not used in the Linux
kernel. Reported by checkpatch
Add indentation to the affected function to follow the Linux kernel
coding style. This improves code visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---

v2: removed unnecessary function prototype

 drivers/staging/vt6655/rxtx.c | 44 +++++++++++------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 715b323cd2a8..341e23054817 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -10,7 +10,7 @@
  * Date: May 20, 2003
  *
  * Functions:
- *      s_vGenerateTxParameter - Generate tx dma required parameter.
+ *      generate_tx_parameter - Generate tx dma required parameter.
  *      vGenerateMACHeader - Translate 802.3 to 802.11 header
  *      cbGetFragCount - Calculate fragment number count
  *      csBeacon_xmit - beacon tx function
@@ -85,18 +85,6 @@ static const unsigned short fb_opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static void s_vGenerateTxParameter(struct vnt_private *pDevice,
-				   unsigned char byPktType,
-				   struct vnt_tx_fifo_head *,
-				   void *pvRrvTime,
-				   void *pvRTS,
-				   void *pvCTS,
-				   unsigned int	cbFrameSize,
-				   bool bNeedACK,
-				   unsigned int	uDMAIdx,
-				   void *psEthHeader,
-				   unsigned short wCurrentRate);
-
 static unsigned int
 s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 		  unsigned char *pbyTxBufferAddr,
@@ -854,21 +842,17 @@ s_vFillCTSHead(
  -
  * unsigned int cbFrameSize, Hdr+Payload+FCS
  */
-static
-void
-s_vGenerateTxParameter(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	struct vnt_tx_fifo_head *tx_buffer_head,
-	void *pvRrvTime,
-	void *pvRTS,
-	void *pvCTS,
-	unsigned int cbFrameSize,
-	bool bNeedACK,
-	unsigned int uDMAIdx,
-	void *psEthHeader,
-	unsigned short wCurrentRate
-)
+static void generate_tx_parameter(struct vnt_private *pDevice,
+				  unsigned char byPktType,
+				  struct vnt_tx_fifo_head *tx_buffer_head,
+				  void *pvRrvTime,
+				  void *pvRTS,
+				  void *pvCTS,
+				  unsigned int cbFrameSize,
+				  bool bNeedACK,
+				  unsigned int uDMAIdx,
+				  void *psEthHeader,
+				  unsigned short wCurrentRate)
 {
 	u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
 	bool bDisCRC = false;
@@ -1097,8 +1081,8 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 	memset((void *)(pbyTxBufferAddr + wTxBufSize), 0, (cbHeaderLength - wTxBufSize));
 
 	/* Fill FIFO,RrvTime,RTS,and CTS */
-	s_vGenerateTxParameter(pDevice, byPktType, tx_buffer_head, pvRrvTime, pvRTS, pvCTS,
-			       cbFrameSize, bNeedACK, uDMAIdx, hdr, pDevice->wCurrentRate);
+	generate_tx_parameter(pDevice, byPktType, tx_buffer_head, pvRrvTime, pvRTS, pvCTS,
+			      cbFrameSize, bNeedACK, uDMAIdx, hdr, pDevice->wCurrentRate);
 	/* Fill DataHead */
 	uDuration = s_uFillDataHead(pDevice, byPktType, pvTxDataHd, cbFrameSize, uDMAIdx, bNeedACK,
 				    0, 0, uMACfragNum, byFBOption, pDevice->wCurrentRate, is_pspoll);
-- 
2.34.1

