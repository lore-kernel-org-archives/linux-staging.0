Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB1314D06
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774117664; cv=none; b=N6uJAD2TrqA02rGUuBHIXahXHIqzZzMFrmYMU4tBNAL4c9158eDARCnHAZpkVallHgccNUnJZiYTQSq4k1L8t2ZxKjPvmYqWUNL5hr8ZbWXzSkgiI0Mhl3mAm8/TD+7vckoaKFFazmeGnbqbQdU67B0DdSw15ijAlez6m5O5f3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774117664; c=relaxed/simple;
	bh=WbWd8XVKq0IbLo2RMHjF6fy7pnGU/YhqCsnztdvUZWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLmDzruo15R/Fse/j0wbJ124W3he1xzUm6bm/VFA/JRtE1vBVtbpNMooMLjU6WU07ijLGmOpXd6IacHLXkSzKCZs5RwaoJ2oEzw1pf6jRyPwmBkqUpvaoUtCaz+FUfwfHWfwE4hVvZMcVNjGe5/JZqyl6Utu4mZzXihRawsQesE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWOfVkbJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWOfVkbJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9793fa5371so383767366b.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774117661; x=1774722461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbJQ9CIu17gJV0ywiqimKBYYJO7ITeaFVsiuBHllRd0=;
        b=bWOfVkbJ7pXd8Fd5tuG3SFLr/sw1ndskccexR+ob6egCs4Bx1Wt2hDfBfMUZKQVApN
         RB0VztiUr/xF+55HacvwVihJnk2NSP5gu1fwhXJJ8NUklQf5nQEce9dQewDZG2K/Og7s
         TQyjwLP3cOQQGSIjC97p9XTV60k/GmoDJKUg5VGwSrn1GLo+GdO4IYF3qXc4QyW6Z0yX
         p/pqixCwQ0JiKBxUtkLeRmY7rijJl/F5S7dyf2He5maFywuCDe7RXndJHYa+wo/4/1z3
         Bs3mhYOa/EvfblolPLqoV6sL2jH5dNB2AyGnpqQHVOBlORDUU4NxazVlm7YH95XK3e1N
         EjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774117661; x=1774722461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbJQ9CIu17gJV0ywiqimKBYYJO7ITeaFVsiuBHllRd0=;
        b=A5Hleb7m26YryUb8qeLNFPjdj/Lc3U69GMgzPWG8dq7kbCH4iSPqx+cSYxfnq42l8u
         +2Hkzj6SIiHFlBzoL70pWsnGoG7sr4ApSIzmum6NCKfvqSUGQpbEQgmiKcJC/udFRY7Q
         yV6LEMD1TQwCuejpLdJlIOz7lkjTdZmOO05gvZWo7CMYerbDX6RbvxElLHBoMQAf+TnW
         fItIErKwGHHQv46Xj8k4cqegPhjiAmJeAiIO0cY0PDQcZzK8+vTMp1LuxtvQGFOlHBMh
         CEiYHx0PdnUtDRIO055dQXTZKMDH6+F0tuMGvGLFx9qcmlr8ovwl9Vugh0hZl9lx7owh
         HR7Q==
X-Gm-Message-State: AOJu0Yyy+h9v7e2dTqzwZhqoEPh1cFQX73aWhGRuSNX3E23R1H4tZhIf
	FC1EgmAPq+WybeZCDy2hmzkLQuu8A1k1n3SkiIoU/DpQT0cXoFR12NjLv9MFN23WB2o=
X-Gm-Gg: ATEYQzx1KBWlyr0BPaYhafyBQRSsRSm6vlyNSKuhPGBWDCOsvr8qP5pu5riFtua0rfP
	2Jn/fr8qfnuNqFQHvDoEKxz9Yj4mX+DSjxpt36LaiMRsk5qoqCFF29UL9sSZYNnX4KmX5gqkDG8
	JWTJ759lo6qL/JvS8o0hU8ypzk2pZhUmyO+kIzAc0yghs9HF8FlaSTXIIguh7VAHz1aWiIq7EEd
	tnOVbWOu9mL16QUgVqDYH/L9DhZZxIuUgZ1JzZHkM/M8pQLC7bVu1o/UIWxb1vNw3+ops/dloLE
	IFcoLRx8EcnmRmahMlt5FFqCUswlzOU9H8zsz2T5jVFN091H0W3IwINrYwNjIrJ7Zuxm1ZmV3F5
	AjaxMASFceGbNT7uyXt8LLvDYWaTsghfPQ/ZGKOUGdh7hPTRpXHfK9TaejmaczZUE3mucAEEVTu
	GKCyU9rFnQbSEOt3PHogqy/b5DoF+NU365DDeQ515EHzr0/g==
X-Received: by 2002:a17:907:c30e:b0:b84:40d3:43e7 with SMTP id a640c23a62f3a-b982f0accdemr466405266b.6.1774117661044;
        Sat, 21 Mar 2026 11:27:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18ce:4346:2c4b:1eff:fec9:fe24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm285097866b.60.2026.03.21.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:27:40 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] staging: rtl8723bs: remove dead REJOIN code
Date: Sat, 21 Mar 2026 19:26:59 +0100
Message-ID: <20260321182713.665872-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321182713.665872-1-azpijr@gmail.com>
References: <20260321182713.665872-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The REJOIN macro is not defined anywhere in the kernel tree. Remove this
dead code to simplify the function.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 28 ++---------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2adc98c955fd..4bf6d1865391 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1153,10 +1153,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 /* if join_res > 0, for (fw_state ==WIFI_ADHOC_STATE), we only check if "ptarget_wlan" exist. */
 /* if join_res > 0, update "cur_network->network" from "pnetwork->network" if (ptarget_wlan != NULL). */
 /*  */
-/* define REJOIN */
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
-	static u8 __maybe_unused retry;
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
 	struct	sta_priv *pstapriv = &adapter->stapriv;
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -1178,7 +1176,6 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	if (pnetwork->join_res > 0) {
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-		retry = 0;
 		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 			/* s1. find ptarget_wlan */
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
@@ -1250,29 +1247,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 	} else {/* if join_res < 0 (join fails), then try again */
-
-		#ifdef REJOIN
-		res = _FAIL;
-		if (retry < 2)
-			res = rtw_select_and_join_from_scanned_queue(pmlmepriv);
-
-		if (res == _SUCCESS) {
-			/* extend time of assoc_timer */
-			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
-			retry++;
-		} else if (res == 2) {/* there is no need to wait for join */
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-			rtw_indicate_connect(adapter);
-		} else {
-		#endif
-
-			_set_timer(&pmlmepriv->assoc_timer, 1);
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-
-		#ifdef REJOIN
-			retry = 0;
-		}
-		#endif
+		_set_timer(&pmlmepriv->assoc_timer, 1);
+		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 	}
 
 ignore_joinbss_callback:
-- 
2.53.0

