Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217633209;
	Fri, 28 Oct 2022 17:41:29 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id r14so9463868lfm.2;
        Fri, 28 Oct 2022 10:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gobEsrmePL4+N4TGxYJCOu1pMn//ERVI3Xu6DuFbms8=;
        b=U/Ys0n7QtTNlumbAOwjMGrn7J6valKN8nyM2L+AFYrmZjgwmcGzEfCR4sW3Qqm1FoV
         Hq/yyr6gEeXY/XkYVMP7Ipnlu13lKSQf7JmE0red1fDPDPXTfjn4GPBWtGOMrR2R/cV2
         T4RqSwUe6M7ySN44TqlehWg5P9sBp/ZxbgJA09UrWx0Ln2JsuGikIMhrqiN8Y0OUerm+
         qAscNWAf+Y8SncA76BjamwvBAIDM0oEQeq7LiJJ7z/2oQ3pa0rnP9SgmBDrwQ5uUtpFX
         iYleukk7WuvvoEcSvZfsAnkJGpvr/AidZhf9SUF9e+DdMvhSqu5GVrCppI4vmjKpYGtc
         o0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gobEsrmePL4+N4TGxYJCOu1pMn//ERVI3Xu6DuFbms8=;
        b=esK/KwTV2dRYrU87B698BAaKkxqjbokslYv/dKUGxD+B6hu0daqyzzlZ7FH6q4hVpm
         vdQzOxx1YWJFbIqvPpTko+enCd5VK2FNWEL2vbv9VEFO5rk3DfWPeC1Km/1RwkNx8klr
         qi/eeGwPq8/OPZIVXOs8GXe5OWMIFnhTQBYOrhoikm7w2UKLA0++R4TZePecv0k2rH6E
         fbZoaClrzNQ8JeRnWIBtnsCrg5c76KKXhQ6SVaRB8btTuSNiqcwswY/yeiO3rY2iN+v1
         Ztkeg/5yAeWi0JwjfyUB3tG710MNWyhLd+zd1DVALKizARRnuMnLnLxFYmRfW0mhDO4x
         SZpg==
X-Gm-Message-State: ACrzQf1DuAh9qqdN21WVB2b/q1Mpp9kQcRtRPmuP4hfbBVuo5D77CpXW
	4Lhl+ywibW+KXLVcPPPW2e4=
X-Google-Smtp-Source: AMsMyM7ak71MHGhKbrt4lK4LvHWWmFHYNFnHD1S4P5dx4XqvrgpMoZ7dlYFRn92MZxRsOvg+LyVt8Q==
X-Received: by 2002:a19:c503:0:b0:4a2:b966:37ec with SMTP id w3-20020a19c503000000b004a2b96637ecmr187398lfe.319.1666978888661;
        Fri, 28 Oct 2022 10:41:28 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s2-20020a2eb622000000b0026dfdcbccdasm725322ljn.14.2022.10.28.10.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:41:28 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v7 6/6] staging: vt6655: fix lines of code ending in a '('
Date: Fri, 28 Oct 2022 17:40:59 +0000
Message-ID: <43693eef6afe24973ed28f8b26e2d5117f5d35f1.1666849707.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666849707.git.tanjubrunostar0@gmail.com>
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20221028174059.rHKoUbZ-9fwskuLTJzOuSM7elKxnrOEdUXj0h4AppsI@z>

fix checkpatch errors related to lines ending with a '(' by
joining splitted lines of code and indenting properly to increase
visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 6a4fcb16b674..d585435520b3 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1118,7 +1118,7 @@ static unsigned int s_cbFillTxBufHead(struct vnt_private *pDevice,
 				pMICHDR = (struct vnt_mic_hdr *)(pbyTxBufferAddr + wTxBufSize +
 								 sizeof(struct vnt_rrv_time_cts));
 				pvRTS = NULL;
-				pvCTS = (void *) (pbyTxBufferAddr + wTxBufSize +
+				pvCTS = (void *)(pbyTxBufferAddr + wTxBufSize +
 						  sizeof(struct vnt_rrv_time_cts) + cbMICHDR);
 				pvTxDataHd = (void *)(pbyTxBufferAddr + wTxBufSize +
 						      sizeof(struct vnt_rrv_time_cts) + cbMICHDR +
@@ -1296,10 +1296,8 @@ static void vnt_fill_txkey(struct ieee80211_hdr *hdr, u8 *key_buffer,
 		ether_addr_copy(mic_hdr->addr2, hdr->addr2);
 		ether_addr_copy(mic_hdr->addr3, hdr->addr3);
 
-		mic_hdr->frame_control = cpu_to_le16(
-			le16_to_cpu(hdr->frame_control) & 0xc78f);
-		mic_hdr->seq_ctrl = cpu_to_le16(
-				le16_to_cpu(hdr->seq_ctrl) & 0xf);
+		mic_hdr->frame_control = cpu_to_le16(le16_to_cpu(hdr->frame_control) & 0xc78f);
+		mic_hdr->seq_ctrl = cpu_to_le16(le16_to_cpu(hdr->seq_ctrl) & 0xf);
 
 		if (ieee80211_has_a4(hdr->frame_control))
 			ether_addr_copy(mic_hdr->addr4, hdr->addr4);
@@ -1470,9 +1468,9 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 
 		/* Get Duration and TimeStampOff */
 		short_head->duration =
-			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B,
-				    frame_size, PK_TYPE_11A, current_rate,
-				    false, 0, 0, 1, AUTO_FB_NONE));
+			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B, frame_size,
+							    PK_TYPE_11A, current_rate, false,
+							    0, 0, 1, AUTO_FB_NONE));
 
 		short_head->time_stamp_off =
 				vnt_time_stamp_off(priv, current_rate);
@@ -1486,9 +1484,9 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 
 		/* Get Duration and TimeStampOff */
 		short_head->duration =
-			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B,
-				    frame_size, PK_TYPE_11B, current_rate,
-				    false, 0, 0, 1, AUTO_FB_NONE));
+			cpu_to_le16((u16)s_uGetDataDuration(priv, DATADUR_B, frame_size,
+							    PK_TYPE_11B, current_rate, false,
+							    0, 0, 1, AUTO_FB_NONE));
 
 		short_head->time_stamp_off =
 			vnt_time_stamp_off(priv, current_rate);
-- 
2.34.1

