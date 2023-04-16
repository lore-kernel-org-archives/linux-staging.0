Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36AB10FB
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 07:20:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f04eb5d1a7so8624565e9.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681629621; x=1684221621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AUb4sZWN17aC9uOKE2iR6leNu0T6NHURX++nzdcY5IQ=;
        b=MylfWUa6l5E2JtYJ7hpuPbEowIeba5IImp/dH6hgWNM0p9QGdUDaDmtisIubZwQikE
         mxbLM6ZUClNtfMR3LTvZcpcsGxu1aOWLXm2yEgq1hwd7Cw5rsfinlP41oSTV2yuf5i5b
         VJsHlBQBQpco06d6T6/kDyihQwNxfJWEKIpdYAP16tzjwrs4ugGWk1l1+il/z6qYeNPX
         /XENEnca5zJTrglitawS/ZrwzBcZLlUTuY33QE7DbTvi0lRwUVuLl1oGdyu+w8pZDJvU
         Dn083f7fDbTaIIsK2PKzZKG9anqP3xoYXaII+lj/QRY7onhngkOWpy84Lj8kq3YpJSxp
         lUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681629621; x=1684221621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUb4sZWN17aC9uOKE2iR6leNu0T6NHURX++nzdcY5IQ=;
        b=CUC2S5cNkOmw6ShHCvCtejFfnef73KKWQAg3r485btUy3DcjL5Ivh8jTqCHfiNgrKl
         2KFG/3epPl9ps9n9riBZ2Y8vYNLTj1V912vpmBPmoR6ZitFTseSZqvsULhlyPtUjUhpz
         Hpiii69q7S0nLH4ZZgP89ULU6Qe8YtUsZVZr9HjAtVAklfGk543zlMSTVR0fDQIPJME5
         hjWA/DVzRrxLGcr/ORd3PTvUejEF9M/Ua4jFzc3NSDlNN1nhnVhxQ5Cmr9cl6MJ/3cF3
         bUg6QrcQYZg2QP9dvaFT2kfkG99z8Aqqo6YP5yRX1hVMO9TBlGsc4JuSNf7G7gbS2gYh
         w0xg==
X-Gm-Message-State: AAQBX9dkPm+0URgxUq0gMC74nDQCFyxLTQXDpjbslSMd91SQnhLiQwC+
	6QetijBMfVKeIHiR3WLj39I=
X-Google-Smtp-Source: AKy350YitU+UU2jw5wDn+l9M1NI73lhAQ0cERXBFyYf6PJFI8vTl1eBeYIT5zZaG79bcRBNm5JGTEw==
X-Received: by 2002:a5d:58d8:0:b0:2f7:ee2:c2a3 with SMTP id o24-20020a5d58d8000000b002f70ee2c2a3mr4343301wrf.3.1681629621442;
        Sun, 16 Apr 2023 00:20:21 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id d4-20020a056000114400b002cea8f07813sm7351663wrx.81.2023.04.16.00.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 00:20:20 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:20:19 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: rtl8192e: Remove unchanged variable
 frame_sync_monitor
Message-ID: <0c4bdca5f5dbb93bb05c6b7f32136d4dfb3b0e4b.1681627603.git.philipp.g.hortmann@gmail.com>
References: <cover.1681627603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681627603.git.philipp.g.hortmann@gmail.com>

Remove unchanged variable frame_sync_monitor and equations that have
always the same result to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 73 ++++++++------------
 2 files changed, 30 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 0eca73e4540f..c97e315a9091 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -382,8 +382,6 @@ struct r8192_priv {
 	u32		continue_diff_count;
 	bool		bswitch_fsync;
 	u8		framesync;
-	u8		frame_sync_monitor;
-
 	u32		reset_count;
 
 	enum reset_type rst_progress;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index ed8b39d3c856..43e335ab0733 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1826,7 +1826,6 @@ static void _rtl92e_dm_init_fsync(struct net_device *dev)
 	priv->rtllib->fsync_firstdiff_ratethreshold = 100;
 	priv->rtllib->fsync_seconddiff_ratethreshold = 200;
 	priv->rtllib->fsync_state = Default_Fsync;
-	priv->frame_sync_monitor = 1;
 
 	timer_setup(&priv->fsync_timer, _rtl92e_dm_fsync_timer_callback, 0);
 }
