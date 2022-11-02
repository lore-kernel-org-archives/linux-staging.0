Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51D2582;
	Wed,  2 Nov 2022 14:09:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id f37so28399848lfv.8;
        Wed, 02 Nov 2022 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vodxGcB9Pfq4inF2n1v2hS81nVigSig+J8tui1TzmuI=;
        b=e/qJP6e1FUzJhEUZWVa0R6rF1rF7EmWXTZq7dzIrJBXev+c2OnbNKAN4SQNPbTiXhC
         qHaEq/Z2QDmQN2Pq0wQx1IjPmqLTYcGploBQNvY4ogc3fItUA4mGyClW+CCujAqn32ke
         WJO4MFQNIwHLWla0C4n20iUn7mtuS0BZ9dIsoBoNnkNRgckBkYOdJVZHVHWkKmaGms9s
         kIXTWqBKPMBC9qlItrMqbjJ00ncyQUHEJnYGRUI+mU7Ms6BXDo+FKHAmaDjjBMkVcRfT
         VrGxGD5ccRge2Gl9fUvhVIE0CxOwCikcTqVVFKYFQrwM8/Tl1/OvDP7EWUHPHZJzQUgt
         NamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vodxGcB9Pfq4inF2n1v2hS81nVigSig+J8tui1TzmuI=;
        b=51JvlQV+gumhIarXaZf4HAlLrvaBS3U1/FJUb7C4nZUuNQjYGWA7xt8sfDCHBhDkB3
         4UKuI/Cs5H5QddwQk7W7V7vpSgj293DtS14KOt0IrxDCuKYZ7bqyfySyFvch9WDh5qPn
         vNZb7lzjgSveJoQ50TzHyEMWqE9fmHLPyEjMoFRt9PEw/eQ17hGWsuVjI2Fbim8KefL2
         7ceFXbySg83/h1972pG1AiTTsEeBw6Q5GfGVLBdYwwSYAJ1M6ijv20WI0ptnvhe1PWnf
         /5uj7mLyefnB/gO4FLiA8S8CgUi1xHEkD3VezZBwxZo2T0f4XNwt6VhDxsdLyqZnhnLZ
         tOIQ==
X-Gm-Message-State: ACrzQf0TQDJJl9jDECb1yyhJTM4Y4TFW5RQQJsyGcCJg81zeQ/zwUHNy
	U80RzkT6cim48PciAVHPZ8GS12vvR5R2nQ==
X-Google-Smtp-Source: AMsMyM45YwFCqNKNFINuFl0RjlFgTYk/NqeZ8JkQG46HPl7XgbIr+zPAqYjZhFMoXjoE8DyFoJ9y5Q==
X-Received: by 2002:a05:6512:54a:b0:4af:b4ac:c2bb with SMTP id h10-20020a056512054a00b004afb4acc2bbmr9042950lfl.650.1667398151683;
        Wed, 02 Nov 2022 07:09:11 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id bj12-20020a2eaa8c000000b0026e0434eb1esm119503ljb.67.2022.11.02.07.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 07:09:11 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH V4 1/2] staging: vt6655: change the function name s_vFillRTSHead
Date: Wed,  2 Nov 2022 14:08:47 +0000
Message-Id: <5a0649c6019f1717cb2e2e8fc4e262f3747d73a5.1667397591.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667397591.git.tanjubrunostar0@gmail.com>
References: <cover.1667397591.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the use of Hungarian notation, which is not used in the Linux
kernel. Reported by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 31ae99b3cb35..c01fc1a593f3 100644
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
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pvRrvTime;
 
@@ -931,7 +931,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
@@ -945,7 +945,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-- 
2.34.1

