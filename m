Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6172572
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621703; cv=none; b=pNx9NNfqDmKOISW/QPf0ZceTgSGKchx2oC4YluXMXxdcOQDftzBocxWdwgHe+pzs3R98X8ypz1eGJmMi19Dxm/9c1d9/4jXI2DiIcXDPdBsUWguN2j3hHnuRDaChBVdVvaoI6xIOa/R3YlAFjoCf6TO3CQ4ovlMByVg6Aq8K4lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621703; c=relaxed/simple;
	bh=jkK8jOTPw4ceO2WyllAi7vTxuRvpVOG1mCqa8/gQJ2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kL8rEm02/jqceShimTUYLvCBW7wDMrKzmTqRzx38DOiUEr8PxqEO5CQ4upw+eotKY5EsAZfO8IenFry+zzPmoWdP5fgYGdQslyjQ4TC3c3Zp6bhP8jcPrB1RX/3JsR05aXIuQdsvsIMVSw4sA6cDTwhdXQ9hBmGoUz2wcIHai4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmTh2f7O; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmTh2f7O"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a5f555cfbso244549866b.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621700; x=1731226500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKAdswjmHcute+NZI8i4OymPZIsBGcO1QIhXFS046nc=;
        b=BmTh2f7OQqd6ZrD3KoVgl2QJ+fOTERpxJne+HBsmyOCJqt7lO4iHdLl0/p5fM9krKA
         qT5N3xmaP2xGma43O+36AzPuK5WFGMMnR6XHbP+Twa57Q5xjLQMTX1VJH0gT1rbVGzOS
         VzMsUiDLMy52AQOUPBH/8ZAyhkBrGwMjux1QGUBWFNgQ9YJxuU6nSJCTGziuYjHNRXX2
         xQ9vMOey13e9ailAxKSBKxttPzCmQQcf28wmlRn6mNtxF4WOueE7dUXLBckbdBnDDAtV
         Flau71MyotCGJRIUOpfZ+HGsprUwfZPQe4oVYrKzBbZar0/HoMvZr7d/baZG6AUMSjb3
         hV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621700; x=1731226500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKAdswjmHcute+NZI8i4OymPZIsBGcO1QIhXFS046nc=;
        b=oVpPFK+HCim0bR7/llFu9QXcaDiTVb8u4GEwpCW5Yd+uF8CxtV32navcV726OOge+z
         KGVRk1pVXpLy74QxyXpppElgnyCEBoR49NbSoFFL+MlySKm/PoqnpKChteFpbeuh8HGD
         bkZXmVhhtu3zolHxCrOUn+ww2qOeDFxAYaDqdrcuEM2xldNxO2b87QqL1cGWUg3cooQo
         ZhvZTZHHzJpVnQh/1NQS8kqBK/dRePqZI6SZpk+N4Ni19CzAV25zWouCVaVF4J/m17Bv
         8x6O20zGv9EvsAavJPNSbCaX3iVqqbCTFI3oWWGbjEEClveJ0577L2Xzd+hdYDw5cEBR
         lnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhao158hGGH20v1AiLgwBJWdUD8/ee0PzZFx2q6+JODGWwGxlBR9ZnGMyX/ePJsS4fDGmvXJQMUKVCVrSm@lists.linux.dev
X-Gm-Message-State: AOJu0YwAFCc4+Pq+8823kb0FEShoMHtinmRAo1vDYeOUofnXRYHv1feX
	RhbSlDlnDtOZIYzBnfmORh9Alr2gitF+A0XgiEXmbjygb/TGxE28
X-Google-Smtp-Source: AGHT+IHAGZc+jJdciJW90mbaXsaA9+aX6wbsgFfRGCPVMrIq5s9KIscNPootxVjfas+RADlB9Bsh9Q==
X-Received: by 2002:a05:6402:5c9:b0:5ca:efe:10de with SMTP id 4fb4d7f45d1cf-5ceb9382a40mr10610643a12.30.1730621699641;
        Sun, 03 Nov 2024 01:14:59 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:59 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 13/13] staging: rtl8723bs: Remove function pointer hal_xmitframe_enqueue
Date: Sun,  3 Nov 2024 09:14:34 +0100
Message-ID: <aef8fb63ed9944dde468fe1a69e5a9c700a4f627.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer hal_xmitframe_enqueue and use
rtl8723bs_hal_xmitframe_enqueue directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 +----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 7462b10fdc94..8b924961789e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -154,10 +154,7 @@ u8 rtw_hal_check_ips_status(struct adapter *padapter)
 
 s32	rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	if (padapter->HalFunc.hal_xmitframe_enqueue)
-		return padapter->HalFunc.hal_xmitframe_enqueue(padapter, pxmitframe);
-
-	return false;
+	return rtl8723bs_hal_xmitframe_enqueue(padapter, pxmitframe);
 }
 
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 20dbaa995498..af9a2b068796 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1258,5 +1258,4 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->hal_xmitframe_enqueue = &rtl8723bs_hal_xmitframe_enqueue;
 }
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 697e22d1e535..7050520224ff 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -180,8 +180,6 @@ struct hal_ops {
 	void (*run_thread)(struct adapter *padapter);
 	void (*cancel_thread)(struct adapter *padapter);
 
-	s32	(*hal_xmitframe_enqueue)(struct adapter *padapter, struct xmit_frame *pxmitframe);
-
 	u32 (*read_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask);
 	void (*write_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32 Data);
 	u32 (*read_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask);
-- 
2.43.0

