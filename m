Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF97288513
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692841; cv=none; b=Di4/qsqai9vRb4MmNvhf01GoECUX9eB3z8ZzpGVlR3Zhv4KRA8gzsGY81Hvmp17W0H5Ww3BIcmohnlAkx3nEjX/hWq7R6q6VryTYkxXNX5uJlRl4cnA6lIIjdVLAw3mMSGzumq1ePLMiEfhQwRJDcRhil62fTuaiv2Tcp50aDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692841; c=relaxed/simple;
	bh=erAa2wgYtFi6ZbP+gTHt+D2llk6q0nMQzvg03j8MO4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxXuCH/rlrBy6mT8fxzeaNxSS0vmTEcmMWZit9wPy+wHG7bgFrdFrxn2+jNQNYFzlj+5eWIs2n2nysNIFwmGUFsBcsFmQd6+2WV3Bl9HTY9Gmct6yIgVRas2qL95L7Pbx+WaAWCKF1omavBnvcHMLCI8+XSUIlZ4/y7vVAJl8eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrAzMGrr; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrAzMGrr"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a7b23dd036so17618855ad.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692840; x=1771297640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8B/V0xUiuY/0tv0TusZ0S8AWx1W4V5I8QXUqIKhBZ0=;
        b=lrAzMGrrt6T9R/e6V5YuDnZawIZX8Mbirxa9nhXEHSjdLLKGoiLbc7Sb3ieMhI9cge
         xELthfVWz/FcgWCRpTe2250X0t+HKQs6Iu5Piet2Yv/RxNwOky3qyquBgupk+8PxQNUo
         qYfIKWw+I+1M2t15OCCFYGLGAmuzWvwyOM7XKx3KIhXqjWqyHP4IsvRazaepuWEXkxWY
         KC/fJoVzMsar7vvm97ifBFu7gAQFbyEM55DUyPVde3YZIMVGpaq8i/Vcx5UQ6UqjU068
         BEJFwgzJ87mLqwHfPwkAUJs7EIcVZk1JFtSSBWdnG/Nik8VSv6rQskoY9HqqGqhHaqhv
         6Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692840; x=1771297640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8B/V0xUiuY/0tv0TusZ0S8AWx1W4V5I8QXUqIKhBZ0=;
        b=M9bJmzIH9lHQbdeCsoXJIb7g5H5agUktr7ZP636IS2sU+AV0EycdYv4U9rMEo1Ckna
         gGCMd7aX613c9wImCAWUJOJFKLwM2q+6Z/aKeDltX8W//0vO21iQc94D4l9KtUF9Pu4z
         fm662eoBGQdK1es/p9Ew7avCCQqf2QaL98LoOUiRgGn8hplHxZ48KIN2BmK4tpmAK4Oc
         F+K2h7gfGjV/2BXUDY7V3t+a35zVc3KU192FXhSTG4AubkBviWXT+7tscxxhnWx+os8n
         UQHuenGMf8D9OuyWfUGrIhGBYpnIqZT60KuifiOVZ8goDIu7xSZ6Hjjri2kpfFU/Hpkf
         pu5g==
X-Gm-Message-State: AOJu0YwbiGVZIqTm5ojwctEVNWuZ44NOMryOfBeF5O9xm8lwk7Expsj8
	826ifEQeYMF8Ej+pTlrslkcG0AwTxufumD679FSGrXLWKeF8a0y0gsyksLSkcJlG
