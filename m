Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6857ED;
	Mon, 24 Oct 2022 10:02:34 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id j4so15957192lfk.0;
        Mon, 24 Oct 2022 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUjB/LIeIaF8ms/g2Nbld44QrRlq9IWMpRhgl/Fq6KI=;
        b=nq1Q11H5du7gVhunvJWLyKQeRvhmbS4Uz2eP0nz++8feNXQN2mIkyEwEYVGnee7+/6
         3VpVwaBT2Cz4zam03P55KzT/dT1dH03pBYnxAxq/dNZdf4glEPr3uZdPR1Bo7iZjaznR
         Huag/Lr81tqDMleuaKqknAAe64Ieyv4AHKS8o9FR1Ozm/12+A3iLOWHuEPsbajyck4Jd
         LqotuWd1t4g3eW9E5Q22C/kzonAMXOLtWXze5oCw20ZqAcfukUnymG0dkRdIZWB+n7PV
         qCIHscHCngi/YTt+WIEFpC9frMTWgqjXSBcwPimf2rrP8IOhHyLhXriBBMZm5Kkf5RQD
         G4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUjB/LIeIaF8ms/g2Nbld44QrRlq9IWMpRhgl/Fq6KI=;
        b=VOYWCJ5Sxw+2NYilsu6CRYdb0+jIdNb4FF5H4F+Lgaps71r/CdJ4j256NtL8tuEJ11
         F1OO4fPH5kQWQrHOY7KA1XiOyEcmbeaIeRvgO9UMQPHabS1wMX8wnrEDVP0Q8CLKy0lY
         ckTrS/bupVYeGC/yb9bkC4XbmCBtYJGWsu8lwlJPQftrdd4G0XL5B5p1MQeB6VCV+JEP
         m8rUtjDLs3z6j7ZhHqaAa+vloYWSaXs48zh+IhjJ6gAWsfy7cY+sVa7WvFLfYBDAQXua
         A4AldiA+VJgZt1wqhNlzFzST+OKl9C/+n6hKtbHAU5pYPddGoQy8nN+61QGCE5xLerVn
         B6Qg==
X-Gm-Message-State: ACrzQf1oEf34MR3vfJhX1m2RVWV4J/03UsNIniWuOOSKO8oz9x5ubD2l
	0PdlDU6EuJrqjf42ZNSnk6U=
X-Google-Smtp-Source: AMsMyM5ocewgUwZ4FqsY3ThKJ9oXuzldPMVB0iB4wvhmkYKgNq0LB7MdEO0L8TBltMOc1SaxEYilTg==
X-Received: by 2002:ac2:5dc5:0:b0:4a6:3193:582 with SMTP id x5-20020ac25dc5000000b004a631930582mr8585481lfq.236.1666605752278;
        Mon, 24 Oct 2022 03:02:32 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s9-20020a2eb629000000b0026dfbdfc1ddsm4896832ljn.11.2022.10.24.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 03:02:31 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v4 6/6] staging: vt6655: refactor code to avoid a line ending in '('
Date: Mon, 24 Oct 2022 10:01:52 +0000
Message-Id: <43693eef6afe24973ed28f8b26e2d5117f5d35f1.1666605225.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666605225.git.tanjubrunostar0@gmail.com>
References: <cover.1666605225.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

join unnecessary split lines to avoid them ending in '('

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

