Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC13019BD
	for <linux-staging@lists.linux.dev>; Tue,  2 Dec 2025 23:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764719039; cv=none; b=DqCVRo8e2zh1/VVbu0B6akanATlc2l92HtZtm2/0heVu47zyDiftphyiI0DmMoQPplBCnQ64U80uDQqZq4KDZAtfo2BvYUamV+PRY1oBpKuSF7Mbw/tqzd45LNqM/b/1nMK0/pPs7tgX9eU785JcO3gDWkMFMCYCEAmPuYdCIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764719039; c=relaxed/simple;
	bh=6dgwv1Q1J7fdQ0vYI+kxpaGgklmM8pdmIQOJbkRrcl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GviQLKJgh11xpcXH3/UQe91BWT+GukmHKT+Qrg/P1wp6QAcEna0ARNJBDkKvJUyzpMcGamlMlsSs/2LzPdTcG2GLBPH3Lp3/p2pew89qupGlf9MrcWEXpOoPfN9xPA3WcYQaKOoJ4E1EM4zLo+aRiB06mzI9kZ7qT/KB/Yu/R64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8leOtgx; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8leOtgx"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso5511007a12.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 15:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764719037; x=1765323837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ne4AZEqkxjkMa7PM+DDHLR3eHEfheOJMKi5RcUfuUD0=;
        b=b8leOtgxe+FqDFjf5FPWjbL/SzWQdhLPE/6PMRkmJKNCovNQIN3Kha1KYjuZp6uzGV
         QIW/trJh8vHlJ0AR1+rp0kmACCJrdjytkMQ9FFwvsBppvWK43pxY2qDQyNCf8vWcNlN0
         FbusoxMNsm9DPqDLqmEpDug25Kcit3HKQhQlumafS3N2kI83aHV2Q3T5GeWAvlnguYtF
         sj+VHRTPm75rz5fT/nTW7zDpYUlgMc4talAohftL0ibhXQT9B28Y7I2wTTECaUXyDxCW
         Y1LBJQhNoK2HfK2EqS2v3A9pDzxBL2/CusPgmdRU84wk3ppHNnmsq8izw++nJmfZVHk7
         yGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764719037; x=1765323837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne4AZEqkxjkMa7PM+DDHLR3eHEfheOJMKi5RcUfuUD0=;
        b=DiCqE+BToWl2HEaY1iHCpzGYQHAsMo8cxH0TW9kzjOxLdMN2WXnkDfsygQivQKreyN
         D+GAEbOyR6+QhigfpiPHR4GfS8BCYoSk99KM89jkg6nS6sbOeZiBi/L5pEbxID4fBDB0
         sMMLHNhCRlxpsGbMeT6bDpYdabJHX7CRlH2enzI52n1Id7nMTJUjyLxv+R9TY9xEZpnX
         7iuwAgonHiRSRrCgqDNGVaKcaJqNqTpRzxYPYX+LkAPb2ygSm6nw6A6A43ye5CavZxIF
         9M9URzfQcr8IMFxm0vev3d1wOeCjr4QMMuf8I8DuTUSdw7/xxPdwZ3xEiEbFa81rblbE
         Xbig==
X-Forwarded-Encrypted: i=1; AJvYcCVogrkAqTsSFOusLXj/hs80myoSZQ8d7nZv1GRXLeieHWpTJeJAalMv+3hfOrzMQmWpFl5qEVK58kGmyOSx@lists.linux.dev
X-Gm-Message-State: AOJu0YyRFQqPa4+W101VNYII/LMb9EZxvToHNdefcPHfsuqKumIEAxsD
	cuGeYr66lNyFipNqK7XCsxp1dGLPjdzdGp3qrbkxWD75gipsmJSbKZV/
