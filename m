Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E09172BD5
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160496; cv=none; b=TgDVYYJlkg6aNCpdgLw+5cDh1RoHB79JblvNx6PrXAU9Kcb26acoyMU6VReRxuE+00ZrvZbGV1LuChf/8QoX/7jKfOMW2gKF0pVAJL38AwqV2aLcnLyf4H7DWl//yRLB5W6RD/gBFbcQIfcrB5zbMhkvfNR9O/uPROg4VC9tPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160496; c=relaxed/simple;
	bh=+o9bNAhuCTEeX/3tRLMGovUGCUWHMeoJSUHhd+GvWXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRfc05ckOOWqULScfdaXJU4PPlFEwNTkMiWKKcAoZ1jAwKkcotbrqjyQ2G0LM49BaWvG6IFtDNKLeRhpGp6xthj0QESSE6FGvZ+90Jgk0jjZPi1hYSaxi6KJyEhaF8X3VoU1ysVKMgr+gfwWlnQsIFab7jk2lJSplccNI3GaLD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHM5DyWf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHM5DyWf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so31678265e9.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160493; x=1728765293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqqVa0m0IFUn28jRHH6DKcrgM36B1YpEymuOnaGzz64=;
        b=iHM5DyWfE1dLQAJQGTzL+eRZZozxwXTZ4jT5JbxM4damh4ha2Nr+oKTJRFpwteviyc
         cw69wXuFp83b/sxDZPfHQdFkQ0YZqRlBmBTtScdSv1kCpnFu1Selq4ESiGGbQvqsZn2Z
         mo14SzRZDzD5aP2/s5hNaFItWYDSTsmwmyQ447ERAYJTBtW+Jzk67Ga3ylJqIpTlb7R3
         MDQxio9d6SlrLPpj3Ayz+hJd9c77AZISPHUMz11fkU6Txv/KMPpnYSLoHMZfkADRl7R5
         VEHg7ONCnvMDl6wT63hEaL9+R55vUcfGnYbVWhLKGsUZyZdi3hlQn/jlT8KV0Lfw8sCc
         ymQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160493; x=1728765293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqqVa0m0IFUn28jRHH6DKcrgM36B1YpEymuOnaGzz64=;
        b=refdd+lntQCsbIPMOdcfP6AOj0oEqr8hI5cPJz3/wcgYTpABgQu6vZcHm7g1AmUIvB
         eHAyPT4iHEbkGXxNLqwTJ0w2ph7YE6h4F15f74cOFL0pSNIxuwz2o2b4e3cK6c9uHZNy
         unAcZDPAJic/gmrARPCdaIn6wc+VT93sWxUWkZG75KA3amWk5Nw5ucgc0LrdvEhJ70jl
         yFQk27Abz5GN3Pf3UxQuCuOAgiS8BNrCRo8IreSJ4WKfHycxnUWzw2j5/h3ulpnvfJXG
         PsNHAk9W92morUSdcVR1VCqUTVsMbZpDMM4HB3YW0WeRBpGVQk2cyBmDHv0jkgmyOvDf
         B87A==
X-Forwarded-Encrypted: i=1; AJvYcCXj7w06wmrc+h16dFwqAFVIK+V+wFpRVkS0CWh3oDPwyliyWcw5TqPLh25SOG6RFd/ruy+y5rMaMy7f+z0j@lists.linux.dev
X-Gm-Message-State: AOJu0YxeBmtpQtjNQBVk0a0IZYOYNLRCM1wXmdBjVpEEYwxeM95zF4GG
	WHuxgwq5v6tFxrhovfj1cmHWz4QcuX7f6O6tVl329nQ1EsSpv3SX
X-Google-Smtp-Source: AGHT+IEyD1wqT6lfw8915OfOpCipvt1vQBVN/4QD9b8dH5y6OQJneRi7TsjPO8yLUIo5COrmveWLbA==
X-Received: by 2002:a05:600c:1d04:b0:42c:a802:540a with SMTP id 5b1f17b1804b1-42f85a6c655mr48721155e9.7.1728160492875;
        Sat, 05 Oct 2024 13:34:52 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:52 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 09/15] staging: rtl8723bs: Remove function pointer dm_deinit
Date: Sat,  5 Oct 2024 22:33:52 +0200
Message-ID: <bb03b1309e9aa6bae988c5b7003b4f925f5c7027.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer dm_deinit as it is not linked to any function.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 3 ---
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 760ba45de8f7..451f54e5de09 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -44,9 +44,6 @@ void rtw_hal_dm_init(struct adapter *padapter)
 
 void rtw_hal_dm_deinit(struct adapter *padapter)
 {
-	/*  cancel dm  timer */
-	if (padapter->HalFunc.dm_deinit)
-		padapter->HalFunc.dm_deinit(padapter);
 }
 
 static void rtw_hal_init_opmode(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 8b85baf5be92..6d301b44fa23 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*dm_deinit)(struct adapter *padapter);
 	void (*read_chip_version)(struct adapter *padapter);
 
 	void (*init_default_value)(struct adapter *padapter);
-- 
2.43.0

