Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65764320A;
	Fri, 28 Oct 2022 17:41:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id p8so9393642lfu.11;
        Fri, 28 Oct 2022 10:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk+TiPiUxsPwinI95K1okpiLhPr3fYQEuz6nvFqNMpk=;
        b=oVgrX1WfK/pyZO3gKslamY9vOam0VT3uo1zgC67sM2hWKvshVm/DooNvDhsIwPY62j
         dFmwSeqqscgkJ+35IGIUZTRgIOKclXofJq2CwoGpKNa5wzukYheu2o7vwblUH0XO1dmx
         SLa/YBT2B0OuZAUqWaBx4bKhTvd3oThuleT44YB26lj8+AuBLU4Heee50Lg67LuPwCRk
         krbv3MXqs/u0VF6a0NrYcQbSnT5QVgdPpXpdT/d+1T+xtwGiAgq3YfOQugGAfNKu5Eg2
         FLlnOuorExVuA+lioluRUHRsgRBkHqbGmmUVqmJAtDNKcDtdMXGkUAJ2ced1tNryxRYs
         h4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk+TiPiUxsPwinI95K1okpiLhPr3fYQEuz6nvFqNMpk=;
        b=V3Dud9S7ObjbBGCnmPolm4YLZuNZR5/apihMid83f88FU0PA5dQO4RZoKhG7vzHfke
         cc9qKeYDJXFmEH0uTdMBfr0tH0VWrySovWwKGKvX6U4vWdPdj9zsBPFrC80M5a2+puW8
         WhL1x7ApbUO1xg7dSYa7JHO09350ngMMG046Teen5jWguibA4VPYfHjfXEuFjrLHZQEW
         dHflsJNOcyX/McyyiSlWrjbD7P3RZryOCehktexl+DsS35Oj7orhLdHvSwGpj9h1Zwh9
         bMcEKx8PzG1MDc4CRZzuVijVU0y4Z9kTdH5WYwB2YXeBzzi46aFOumXtpzfumMvG9sFZ
         w/kw==
X-Gm-Message-State: ACrzQf2GTQoBXL7IW4jBth1TuP0q0oS1AXfdb0E557DmBExxlryo3hhc
	KKgA9zkfBqgfHZRytId+5CU=
X-Google-Smtp-Source: AMsMyM72em/id+unPHyhlqAc6Ux8M2VrhsivqgkZKU172PDef31RGhJzFDsiHs4thxMLfXHfM0aCTA==
X-Received: by 2002:a05:6512:1096:b0:4a2:f71:60ea with SMTP id j22-20020a056512109600b004a20f7160eamr210615lfg.232.1666978879539;
        Fri, 28 Oct 2022 10:41:19 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s2-20020a2eb622000000b0026dfdcbccdasm725322ljn.14.2022.10.28.10.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:41:19 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v8 5/6] staging: vt6655: refactor long lines of code in the rest of the file
Date: Fri, 28 Oct 2022 17:40:57 +0000
Message-Id: <71c411a68c9c54b20e7fa687f736acac50b33b5e.1666978292.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666978292.git.tanjubrunostar0@gmail.com>
References: <cover.1666978292.git.tanjubrunostar0@gmail.com>
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
 drivers/staging/vt6655/rxtx.c | 86 +++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 475526b73e1a..6a4fcb16b674 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1102,44 +1102,59 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 		if (byFBOption == AUTO_FB_NONE) {
 			if (bRTS) {/* RTS_need */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts));
-				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_rts));
+				pvRTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
 				pvCTS = NULL;
-				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
-							cbMICHDR + sizeof(struct vnt_rts_g));
+				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
+						      sizeof(struct vnt_rrv_time_rts) +
+						      cbMICHDR + sizeof(struct vnt_rts_g));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_rts) +
 							cbMICHDR + sizeof(struct vnt_rts_g) +
 							sizeof(struct vnt_tx_datahead_g);
 			} else { /* RTS_needless */
 				pvRrvTime = (void *)(pbyTxBufferAddr + wTxBufSize);
-				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts));
+				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
+								 sizeof(struct vnt_rrv_time_cts));
 				pvRTS = NULL;
-				pvCTS = (void *) (pbyTxBufferAddr + wTxBufSize + sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
+				pvCTS = (void *) (pbyTxBufferAddr + wTxBufSize +
+						  sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
-						sizeof(struct vnt_rrv_time_cts) + cbMICHDR + sizeof(struct vnt_cts));
+						      sizeof(struct vnt_rrv_time_cts) + cbMICHDR +
+						      sizeof(struct vnt_cts));
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
+						 sizeof(struct vnt_rrv_time_rts) + cbMICHDR);
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
+				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize +
+						 sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
+				pvTxDataHd = (void  *)(pbyTxBufferAddr + wTxBufSize +
+						       sizeof(struct vnt_rrv_time_cts) +
 					cbMICHDR + sizeof(struct vnt_cts_fb));
 				cbHeaderLength = wTxBufSize + sizeof(struct vnt_rrv_time_cts) +
-					cbMICHDR + sizeof(struct vnt_cts_fb) + sizeof(struct vnt_tx_datahead_g_fb);
+					cbMICHDR + sizeof(struct vnt_cts_fb) +
+					sizeof(struct vnt_tx_datahead_g_fb);
 			}
 		} /* Auto Fall Back */
 	} else {/* 802.11a/b packet */
@@ -1147,19 +1162,25 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
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
@@ -1167,19 +1188,25 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
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
@@ -1195,7 +1222,8 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 			       cbFrameSize, bNeedACK, uDMAIdx, hdr, pDevice->wCurrentRate);
 	/* Fill DataHead */
 	uDuration = s_uFillDataHead(pDevice, byPktType, pvTxDataHd, cbFrameSize, uDMAIdx, bNeedACK,
-				    0, 0, uMACfragNum, byFBOption, pDevice->wCurrentRate, is_pspoll);
+				    0, 0, uMACfragNum, byFBOption, pDevice->wCurrentRate,
+				    is_pspoll);
 
 	hdr->duration_id = uDuration;
 
-- 
2.34.1

