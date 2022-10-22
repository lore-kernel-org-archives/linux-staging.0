Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66AF7C;
	Sat, 22 Oct 2022 07:07:08 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id c22so6482902lja.6;
        Sat, 22 Oct 2022 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF2XVu1q9jU+DBiuqTBo6dmg55zjCxM1MoAMy78YdKg=;
        b=EF/ZK5EpfIWMRHB2E1p+7kYWmD6Du2wObIfV2UWmLRg9808YB4krJGSmbqweUD75Qi
         3YjJt8vF/T8/dN5p51Nu2anyPJPd612gcrt9NQokhDnzql0iilZtDi1VnMH1fe5JyRYP
         VpBx3S5h5/a0UmGLPifnpsAbJqh2NEYDcjKSiYq/5z+TRZ3LoxUwLnW0Hc42bujSNcGp
         bjNIUK7DmOfgQyfIUSWChi7svpRmA+Z3x3C5FnAqgftU/javstyYKebi1DYppAy4NvER
         4QnphlgyntrJ0Fd4Ih3oFlachl83CKrCjZcLKEIuIKzJnn4ao6GJqwHgE8X5wWmHydQO
         2zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NF2XVu1q9jU+DBiuqTBo6dmg55zjCxM1MoAMy78YdKg=;
        b=IgkFS253u6BKSHegUUX8mMXq/fAkbGIsFgtaKAWAiWjttn/8MMmTG7sKedmucnxZEz
         naQqjrUZl1r5dBLiIgUO1BSS2Cx5vy741lP57T1Hiydv84rNgY/RU96DhhGM3YWHOq73
         AmgzYxs8LykK13qnQVJcm0nCMoWiaOBfYn0ovrTwyDSGKb0P2DbfnSeymrqz/tYxQmgV
         gE32qx5XNRvbekoNRX9IReedjnXaWf7N+oKI56iY0CPT362RjNY5nkLEyr+flmRzM5DD
         5w15xdYNv+7SyIs3dcdJfpy60LcXrcyxFtwnxmWWiwmjR6Wsaqiu+mPZiiU1VM6ZXhrX
         bSeg==
X-Gm-Message-State: ACrzQf27GocKkYZ36bLtzp6xFwo5vkFQPhmaq+WGNdjntnpIZGhDqYDW
	wKdW6IAksXaKJvY7iCkFHdBEHDgwEM8rJnR+
X-Google-Smtp-Source: AMsMyM7FEYig1nYndmnUPEZEuZykm0LTclpJ+iw/mHkA23R1nJ8FIBRYJRPQF0b/Yer9raGrXrHOsw==
X-Received: by 2002:a05:651c:1547:b0:26e:9716:67ba with SMTP id y7-20020a05651c154700b0026e971667bamr8225237ljp.256.1666422427039;
        Sat, 22 Oct 2022 00:07:07 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s5-20020a2e1505000000b00276d2537921sm390404ljd.59.2022.10.22.00.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 00:07:06 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3 5/6] staging: vt6655: refactor long lines of code in the rest of the file
Date: Sat, 22 Oct 2022 07:06:11 +0000
Message-Id: <20221022070612.13009-6-tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch errors by refactoring long lines of code in the rest of
the file

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 105 ++++++++++++++++++++++------------
 1 file changed, 67 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 951d4172e9f2..572be45cdbeb 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1105,44 +1105,60 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 		if (byFBOption == AUTO_FB_NONE) {
 			if (bRTS) {/* RTS_need */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts));
-				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+					   sizeof(struct vnt_rrv_time_rts));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
-							cbMICHDR + sizeof(struct vnt_rts_g));
-				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
-							cbMICHDR + sizeof(struct vnt_rts_g) +
-							sizeof(struct vnt_tx_datahead_g);
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_rts) +
+						      cbMICHDR + sizeof(struct vnt_rts_g));
+				cbHeaderLength =
+					wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
+					cbMICHDR + sizeof(struct vnt_rts_g) +
+					sizeof(struct vnt_tx_datahead_g);
 			} else { /* RTS_needless */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_cts));
 				pvRTS = NULL;
-				pvCTS = (void *) (pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
+				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						  sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
-						sizeof(struct vnt_rrv_time_cts) + cbMICHDR + sizeof(struct vnt_cts));
+						      sizeof(struct vnt_rrv_time_cts) +
+						      cbMICHDR + sizeof(struct vnt_cts));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
-							cbMICHDR + sizeof(struct vnt_cts) + sizeof(struct vnt_tx_datahead_g);
+							cbMICHDR + sizeof(struct vnt_cts) +
+							sizeof(struct vnt_tx_datahead_g);
 			}
 		} else {
 			/* Auto Fall Back */
 			if (bRTS) {/* RTS_need */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts));
