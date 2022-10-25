Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB747B;
	Tue, 25 Oct 2022 23:39:17 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id bp15so25263369lfb.13;
        Tue, 25 Oct 2022 16:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbEoGrXusmODeHp59Zc33PMYoCkMrCDJTVhmN+b+I+A=;
        b=M9fqafIZ1Re9mdOIXzPeUQ2SxkiGyfeeov1l/PQhWDPAO7db+ZZK+C9YeB6Ihvuq36
         TpOQ2E4xpDuFYruMg7nZ8mQV16dapSI0/ahxfw7IcHxXZTDfyLlRqncA9cecH94bsura
         11hOYU1vEANCo4P19p7zdHeSituoHVfg3I0NenQo5s1VG19OlW3N6myBlX1YF9kclsK8
         f/osWfHTqIzpGc7awCXeLQpHXvd0k6AjjSUVKSUYIne6CGyEpMjkyylWeovahjTlrm7f
         oJFoxW92ufiwhDuA/ggeImMl2qgXPOckWO3byfwiQ+yD+e8fPAR17npkJcJfnjZPULzG
         UijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbEoGrXusmODeHp59Zc33PMYoCkMrCDJTVhmN+b+I+A=;
        b=0EyumGlaNF0AB8sXRzySLMpsi6H2JFX9/eSt+WMSy95Z6T9reDr0oW1cn+l/6NDLGx
         aN3aSlWq/IwoGVlDFWcmgXBYSFsUMwjCc/wXDv2pcLzInpeGoAmGPuXG22VNkuumUT7W
         dKBW9r0BPbv+bRhru9rdSZiTgJWN7n++x/QzQG8cSG38TPBOD6dH2TNvaWRjI1BVnCzS
         JTmmuYwgnN9uYOY7AQc7I1JbKWMCkXQBxavaCRkhT5UlGT+nmxckuu5ADk1IaaxoZo2b
         muSEtQVwRNEPxPKcjqfoYszc9A0NKfl7QX0ARz3ilUgf05EsVXnOPHq/hl8piGRKo7IZ
         4ulg==
X-Gm-Message-State: ACrzQf0GQ7T7nL7NYBri1uhFTiaXcZgEX64t7umWf2gbQhVvHH0692mx
	TNvg4t1vMTcKdzyZcqOQb7FvVPcRdhS/lQ==
X-Google-Smtp-Source: AMsMyM6UhwvO3JUqhW/6sJglO/qyarUK8nliSw1Qw+2cQpPNnVqcEx/ejROPYKKaxEqyAUIAHOK23g==
X-Received: by 2002:a19:9106:0:b0:4ab:a0dc:ac3e with SMTP id t6-20020a199106000000b004aba0dcac3emr4992767lfd.395.1666741155896;
        Tue, 25 Oct 2022 16:39:15 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05651c119100b0026daf4fc0f7sm701969ljo.92.2022.10.25.16.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:39:13 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 15/17] staging: vt6655: changed variable name: psEthHeader
Date: Tue, 25 Oct 2022 23:37:11 +0000
Message-Id: <a1cb8f6ad881bc6891d5baf22ced852c95e61754.1666740522.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666740522.git.tanjubrunostar0@gmail.com>
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

change variable names psEthHeader to meet the
linux coding standard, as it says to avoid using camelCase naming
style. Cought by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 5729798973b4..6a54f234261a 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -104,7 +104,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     unsigned int	cb_frame_size,
 				     bool b_need_ack,
 				     unsigned int	u_dma_idx,
-				     void *psEthHeader,
+				     void *ps_eth_header,
 				     unsigned short wCurrentRate);
 
 static unsigned int s_cbFillTxBufHead(struct vnt_private *p_device,
@@ -946,7 +946,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 				     unsigned int cb_frame_size,
 				     bool b_need_ack,
 				     unsigned int u_dma_idx,
-				     void *psEthHeader,
+				     void *ps_eth_header,
 				     unsigned short wCurrentRate)
 {
 	u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
@@ -986,7 +986,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 								b_need_ack);
 
 			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, b_need_ack,
-					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
+					  b_dis_crc, ps_eth_header, wCurrentRate, by_fb_option);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pv_rrv_time;
 
@@ -1015,7 +1015,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 
 			/* Fill RTS */
 			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, b_need_ack,
-					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
+					  b_dis_crc, ps_eth_header, wCurrentRate, by_fb_option);
 		} else if (!pv_rts) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
@@ -1033,7 +1033,7 @@ static void s_vgenerate_tx_parameter(struct vnt_private *p_device,
 
 			/* Fill RTS */
 			s_v_fill_rts_head(p_device, by_pkt_type, pv_rts, cb_frame_size, b_need_ack,
-					  b_dis_crc, psEthHeader, wCurrentRate, by_fb_option);
+					  b_dis_crc, ps_eth_header, wCurrentRate, by_fb_option);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pv_rrv_time;
 
-- 
2.34.1

