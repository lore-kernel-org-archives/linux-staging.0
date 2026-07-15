Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB5478E42
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119825; cv=none; b=b5xPrLYjmDtNdNUpoeX4hrAxI8qUfa9+TOGBTwdTPGVQ6AE0yA75rVOCAzJLbp3+qVKECsCVh/N8EwZdjZOpDvW2B4uydCtZSul0cRKLN6epp8TZy19v6PPogvvlEIS2TImTIJRjiquCHmv8zFpJVSVEq7gzNH811Xjl08MdaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119825; c=relaxed/simple;
	bh=tOisHDi0phiyzU0vMYb0qTFoiPyLIHuqVUpPm+GYpOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWHjNRWAghATxOv8o+IZDDzPR4Ne+FYYJiNP6uzuLyy1efXfRVksuszgC8XzcE9Xt+ezNotwcOUm009r7N4VFrKkGDKqTjW1GtQ5PmfgA7FhLi7ixfW79X7QTghMsTQCE4gN8gvhfEQ8T+l+SlLjCurZ1zs7I+2RnPIxjK8SUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWTbYkCs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWTbYkCs"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so764600e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119821; x=1784724621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsOYVxFhznZQrT6Z49Uf6QbYafsZoVDekj2J13kqbiM=;
        b=qWTbYkCssxnqAAbp2+s1Xz82hLaQTKdXMe8K6yolGeFxViWHcWfiUc75sz9zZj+5jC
         bU9gsYpcimnnuZSqTrKh7JbuVttF71/ik3ws4m6lkGs4SsGNLfEOqTEfpVLGISfkNHku
         8g/mEZHI0NhrH4uyI1KlYd6cyq8hj4e2xljQRza9oemC8b520n2dWViNtchorjyafrYO
         a/ptdjFfoJk0Wm9wNpn2ROePZ0IeE00yqtozB1VHEEjtF5/xBgdPnIg8jNX67sM1n3BR
         lvgS6JKkxfwg73o8SlTlSRVeiNWjIwbkgdTkYb65v/fxWb99rPUZPkPhOl7VVraNf8T3
         5Qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119821; x=1784724621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsOYVxFhznZQrT6Z49Uf6QbYafsZoVDekj2J13kqbiM=;
        b=MPyyTLLpmhfG0VVkpV8BTROy8HsB6rDruYEAD2EiWFwqXo4Wv3+wMcwLATllYOdQ7N
         MCjygu8zwdbtxdyVSY9vAvc40BfnzK1T0LJV3ppr7mS2bCe0nOGWrscCBW/FF6tUEsbU
         KR8YcinfGtZ3VIsVS4zC6UeXViftj2umQE21wxh0PpXlMquDx7fPJlYPA6f8eVwhQq+Q
         DAv5UIPM+Q6oFBp9dpg/ZYzUzpZo5lCd1k23Co0tZXUcLqfkyylj/GpMLwyRgnrIGmz4
         9HwKVfXIl7MamGt6gjS150FUhVkupsNeS++V2WsNe7cslQEJatigmBTEvj0Zu8bHYjvW
         NeLw==
X-Gm-Message-State: AOJu0YyILYuYDzJzY7i406o4SXW/gxK+veM86n/3CbP/o4uHzr7I4KUG
	g8WAF20c/Q8ygXteuqcoL1yAii5iioYl6siR0LQq/fsHELpPJ8EMrVxS
X-Gm-Gg: AfdE7clLIedGDuQX3V2IF3oLgtno+jU0wvrglF3u+rs1BTjbAzy0G2MqxmcGvwJXtJF
	47G4S9e6ZtR1GANwqonR4/DCrTWlZoE3s2kN8ALow2XuV8olBzP3DrEx6Em3NCkJzVe4+Rhq+tm
	5bgPEqGQV+5B/y1Fizi6Kv3O70+TeQuEGo1YE9p21mxk1U+Hc6PxXaaMVFhFR0+BEhTgL3lEmMT
	soyz6ndns/fh8QcYlrqIeNhHdW4QS6+dpiHiLGufo7ZT7M01uAagyDVD6KkzaUQnwb3H0qjkCSY
	1cyOiH79zXqxQ9CpKt0KgFwp22maCRy79n7TU476SejjomZvlxFCqZV0LZlc004dXR5X7Bkvqrj
	KEYI1bQEqtOfk7/vRdT0v6+D1DHih7SW2Gq1RQSjd8G/Mu0QFNs+jNgN/pWVgbdNSrpgdYH5OzS
	bj1opqlGgZgnQjn+wBT6mbvP7E62hdYBLNrGI7/DglRXuMXsZnHthrXkXGdP6mje23XNs71Ptm6
	73NWGd4pl0YdA==
X-Received: by 2002:a05:6512:61d3:20b0:5aa:5ef9:a33 with SMTP id 2adb3069b0e04-5b15d77e547mr473071e87.25.1784119821409;
        Wed, 15 Jul 2026 05:50:21 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:21 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 08/61] staging: rtl8723bs: remove unused NULL_hdl function
Date: Wed, 15 Jul 2026 19:47:36 +0700
Message-ID: <20260715124829.90290-9-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NULL_hdl() function is completely unused across the entire driver
and serves as dead code. Remove the redundant function definition and
its prototype to clean up the codebase and reduce the driver footprint

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 12 ++++++------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    |  5 +----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 --
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5..0c8fb2754 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -86,12 +86,12 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 };
 
 static struct cmd_hdl wlancmds[] = {
-	GEN_DRV_CMD_HANDLER(0, NULL) /*0*/
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
-	GEN_DRV_CMD_HANDLER(0, NULL)
+	{0, NULL}, /*0*/
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
+	{0, NULL},
 	GEN_MLME_EXT_HANDLER(0, NULL)
 	GEN_MLME_EXT_HANDLER(0, NULL)
 	GEN_MLME_EXT_HANDLER(0, NULL)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 84283bb22..e1503b054 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5005,10 +5005,7 @@ void sa_query_timer_hdl(struct timer_list *t)
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
-u8 NULL_hdl(struct adapter *padapter, u8 *pbuf)
-{
-	return H2C_SUCCESS;
-}
+
 
 u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 578708cb3..0f606357d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -628,7 +628,6 @@ u8 read_rfreg_hdl(struct adapter *padapter, u8 *pbuf);
 u8 write_rfreg_hdl(struct adapter *padapter, u8 *pbuf);
 
 
-u8 NULL_hdl(struct adapter *padapter, u8 *pbuf);
 u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf);
 u8 disconnect_hdl(struct adapter *padapter, u8 *pbuf);
 u8 createbss_hdl(struct adapter *padapter, u8 *pbuf);
@@ -652,7 +651,6 @@ u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 run_in_thread_hdl(struct adapter *padapter, u8 *pbuf);
 
 
-#define GEN_DRV_CMD_HANDLER(size, cmd)	{size, &cmd ## _hdl},
 #define GEN_MLME_EXT_HANDLER(size, cmd)	{size, cmd},
 
 struct C2HEvent_Header {
-- 
2.55.0

