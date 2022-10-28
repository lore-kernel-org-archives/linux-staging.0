Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DB1FA8;
	Fri, 28 Oct 2022 06:40:14 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id be13so6771291lfb.4;
        Thu, 27 Oct 2022 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gobEsrmePL4+N4TGxYJCOu1pMn//ERVI3Xu6DuFbms8=;
        b=DrAql0F+RKOMWcw4yKgJMxE1la1WvS3y0HccrNw90mtIRYDj15TM+bUB1RjLgywP7S
         DCPhJ82dnikHFekk+8FY70oBBUZ5jEfRh9WHxB1qjawW/9kTP6QD7BJLtxf31Ve/edtq
         tF6uIODoh5dvqUJlx3D56BL3T3ZklqPq6s7SOH2FHWIiXAiWLgS04JzUc9Ijd2I/dF/x
         /gRHe4LArvy40apOWGKibq24nEWxNC/D30NzO5chlOVGDDTmLbJ/PZVCEZ9hYNOz7S2O
         5FQGkKk5q33J8OMIQxatxRxyEDB5uI42CeJfvBLwNvJ+doypkL2h8qRzenLVnQktJRiX
         yaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gobEsrmePL4+N4TGxYJCOu1pMn//ERVI3Xu6DuFbms8=;
        b=XqRNky2ulce5ksaxvBJO9vJxAstNcjfhzhWPvxu1oOA7caXDdTbJnkr0ET2+FxRbiE
         Ga9F0ivtUC7W7bQEUxD6V+OKcLjhoXOxsWZmQWHiedTlvxo+4dA6533wPtApxDe9YlC9
         BEXU8nUkFOcmvc2IhAEUIjn7/h6oYl9cjfKqG+czeS/PN98qeKnNZiRuVr5Zqt28KoPF
         xvlyNBKeegF++IXuyF7iiMQDQiMynZty+t98TcybLaTDsOm5frmStwE4xqKmbQi8loIk
         SCzqXgC4lZY9Lml3WlvyEMeH1bMgZB8DeNLYIVvDiaEWSbG6PQqQXRNIlvv/gS3Bto9C
         RN1g==
X-Gm-Message-State: ACrzQf3n2Zt2EHdk4u5Ew43mqdxhHpgBzDPt2mVSaqh4hexd40Bk/gT0
	DRxN5NpIyRhdNJVfZktp9ZLnxVEhu+pwVQ==
X-Google-Smtp-Source: AMsMyM72Npgklwq6Vqs+SdtDAwZpJmpOGHzAYR59FxRnIqfQ/XFO++4wKi4Vi7P2n3myr6suxnM70w==
X-Received: by 2002:a05:6512:1154:b0:4a2:7d6f:7814 with SMTP id m20-20020a056512115400b004a27d6f7814mr18224425lfg.342.1666939212993;
        Thu, 27 Oct 2022 23:40:12 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id t7-20020a05651c204700b0026dced9840dsm498509ljo.61.2022.10.27.23.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 23:40:12 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v7 6/6] staging: vt6655: fix lines of code ending in a '('
Date: Fri, 28 Oct 2022 06:39:29 +0000
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
Message-ID: <20221028063929.N1rjzeJXsmNxEUrNY0TH3lWJ_ySWef8FtumDKBIaobE@z>

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

