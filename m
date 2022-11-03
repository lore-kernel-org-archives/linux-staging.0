Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA9A5B;
	Thu,  3 Nov 2022 09:52:13 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id r12so1935110lfp.1;
        Thu, 03 Nov 2022 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwDKMymvmRecMVv+Yu1YP/lKTyHvR7o4RJWcrXGZQkU=;
        b=Fsb+tFo1Mh+LJNBrbfqJfBMoJ5E9/H6dHJ4VWiP8OZYHAgHW/s6QawW3a/J9EvVHaP
         r3qGufzumL2LpzHJdti2X0Eg+3hSfVMOSa9cBj2ajbJA4zU2cSYlxoyLl9UnaRTZ5LGt
         dMKVobvn7TiN51VHTZDTOnRnqBcHHcIndH2R5tnNc8fmPAth5AgPCXHa0NbMJUxhtSxR
         hl1cuC4Q0I7NAevpiGBHvTXMj8RUvIStA9cO8uYSfKCRAvjIRtpvUsP1+mKEx5TcxsnA
         KDZfDYnSomVE04Zfq0+18s43vbM8/6yW471A6x4ZU3IFNpd+/liAErS3eVkGH4nEdFgi
         H9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwDKMymvmRecMVv+Yu1YP/lKTyHvR7o4RJWcrXGZQkU=;
        b=Ko8d69JN4OW3cPSMVQwGT7ZjhLKAJ1ZHIIiBrGY/0RQrFQL9ozgm4u12FovGD7eAiU
         HFBIfENi3sCwgv4G6dt/BBgVfCn6S0Fn9bJesjAvYOg7M5/3nOfnAWTsenhlN67Yff07
         GXEuuIrzjI5kZqoODqmEpWkwHS3RWB6W7+5IynkvtgwN76FiZqtWPfep+0zDU/8AGx0u
         ORqxRL355P1vmTWr75kjGoq8NlPCGHjAIOkEdvovwxF6/n/5/yUdzNzWiHrm1ONZI2nz
         wUp7yoQ7EQLXbMDiVbWuHwDIEfFSIIyflRGjUwdYZGmMbx/oels0HJ2M0bydWzQ7V/g2
         QVGA==
X-Gm-Message-State: ACrzQf20pCQ+Gq4cD++xnReNo2rpR5CJ59kz/FVBa9seUpN+UXW+CIIY
	3TtbAabzcFxbZBYuvFJ1GL92JJWQBy8xAw==
X-Google-Smtp-Source: AMsMyM7d99LemBFqXDxntepB+7QSAXMsS8Pfy69BL364aDonu9tJKmxPkwjshE8Dw5sA2cEYGpBjvQ==
X-Received: by 2002:a05:6512:1108:b0:4a2:504f:b3f with SMTP id l8-20020a056512110800b004a2504f0b3fmr10980794lfg.169.1667469131064;
        Thu, 03 Nov 2022 02:52:11 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id x26-20020a05651c105a00b002770eafaafbsm30792ljm.99.2022.11.03.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:52:10 -0700 (PDT)
Date: Thu, 3 Nov 2022 09:52:10 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: vt6655: change the function name s_vFillRTSHead
Message-ID: <Y2OPStg4jXtWpJcd@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
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

Fix checkpatch error related to code line ends with a '(', by joining
some lines and indenting correctly. This improves visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 31ae99b3cb35..debc5d5daede 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -23,7 +23,7 @@
  *      s_uGetTxRsvTime- get frame reserved time
  *      s_vFillCTSHead- fulfill CTS ctl header
  *      s_vFillFragParameter- Set fragment ctl parameter.
- *      s_vFillRTSHead- fulfill RTS ctl header
+ *      fill_rts_header- fulfill RTS ctl header
  *      s_vFillTxKey- fulfill tx encrypt key
  *      s_vSWencryption- Software encrypt header
  *      vDMA0_tx_80211- tx 802.11 frame via dma0
@@ -85,15 +85,15 @@ static const unsigned short fb_opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static void s_vFillRTSHead(struct vnt_private *pDevice,
-			   unsigned char byPktType,
-			   void *pvRTS,
-			   unsigned int	cbFrameLength,
-			   bool bNeedAck,
-			   bool bDisCRC,
-			   struct ieee80211_hdr *hdr,
-			   unsigned short wCurrentRate,
-			   unsigned char byFBOption);
+static void fill_rts_header(struct vnt_private *pDevice,
+			    unsigned char byPktType,
+			    void *pvRTS,
+			    unsigned int	cbFrameLength,
+			    bool bNeedAck,
+			    bool bDisCRC,
+			    struct ieee80211_hdr *hdr,
+			    unsigned short wCurrentRate,
+			    unsigned char byFBOption);
 
 static void s_vGenerateTxParameter(struct vnt_private *pDevice,
 				   unsigned char byPktType,
@@ -555,19 +555,15 @@ s_uFillDataHead(
 	return buf->duration;
 }
 
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pvRTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	struct ieee80211_hdr *hdr,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+static void fill_rts_header(struct vnt_private *pDevice,
+			    unsigned char byPktType,
+			    void *pvRTS,
+			    unsigned int cbFrameLength,
+			    bool bNeedAck,
+			    bool bDisCRC,
+			    struct ieee80211_hdr *hdr,
+			    unsigned short wCurrentRate,
+			    unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
@@ -912,7 +908,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
 
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pvRrvTime;
 
@@ -931,7 +927,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
@@ -945,7 +941,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-- 
2.34.1

