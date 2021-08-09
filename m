Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319016D10
	for <linux-staging@lists.linux.dev>; Mon,  9 Aug 2021 16:50:58 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m36-20020a05600c3b24b02902e67543e17aso299471wms.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Aug 2021 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tvbz591DMvF33ax+eSb+xGGBL3Gl9La/xcKDxZqOIrc=;
        b=FJZnIR7p1spTk2er8QaEkPFPa0f2ZPJ9EG0leRmg1hfhP6eAUXcRXnlm7N/45mRY8Z
         gziwuylrpA6e0ounj2YjwW01wQbgpME8wwqThPtTF/qsTOmnrrk2iO3aNFIpxyDGNXxN
         Asv3pk4fWERGhxPycqAOoS4w8rJ7VMQwxlurJ0SxyWmkT/UO7Xx23vzEIth4A/3gyO5w
         8s5RvjGlbugBjo4XLPgrh3XmBJKsaLvqBHr6gVQZ2f/jVUZ58oztkK3NMlXRtgTil35j
         JcwbjK6R2Dw2KZxYs39+wFFN6d3T1itb1hNWvHi4YQBI+YDChqB4UlHsvsoociGIw/10
         p+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tvbz591DMvF33ax+eSb+xGGBL3Gl9La/xcKDxZqOIrc=;
        b=CLlwr05joyGzuw4RTZFHHitixMS4Z9j924xZAztWJFb7GENgdNTIjG7Cvr1vFyBpfE
         GF4s7zEz6iApfhWAucihJAjwQ9zXv1Jg0E79dEZET98WAiqE7qcyYDO3RR2bUh152Fdp
         fdKN8Y1AdRzcEO8mO/Nueu1AVAv81/mvWQ7Ou04/o7K7jloNHKs5kedPxmiIRBtXq4oP
         H7GOucUpIuK9op65qhHKj0Ut7ummgknAZZ1FqAtbJUt8QqXFBzLaDITWcWh1WcunOrWP
         +wA6D4jBR3F0+WsAQ+vE4J/Lq9NvQ6/VFyyq3UxRy5FThheDCXzurU19VuSWBKhHiSTh
         bEOA==
X-Gm-Message-State: AOAM530cKzh0h7wVU2Hjc/Gd4XV2tDROFYz6nNjmHsq9cG2r66HOgkbn
	2T3ljXxHJ0BC4FZOXN0urh8=
X-Google-Smtp-Source: ABdhPJyQv0Vj42OeGfAeLCK15Y7q50KvN6EzhbR7Bvgi3piO+K/2h18AYzbnChs+lYO15CH9vG3XrA==
X-Received: by 2002:a05:600c:acd:: with SMTP id c13mr18165226wmr.189.1628527856653;
        Mon, 09 Aug 2021 09:50:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::996b])
        by smtp.gmail.com with ESMTPSA id q5sm20484469wrx.33.2021.08.09.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 09:50:56 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 13/17] staging: r8188eu: remove unnecessary parentheses in core/rtw_pwrctrl.c
Date: Mon,  9 Aug 2021 18:50:03 +0200
Message-Id: <20210809165007.23204-14-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809165007.23204-1-straube.linux@gmail.com>
References: <20210809165007.23204-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses in core/rtw_pwrctrl.c reported by
checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 57cd10205d6c..9a00a316674b 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -51,8 +51,8 @@ void ips_enter(struct adapter *padapter)
 int ips_leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
-	struct security_priv *psecuritypriv = &(padapter->securitypriv);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	int result = _SUCCESS;
 	int keyid;
 
@@ -98,9 +98,9 @@ int ips_leave(struct adapter *padapter)
 static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 {
 	struct adapter *buddy = adapter->pbuddy_adapter;
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 #ifdef CONFIG_88EU_P2P
-	struct wifidirect_info	*pwdinfo = &(adapter->wdinfo);
+	struct wifidirect_info	*pwdinfo = &adapter->wdinfo;
 #endif
 
 	bool ret = false;
@@ -122,9 +122,9 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 
 	/* consider buddy, if exist */
 	if (buddy) {
-		struct mlme_priv *b_pmlmepriv = &(buddy->mlmepriv);
+		struct mlme_priv *b_pmlmepriv = &buddy->mlmepriv;
 		#ifdef CONFIG_88EU_P2P
-		struct wifidirect_info *b_pwdinfo = &(buddy->wdinfo);
+		struct wifidirect_info *b_pwdinfo = &buddy->wdinfo;
 		#endif
 
 		if (check_fwstate(b_pmlmepriv, WIFI_ASOC_STATE|WIFI_SITE_MONITOR) ||
@@ -147,7 +147,7 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 void rtw_ps_processor(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	enum rt_rf_power_state rfpwrstate;
 
 	pwrpriv->ps_processing = true;
@@ -248,7 +248,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 {
 	u32 curr_time, delta_time;
 	struct pwrctrl_priv	*pwrpriv = &padapter->pwrctrlpriv;
-	struct mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 
 	curr_time = jiffies;
 	delta_time = curr_time - pwrpriv->DelayLPSLastTimeStamp;
@@ -275,7 +275,7 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 #ifdef CONFIG_88EU_P2P
-	struct wifidirect_info	*pwdinfo = &(padapter->wdinfo);
+	struct wifidirect_info	*pwdinfo = &padapter->wdinfo;
 #endif /* CONFIG_88EU_P2P */
 
 	if (ps_mode > PM_Card_Disable)
@@ -412,7 +412,7 @@ void LPS_Leave(struct adapter *padapter)
 /*  */
 void LeaveAllPowerSaveMode(struct adapter *Adapter)
 {
-	struct mlme_priv	*pmlmepriv = &(Adapter->mlmepriv);
+	struct mlme_priv	*pmlmepriv = &Adapter->mlmepriv;
 	u8	enqueue = 0;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) { /* connect */
-- 
2.32.0

