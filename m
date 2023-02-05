Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC523B0
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 08:06:13 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id fi26so8828602edb.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 00:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/FJrVLcAKW7dc7MqSQRF48wmArQiFUNesAGFLiITg0=;
        b=I0LnG/Ai2sOlueHpvhYXWwR065xy3BZSzwWts7twB68GI8hNAKMhlV7ABQid65uXmd
         0H2VWsvE1MHIWvm8uJ3bciD6f2rP/Y+x1YMLaH4FzNKNux+E8r1L6d3BiSLui30BUXQx
         vXkM5i0OSH+9i0j3zEWLbOa1Pjpyv152qjRPUzCfEYKesCxwLrvimA0Z4urxZzBxYsI0
         hseZt1gqTfrVfvMAlvAhcnox69pH7OIy0nB6o0raUbzU0/8VgLLbvMAi0syJ0f364V4d
         QQDbv+SWG5JgJgMMZPAHRqHI4kLNi5AvQx4OHkb11bg6AzgiaSKkKMR81ZOGRbYjb77+
         /VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/FJrVLcAKW7dc7MqSQRF48wmArQiFUNesAGFLiITg0=;
        b=rjewjjNEtq8msdS0m/fmOKJzd/g5FxfJGYCHWw58W91xKOuYxyoBGc0xNL0WKTNyPl
         EUUGhrvRJ1l+jDLEy/Zbi/aFybt3FEKGjIFnRjyosYWc8sJitGb2CWxzDgqjuKccpTdZ
         gci7s5Z63Sdbi6pWis3lZ6/yD53JJgKS6KkgA2MCG5p92r/qgBWm+SvexbC6S8ACV7PB
         ml/8NXueSpE4hOghsqxaCxlFcZeqcoscx8FOWDBFOZ1AXhvsp1Trl0r2BL2ZS5W8baps
         RMOcEcBteaEzHrVzgs1bpUZ+qQLr6LFPURebdqkGddVYPuCHLGt4LSFusmLUrOGWlBL3
         +8Mg==
X-Gm-Message-State: AO0yUKVoL2fILA/j0Eu96tvgUWZCT499l+c4R1QfdGTq6jMmmEKatvgq
	rZ7YxfgmMEnDB0N9qB+QQeJqHO1Ml3CSrA==
X-Google-Smtp-Source: AK7set/Dqzd9M/9SJhd4BR3dSRQkvR2QIOPCPlj6ePuO5SmyV9kzUI7loxfiQKAvj7nwcNyVIkaBLA==
X-Received: by 2002:a50:ab4a:0:b0:4aa:a7c8:67a0 with SMTP id t10-20020a50ab4a000000b004aaa7c867a0mr1201265edc.12.1675584371990;
        Sun, 05 Feb 2023 00:06:11 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbf9.dynamic.kabel-deutschland.de. [95.90.187.249])
        by smtp.gmail.com with ESMTPSA id q10-20020a056402518a00b00463bc1ddc76sm3441379edd.28.2023.02.05.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 00:06:11 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/2] staging: r8188eu: correct error logic of _rtw_init_recv_priv()
Date: Sun,  5 Feb 2023 09:05:59 +0100
Message-Id: <20230205080559.8319-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205080559.8319-1-straube.linux@gmail.com>
References: <20230205080559.8319-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function _rtw_init_recv_priv() away from returning _FAIL
and _SUCCESS, which uses inverted error logic. Return 0 for success
and negative values for failure instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
Removed the initialization of the variable err since it's not needed.

 drivers/staging/r8188eu/core/rtw_recv.c   | 17 +++++------------
 drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 70d43c10e53d..fc7568cf948b 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -99,10 +99,8 @@ static int rtl8188eu_init_recv_priv(struct adapter *padapter)
 int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 {
 	int i;
-
 	struct recv_frame *precvframe;
-
-	int	res = _SUCCESS;
+	int err;
 
 	spin_lock_init(&precvpriv->lock);
 
@@ -115,11 +113,8 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 	precvpriv->free_recvframe_cnt = NR_RECVFRAME;
 
 	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(struct recv_frame) + RXFRAME_ALIGN_SZ);
-
-	if (!precvpriv->pallocated_frame_buf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!precvpriv->pallocated_frame_buf)
+		return -ENOMEM;
 
 	precvpriv->precv_frame_buf = (u8 *)ALIGN((size_t)(precvpriv->pallocated_frame_buf), RXFRAME_ALIGN_SZ);
 
@@ -139,16 +134,14 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 	}
 	precvpriv->rx_pending_cnt = 1;
 
-	if (rtl8188eu_init_recv_priv(padapter))
-		res = _FAIL;
+	err = rtl8188eu_init_recv_priv(padapter);
 
 	timer_setup(&precvpriv->signal_stat_timer, rtw_signal_stat_timer_hdl, 0);
 	precvpriv->signal_stat_sampling_interval = 1000; /* ms */
 
 	rtw_set_signal_stat_timer(precvpriv);
-exit:
 
-	return res;
+	return err;
 }
 
 static void rtl8188eu_free_recv_priv(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index cfc24420e70c..4130e8fe2952 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -482,7 +482,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 		goto free_mlme_ext;
 	}
 
-	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter) == _FAIL) {
+	if (_rtw_init_recv_priv(&padapter->recvpriv, padapter)) {
 		dev_err(dvobj_to_dev(padapter->dvobj), "_rtw_init_recv_priv failed\n");
 		goto free_xmit_priv;
 	}
-- 
2.39.1

