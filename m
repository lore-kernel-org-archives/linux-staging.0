Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4430325D535
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872314; cv=none; b=bkXTN54K0be3FogzZnOGoMchK/g5z5qxnbALbgJdGroOxoOkdPM0QxWXgXfBIlJkBsx736oDiX+ku/IL5aGaRK/Vbr9V3HmUho7fpsT4yMCXN8IjgqSUeGzZmmuO/hLe4EsFCGZKHCC8ySMMB7sk6AO4KY9JA60uhyn3BWPpGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872314; c=relaxed/simple;
	bh=4WM+PaTJkQfWtbrVRkv8jeEKfAmMzADF55xsjqGy7qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAl8cOmhblRqnZWuFNQfpAl6Ooyb7Jui2GzETX1AJZ7PJzu39srbjZGa0CR/3wuyAVNohtEWpzbbZkKHfkhYphgJ+RbXkT0buWjykn0B4Dktm248wBdq0KHAtXUu73hsMdldcdONWJ9qYWJ+cEmmg7SyJckTFJSbgsgGEpo6CCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1HsneIv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1HsneIv"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso1400227a12.0
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872311; x=1754477111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3ApnJqgQPyyaOo/pksd04vUviI4gdkXDx5i9fd+KII=;
        b=M1HsneIvWiBN9iyzJ3oZnQhkXUsTp/2d7EDBBSXNOkQkLELozJ0Gl7x50wCIubD3Kd
         T/AzD0WZx7ZqSBWO18/ZvPHmk7b3K+oxIjWSeIf996H9eho37P/wwR1Lu3BZ5T9R7jiO
         9QGWKHRncm7EbuIbto/i+VEwb2iLymZ4nJxuF6oHBGjh/4zK29MqVKr5bgucs5dXPugB
         FBMpLn2wjpjNFVJQdGRbIihghnz4uxoKPdhbboNsUnggVFY3XXIhn4zbsqSQ4yMqvdR1
         BMg7CGHGp/BYqr3vVdWjAT3pvxCCUffVW2LoV8Ij+BO+OyyBvAq/QmxIOdXlblSbOIw+
         78Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872311; x=1754477111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3ApnJqgQPyyaOo/pksd04vUviI4gdkXDx5i9fd+KII=;
        b=pZ6IS/dQf6GWKb44S2YCZiDn4BYyPTqXaLi6h1RwEMWNq9KENU/zAlc6h7Ai8BLept
         Bl0gnr0+RTz2SiMdbkW5wR/HzR3vbyWpywSFs0QjSOzEr879Yd7q5VjROvKQV+ntfcgG
         s55e7/+8cBcHygx9pNy9ej08fA6pejsGZBiqejeDNaR26TB+x2IbbL9NOV03thMq7dm1
         o87OpVJryADW9tWpeizYe0RXJXXCzmI4xMssSr78P3YybK75WCV0M5f+iOFJb8bmPUvp
         IW+m5zEbCsHDNT+w/28N523Cfla1P1+K5HpymNTeI9AmWNuN/V0bhdNnCSnwZXcVhJ83
         rufw==
X-Forwarded-Encrypted: i=1; AJvYcCUyPEZ335c2cXP7SLhon8V7hTzDCHwwCUiRDhp13D0zS9Bbyt/rPBtoDwt23fScDcp70J1TEZxIO/gExHc7@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Q3fPqI5bLs+trKSKu3TOm6ytIuh+S9LnBnNONw57Y+K3p+4r
	eznoq1MGyJuV3U+m2jj9A2k9Fd9KqmF6jKYqg3oBpTu3PeACFOkEOWrK
X-Gm-Gg: ASbGncuo2DEetc0Pr7JBkf8juUl1vCD/An0vL8Vty2x4R2eithGld1wyBVW5vYWo6nh
	7DR14zI9teShk0UblG8qfWKhlO85gMyb8PDdKT2ZFcrUoKnqb2ADfPxA2Bu/tTKzPz+0QYrkwGs
	FG2oa994Utvo3vORGLSirbIRNM1sd5g8Vvjqwt7cHogHPjBkP3qjC6P+bf+/36VaPMuuPDwD1qx
	N6MoXZbUzICcSF1n/8NzD9D2hTT5aDRH6wMw6Ch2PD3XF0NRYG14crjnyAqlXU8CRJd0IrrY0Gb
	6XV65Qv7yFt666vjqWVJ5Eg1rSnm/ckRt2rMwVni0uIQi3EI4rwlIufpLo6WJBRvWEUB4is++YE
	g4sUabq83T2Z0TgO70MrV0JOB0wp7wK3uHfhoINAQPjtjBq75j3x/1HkB