@@ -2053,12 +2052,10 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 
 			}
 		}
-		if (priv->frame_sync_monitor) {
-			if (reg_c38_State != RegC38_Fsync_AP_BCM) {
-				rtl92e_writeb(dev, rOFDM0_RxDetector3, 0x95);
+		if (reg_c38_State != RegC38_Fsync_AP_BCM) {
+			rtl92e_writeb(dev, rOFDM0_RxDetector3, 0x95);
 
-				reg_c38_State = RegC38_Fsync_AP_BCM;
-			}
+			reg_c38_State = RegC38_Fsync_AP_BCM;
 		}
 	} else {
 		switch (priv->rtllib->fsync_state) {
@@ -2075,50 +2072,40 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 			break;
 		}
 
-		if (priv->frame_sync_monitor) {
-			if (priv->rtllib->state == RTLLIB_LINKED) {
-				if (priv->undecorated_smoothed_pwdb <=
-				    RegC38_TH) {
-					if (reg_c38_State !=
-					    RegC38_NonFsync_Other_AP) {
-						rtl92e_writeb(dev,
-							      rOFDM0_RxDetector3,
-							      0x90);
-
-						reg_c38_State =
-						     RegC38_NonFsync_Other_AP;
-					}
-				} else if (priv->undecorated_smoothed_pwdb >=
-					   (RegC38_TH+5)) {
-					if (reg_c38_State) {
-						rtl92e_writeb(dev,
-							rOFDM0_RxDetector3,
-							priv->framesync);
-						reg_c38_State = RegC38_Default;
-					}
+		if (priv->rtllib->state == RTLLIB_LINKED) {
+			if (priv->undecorated_smoothed_pwdb <=
+			    RegC38_TH) {
+				if (reg_c38_State !=
+				    RegC38_NonFsync_Other_AP) {
+					rtl92e_writeb(dev,
+						      rOFDM0_RxDetector3,
+						      0x90);
+
+					reg_c38_State =
+					     RegC38_NonFsync_Other_AP;
 				}
-			} else {
+			} else if (priv->undecorated_smoothed_pwdb >=
+				   (RegC38_TH+5)) {
 				if (reg_c38_State) {
-					rtl92e_writeb(dev, rOFDM0_RxDetector3,
-						      priv->framesync);
+					rtl92e_writeb(dev,
+						rOFDM0_RxDetector3,
+						priv->framesync);
 					reg_c38_State = RegC38_Default;
 				}
 			}
+		} else {
+			if (reg_c38_State) {
+				rtl92e_writeb(dev, rOFDM0_RxDetector3,
+					      priv->framesync);
+				reg_c38_State = RegC38_Default;
+			}
 		}
 	}
-	if (priv->frame_sync_monitor) {
-		if (priv->reset_count != reset_cnt) {
-			rtl92e_writeb(dev, rOFDM0_RxDetector3,
-				       priv->framesync);
-			reg_c38_State = RegC38_Default;
-			reset_cnt = priv->reset_count;
-		}
-	} else {
-		if (reg_c38_State) {
-			rtl92e_writeb(dev, rOFDM0_RxDetector3,
-				       priv->framesync);
-			reg_c38_State = RegC38_Default;
-		}
+	if (priv->reset_count != reset_cnt) {
+		rtl92e_writeb(dev, rOFDM0_RxDetector3,
+			       priv->framesync);
+		reg_c38_State = RegC38_Default;
+		reset_cnt = priv->reset_count;
 	}
 }
 
-- 
2.40.0

