Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683747D934
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119827; cv=none; b=mIiF5MdMzYtCzTNyvFEycDmZZjCw2/BuV50ue3zZro5rXYECy3fy1fSuGc6xV6WJUSEdIB+28vd9trxDt8PBxmO9sispmBHcnn7qcyxjr9AmaTDXrHAomqV7DGv+IBqOSw7EfMPtFn3fn6qJqpdZNY3kl0Zo5zRWDWmyfZGlFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119827; c=relaxed/simple;
	bh=k0/H6otJQUDF2ERjuTicWjtdotROQboPv9m77nv38rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxPzchBTFNzRxRnxcjfugiHNU37ECAbre46L0aYv0h/POA4vfJ/+Uw7J+r2e3RkX83aysR4D2Mp0TXlms+RpjPc9E0ikb0Vz/IM70L0iexfmeAPNfitcjEllm21sTki6x0BegkeW6Pnw2DPGuQ+McYpFwly4Xa8StKf/65fAbUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4ZQBl9j; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4ZQBl9j"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1548111e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119824; x=1784724624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Tr2rTsiJ7MExYH/1GXMBrNyd5k3uSTVOlRj9QPU1As=;
        b=E4ZQBl9j2RQm8xelmoh+yCy1esrd8hnVwOJbIxBUcPEWFlHl3IuHcmDe0bt3FDb9Qb
         0nFYaeZNJx2kfv1sawvaQ6IUS929bqXzSfrw9lRYDTbhQvXglKkpDfaw7mIMkUgZTYB0
         bK3MsOUuBsRNY9wGwXJ62e7g/SBfxEkY/oyZ4g9ZHdeeUWciXIJ/P/ax5XhzQoUPHqwe
         ayJfGqD5x94f2XjGkllDmEhKP0w4zG0PZuv840S/NYbgXIgVGgvKM7OzcdK/anIs8At5
         cn2iY0h4qmT0yfIriTcJEai9ZvDkaEUBeVjznq37Y/KervxvS4IACxxe39lIdG9VuHyR
         rIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119824; x=1784724624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Tr2rTsiJ7MExYH/1GXMBrNyd5k3uSTVOlRj9QPU1As=;
        b=qYGIZN5eifGoyYNI3YKqtxvux3qv3lPHHeL4U4pmCCPWJUeEYoqRe6/S6mxvLQ1BlM
         Yo1ijLYlYyDeuNoCOmnpXxE5Ug80Jhbc34LcJiy4kMOI68v+hPaSBE90k8U/So7+cbeW
         p01J50KavShP7ZdOrHoISFejgMApcVLsicjNv/fxszrvN0n2b3rjs+KoASW22ZZAbfUY
         SgahzAKg9DtA/043NC+WOgtX6TeiomR2U7RmIN0dCuKRiffwK4iRRSDQZtdbUelO0dcB
         0aCuMfBETWGwZjtdYYE7drcxkbQW6EyfQpd9v18+1l5mU4UETu6jivJ4P0VR+nhXOo8L
         bMsg==
X-Gm-Message-State: AOJu0YzpsnmMMXgHnV8kc8aZqsw/cfj6JZU//Uek5/BhoIVVPEni9Ngs
	PtaoFbaFyzQcof1NFuvC9jAMwYZzCY8FYrQtD2dtzexQcbUGwyei8bbajvk0ETyYsJU=
X-Gm-Gg: AfdE7cmzNutmY9LM04IjpXELXFuzKgCTLx6j4MDMHUbLD/kptDV3ubuimhEfv0X73+B
	MmxIsmB3ESt5y6tF2De7pEu4y+ZytE3TtNuJblg7BeXCObWuA/tVTyc1GNEvBWpTX8frOgXNaia
	2ct8vPFgZb/laVYyL2YGbYkiPxNoOJPa8CINV83yi8KV5lVWUCKWNXgUCZkfNS+60OSwgIjNCl+
	8p2hOyOI7EixEJy7lqjhtSkv9BlpK+2DIo4aIwTICnxGn8Sjy2t8vrq6vq21J5IzcbdIcIWLTkR
	YbjoPM3BdSDymBbeXcvUTSF+MxfebAz9nZCH5Uxwy73rah+QUkZaobyUFJn245PqPSw4g68zF4r
	nb+NRxZyS9ZGwyCAMpisWRxIHPLu1MLh0QkFcBcuwQuzYbtgmtzo/xie3GrileMm2Y0SYXrSc6E
	HmrZa2n+bBelGaWXSnJHz2aT4tdmvGihOgPkkfScs9Pw+ms0Qk/8u5GT7MaGz4b3ablkuQO/Km4
	exj8aoQQGgvTQ==
X-Received: by 2002:ac2:5328:0:b0:5ae:ae6f:1c4b with SMTP id 2adb3069b0e04-5b0236677a3mr2998836e87.25.1784119823781;
        Wed, 15 Jul 2026 05:50:23 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:23 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 11/61] staging: rtl8723bs: inline rtw_ps_deny_get() and remove dead code
Date: Wed, 15 Jul 2026 19:47:39 +0700
Message-ID: <20260715124829.90290-12-ulijg308@gmail.com>
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

The function rtw_ps_deny_get() is a simple wrapper that returns the
ps_deny value. Replace its sole usage with direct access to the
structure member under the pwrctrl lock. Then, remove the now unused
function, its warning comment, and its declaration.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 12 +-----------
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  1 -
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf101..1d6fe3734 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -139,7 +139,7 @@ void rtw_ps_processor(struct adapter *padapter)
 	u32 ps_deny = 0;
 
 	mutex_lock(&adapter_to_pwrctl(padapter)->lock);
-	ps_deny = rtw_ps_deny_get(padapter);
+	ps_deny = adapter_to_pwrctl(padapter)->ps_deny;
 	mutex_unlock(&adapter_to_pwrctl(padapter)->lock);
 	if (ps_deny != 0)
 		goto exit;
@@ -1133,13 +1133,3 @@ void rtw_ps_deny_cancel(struct adapter *padapter, enum ps_deny_reason reason)
 	pwrpriv->ps_deny &= ~BIT(reason);
 	mutex_unlock(&pwrpriv->lock);
 }
-
-/*
- * ATTENTION:
- *Before calling this function pwrctrl lock should be occupied already,
- *otherwise it may return incorrect value.
- */
-u32 rtw_ps_deny_get(struct adapter *padapter)
-{
-	return adapter_to_pwrctl(padapter)->ps_deny;
-}
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 6977892a5..9b6c42e4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -249,6 +249,5 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode);
 
 void rtw_ps_deny(struct adapter *padapter, enum ps_deny_reason reason);
 void rtw_ps_deny_cancel(struct adapter *padapter, enum ps_deny_reason reason);
-u32 rtw_ps_deny_get(struct adapter *padapter);
 
 #endif  /* __RTL871X_PWRCTRL_H_ */
-- 
2.55.0