X-Gm-Gg: ASbGnctK4XckBKpoVsm0lN83vp8mYWk+fl96lySk2zwlmtpoxyQVuqsr5+iD6AugOvl
	AFanITmZDWzP276/On36gp8UB3Bh0nBmaPqK/CidQ+XEpf4ys30S0aETnrwoay+bIiJF/8ys8zb
	oHGZ/FJPweqopmAR+6U13hLSiT8V6xeYJJ5mxCJ/t2pJxOFDyaWYCYmddc7KxRanRFwZqKhahmB
	uBww2xkEX8T+pvXSytDVVaGup+qQPz5FI/5xT43Xs1/ROTTFCH/OBGdjYe5hx2ak/61hCen+/oC
	th9qCddsV4sRGKwT5v5hQUxXRQ06xDW1bZemI6fELgBMvGp3gpdsZReJUpFBGGMVf5ox2Ivc8kg
	A5Be8Kv6txZxUa5uq1+y5vPkCNLzjw9HNkbfO6Jr6HXIesqtUHb7DkLrH/lOlmiHSpNoLSR8xyO
	oUB81hwbtmTC3K+fVUGyRc/kq3AMpkHD4=
X-Google-Smtp-Source: AGHT+IEGNq9iJyDzCYEqXt9ptFWaA68gfKVIKnVCUJtVrPEd8HwOlpYGuPSBaJmma1rXpd00116H7g==
X-Received: by 2002:a05:7300:8605:b0:2a4:3594:d538 with SMTP id 5a478bee46e88-2ab92d54646mr274626eec.5.1764719036969;
        Tue, 02 Dec 2025 15:43:56 -0800 (PST)
Received: from hydrogen.tailccd71a.ts.net ([71.95.36.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b47caasm61850810eec.6.2025.12.02.15.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:43:56 -0800 (PST)
From: Rutansh Suthar <rutanshsuthar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	zhaochenguang@kylinos.cn,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rutansh Suthar <rutanshsuthar@gmail.com>
Subject: [PATCH v1] staging: rtl8723bs: fix block comment coding style in rtw_io.c
Date: Tue,  2 Dec 2025 15:43:18 -0800
Message-ID: <20251202234318.75104-1-rutanshsuthar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment alignment and style in rtw_io.c to match kernel
coding style standards.

No functional changes intended.

Signed-off-by: Rutansh Suthar <rutanshsuthar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 51 +++++++++++++------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 79d543d88278..fc29a635a77c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -5,25 +5,25 @@
  *
  ******************************************************************************/
 /*
-
-The purpose of rtw_io.c
-
-a. provides the API
-
-b. provides the protocol engine
-
-c. provides the software interface between caller and the hardware interface
-
-
-Compiler Flag Option:
-
-1. CONFIG_SDIO_HCI:
-    a. USE_SYNC_IRP:  Only sync operations are provided.
-    b. USE_ASYNC_IRP:Both sync/async operations are provided.
-
-jackson@realtek.com.tw
-
-*/
+ *
+ * The purpose of rtw_io.c
+ *
+ * a. provides the API
+ *
+ * b. provides the protocol engine
+ *
+ * c. provides the software interface between caller and the hardware interface
+ *
+ *
+ * Compiler Flag Option:
+ *
+ * 1. CONFIG_SDIO_HCI:
+ *     a. USE_SYNC_IRP:  Only sync operations are provided.
+ *     b. USE_ASYNC_IRP:Both sync/async operations are provided.
+ *
+ * jackson@realtek.com.tw
+ *
+ */
 
 #include <drv_types.h>
 
@@ -135,10 +135,11 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 }
 
 /*
-* Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
-* @return true:
-* @return false:
-*/
+ * Increase and check if the continual_io_error of this @param dvobjprive is
+ * larger than MAX_CONTINUAL_IO_ERR
+ * @return true:
+ * @return false:
+ */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
 	int error_count = atomic_inc_return(&dvobj->continual_io_error);
@@ -150,8 +151,8 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 }
 
 /*
-* Set the continual_io_error of this @param dvobjprive to 0
-*/
+ * Set the continual_io_error of this @param dvobjprive to 0
+ */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
 	atomic_set(&dvobj->continual_io_error, 0);
-- 
2.43.0