X-Gm-Gg: AZuq6aJ8KKF/9VGkeF9Z4teyDqOpg+MIURRmFMy86zTyenPDfDaOMIegtHAU1LmfNVL
	u7ry1o1ejuxnRcduxP5zmN92sGly2RaY3blUOkzCo+i0z1MrjrxSa20xd//EhGeGXpx0udwwUta
	2sEo7DzJF1stAoXdGViKbyleOkMYqmLqd9BsrOCv0+z8YF8Pis3liGSYQz6HtJw/cknP2yDxwlS
	hrEmBT1TOxTw1ShuO1WG4SyblvZjMA6oyS8w1tm82tjRsSFiouioboy+jv6PJltduCOZzpSJqd2
	AtRRMz4GZlZWRaydMYiVxYhlR0x+VQVGVoGjJGe/xGY7Molv7PzA+a3sJh5HJUrRb6XlhxcmiRc
	fP8BenlG3oxsj/LXz+Yy5L0USW7m7BSlCr2o1qFgjiMaUNT8gY3Mcd/Y+COxzOXr5ugEItK55bJ
	2lOnRgdjxG90wo0PBx7s+UjepvR0aSqQ==
X-Received: by 2002:a17:902:cecc:b0:2a8:fc56:a3e6 with SMTP id d9443c01a7336-2a95165538bmr112825215ad.24.1770692840036;
        Mon, 09 Feb 2026 19:07:20 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:19 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 4/7] staging: rtl8723bs: remove unnecessary void * casts in rtw_mlme_ext.c
Date: Tue, 10 Feb 2026 10:06:04 +0700
Message-ID: <20260210030607.1430567-5-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210030607.1430567-1-horstaufmental@gmail.com>
References: <20260210030607.1430567-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..e6a0f801ee4f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -528,7 +528,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (is_valid_p2p_probereq)
 			goto _issue_probersp;
 
-		if ((ielen != 0 && false == !memcmp((void *)(p+2), (void *)cur->ssid.ssid, cur->ssid.ssid_length))
+		if ((ielen != 0 && false == !memcmp((p+2), cur->ssid.ssid, cur->ssid.ssid_length))
 			|| (ielen == 0 && pmlmeinfo->hidden_ssid_mode)
 		)
 			return _SUCCESS;
@@ -794,7 +794,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	} else { /*  shared system or auto authentication */
 		if (seq == 1) {
 			/* prepare for the challenging txt... */
-			memset((void *)pstat->chg_txt, 78, 128);
+			memset(pstat->chg_txt, 78, 128);
 
 			pstat->state &= ~WIFI_FW_AUTH_NULL;
 			pstat->state |= WIFI_FW_AUTH_STATE;
@@ -809,7 +809,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 				goto auth_fail;
 			}
 
-			if (!memcmp((void *)(p + 2), pstat->chg_txt, 128)) {
+			if (!memcmp((p + 2), pstat->chg_txt, 128)) {
 				pstat->state &= (~WIFI_FW_AUTH_STATE);
 				pstat->state |= WIFI_FW_AUTH_SUCCESS;
 				/*  challenging txt is correct... */
@@ -896,7 +896,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			if (!p)
 				goto authclnt_fail;
 
-			memcpy((void *)(pmlmeinfo->chg_txt), (void *)(p + 2), len);
+			memcpy(pmlmeinfo->chg_txt, p + 2, len);
 			pmlmeinfo->auth_seq = 3;
 			issue_auth(padapter, NULL, 0);
 			set_link_timer(pmlmeext, REAUTH_TO);
@@ -1010,7 +1010,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 	} else {
 		/*  check if ssid match */
-		if (memcmp((void *)(p+2), cur->ssid.ssid, cur->ssid.ssid_length))
+		if (memcmp(p+2, cur->ssid.ssid, cur->ssid.ssid_length))
 			status = WLAN_STATUS_CHALLENGE_FAIL;
 
 		if (ie_len != cur->ssid.ssid_length)
@@ -1349,7 +1349,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 asoc_class2_error:
 
-	issue_deauth(padapter, (void *)GetAddr2Ptr(pframe), status);
+	issue_deauth(padapter, GetAddr2Ptr(pframe), status);
 
 	return _FAIL;
 
@@ -2736,9 +2736,9 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	memcpy((void *)GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
-	memcpy((void *)GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
-	memcpy((void *)GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+	memcpy(GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
+	memcpy(GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
+	memcpy(GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
-- 
2.52.0

