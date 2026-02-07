Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C7133B6D9
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770498111; cv=none; b=I7oAnViucLbGTQ5qPH8rBZvia2rHN8ANSqGZenpBBChSUMkHI7rzXIMI5l5weLuFWIvStQFYeaYRPfwcEyMtn6Lttfv1Blf1dRrV99I5/eM+XSTR3sLFmItiWJr7nSzDOGXU37TOvIngVfuzfOOJz0VN7l9yJHYj+qCOPwXzvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770498111; c=relaxed/simple;
	bh=q/bDI9X0IA9gYGzICTstANNhTCvE5nYEX/QwLYajHvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fCE9wCmYJTdz2iBpK6QXlueGHkPKZgxEPU2KTcB6zV6p0BklUCSxDTg0QWxiIS85SaNsf2lIzpkLCgTtH4SmWZn/fiBRI1vvMzC8oGhyocOxLuLyaTy1kHcbbfn95Y6vNe8xNrKYNITrYM0ky0nndO3K4VSCr+IRSgHVnf4v8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRpkwxjq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRpkwxjq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-481188b7760so22926785e9.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 13:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770498110; x=1771102910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9ZlXpaYy27cDAgJgOCR6316h8+bdvTaeYJ/aCmGH84=;
        b=FRpkwxjqnbKiVof2J+LwwWjAYHlrhDdy2/azvKUV8lKIzZKrEXTFCMaJf1M6prZmDf
         lgwmWsUoBso+SAT1c6FOIoJOh2FlSIyEJZh/CLSpsuMf4QsQaD5KNWbY/9KESxLmgHXB
         vKRGqoZNbP1m9MM7jpyqUfG1LICZiLXL4ARuWxUU5Bn5Pg5mYZcaxNdvMoZt0junUU8n
         K0UP0jaRUzlmiGYO8FkAGD/3Ric7kMbAypQWdW23d2k1NyA7BEDZ1pjAs7QsP45Bgr9z
         bDDXoIb7SI/s55mg2UkaUFeaZqQ/XwtHhYxuPhxczHeKiKZw+JzIMU25jT+4B/zlod6V
         iCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770498110; x=1771102910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9ZlXpaYy27cDAgJgOCR6316h8+bdvTaeYJ/aCmGH84=;
        b=v1jMXrzHrkEP8Mdgnwf5elyMcT41lJNPh+a2nyp5rOx3OLxUUcB6HKDs/x1qXIvEKP
         Ac/gVw3Z7u+Q+odiCtLf5SdaoPhRgMcefH8OlR4iByfBCZDvF3A+5XaAZwO71CEMux3a
         iKSWU7yKb5/VKNAmraz3kLsMZMQ7s5aelPUoIjH8Z8OQM4l1E1FAUKoZFpVTTWa2kBnI
         wGB6Zcaf61Igi5WOG0RoJFB85X+py7WgXrMMcCMrLthbdmiHgQ4xatLY41SF6HXTS0to
         kQ6l/XFtO3IXevmiMOPm9blvd4QRBktmUFiprlTb6+cgE5JaZucj/YBwgqsxKHa63cJV
         XFrg==
X-Forwarded-Encrypted: i=1; AJvYcCViT3R3FAQNjy6X/cTlhF5/U8Q4YTgqdp2S8j17asYEd14xWtO43ounv4KwS//BTng7suvcSXe7O6vZzZB9@lists.linux.dev
X-Gm-Message-State: AOJu0YyirHAFf/y2FegnP/AZDT42bpeTambVOH1ssoptdJART5KwoEwO
	xod1p2YVSwIqX/SrPjzVkkFuV6ArR2QoY9aiPinroJk0dWZZWAgPQquAmpjeQNx3
X-Gm-Gg: AZuq6aJZccWGcXZCOXomd+9uWPwkVE70cUEW6qxsc82zsFNliETM0vXqi+8XLOftP3/
	kfR7/oUiCRIFoDvzp/ev2OQN9/U/EpoP5Yx/xyGS3jpy0hQg59OHuRfbIt+HZT4bW7un6zQBW+7
	KgIUF41AHCod/hclKlWrXXrW7EyPtyvDW3Ynuu4JjlY4NtQAO7bPVsWABDovgpxwT18kidVu6Zo
	5PyurA/MQO4U9B/rdQqckeMaGqeE35ErNR6AZLf0AuPzm2M50JDRLlfR/kv7dl74a7ThPkHCvJC
	Wd+GcU/Ia4AvTKL+tZB0yo1ud+D0YxyWo/7xeJqSODcB2ETVZHXBoE3RI+W4APjnS2a2a4AZZ6Q
	1G3K2KBkQjqTd4m5wWXJYkvIPdkbUDdvqJJ0q32ArdakR6myZqSxQNsat9E9VCrGV1l5TTJgtae
	ni2UJXyFcP7ntyXWMc5v4XWRPLpfX1TNBpP69oLHyUX6i/h7lQOEpXbw==
X-Received: by 2002:a05:600c:621a:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-48320928d7cmr92912685e9.3.1770498110004;
        Sat, 07 Feb 2026 13:01:50 -0800 (PST)
Received: from fedora (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a924sm325652895e9.10.2026.02.07.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 13:01:48 -0800 (PST)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: karanja99erick@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH] staging: rtl8723bs: clean up checkpatch warnings in rtw_btcoex.c
Date: Sun,  8 Feb 2026 02:01:24 +0500
Message-ID: <20260207210124.10094-1-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary comparison to true and extra blank lines
to address checkpatch warnings.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index f4b19ef7b341..8c17ac994bbc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -11,7 +11,7 @@
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
 	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
@@ -54,7 +54,6 @@ void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv;
 	u8 lps_val;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
@@ -66,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
-- 
2.52.0

