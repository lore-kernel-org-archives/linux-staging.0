Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7473E5EDB
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311557; cv=none; b=HIWlsfiUMUmdWFCe6m51nD26EIAdwouyk2+WLeSSE8UuygIsEGR+aiK2qR3kpEfAGqz7ZfFUPJaEK0PX7d9SUvwvadl1AIvRbVtjJ47TwQfTeeRBR02m9b6TmgTmTHjqWL7W/pSE+K9X9Gt0AwxycImGHXXOMuYA5FVFzy9wcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311557; c=relaxed/simple;
	bh=Fb0RNY6ha2iMUIgygwSJYpINAnjb9o8QydPVRybPGNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHOwBRWY4Kw2R6edi9fBW5NeqYnjP/muI982CeFabVJ5vVbPb7Pr//rcyVITmukhZHcYf+gQoAdeCXl6tauPV94dGAN1rL/o8cDvtfZKweDY4BAS06SRyuFMTjGJz5z16CMcH9Jrp1nO6yCRa1hYgIpyyvF1L9dQUobEBDKqvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rdm/oOv5; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rdm/oOv5"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38be5e86918so116064961fa.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311551; x=1777916351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W9U68cUWxpZM3IgOpqu6mmWCCpCvLqOOPUep/1W86E=;
        b=Rdm/oOv5buMVb54BW884MAY8slH6/bJ1FS8otqrRsKzix35AQiu3m1JQBwEUWeLW23
         ZTd8sReENwEAUUFMK8zS1XaMtMG3bcf56LLz5Zh3LDdpsBPiSkzt577vfQqFash5uZfY
         GRYSYIhJDnEJFtr2dQ9U4xXpaAxdX0oIc4GdNOagIm/Ph7pQxZLopJiYvn9BCRSHrt6X
         psVIQt46JLdQ3RPphNGZoeIFA7c3VrJpgIrJfEnAMAY2GTUHAZKqTNYXogbVAHdetkJf
         ULP+XqgjKahe6vr/oL51pDelqyLTn8phUce2adRzf6Usw4O9z7Ih7N5HPqcKoVYTKSah
         wMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311551; x=1777916351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+W9U68cUWxpZM3IgOpqu6mmWCCpCvLqOOPUep/1W86E=;
        b=Ofjlhg0GXAs5YCZXashiRni/Pu0adaT5M5y9aVUtNa6prz1P1mT7WXLpuYSPRI0EV5
         vKhehH89MYCJ+DpmPTSL1usBy8VDCCTL1Vblzfo+/gTjFWSzkgQ09Rf1zC/4ITxom5y/
         8gTP6NiNJkLo2Ho4Eqo4cVDQ5lK/mMiT1coAsbsBUNZGjc5dGarLHsQCGKRkvkyYqyOE
         LQJckVTixSzPA1U6qDnd+/AhW5SGd5PakAdL03temcgdVUtZ2w9f3fPFQ25wf1ADULNu
         1w4JEDsyjhYHrMkYBBsMv3m/t0H8bDOKT3MQcl5wumJKMet1XN8+NkW+EvYKy8O7pEVE
         QkNw==
X-Gm-Message-State: AOJu0YzJwGNWkrPMMtP6gVJ3ln7If9Mr0xYLZNwopXjwInl+PS+DobN4
	C8EAeDEzUhrIDuKR7C6m2z5fvPzwOZ5GuPxrXc/n8wdODTh77GgCYNTqD/j6OOHdHuc=
X-Gm-Gg: AeBDietLTPsGizbT9hFwGPxYaLf0xZl3Xsa/YgzHTmc7tyQ1LNxQHOZ1BWfuRTL9Abf
	y/BfMTR6Mkwkq5hL3gdb6wWvXaqUHYE8a46wFa3cTiKW/Hq/7uo2wBKwktWFt4x0B6tT9bU+okQ
	TgTReXv8ZyEdCdnbWq6YQQnCunqBsLj2QJhS6Jd05ufxdF+o6IyOcyIt8xKh/++uC0CFfijsjbh
	aJ0ukIEfNMN30OptSJVOtmEQSrGwA4s2CDkDOCz5jveGBZMcCaPOvIPtABdbpWv+J/ZERz9Kjj6
	SLpyYGz0S1/pMCf0cdb5R5JBQ2BKlTf5sKQUAnf6FYzJEY2j/FwW4gcDtuWn3v0NuUR1o8Ly5df
	C5vdNG49E36L2cQjC07gYjOq8pgCr8IvPd8rbYjE6lJQRKhbj1qPqMMcuytO02zbnea3Bshu9Vn
	2BgRr8cjfLZ5JHTYl6iDhWV9LLW16Z7ahDp0winuATzLy83Uttcxe5h73hSuHl60TsSnakoAPp
X-Received: by 2002:a05:6512:3b8a:b0:5a1:33b6:2b6d with SMTP id 2adb3069b0e04-5a745e3a184mr76978e87.14.1777311551409;
        Mon, 27 Apr 2026 10:39:11 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebe31sm8272024e87.75.2026.04.27.10.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:11 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 8/8] staging: rtl8723bs: rename rtw_btcoex_LPS_Leave to rtw_btcoex_lps_leave
Date: Mon, 27 Apr 2026 19:38:57 +0200
Message-ID: <20260427173857.585742-9-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
References: <20260427173857.585742-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames rtw_btcoex_LPS_Leave to rtw_btcoex_lps_leave in order to conform
to kernel code style.

Found using checkpatch.pl.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c    | 2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index abdeae7ab861..d12a65bb3eb7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -61,7 +61,7 @@ void rtw_btcoex_lps_enter(struct adapter *padapter)
 	rtw_set_ps_mode(padapter, PS_MODE_MIN, 0, lps_val, "BTCOEX");
 }
 
-void rtw_btcoex_LPS_Leave(struct adapter *padapter)
+void rtw_btcoex_lps_leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index fc977d5497c4..81d25a4404c1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -36,7 +36,7 @@ static void halbtcoutsrc_LeaveLps(struct btc_coexist *pBtCoexist)
 	pBtCoexist->btInfo.bBtCtrlLps = true;
 	pBtCoexist->btInfo.bBtLpsOn = false;
 
-	rtw_btcoex_LPS_Leave(padapter);
+	rtw_btcoex_lps_leave(padapter);
 }
 
 static void halbtcoutsrc_EnterLps(struct btc_coexist *pBtCoexist)
@@ -60,7 +60,7 @@ static void halbtcoutsrc_NormalLps(struct btc_coexist *pBtCoexist)
 
 	if (pBtCoexist->btInfo.bBtCtrlLps) {
 		pBtCoexist->btInfo.bBtLpsOn = false;
-		rtw_btcoex_LPS_Leave(padapter);
+		rtw_btcoex_lps_leave(padapter);
 		pBtCoexist->btInfo.bBtCtrlLps = false;
 
 		/*  recover the LPS state to the original */
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 22010239515a..765103498789 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -22,6 +22,6 @@ void rtw_btcoex_halt_notify(struct adapter *padapter);
 /*  ================================================== */
 void rtw_btcoex_reject_ap_aggregated_packet(struct adapter *padapter, u8 enable);
 void rtw_btcoex_lps_enter(struct adapter *padapter);
-void rtw_btcoex_LPS_Leave(struct adapter *padapter);
+void rtw_btcoex_lps_leave(struct adapter *padapter);
 
 #endif /*  __RTW_BTCOEX_H__ */
-- 
2.54.0

