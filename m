Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E83E558C
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311557; cv=none; b=If/JCU9/UxooY7ephUpqHt8cWH+cAOZPxd0Dkk/sFymAOYyaqMqAjo3zAThxZu1E4YsfIMrLvAHFDesPASD7fAbKpSHB3/b8+n9tMy6QjNhgRlps0lbviKtNmRxpbc0TPGyNKJsZh/etHoOuoKrWqxTnyUNpcMY3acIv9Eb5oHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311557; c=relaxed/simple;
	bh=CAPb24zriRhotaF9JWWtTernSHWiIDJJV/Rm664mveY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odnGQcN5RSZYCRsM2YSW9V8tnmSBdkTxHL7AjDnRTuaHNS168nvLrjz6aGDQKLXjaX0EROGlx3bvVDQB9eZqU6keT9IiAGsQAff/aqRPTcUwAZz4EiNCY9U1XzLmsGAGF2smB5tZwNxgq8L8bW43UHnnUnilv4RPaywTnmzFeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnkAN7bI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnkAN7bI"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a415fd6bceso11575326e87.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311550; x=1777916350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9xuyhQD5dcJB0rJyJUQhXSBxgYlHA6eoj0QC6tQvfc=;
        b=SnkAN7bIomo+0dSiQ0/GaIxH6vG3skc1kFUU/sTQqo0auRQpYGodiOX/utsoujkIvm
         yzzeVj47/3jv9RL0YBCFHf0OQ6J8zPmo3+z0Ou781s45VHdGfboCsOba6j/GJvt37GGW
         ddksDZVTxfCoFcYSOzKTK8hB4VkTTuXR9Aq+ytllbCmg48IT81dtWMGbzRqgLXqBTvzU
         tSdlZhSCvUo2qKSPSLTQpHPtJXuXGozszg5QfCPtfbUmBiKdsBzUk7S+Gu6ezIuIms5d
         hHEuSI6TEqid7whBXrcjnKY5BIIWhpliPzIxpCGpLRZ55ncuruAIaCpehzwiwM9r4eRZ
         Mmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311550; x=1777916350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9xuyhQD5dcJB0rJyJUQhXSBxgYlHA6eoj0QC6tQvfc=;
        b=cxCDm0V7LajLgUtyHxWMLV1NOkxIP4kbiIKxPlQsKjGCkr2+2JZuItezCZhrb/Fvje
         goAIVRlqt3YwLO7u/BCVHV2JAeuo2owhPMIDtf/RCrETUGa03826m6qOyFNmHIyoOchH
         fF+Jstcvys6LejRDK59rrK9HQNNOry2V7ao3PRreZivZThgl5Rcc0l4GssP9A2rlmY9T
         sKu+lFGGArUPrvL3qUS0C3nxdhfjJDb4hUBQ2AOivq5dkv+uuReNlL+fAQ8h60axTJU6
         pIVZlxLS7ICfqLUGqP4KqAtPwNTWLmJzgDocy77+2eY8X/AkzGYab1wm9KoLUaTPncid
         zTeQ==
X-Gm-Message-State: AOJu0YzQJlYndxFXR6JBoVIUGFtrFyKRRMbmAAGOUGtzcHE+LF1P1HYz
	0iM8GFNvYAprAhSSbLsr4FpKHOOO5ESRb0miaytYlA7ARIbypWruMKlz
X-Gm-Gg: AeBDievdsHQTOq9Q0+rxUYzGGMLxCqtJbu2KKe6guHshyzBcE21g9o4o9Z9N+E+m1To
	y5/AM1tzEoS8X6vWtgx3ADKX8bpD2WvtDHPVYyzF28lULrCmFFDANxqQRwH6LQUIgiYU0jASTOB
	HuoLVMBwrqCxLLZgmDVdpYExJMThgdPDWMqrNSafTlKsopf/t3kf4cL2R2JO0oNwtkOxngFRinb
	C5vvxcd8b4khJZyQBzqjfLm9Cv3cRmKnsLiRZ75YthVPnVV0NxQ5/LCK+z30u6LRwIxZs2CoRb1
	cVi7NgnJbI7HELwP6LGExT5uy+1vE3kTnzPQd+69C+CvazQk/j2/0D4WIdiWFXeigMHvNzE0D2Z
	sbxhQrfP3xp9gbzB9/qxeW45tgfFpBzJxK5LuW3pA96lSr5l9rPWDHrZZ8YwrXhz5513iuOQd2K
	u4oDrto8IlKkep3jQ0T2kAl+Z7YiKjaBmxEl4mXatOKpZfg0PLVfCt70XCh+cKAeWm5XkTHO4l
X-Received: by 2002:a05:6512:8014:10b0:5a4:299:285b with SMTP id 2adb3069b0e04-5a746220c3amr6149e87.12.1777311550366;
        Mon, 27 Apr 2026 10:39:10 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1214sm8395500e87.45.2026.04.27.10.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:10 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 7/8] staging: rtl8723bs: rtw_btcoex_LPS_Enter() -> rtw_btcoex_lps_enter()
Date: Mon, 27 Apr 2026 19:38:56 +0200
Message-ID: <20260427173857.585742-8-linus.probert@gmail.com>
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

Renames rtw_btcoex_LPS_Enter to rtw_btcoex_lps_enter in order to conform
to kernel code style.

Found using checkpatch.pl.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c    | 2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 2 +-
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 2528520262a6..abdeae7ab861 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -49,7 +49,7 @@ void rtw_btcoex_reject_ap_aggregated_packet(struct adapter *padapter, u8 enable)
 	}
 }
 
-void rtw_btcoex_LPS_Enter(struct adapter *padapter)
+void rtw_btcoex_lps_enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 	u8 lps_val;
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 77c474919ffc..fc977d5497c4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -49,7 +49,7 @@ static void halbtcoutsrc_EnterLps(struct btc_coexist *pBtCoexist)
 	pBtCoexist->btInfo.bBtCtrlLps = true;
 	pBtCoexist->btInfo.bBtLpsOn = true;
 
-	rtw_btcoex_LPS_Enter(padapter);
+	rtw_btcoex_lps_enter(padapter);
 }
 
 static void halbtcoutsrc_NormalLps(struct btc_coexist *pBtCoexist)
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 61a67360af00..22010239515a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -21,7 +21,7 @@ void rtw_btcoex_halt_notify(struct adapter *padapter);
 /*  Below Functions are called by BT-Coex */
 /*  ================================================== */
 void rtw_btcoex_reject_ap_aggregated_packet(struct adapter *padapter, u8 enable);
-void rtw_btcoex_LPS_Enter(struct adapter *padapter);
+void rtw_btcoex_lps_enter(struct adapter *padapter);
 void rtw_btcoex_LPS_Leave(struct adapter *padapter);
 
 #endif /*  __RTW_BTCOEX_H__ */
-- 
2.54.0