-				pvRTS = (void *) (pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_rts));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						  sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_rts) +
 					cbMICHDR + sizeof(struct vnt_rts_g_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
-					cbMICHDR + sizeof(struct vnt_rts_g_fb) + sizeof(struct vnt_tx_datahead_g_fb);
+					cbMICHDR + sizeof(struct vnt_rts_g_fb) +
+					sizeof(struct vnt_tx_datahead_g_fb);
 			} else { /* RTS_needless */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_cts));
 				pvRTS = NULL;
-				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
-				pvTxDataHd = (void  *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
-					cbMICHDR + sizeof(struct vnt_cts_fb));
+				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
+				pvTxDataHd = (void  *)(pbyTxBufferAddr + wTxBufSize +
+						       sizeof(struct vnt_rrv_time_cts) +
+						       cbMICHDR + sizeof(struct vnt_cts_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
-					cbMICHDR + sizeof(struct vnt_cts_fb) + sizeof(struct vnt_tx_datahead_g_fb);
+					cbMICHDR + sizeof(struct vnt_cts_fb) +
+					sizeof(struct vnt_tx_datahead_g_fb);
 			}
 		} /* Auto Fall Back */
 	} else {/* 802.11a/b packet */
@@ -1150,19 +1166,25 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 		if (byFBOption == AUTO_FB_NONE) {
 			if (bRTS) {
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
-				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				pvCTS = NULL;
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
-					sizeof(struct vnt_rrv_time_ab) + cbMICHDR + sizeof(struct vnt_rts_ab));
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR +
+						      sizeof(struct vnt_rts_ab));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
-					cbMICHDR + sizeof(struct vnt_rts_ab) + sizeof(struct vnt_tx_datahead_ab);
+					cbMICHDR + sizeof(struct vnt_rts_ab) +
+					sizeof(struct vnt_tx_datahead_ab);
 			} else { /* RTS_needless, need MICHDR */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
 				pvRTS = NULL;
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_tx_datahead_ab);
 			}
@@ -1170,19 +1192,25 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 			/* Auto Fall Back */
 			if (bRTS) { /* RTS_need */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
-				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				pvCTS = NULL;
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
-					sizeof(struct vnt_rrv_time_ab) + cbMICHDR + sizeof(struct vnt_rts_a_fb));
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR +
+						      sizeof(struct vnt_rts_a_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
-					cbMICHDR + sizeof(struct vnt_rts_a_fb) + sizeof(struct vnt_tx_datahead_a_fb);
+					cbMICHDR + sizeof(struct vnt_rts_a_fb) +
+					sizeof(struct vnt_tx_datahead_a_fb);
 			} else { /* RTS_needless */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_ab));
 				pvRTS = NULL;
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_ab) + cbMICHDR);
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_ab) +
 					cbMICHDR + sizeof(struct vnt_tx_datahead_a_fb);
 			}
@@ -1197,8 +1225,9 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
 	s_vGenerateTxParameter(pDevice, byPktType, tx_buffer_head, pvRrvTime, pvRTS, pvCTS,
 			       cbFrameSize, bNeedACK, uDMAIdx, hdr, pDevice->wCurrentRate);
 	/* Fill DataHead */
-	uDuration = s_uFillDataHead(pDevice, byPktType, pvTxDataHd, cbFrameSize, uDMAIdx, bNeedACK,
-				    0, 0, uMACfragNum, byFBOption, pDevice->wCurrentRate, is_pspoll);
+	uDuration = s_uFillDataHead(pDevice, byPktType, pvTxDataHd, cbFrameSize,
+				    uDMAIdx, bNeedACK, 0, 0, uMACfragNum, byFBOption,
+				    pDevice->wCurrentRate, is_pspoll);
 
 	hdr->duration_id = uDuration;
 
@@ -1446,8 +1475,8 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 		/* Get Duration and TimeStampOff */
 		short_head->duration =
 			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B,
-				    frame_size, PK_TYPE_11A, current_rate,
-				    false, 0, 0, 1, AUTO_FB_NONE));
+							    frame_size, PK_TYPE_11A, current_rate,
+							    false, 0, 0, 1, AUTO_FB_NONE));
 
 		short_head->time_stamp_off =
 				vnt_time_stamp_off(priv, current_rate);
@@ -1462,8 +1491,8 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 		/* Get Duration and TimeStampOff */
 		short_head->duration =
 			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B,
-				    frame_size, PK_TYPE_11B, current_rate,
-				    false, 0, 0, 1, AUTO_FB_NONE));
+							    frame_size, PK_TYPE_11B, current_rate,
+							    false, 0, 0, 1, AUTO_FB_NONE));
 
 		short_head->time_stamp_off =
 			vnt_time_stamp_off(priv, current_rate);
-- 
2.34.1

