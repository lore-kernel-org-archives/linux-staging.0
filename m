Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD621C38
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 16:51:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso3771169pjm.3
        for <linux-staging@lists.linux.dev>; Sat, 08 Apr 2023 09:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680972718;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7rWvOXfuvSXh57FKc1iytj8qoT2uElPC4EU8H1W8eo=;
        b=SpAyZzbqRob7hIl0izmIl5sXQvWinEN5OnK2n6ff5QZw6pskhBAtOB0ERN8dq9umgT
         kDc5mwi3vQMwA4EdqyICk3xna2ATFXQOiQeZ4j2VCWUzZnhDeQFkk57Ov87EcnV9wjPf
         zgUp7NoJLfC1x9fv8MgOfHd0OAC94pvIxXgXRPv771Ah/l/7DIGKAU8FmMD243QDANQf
         5aBxne/u9g0+nU/el6vp34D4M9PLZ4L055a9FgfF8IiQblTOkoe5S7SN0FdiBCqyHjhm
         hrt3lKtQ2xQlWltvKLPvUcRaLCFFilnJZJhX7PX8sOUTFHAabBUWVh2KvfES28kA3ajK
         etrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680972718;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7rWvOXfuvSXh57FKc1iytj8qoT2uElPC4EU8H1W8eo=;
        b=uN5WnbGNU1iR6y/I/QmF9NDwYnmINgDhZqSPaJUkjA0Par2gqWF1iGfVnZZnoofROu
         aGAX6LJ3TXIYXMnl911p+xvosyVZ8LdEA9od/leucbrY19Skt20TlxFMWm3pB+QW6743
         bawZEGNxacUtm9JaXe8J2fv2J+ghQzQPpcI7Tiwh1RMyrs4xKbNZ4PHL7wE5tOZAe+5N
         5LmLIdbBU0uQfX1aXZ4CXRhOZ2KLzsXMqB2LiCdVzojsHIlEuQgNEcDb5ABQXpIpeWQc
         CPRdt+GisHKR55UFLDteQcVrUlVDMkBF8q1gkiZ8sO98M+14PGJUgPXH1dQZW9vF8aDt
         UMgw==
X-Gm-Message-State: AAQBX9dYDo3giPbhgOqCci9Ipg/HQbGJ0NCF3190avgXPRNJtg219gSb
	FFIRF5iJat7dNHRvrC9X/mc=
X-Google-Smtp-Source: AKy350YZtEG7zNuTezKUG95+2SMR1vPAADRBOCuDpuDqkhQuyhxNIfUKZS4m+isgIPtkVUAqhHTs0g==
X-Received: by 2002:a17:90a:aa83:b0:23d:2f73:d3c8 with SMTP id l3-20020a17090aaa8300b0023d2f73d3c8mr7172990pjq.42.1680972718120;
        Sat, 08 Apr 2023 09:51:58 -0700 (PDT)
Received: from sumitra.com ([117.207.136.97])
        by smtp.gmail.com with ESMTPSA id v3-20020a654603000000b004fb3e5681cesm4447455pgq.20.2023.04.08.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 09:51:57 -0700 (PDT)
Date: Sat, 8 Apr 2023 09:51:51 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix alignment to match open parenthesis
Message-ID: <20230408165151.GA261885@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix alignment to match opening parenthesis as suggested by Linux kernel
coding-style. This issue is reported by checkpatch.

CHECK: Alignment should match open parenthesis

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index cde41111012a..d0b943145259 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -564,11 +564,9 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 
 			for (k = 0; k < 5; k++) {
 				if (k != 4)
-					tmp_report[k] = rtl92e_readb(dev,
-							 Tssi_Report_Value1+k);
+					tmp_report[k] = rtl92e_readb(dev, Tssi_Report_Value1+k);
 				else
-					tmp_report[k] = rtl92e_readb(dev,
-							 Tssi_Report_Value2);
+					tmp_report[k] = rtl92e_readb(dev, Tssi_Report_Value2);
 
 				if (tmp_report[k] <= 20) {
 					viviflag = true;
@@ -1138,7 +1136,7 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_false_alarm(struct net_device *dev)
 		return;
 	if (priv->undecorated_smoothed_pwdb <= dm_digtable.rssi_low_thresh) {
 		if (dm_digtable.dig_state == DM_STA_DIG_OFF &&
-			(priv->reset_count == reset_cnt))
+		    (priv->reset_count == reset_cnt))
 			return;
 		reset_cnt = priv->reset_count;
 
@@ -1216,7 +1214,7 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_highpwr(struct net_device *dev)
 	if (priv->undecorated_smoothed_pwdb >=
 	    dm_digtable.rssi_high_power_highthresh) {
 		if (dm_digtable.dig_highpwr_state == DM_STA_DIG_ON &&
-			(priv->reset_count == reset_cnt_highpwr))
+		    (priv->reset_count == reset_cnt_highpwr))
 			return;
 		dm_digtable.dig_highpwr_state = DM_STA_DIG_ON;
 
@@ -1226,7 +1224,7 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_highpwr(struct net_device *dev)
 			rtl92e_writeb(dev, rOFDM0_RxDetector1, 0x43);
 	} else {
 		if (dm_digtable.dig_highpwr_state == DM_STA_DIG_OFF &&
-			(priv->reset_count == reset_cnt_highpwr))
+		    (priv->reset_count == reset_cnt_highpwr))
 			return;
 		dm_digtable.dig_highpwr_state = DM_STA_DIG_OFF;
 
@@ -2111,9 +2109,8 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 				} else if (priv->undecorated_smoothed_pwdb >=
 					   (RegC38_TH+5)) {
 					if (reg_c38_State) {
-						rtl92e_writeb(dev,
-							rOFDM0_RxDetector3,
-							priv->framesync);
+						rtl92e_writeb(dev, rOFDM0_RxDetector3,
+							      priv->framesync);
 						reg_c38_State = RegC38_Default;
 					}
 				}
@@ -2129,14 +2126,14 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 	if (priv->frame_sync_monitor) {
 		if (priv->reset_count != reset_cnt) {
 			rtl92e_writeb(dev, rOFDM0_RxDetector3,
-				       priv->framesync);
+				      priv->framesync);
 			reg_c38_State = RegC38_Default;
 			reset_cnt = priv->reset_count;
 		}
 	} else {
 		if (reg_c38_State) {
 			rtl92e_writeb(dev, rOFDM0_RxDetector3,
-				       priv->framesync);
+				      priv->framesync);
 			reg_c38_State = RegC38_Default;
 		}
 	}
-- 
2.25.1