X-Google-Smtp-Source: AGHT+IFTVX6XeKgtp2r4MdAeKZJlv6B2mqWPnNL5IkVLc/0B1kD4lBQR1D9Vcurb6gmXImN8GTYAMA==
X-Received: by 2002:a05:6402:2813:b0:615:539b:7acf with SMTP id 4fb4d7f45d1cf-61586ec404cmr3036405a12.2.1753872310269;
        Wed, 30 Jul 2025 03:45:10 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/8] staging: rtl8723bs: move rtw_init_mlme_timer to core/rtw_mlme.c
Date: Wed, 30 Jul 2025 12:44:56 +0200
Message-ID: <20250730104501.150270-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730104501.150270-1-straube.linux@gmail.com>
References: <20250730104501.150270-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_init_mlme_timer from os_dep/mlme_linux.c to
core/rtw_mlme.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 30 +++++++++++++++++++
 .../staging/rtl8723bs/include/mlme_osdep.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 30 -------------------
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ebc4bd6ecce9..bc74c7838a3b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -9,6 +9,36 @@
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 
+static void _dynamic_check_timer_handler(struct timer_list *t)
+{
+	struct adapter *adapter =
+	timer_container_of(adapter, t, mlmepriv.dynamic_chk_timer);
+
+	rtw_dynamic_check_timer_handler(adapter);
+
+	_set_timer(&adapter->mlmepriv.dynamic_chk_timer, 2000);
+}
+
+static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
+{
+	struct adapter *adapter =
+	timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
+
+	rtw_clear_scan_deny(adapter);
+}
+
+static void rtw_init_mlme_timer(struct adapter *padapter)
+{
+	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+
+	timer_setup(&pmlmepriv->assoc_timer, _rtw_join_timeout_handler, 0);
+	timer_setup(&pmlmepriv->scan_to_timer, rtw_scan_timeout_handler, 0);
+	timer_setup(&pmlmepriv->dynamic_chk_timer,
+		    _dynamic_check_timer_handler, 0);
+	timer_setup(&pmlmepriv->set_scan_deny_timer,
+		    _rtw_set_scan_deny_timer_hdl, 0);
+}
+
 int	rtw_init_mlme_priv(struct adapter *padapter)
 {
 	int	i;
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index c84c84c68286..4bb7a01caf4a 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -8,7 +8,6 @@
 #define __MLME_OSDEP_H_
 
 
-extern void rtw_init_mlme_timer(struct adapter *padapter);
 extern void rtw_os_indicate_disconnect(struct adapter *adapter);
 extern void rtw_os_indicate_connect(struct adapter *adapter);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index d22d6cf3cb11..5cb27ddab769 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -6,36 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-static void _dynamic_check_timer_handler(struct timer_list *t)
-{
-	struct adapter *adapter =
-		timer_container_of(adapter, t, mlmepriv.dynamic_chk_timer);
-
-	rtw_dynamic_check_timer_handler(adapter);
-
-	_set_timer(&adapter->mlmepriv.dynamic_chk_timer, 2000);
-}
-
-static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
-{
-	struct adapter *adapter =
-		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
-
-	rtw_clear_scan_deny(adapter);
-}
-
-void rtw_init_mlme_timer(struct adapter *padapter)
-{
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
-
-	timer_setup(&pmlmepriv->assoc_timer, _rtw_join_timeout_handler, 0);
-	timer_setup(&pmlmepriv->scan_to_timer, rtw_scan_timeout_handler, 0);
-	timer_setup(&pmlmepriv->dynamic_chk_timer,
-		    _dynamic_check_timer_handler, 0);
-	timer_setup(&pmlmepriv->set_scan_deny_timer,
-		    _rtw_set_scan_deny_timer_hdl, 0);
-}
-
 void rtw_os_indicate_connect(struct adapter *adapter)
 {
 	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-- 
2.50.1

