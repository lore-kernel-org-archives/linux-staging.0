Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082FF320E;
	Fri, 28 Oct 2022 18:11:51 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id u2so9365062ljl.3;
        Fri, 28 Oct 2022 11:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQRb83QAFePKhKbHLajNFJKcMixGfgCDUPELEyoVamM=;
        b=AOogLAxXP23eX2lBQvcI9TTavczm05ANMT+Ta8nBkkZBnhTHLmAq0YrFr+A20kLRMZ
         ESb+7b1nf5BzYGYw1nkQbq8VHtYGOHaPGcbDWW+N+Ic9yFaKS9HCDQ8rc7tGbeSglfG8
         Ok8ZrLbDZIFUA9/My1EovkQCWn4mTkp8o+S8snQaZRq8GOIzxbmxb6kfAyaRxCvIswOJ
         ZuMPzxuiIpzxCSvOe9dhuFDGRpT2G3VA1fRvHdXlOqIHEryBaL37Tcyfx11XPorYvOUY
         kD1IKR4ErIQ6fRuvPXvllJSriT62XXDswCQz1ulOjNcM+h6oPX6P8uNEZvUHPzeKuR8J
         7+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQRb83QAFePKhKbHLajNFJKcMixGfgCDUPELEyoVamM=;
        b=t8IZtDnpzETI3vY3p/lnAjklQ7FFrLc9Uv+BkPTp15nymnyPYgfoyfS74UKbpgOjkj
         UCr/ptx7/CCM9Xvt83omuBVT6Of+a4rdMf0M2XdNeMfSJFB8SQEOdd+WrDDtpFXu91Cg
         W+yL/lw03S+hxe/QA6B+54ObwjO3U3RDPFmdz386b6DP0+L9QM/l+leoOqEgVHGhuhBY
         sF+LY2e6XkbPVDK0T+QBhBclpA1/Ab2yhCl3lExvyZoqqDGxh8gYs3w96Om1RAvBrJCg
         7PJJMccx1ZHIiyguBWO/orIRvd87Vu9K5Kt8JU3hFMY5gEDEDoM7IHyN/RQfAjC83lgK
         nocg==
X-Gm-Message-State: ACrzQf27upS1BULMNWdcnTDZqVghVq32T/oCtPfAC3kDW8eE9RQSiPru
	wRyCz+aJzeay8HpeSE1WIFZAVvZSv2mu+g==
X-Google-Smtp-Source: AMsMyM6WO6wHfpMi5sS8Lc6uHKgFyual7QKjuOAGsM1TIzn5Ix6NPJDk49DxpV9tBo6QyeZD9puALg==
X-Received: by 2002:a2e:b892:0:b0:26f:ec13:e712 with SMTP id r18-20020a2eb892000000b0026fec13e712mr317706ljp.50.1666980709749;
        Fri, 28 Oct 2022 11:11:49 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id o4-20020ac24944000000b0048aa9d67483sm654736lfi.160.2022.10.28.11.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 11:11:49 -0700 (PDT)
Date: Fri, 28 Oct 2022 18:11:48 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vt6655: fix lines of code ending in a '('
Message-ID: <Y1wbZEHyXKcnlJN/@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fix several checkpatch errors related to lines ending with a '(' by
joining some lines of code and indenting properly to increase
visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 165 ++++++++++++++--------------------
 1 file changed, 69 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 1e5036121665..7eb7c6eb5cf0 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -139,15 +139,11 @@ static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
  * PK_TYPE_11GB    2
  * PK_TYPE_11GA    3
  */
