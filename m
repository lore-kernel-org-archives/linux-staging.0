Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4592F26159A;
	Tue, 25 Mar 2025 12:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742906845; cv=none; b=XbCVkuzeTwfCAvVgC4kynMzmKpQuw4LFpFCbak5+O+5Xesr+N/RWMnWtVbjwABtPdlzpVOUtc9IekIO6cBP6EZ+449eEA5oEsfLOjt/lK7AW2PmzzAihEVJ2qh/Il/oYsp5UBCPRgeI8FQN08CuiW9rrdYwwnxvP+KWaRrhIJss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742906845; c=relaxed/simple;
	bh=W0UjzV++zRmDeWfAHDUKWe4w1h2+xe5Sqgek4dnSeRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=frCfnjxr9XglayfhapAdyfgdlKoP21cYKlXG0RIv7nr7MYLLMd8s9BNfkyrJqBd1HaSpwwCIhtSSZfxv8Ga+xT94GldP1NuLT7Y2hAsFcbWzA4rypCmjKWkLfZ+LLeKnhJ2WbBm+FYUYFrnoTNNfvCngdsYqLejT/GM0yZLFgoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQctHiyv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQctHiyv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43690d4605dso39167815e9.0;
        Tue, 25 Mar 2025 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742906841; x=1743511641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8T5E+tN2GeC9Fls1L5neCulWG3IZUOA7/xIRYDwMGQ=;
        b=eQctHiyve1aeCqQo7t1ZHL17i4v9wLX1/TCgJIQ7EE+iF7I2LeI5SbbVjkSGOlB+0E
         IlZgkXYUIfET0umD/oTD2qneTQ3J29NZODCrYoN0kj1V98XHji5dpkqdctUtH1mLeZVA
         0j81K3w/lAQoHMDUYFO4C6bmardGM5a9HXI2S3wYewS2CorRQO3I0OijO53cLSI34xpH
         wagyUmbNKzKUO8peZwyR1Fa3zjeUfdEWt1wNj6fok5XQvKCkXq86fDNsCBr6fQ9GFpBr
         cY6m/Uj55T/uQ3q/2PIl6ME4KWdLFqg2cisc6R+wNzKI8l356Ju5geQuw2TIYGtNe25w
         seZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742906841; x=1743511641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8T5E+tN2GeC9Fls1L5neCulWG3IZUOA7/xIRYDwMGQ=;
        b=o34vQF4/WpMAoOwv33Hf+kvqwiHnOx228lVwkXUI47f29ve9MD8j6SHpmZ4K7UPx8J
         T7LkuzAdOiclsI6sUTBJ6JvjfYeVr81bwXqaD7Ge+lBlcHotWw+dcrqM30ufw3+KrPVX
         4oTPlbwavwxpoE3EqjUiEbb+UsPn4cpsOITkH24dLXK1TdRxSE4t08mhYFUwL51FJvfw
         UCe4qgDWwKFocnSY/xdxF4xQ2iCAzXZ3w9nAgmAn2WR+EjXU6TH6b80yTUsJrz8kjUMj
         tW2tMoGKttm2Y7s9FTFi1HNKtYEe9klCdUBZfzXbKQ+b5wwZwyyJpXfO2O+k//5vsvR1
         YmIw==
X-Forwarded-Encrypted: i=1; AJvYcCVnMRI9AeKbQvmc4prmdt9SPrLsGPqyBuqd6Nf7Z62z+YQ61DXFuqrIqP5N6v/zV6xpMd/pXj0hHmPB@lists.linux.dev, AJvYcCXuPq6i4NSAICFY9gZ2/UqrAa9ilErDO6BFn3aOXeC7EkY4uHGnTACxpSlvYBhC6bfQ750h9eE+ExrKnbsK@lists.linux.dev
X-Gm-Message-State: AOJu0YySdPjm4y+8LVfgPjZQBBEC0Ee+QV0HgmdalcEVZ7adncG+lZ1g
	/aJugtKRGTMOwFLoFSkVBAvxCmgA9nBPXJT7xf4okM0XvNDDg47n
X-Gm-Gg: ASbGnct/7UtwDx8VvKX5/KbDX6aEHbNrk33kivmjqZlUMgsfgAxjD6dfq5Jq/EDq5Bw
	9hKNLG2hmmq33PgOplHxYxlttJwTbY15sWsujSD/KaSEvJ/N5i1zmr+wU47PRFF2uJlp5ljgEqu
	ba3ZbNMMrcXqXPZp1Sh4CQJTsmaf6n9jqIMpRVTS+RPFRl0JM4dguvJIMFDhXrP9eMtLWFqvHDb
	wJ4vjXjXKsWVa4aYBdbO9w+J9pQp2e6orPHy3R8g7DL/30n3IfqQQwxY51rKtj79bebKnmKfOoe
	vJWUfsPnJADIBMYmkTETlPX/mV6vTyZl/y80eWOeRg==
X-Google-Smtp-Source: AGHT+IGskFUgT193BbGSZ39xZtsi6sDeuCGufdjn36V4p3+9ta4/gGj0D++bLlwEKgTd14NEHqrScA==
X-Received: by 2002:a05:6000:1aca:b0:391:47a7:299c with SMTP id ffacd0b85a97d-3997f94de39mr15914557f8f.40.1742906841341;
        Tue, 25 Mar 2025 05:47:21 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d74b48b90sm1975715e9.14.2025.03.25.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:47:20 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	davidzalman.101@gmail.com,
	vivek6429.ts@gmail.com,
	viro@zeniv.linux.org.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Rename variables
Date: Tue, 25 Mar 2025 15:47:12 +0300
Message-ID: <20250325124712.47577-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable `mediaStatus` to `media_status` and variable
`lpsVal` to `lps_val` to adhere to Linux kernel coding
standards by using snake_case instead of CamelCase.

Fixes checkpatch.pl warning:
	CHECK: Avoid CamelCase: <mediaStatus>
	CHECK: Avoid CamelCase: <lpsVal>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index d54095f50113..27dfd00b4249 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -8,14 +8,14 @@
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus)
+void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((mediaStatus == RT_MEDIA_CONNECT)
+	if ((media_status == RT_MEDIA_CONNECT)
 		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-	hal_btcoex_MediaStatusNotify(padapter, mediaStatus);
+	hal_btcoex_MediaStatusNotify(padapter, media_status);
 }
 
 void rtw_btcoex_HaltNotify(struct adapter *padapter)
@@ -52,21 +52,19 @@ void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable)
 void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
-	u8 lpsVal;
-
+	u8 lps_val;
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
-	lpsVal = hal_btcoex_LpsVal(padapter);
-	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lpsVal, "BTCOEX");
+	lps_val = hal_btcoex_LpsVal(padapter);
+	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lps_val, "BTCOEX");
 }
 
 void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
-- 
2.43.0

