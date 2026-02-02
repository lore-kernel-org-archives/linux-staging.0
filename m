Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05AB30E846
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016096; cv=none; b=VtWAMgumIWqozFv4eMqvVptg1QE6CKgYyeJnwisGwIkKq0b646b6uv2TpDrT97cfZW2IDcav5CvSH5P3CM3Zui1iPh2yaN794Dd8uOPJYMCCoa1W6B5QopTyv51nXpqO+ldvUaRsqT8QJMqWvhfbjZchfZPGOZt1w+MTl1IGg6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016096; c=relaxed/simple;
	bh=lpWYvh7dqR/x0vZXCzTGE1VKlcdLj1oQVQB5nHGjuu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AshVh+7n2KlIwBsPEteurx2N63w7fsAgNU7+tAP9+q9PP75O5rXiET8/oDTHIR+kETqWmCahcEifcKFci62TE7cPhwJWbwEs0nPHgikYgnT2W1EeJ2iTEdMsaJN2nT4N/ENQ+0ZwWfnqZz4H6DTowczkjbqW485DbphHQHN165o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmm9ChxA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmm9ChxA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so39178705e9.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 23:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016093; x=1770620893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6eWckwE+jmzFc1g1wPivXZpnaZArCu0DUT5/MbIzAw=;
        b=nmm9ChxAn0/o6GvXqo6l/l5qR9uXto9uYg1qnJ5JZF08jCR/A4HkxyoEXvFc9N6C30
         O/1K1yh8Pv+1l2nIu1m2qfGGIoLauJiLc3e+kvgQge/MxZN3IEmQkKD9bgjyaH+xWGLR
         DXDdxnxTz5rSfRF0XAURewmUO9LTUOuz1fmZitcsWehQSynefElxeO1bN/z+mSNbYaKa
         IrVj1P8rAjWTKRQLFO2BUbAMFOmvyCX091vlDDHeojroKa393NywgtC3t/IlTAWyqsKa
         UsNJtRpn9V6mKVgLXaE6P9tUXb/xC6IQOtKP9LjGPW6W43ZDsNs8tugEyqffxzOWBNiI
         V4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016093; x=1770620893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d6eWckwE+jmzFc1g1wPivXZpnaZArCu0DUT5/MbIzAw=;
        b=RY9K0sVM14vaj9TETkoyNEGNsD226WryRhVf82VZJ50G3UAnfnEgHbbJ+9CgBh7Oub
         MNahCRlfsDva3ZUsXA9wrULqRfvyQceDDYAPLK+HvHlbIpdmBxCVUQg3lTsC0TaF2gGs
         lUzazBjb+Unn6Wek8uDEJysEWszQdRuNqncskR8VsBQ2TRJj18S1yoP5OFOJ8Q00NQQS
         S+S0yDaGqhC2O3Vbv8R+vYpv/y1hcAzAEGpeg5N4sRtbGTCyt2aVcXKfQkxjHric0phr
         N54ICHowWzaitKvxrHa/Mmxwc79UC4S8lNk9bxk8GwqnNcfCn4kWpvvwthOl930PmBUs
         fmIw==
X-Forwarded-Encrypted: i=1; AJvYcCUV3rvUqTHr23ptj2nbYJr12L9IqSbwAklnZb3P0TG++QZ6XVBwu7vnSIAr2BXKz5Yfg9OUfFLCTBQVvf2O@lists.linux.dev
X-Gm-Message-State: AOJu0YyrMszrDohrO8G0D39N/NXogAsEyMFJvcUd5DjShredpUxkAfoP
	qZXgItkX2yif0R4cbIKVguy/vprMzaXR1lIQGhQRteyVO4rxcvpK/vo=
X-Gm-Gg: AZuq6aKnP3oYbizPfmTlLT+31XtztQmkfwsQkIg2FgRXrVh3mN4jwmp46eDRVQL6I96
	c7hTvoJsWdLNNy6W60P3kTIejGdrZGTgzgTxtcn1AkRts/GN2fTkB2fgifMzVO3RQ8dqyLHcE5J
	PC4wBPywyYLYysRrCfgM+PfEzrugqjksVUa5bGEWrc6QXbsDGZlJmkEpOu2asGyyGFSOMKAtBBv
	VrcDLJxoH1744hIh5OMD4NSJeOY+PsbookWVKjiQ7r6qtp1Cxuf9Fn6+i4fGah/KYnt/VxXvnGt
	x8c/hkpRrb7aNUeFcjduUlxCZ8Ukdqi8r0itU6Z5Uuxvb3sz3PSJolRyvNVsSxfey/Hejg1N5qR
	EhKGGN5jdVHkJALemXAFVhSkLFawfMBAbiZLvKKryRsCyBjdXWhJgzY3V+a1qMC9PwpnT/2FYRY
	MctAwE69YuF3BZNCOtN+0uEwg/xuPw3DKQyKVK0Ke5ULr415IaNdd7ggl0Ls+BXIhsf4W8Dy2l
X-Received: by 2002:a05:600d:8449:b0:482:ef72:5778 with SMTP id 5b1f17b1804b1-482ef7258admr52506095e9.8.1770016092838;
        Sun, 01 Feb 2026 23:08:12 -0800 (PST)
Received: from LGPC ([31.223.131.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm371369315e9.6.2026.02.01.23.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:08:12 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v1 1/5] staging: rtl8723bs: remove unused code for other Realtek chips
Date: Mon,  2 Feb 2026 08:07:48 +0100
Message-ID: <20260202070752.3391-2-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202070752.3391-1-lukagejak5@gmail.com>
References: <20260202070752.3391-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused definitions and function declarations that were left over
from other Realtek chips:

- Remove rtl8192c_translate_rx_signal_stuff() and
  rtl8192c_query_rx_desc_status() function declarations from
  rtl8192c_recv.h. These functions are declared but never implemented
  or used in the 8723bs driver.

- Remove unused RECV_BLK_SZ, RECV_BLK_CNT, and RECV_BLK_TH defines from
  rtl8192c_recv.h. These are not referenced anywhere in the driver.

- Remove unused MAX_PATH_NUM_* definitions for other chips (92CS, 8188E,
  8192E, 8812A, 8821A, 8814A, 8822B) from odm.h. Only MAX_PATH_NUM_8723B
  is actually used by the driver.

This addresses the first TODO item: find and remove any code for other
chips that is left over.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h               | 7 -------
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 8 --------
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 1c929d88e596..38830552d5bc 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -202,14 +202,7 @@ struct odm_rate_adaptive {
 /*  */
 /*  Declare for common info */
 /*  */
-#define MAX_PATH_NUM_92CS		2
-#define MAX_PATH_NUM_8188E		1
-#define MAX_PATH_NUM_8192E		2
 #define MAX_PATH_NUM_8723B		1
-#define MAX_PATH_NUM_8812A		2
-#define MAX_PATH_NUM_8821A		1
-#define MAX_PATH_NUM_8814A		4
-#define MAX_PATH_NUM_8822B		2
 
 #define IQK_THRESHOLD			8
 #define DPK_THRESHOLD			4
diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 9664758e21be..b63625ab4e45 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -7,10 +7,6 @@
 #ifndef _RTL8192C_RECV_H_
 #define _RTL8192C_RECV_H_
 
-#define RECV_BLK_SZ 512
-#define RECV_BLK_CNT 16
-#define RECV_BLK_TH RECV_BLK_CNT
-
 #define MAX_RECVBUF_SZ (10240)
 
 struct phy_stat {
@@ -34,8 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.52.0

