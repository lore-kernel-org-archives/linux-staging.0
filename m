Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B661F7E;
	Tue,  1 Nov 2022 11:14:34 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id l8so9466715ljh.13;
        Tue, 01 Nov 2022 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODOqilNSijD4py9EAus4CVCtQnvb754955fyu3E9a6Y=;
        b=XnmIx4hOAXsqj1PC3SDcc7sRM7ZiSp5OeQjyiGSBCcVNp/OyVPT9fwwMivbvhrLBJW
         MAoWgSr4uEtUnauiw1GZrdeCVwkRRGfS+8hU7dRuq7yfcox/y2kdX9qEiaCPK1mpzxJW
         v2B41bfsXERiI5zE7d1fU1cjI98j/RqsdeBui8r3meK59vV8+GNcazINrBpRhiZ6e0bB
         oDG/RPSWD2pE6ZeP+TToq/8C1f2Tk1COJykyCpLOsNgvu+W99SgW0mBtQ4YyXoninrO/
         AT9TUk0MzJjfkFuD7nZQKkUo/9GYrW4/h7LtGJFu0cdDzOk1apUQQcvASiqpN8Ugfq6c
         qp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODOqilNSijD4py9EAus4CVCtQnvb754955fyu3E9a6Y=;
        b=i3fYNu/3FMLrAH2XxRNrqn2uZU+X7+AkgH8AlEmK+10cMrZ5/aX3u/K2G4K2Aewn1J
         CUGIYd89AHmVJiIgQbBfNbdH3QGbvpKrNXw3AVPF+bAhObfUd6vxOoH5VFTEiN0Lp/bB
         G1DDr7HIuyQyMVvfKY8feJ3mijTOQ4D6Nf/SRMWKNHt44hLAq/J5kjFToKdCvGqeNoyd
         PcKEEcQrn9xQzTadf4Vuo7tu4jMCn0YXymin9UCmOU8CLnyBB/d68ZsGqtWRYa1nb1+n
         iazmsc9xIsSWGYLFGGZuseXHENMZqlv9MZr3E6s00nvlGgnmoJYeeFeuE87sCpgnHSon
         ReEA==
X-Gm-Message-State: ACrzQf3vmgQ047JBy2WGEFOSbVMsJ5YEyQ1j1GopSeCjnWhWks19s0SL
	YP2FPIDsuCjnHvgdCYxecE8=
X-Google-Smtp-Source: AMsMyM6xt6uwOkEGQU4Qwe0/HFDzf9PTR1VXNz8cNbSKEVyTggHbKFXNqNdWrF9Q8vDqV7yjigVF5A==
X-Received: by 2002:a2e:1505:0:b0:277:5648:24cf with SMTP id s5-20020a2e1505000000b00277564824cfmr4196737ljd.430.1667301272727;
        Tue, 01 Nov 2022 04:14:32 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id e17-20020a05651236d100b0048af3c090f8sm1629472lfs.13.2022.11.01.04.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 04:14:32 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 1/2] change the function name s_vFillRTSHead
Date: Tue,  1 Nov 2022 11:13:27 +0000
Message-Id: <16e1033e32dd5a82e058c7c69ea2ec93800a30b7.1667300134.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667300134.git.tanjubrunostar0@gmail.com>
References: <cover.1667300134.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the use of Hungarian notation, which is not used in the Linux
kernel

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 31ae99b3cb35..d7e439cd8675 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -23,7 +23,7 @@
  *      s_uGetTxRsvTime- get frame reserved time
  *      s_vFillCTSHead- fulfill CTS ctl header
  *      s_vFillFragParameter- Set fragment ctl parameter.
- *      s_vFillRTSHead- fulfill RTS ctl header
+ *      fill_rts_head- fulfill RTS ctl header
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
+static void fill_rts_head(struct vnt_private *pDevice,
+			  unsigned char byPktType,
+			  void *pvRTS,
+			  unsigned int	cbFrameLength,
+			  bool bNeedAck,
+			  bool bDisCRC,
+			  struct ieee80211_hdr *hdr,
+			  unsigned short wCurrentRate,
+			  unsigned char byFBOption);
 
 static void s_vGenerateTxParameter(struct vnt_private *pDevice,
 				   unsigned char byPktType,
@@ -912,7 +912,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
 
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pvRrvTime;
 
@@ -931,7 +931,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
@@ -945,7 +945,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-- 
2.34.1

