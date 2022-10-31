Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DA37E
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 15:37:57 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id d26so30330889eje.10
        for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9yhgj+6ArvrtFVIbg6vtYy8oqEY7mQcPE3AQ+WlIQ0=;
        b=Pd2Xcu0rYuMekQASXdJfXt/Fh70vvgyBjR8Ldw4R2YCGnJqjEekehmKBrZDVztpF7R
         DQNEaCHuXHob1edwmp3v4NC7QoPdmnR2+anKHz+5euk2gY4ElIMOsQ7fXQ3Fo5zI0emq
         DZpniI0yfCo3fmlDQhYIzfnEm2OyHIkdn19Qz0KwzBWP6sfkG2ZZFE0pczeQhtKkeLzS
         LrDsrdtr65s4471Sswfd4P+7ioweFbZ46QQozUbtptZM3Cg/0kZR/Au8bA6LDiYMifYk
         KFY2h2F2vs4ziysMXSXrOGwusYXcfD1zmIFAdwFOe71kr+tqOv6jVlVVnVvJ5Q1YZIgK
         ac9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9yhgj+6ArvrtFVIbg6vtYy8oqEY7mQcPE3AQ+WlIQ0=;
        b=kOwvRPvkQagvVShT6DuZVXKCF3NRxhD7QTQCXabSfJF75+gOvJiz1AToDzmEM++h4o
         R2U1HbRCQ13c0ke7vBLb3j968iuZ4WMNyV0VqycWTMtPBntxBFU+WLPJezVzcbp5dCWg
         rRWdAf2r5dK/o9xHEHOpgda8TbCUav5+YUleNOokeiMMjHQUn5Gkam/D1lDWuwN7AyfL
         wOCYWgJaMj7hBoDnBn4XK2rNy0k9Qn0OkFtpln4+FVE5so8smi0c+VUJKeSrwCtWzEbC
         KmwtQMUdA5xEiRzfjKa0Qa/Y4nqMNavAeyDZfj1yqcfzVvOOGYUH0Db8lbteB87eBFqs
         vG8Q==
X-Gm-Message-State: ACrzQf0ihbw6yDqgXxMYE1vHrQBA5Z0FVfHWcw25mlG8eyAJqUS9cj5m
	5uBiBqhgt9ciZWdK7ip90Bk=
X-Google-Smtp-Source: AMsMyM5LT3S8Sf3tClaiBHaGlWt/pMux0Iu1g5BlUWs9LQeW4TdAgV7usujoZgjhxPzpq0Z6Bd+biQ==
X-Received: by 2002:a17:906:66ce:b0:7ad:d178:c252 with SMTP id k14-20020a17090666ce00b007add178c252mr5800353ejp.158.1667230676190;
        Mon, 31 Oct 2022 08:37:56 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb7e.dynamic.kabel-deutschland.de. [95.90.187.126])
        by smtp.gmail.com with ESMTPSA id f24-20020a17090631d800b007ad98918743sm3072990ejf.1.2022.10.31.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 08:37:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: replace ternary operator with min, max, abs macros
Date: Mon, 31 Oct 2022 16:37:43 +0100
Message-Id: <20221031153743.8801-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace some ternary operators with the min(), max() or abs() macros
to improve readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c      | 3 +--
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 2 +-
 drivers/staging/r8188eu/hal/odm_RTL8188E.c   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 4f8220428328..bd6c1a401c59 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -476,8 +476,7 @@ static uint rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 {
 	uint len;
 
-	len = rtw_remainder_len(pfile);
-	len = (rlen > len) ? len : rlen;
+	len = min(rtw_remainder_len(pfile), rlen);
 
 	if (rmem)
 		skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 60cdfcf80daa..622f95d3f2ed 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -583,7 +583,7 @@ static bool phy_SimularityCompare_8188E(
 			tmp2 = resulta[c2][i];
 		}
 
-		diff = (tmp1 > tmp2) ? (tmp1 - tmp2) : (tmp2 - tmp1);
+		diff = abs(tmp1 - tmp2);
 
 		if (diff > MAX_TOLERANCE) {
 			if ((i == 2 || i == 6) && !sim_bitmap) {
diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index dd9c8291f025..f3f4074d4316 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -199,7 +199,7 @@ static void odm_HWAntDiv(struct odm_dm_struct *dm_odm)
 			Aux_RSSI = (dm_fat_tbl->AuxAnt_Cnt[i] != 0) ? (dm_fat_tbl->AuxAnt_Sum[i] / dm_fat_tbl->AuxAnt_Cnt[i]) : 0;
 			TargetAnt = (Main_RSSI >= Aux_RSSI) ? MAIN_ANT : AUX_ANT;
 			/* 2 Select MaxRSSI for DIG */
-			LocalMaxRSSI = (Main_RSSI > Aux_RSSI) ? Main_RSSI : Aux_RSSI;
+			LocalMaxRSSI = max(Main_RSSI, Aux_RSSI);
 			if ((LocalMaxRSSI > AntDivMaxRSSI) && (LocalMaxRSSI < 40))
 				AntDivMaxRSSI = LocalMaxRSSI;
 			if (LocalMaxRSSI > MaxRSSI)
@@ -211,7 +211,7 @@ static void odm_HWAntDiv(struct odm_dm_struct *dm_odm)
 			else if ((dm_fat_tbl->RxIdleAnt == AUX_ANT) && (Aux_RSSI == 0))
 				Aux_RSSI = Main_RSSI;
 
-			LocalMinRSSI = (Main_RSSI > Aux_RSSI) ? Aux_RSSI : Main_RSSI;
+			LocalMinRSSI = min(Main_RSSI, Aux_RSSI);
 			if (LocalMinRSSI < MinRSSI) {
 				MinRSSI = LocalMinRSSI;
 				RxIdleAnt = TargetAnt;
-- 
2.38.0

