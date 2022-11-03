Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673B6FAE;
	Thu,  3 Nov 2022 11:29:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id p8so2247227lfu.11;
        Thu, 03 Nov 2022 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ji8a4yG4RjSdG7BLCUtmcpBYrxK+oJyQ34/a2EhpGDc=;
        b=i437q/kUp1uPQM4UD6FyTPNjz/1+HTAK5HrZQ45guWjdEBZMg1e4w8DTUZc44Mbix9
         lsuLn29TKXwj3Emf47sO7JCc91PLpS8alu+6kbOWEcbyRoxQT2TPt3JyagDsK0R+uou4
         iyOmjPVS+Q1r/0RIiXQ28XjFNMshPlsuer6oOPgPFSkEkG+c+ptVBs0oSSHgm2IqD3dv
         XdYmreEpBMdSwY+9zZy2CvuZ6QryWhGoOJw+KI6cc1kS7UIcaBJ2R4qCEF9N4v8YWMbx
         cnTY/RQ/eSJBmn6376Jh3p7WD8ACNyiVRmLI2uqdXje/66a4qdKCQ02n1rr1TvmkSDMq
         bopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji8a4yG4RjSdG7BLCUtmcpBYrxK+oJyQ34/a2EhpGDc=;
        b=MhVCsclgj8j+5eDhCcKkpm6hHVkQXHn4DRM8nF2FdqmKnEaSxXnUAraIBf9SUWz4qQ
         2jZWgS/C/PhMZfuWFBf8FShjNWeWRa0DCjKypICpXO3PJgTeDgUnMsGNRyKnQWurEPln
         5XhX0JZ9BbDblJXdL57LYyB4L7KdvEgaxct7OkYh+iVCYE0+/VrMZpF+kLIXvvwxFQoE
         qBObgVOYRwUVOvmBuEGqq3yo4Rii3KdFheGeZrChzDbF4o+fH5BsIl1nSmDCakEuyzso
         Xy9JCKEZM4kwpI28/K0XbWCNzkeLzy2bdnvmaYevMMp2ufdrxD1JzsE7Ky9rjrJK/QlG
         4YUw==
X-Gm-Message-State: ACrzQf0sGpSl0S1+i7cySsvtx0+EkwKeuNuSHsHqhDqxZ8Hkfhi3wKra
	5rUnriOsunjTa3qJgzlPcR5LpiOeTvs8GQ==
X-Google-Smtp-Source: AMsMyM4s9MpBhBrcnB17SSvGjjFfKFk+eOcyP84Lak/wUO1b/agDvBgCIiSwAt2FQLzagdQZmKObDA==
X-Received: by 2002:a05:6512:3c8f:b0:4a2:5959:8b5e with SMTP id h15-20020a0565123c8f00b004a259598b5emr12323417lfv.647.1667474947037;
        Thu, 03 Nov 2022 04:29:07 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512203100b004a2cd6d5ad6sm100308lfs.19.2022.11.03.04.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 04:29:06 -0700 (PDT)
Date: Thu, 3 Nov 2022 11:29:06 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: vt6655: change the function name
 s_vGenerateTxParameter
Message-ID: <Y2OmAuBswNbWFWRd@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the use of Hongarian notation which is not used in Linux kernel.
Join some lines of code to avoid a line ending in a '('
Reported by Checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 54 ++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index debc5d5daede..793a63b2ff46 100644
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
@@ -95,17 +95,17 @@ static void fill_rts_header(struct vnt_private *pDevice,
 			    unsigned short wCurrentRate,
 			    unsigned char byFBOption);
 
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
+static void generate_tx_parameter(struct vnt_private *pDevice,
+				  unsigned char byPktType,
+				  struct vnt_tx_fifo_head *,
+				  void *pvRrvTime,
+				  void *pvRTS,
+				  void *pvCTS,
+				  unsigned int	cbFrameSize,
+				  bool bNeedACK,
+				  unsigned int	uDMAIdx,
+				  void *psEthHeader,
+				  unsigned short wCurrentRate);
 
 static unsigned int
 s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
@@ -864,21 +864,17 @@ s_vFillCTSHead(
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
@@ -1107,8 +1103,8 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
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

