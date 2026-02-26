Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B3D1A08AF
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 01:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772067954; cv=none; b=XEWLBjM8exwE6kaYLFbkb0As1Kw7PaUU31k62/RbUsVsrM4fDQbJCVXzHCuzABFIsoGHIVGNn6XgvSKxqFwt7ApNiz341D3sG6MThssC7ch/8ckethZ7tl7BE+6R8s2lYmJZzMVDaqL2+TAQ0wJ5jp0IVSLwhmgnhog9AOASV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772067954; c=relaxed/simple;
	bh=nlYCXcTnmOQU8eSJdPO7inqkmO7okltbDMOkl7PDT9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gq97bfGRfntiFDupy3ELkdbPmx6i8tENPK6NbUl6f67w+xnsEXuR7QZIORK2jvT1pqoJSWuYNyw5u2owK+/tUFTca/BDnMW56bFYDOCZePGs/bws+2vGnOXtQTjsykLIqUy3DAGU5zRR6SEq+2cv4KElxHGIVRSZz3G+3hUhsHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyaP3Evy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyaP3Evy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4833115090dso3477035e9.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 17:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772067951; x=1772672751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBuQnpPws9ThqSgQ1vwHtjpl+Ddv3pxo7Y4BbfQ+qks=;
        b=PyaP3Evy3BQ7O8GFTToO+6BYaTf+VMPBMWzjNX5FO3cPxhCwtU/sSkXtd3chAdD8sq
         mGWZUGrIhaHNEM4SOCMX2Pvc56cmB+JRRM+mtFFFTmMFy0SlICdL30ZQFgrmLg/4AT/h
         cl7r3zbIzqobcM205kmIJUCC6yLiXuIhKXb96xQXliOfV5m4TB70xmoz5Fm/OJ5PgBKd
         ZExnhDz3mDkNrLtHiwwbOCYt7gJAjxEJO1DdkJDPhzVsghbhIC6bL+7l01O2WBdlz/Lh
         DhEXrc5/QQII8hVH/13SyBJDSGvKH8YNbpyWMcEEAlXpodG1v1Q6kvKixsYU8zO6J6oR
         01JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772067951; x=1772672751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBuQnpPws9ThqSgQ1vwHtjpl+Ddv3pxo7Y4BbfQ+qks=;
        b=tatJGpUFA8J3ab1rrkMHhqOJWrVWpfl3IZBELQk6JqBjIdSG+KmxyvSXfM9DphYhBP
         y4+BbVSUQSqnuM9Bvy6CcF3MHO6ojnSh3RlBjbZ5yALfVpM9o4CNOsxgS3EuEw4t4Dnm
         WQpFtcLiTWChOLAeVseZvmh/4hHM39tSN0TU6Ssq3iNI1gvkbLwCp65lD8UN+07oWV45
         zNMDeCIvHevwfNuzMJoF2yB+tp2EYqzW6wkfsA7IQ3hwkmesw02y7odH1UpM0W0J6TGt
         odWLeQy5VnKwCJoft7s8mOwk45oRVUVuX2XzfXeWKANtYkclooOuQrd98o1o7Xc/CMXX
         QL6g==
X-Forwarded-Encrypted: i=1; AJvYcCWZEnC+VYVqVldulbrgftetS6u8/7NwNZbN04/0uDPqWKVlr7u+3LNXl/ZAac/UfGMBF0qtxubgxR59pwHt@lists.linux.dev
X-Gm-Message-State: AOJu0YziWiM+fg4XkFAL/hrDCaUwmhmfiQ4QWdXOw1rQ39mJV4vJ3NLC
	CaluzgZrW1/WiDgkncUHtW3JRo9IxdRxJ4UgfIAJV+87UrFxv9+zproV
X-Gm-Gg: ATEYQzydTxkZs2gzd8jPuJ0zLaJqy6tCdPxxp7AlAtMBsbQa80P51Q90P0/J7siKP92
	iS5WFj/6JuMLKgB4SYdLYECXrVHdcgjPP3vAuzG1i40aokoRNb1UhskldB449Ld1fDZbZ+9ZVLj
	Lwh+PcGSd7lUC7QP7FKu4auPHNSMF8MI2eE1DPG6mF6hq3+je/C8/W7kXI7PPJ0PUdV7kXz2LmE
	dugjHL/u0HTYjfUM/9hjXB/lp8xG+8s8bDkQcRoYgNla2u20lwWxEI2wVJ8TzPvbysJA0fORZNS
	whZgJAyOh6083dEAA2E+hDNNtQkyIWNbvq3wsRlarfM9Be1tAouRCohTMEw8uT00qX2cxGDzchy
	9ooVUO52mB3Pz0CTmQ646uWA4WURwkEfjnkp9C6edo7xOO/n5rfB8s524U3djXilyEpD8XvbiZ8
	HbQFqtI7r2pVhEU5NpiTR5vbELYVYC7RfVF7rq83g=
X-Received: by 2002:a05:600c:5489:b0:483:4807:210c with SMTP id 5b1f17b1804b1-483c3deb450mr4611795e9.24.1772067950830;
        Wed, 25 Feb 2026 17:05:50 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb84e4fsm22275095e9.8.2026.02.25.17.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 17:05:50 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minu Jin <s9430939@naver.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: replace msleep() with fsleep() in rtw_cmd.c
Date: Thu, 26 Feb 2026 02:05:34 +0100
Message-ID: <20260226010536.179729-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep() with fsleep() in rtw_cmd.c to improve delay
precision and follow modern kernel practices.

Specifically, this fixes a checkpatch warning for the 10ms delay
in _rtw_free_evt_priv() and updates the 100ms polling loop in
rtw_chk_hi_queue_hdl() for consistency.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..e2c5eb2d32ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -8,6 +8,7 @@
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 #include <linux/align.h>
+#include <linux/delay.h>

 static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
@@ -214,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		fsleep(10 * 1000);

 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
@@ -1495,7 +1496,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 	rtw_hal_get_hwreg(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &empty);

 	while (!empty && jiffies_to_msecs(jiffies - start) < g_wait_hiq_empty) {
-		msleep(100);
+		fsleep(100 * 1000);
 		rtw_hal_get_hwreg(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &empty);
 	}

--
2.53.0