-static
-unsigned int
-s_uGetTxRsvTime(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	unsigned int cbFrameLength,
-	unsigned short wRate,
-	bool bNeedAck
-)
+static unsigned int s_uGetTxRsvTime(struct vnt_private *pDevice,
+				    unsigned char byPktType,
+				    unsigned int cbFrameLength,
+				    unsigned short wRate,
+				    bool bNeedAck)
 {
 	unsigned int uDataTime, uAckTime;
 
@@ -214,20 +210,16 @@ static __le16 get_rtscts_time(struct vnt_private *priv,
 }
 
 /* byFreqType 0: 5GHz, 1:2.4Ghz */
-static
-unsigned int
-s_uGetDataDuration(
-	struct vnt_private *pDevice,
-	unsigned char byDurType,
-	unsigned int cbFrameLength,
-	unsigned char byPktType,
-	unsigned short wRate,
-	bool bNeedAck,
-	unsigned int uFragIdx,
-	unsigned int cbLastFragmentSize,
-	unsigned int uMACfragNum,
-	unsigned char byFBOption
-)
+static unsigned int s_uGetDataDuration(struct vnt_private *pDevice,
+				       unsigned char byDurType,
+				       unsigned int cbFrameLength,
+				       unsigned char byPktType,
+				       unsigned short wRate,
+				       bool bNeedAck,
+				       unsigned int uFragIdx,
+				       unsigned int cbLastFragmentSize,
+				       unsigned int uMACfragNum,
+				       unsigned char byFBOption)
 {
 	bool bLastFrag = false;
 	unsigned int uAckTime = 0, uNextPktTime = 0, len;
@@ -316,17 +308,13 @@ s_uGetDataDuration(
 }
 
 /* byFreqType: 0=>5GHZ 1=>2.4GHZ */
-static
-__le16
-s_uGetRTSCTSDuration(
-	struct vnt_private *pDevice,
-	unsigned char byDurType,
-	unsigned int cbFrameLength,
-	unsigned char byPktType,
-	unsigned short wRate,
-	bool bNeedAck,
-	unsigned char byFBOption
-)
+static __le16 s_uGetRTSCTSDuration(struct vnt_private *pDevice,
+				   unsigned char byDurType,
+				   unsigned int cbFrameLength,
+				   unsigned char byPktType,
+				   unsigned short wRate,
+				   bool bNeedAck,
+				   unsigned char byFBOption)
 {
 	unsigned int uCTSTime = 0, uDurTime = 0;
 
@@ -409,22 +397,18 @@ s_uGetRTSCTSDuration(
 	return cpu_to_le16((u16)uDurTime);
 }
 
-static
-__le16
-s_uFillDataHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pTxDataHead,
-	unsigned int cbFrameLength,
-	unsigned int uDMAIdx,
-	bool bNeedAck,
-	unsigned int uFragIdx,
-	unsigned int cbLastFragmentSize,
-	unsigned int uMACfragNum,
-	unsigned char byFBOption,
-	unsigned short wCurrentRate,
-	bool is_pspoll
-)
+static __le16 s_uFillDataHead(struct vnt_private *pDevice,
+			      unsigned char byPktType,
+			      void *pTxDataHead,
+			      unsigned int cbFrameLength,
+			      unsigned int uDMAIdx,
+			      bool bNeedAck,
+			      unsigned int uFragIdx,
+			      unsigned int cbLastFragmentSize,
+			      unsigned int uMACfragNum,
+			      unsigned char byFBOption,
+			      unsigned short wCurrentRate,
+			      bool is_pspoll)
 {
 	struct vnt_tx_datahead_ab *buf = pTxDataHead;
 
@@ -555,19 +539,15 @@ s_uFillDataHead(
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
+static void s_vFillRTSHead(struct vnt_private *pDevice,
+			   unsigned char byPktType,
+			   void *pvRTS,
+			   unsigned int cbFrameLength,
+			   bool bNeedAck,
+			   bool bDisCRC,
+			   struct ieee80211_hdr *hdr,
+			   unsigned short wCurrentRate,
+			   unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
@@ -750,19 +730,15 @@ s_vFillRTSHead(
 	}
 }
 
-static
-void
-s_vFillCTSHead(
-	struct vnt_private *pDevice,
-	unsigned int uDMAIdx,
-	unsigned char byPktType,
-	void *pvCTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+static void s_vFillCTSHead(struct vnt_private *pDevice,
+			   unsigned int uDMAIdx,
+			   unsigned char byPktType,
+			   void *pvCTS,
+			   unsigned int cbFrameLength,
+			   bool bNeedAck,
+			   bool bDisCRC,
+			   unsigned short wCurrentRate,
+			   unsigned char byFBOption)
 {
 	unsigned int uCTSFrameLen = 14;
 
@@ -868,21 +844,17 @@ s_vFillCTSHead(
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
+static void s_vGenerateTxParameter(struct vnt_private *pDevice,
+				   unsigned char byPktType,
+				   struct vnt_tx_fifo_head *tx_buffer_head,
+				   void *pvRrvTime,
+				   void *pvRTS,
+				   void *pvCTS,
+				   unsigned int cbFrameSize,
+				   bool bNeedACK,
+				   unsigned int uDMAIdx,
+				   void *psEthHeader,
+				   unsigned short wCurrentRate)
 {
 	u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
 	bool bDisCRC = false;
@@ -954,11 +926,12 @@ s_vGenerateTxParameter(
 	}
 }
 
-static unsigned int
-s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
-		  unsigned char *pbyTxBufferAddr,
-		  unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
-		  unsigned int is_pspoll)
+static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
+				      unsigned char byPktType,
+				      unsigned char *pbyTxBufferAddr,
+				      unsigned int uDMAIdx,
+				      struct vnt_tx_desc *pHeadTD,
+				      unsigned int is_pspoll)
 {
 	struct vnt_td_info *td_info = pHeadTD->td_info;
 	struct sk_buff *skb = td_info->skb;
-- 
2.34.1

