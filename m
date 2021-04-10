Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C071
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 15:00:41 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id hq27so13113741ejc.9
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+GS5YSfWFuaI4QAKIQGwDg4lsv5EguJ6x2s2YbgKL78=;
        b=XBAoLJGU1Gz/A/gMAcXAIHOyw/xJ6GQVtG9UVSMOnNEDap5BWU+A/2pekAzKgy7QGj
         nvLIonwIrbXh9TDom7KndIiqlQY9StdWdUFZOm7Zko3OGv+eOnHeysa0McQahXW/DHRP
         kAUG8Zi7EWayOGG+JgB/sejgspfOvRLyetjmPo96fsQ8p5E8vIBXxnIyxqlE4QCwQ1+P
         yPDCUeUX7Nj7oo1ptJQHDzDKqdo/qYp3QBe3KZCi2WH0lgyXoMi7wzs6U0Kb1RpZIS9p
         sSsWTL6TLaCRxsddem7IYmfNuAfh5nqVCIP7lNjGj31KewzOzwrOg/xPtbl3nVfttJbr
         ts6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+GS5YSfWFuaI4QAKIQGwDg4lsv5EguJ6x2s2YbgKL78=;
        b=qFirJ282rRBIguT9jgHm1mlrrnd1Aw8lcSxnhb3nZgVnuJFkWgzsqjLf7iIXiTeHRq
         5By0tVU02F1s6UNgE8RCG6Tz8h4zb5MXwVpctolrJTurcuxiPYO9lRz9/gsqOAPcQucz
         5zL/Q+UyiyuOwnImucSoHSjSsFwFYTOIPmrVtWIQR8Js8Zp7bI++sF3DDS0JazEsajmA
         HbQmxNCWx71L6aqJHO/DJBu1uEErRpd8CKcR/6pp9/fDSO3e0vOcZXvgUxPIQAm7RrMv
         IRgP2BbZPww4G8kex4dHOGSUtzKCeNf0aZaiKV0FLp9Cs1HCjzbllP9LHReJ4ng/WxPn
         r8tg==
X-Gm-Message-State: AOAM533y6jNsdR/YKISkHs1mFdyMbdH77D+w0WZrLCSXr05ccbTX75Qh
	rtqJtY6hVgckII6iwxRzqBo=
X-Google-Smtp-Source: ABdhPJzUPJhD/Jw25OmsKVnptLqsNbw9k+oR68MuFXrpm1oxEr3dV8AQ2bx0m0E8+qZDdyfnNx6pGg==
X-Received: by 2002:a17:906:5413:: with SMTP id q19mr1563472ejo.8.1618066840031;
        Sat, 10 Apr 2021 08:00:40 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gb4sm2719494ejc.122.2021.04.10.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:00:39 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2 4/5] staging: rtl8723bs: Change the type and use of a variable
Date: Sat, 10 Apr 2021 17:00:07 +0200
Message-Id: <20210410150008.5460-5-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210410150008.5460-1-fmdefrancesco@gmail.com>
References: <20210410150008.5460-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the type of fw_current_in_ps_mode from u8 to bool, because
it is used everywhere as a bool and, accordingly, it should be
declared as a bool. Shorten the controlling expression of an 'if' statement.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: No changes.

 drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 96fe172ced8d..8dc4dd8c6d4c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -348,7 +348,7 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
-	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode == true) {
+	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
 		if (padapter->HalFunc.hal_dm_watchdog_in_lps)
 			padapter->HalFunc.hal_dm_watchdog_in_lps(padapter); /* this function caller is in interrupt context */
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 0a48f1653be5..0767dbb84199 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -203,7 +203,7 @@ struct pwrctrl_priv {
 	u8 LpsIdleCount;
 	u8 power_mgnt;
 	u8 org_power_mgnt;
-	u8 fw_current_in_ps_mode;
+	bool fw_current_in_ps_mode;
 	unsigned long	DelayLPSLastTimeStamp;
 	s32		pnp_current_pwr_state;
 	u8 pnp_bstop_trx;
-- 
2.31.1

