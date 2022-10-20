Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E47B;
	Thu, 20 Oct 2022 11:30:39 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id p8so6826355lfu.11;
        Thu, 20 Oct 2022 04:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HlZkA9cMQXxGdkJxrvcIgpC4zTHT7PCGOSCarF98fw=;
        b=Qddp436yqykHlrELlixj3k7NnlnNDEqKzvEbjFUTOqsb4kZr/FoIo7TuVLPE1LB/lp
         AVHcLPErhpjht6pRQ6uTZGC6cM4/RJejveNBDaEBt+SlBZfNr/MzgahIbsbidQOUNwPf
         KqP3hZ0imeFVyj3wqtv0mzCV94GTtTPi1Pd45O0vg334rnq81qrg9rI8xMuXFyna4GIX
         WwOLc6yuKOCXGWSORC8SGgNgOaP7FRGIRb/g/B9Z0BzPfUz9piBNHQRN8daYyxMJZDKL
         V5rUJV35otovgOI7gHWaUOeHPTxIOoRdIG3orBL7e12ssR1PiCsoah2z2lfbI9CdHu3/
         giIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HlZkA9cMQXxGdkJxrvcIgpC4zTHT7PCGOSCarF98fw=;
        b=XH3BMST8ZKXdhawVvn4TOSi5NMoS1V9Dt1AstO8Byb1uhbCppGM8+aCib4f2CMzYnE
         auwlAgszmzfN6WBSRXfB/x2NdrGE7ZYvAgYaDcECDfqNDxhs5oGMihfqddjow5lrGnIq
         +n0DAXh/V3PEBfunPJ3TBWsgWfEmOtR2Ig9UP7cxf6xZnPfL0wNoXlog9xF+/ZLAReZO
         6k6qdwI2HDa+vQk8EtLSF2VDV9QC3iZoj8fjtKvJPcZp3N2NZ3xLWIjG9zeP/tnqs1bS
         PwtfJZ2ubfMvlgkaPZgvF/glFs2i4Pu/zya2aHmfYaSnVvH+Y2qqguvBt1EKFaSi2mpA
         bBuw==
X-Gm-Message-State: ACrzQf3PkHbTZbGYy602O38ofU31jzoseSjpr/BBwclKi5yO6GBLIz4t
	hGluVIPZ4BQJU+lQnI0X2kVvMC7miE8Y8RW3
X-Google-Smtp-Source: AMsMyM5xkAS9ayI6cah9ixTnnB2Rip+uKkfjC69qVdQiWrA2av434aXTqVsInhtUCy6EpyERywbnTQ==
X-Received: by 2002:ac2:5b9b:0:b0:4a2:3d0d:cb47 with SMTP id o27-20020ac25b9b000000b004a23d0dcb47mr5002714lfn.610.1666265437643;
        Thu, 20 Oct 2022 04:30:37 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id s5-20020a05651c200500b0026ddaf38b0fsm2885429ljo.96.2022.10.20.04.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 04:30:37 -0700 (PDT)
Date: Thu, 20 Oct 2022 11:30:36 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v3] staging: vt6655: Fix Lines should not end with a '('
Message-ID: <Y1ExXEuhV3cJnTiD@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Code style warnings reported by checkpatch.
Improve the layout of a function header:
Put the first parameter immediately after the '(' and align the other
parameters underneath it.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>

---
v2: put static and void on the same line and adjusted the indentation as
suggested by Greg KH
---
v3: Reformat the code by inserting tabs and white space as recommended
by Nam Cao and Julia Lawall

 drivers/staging/vt6655/rxtx.c | 78 +++++++++++++++--------------------
 1 file changed, 33 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 5bdb5176772c..1e5036121665 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -85,35 +85,27 @@ static const unsigned short wFB_Opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pvRTS,
-	unsigned int	cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	struct ieee80211_hdr *hdr,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-);
-
-static
-void
-s_vGenerateTxParameter(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	struct vnt_tx_fifo_head *,
-	void *pvRrvTime,
-	void *pvRTS,
-	void *pvCTS,
-	unsigned int	cbFrameSize,
-	bool bNeedACK,
-	unsigned int	uDMAIdx,
-	void *psEthHeader,
-	unsigned short wCurrentRate
-);
+static void s_vFillRTSHead(struct vnt_private *pDevice,
+			   unsigned char byPktType,
+			   void *pvRTS,
+			   unsigned int	cbFrameLength,
+			   bool bNeedAck,
+			   bool bDisCRC,
+			   struct ieee80211_hdr *hdr,
+			   unsigned short wCurrentRate,
+			   unsigned char byFBOption);
+
+static void s_vGenerateTxParameter(struct vnt_private *pDevice,
+				   unsigned char byPktType,
+				   struct vnt_tx_fifo_head *,
+				   void *pvRrvTime,
+				   void *pvRTS,
+				   void *pvCTS,
+				   unsigned int	cbFrameSize,
+				   bool bNeedACK,
+				   unsigned int	uDMAIdx,
+				   void *psEthHeader,
+				   unsigned short wCurrentRate);
 
 static unsigned int
 s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
@@ -121,22 +113,18 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 		  unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
 		  unsigned int uNodeIndex);
 
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
-);
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
+			      bool is_pspoll);
 
 /*---------------------  Export Variables  --------------------------*/
 
-- 
2.34.1

