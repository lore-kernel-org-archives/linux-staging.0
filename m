Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC4361956
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423051; cv=none; b=IhOJ7IPSOV041+5H49l6+3W1xZ4JFIPXhexFLwW1XK81pm/7y7br0V+DbTf/neIemKrlCgf5JAWVAghSWBQtXHiXIjZGIR31KMKNTXGwfJUiFvPc9XMeCtii8Pu8I5vya8unOVh4cm3zjNrpDadH+fP1txb3VNm3itxYVmFxnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423051; c=relaxed/simple;
	bh=u1OKHhmHAqjLe35TGicNWb6VM2ww3qQWvFf9wbnm4eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNBB1l3yqmzVWeSVkiDDT7NNyCwSK6iNiHYtJScsIKcqa79ulb0f+zWJgtk1uk6aqKE73JT3KkCSL/aDSoDiHS6hDtX5dYP05yFClncNh5kxqV1+MFI5I1sf9gkoHgnlqX8Y+jzfIvf99rufQGnM4g9mT5eAo1GFSnDXl3mpJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGJU2/HK; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGJU2/HK"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1577049a91.3
        for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787423049; x=1788027849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCctgv05Xaxb0nJYkWTCE+fM2fXbXJt0bAOp50gZWuM=;
        b=fGJU2/HKp4+KLOikNcQsjkuRp5DKmoEi7sR3UAux/JHMaXeQyhPnNP9NcGbWRp/wY1
         7jUvhRjaWiKEeVI5DfyS1EAeW6Z4jkxnDZZVMLVeb0UDNKjmbUil/kX/cDPl/vg1ZFPp
         VHJdiLAKqYJZDXwfH7aZXTsiS/zkRIUz4ic1jRGgui0xYw+Kqfg1W+gYYfKNL0s2om5G
         /56tGFR/0lv+cE23CW7meOY+dhGWp6cNCkKdCp4ihc82eDenXKXGhG0EbZj3b0BjO9Ue
         bPwPvxVZz4NTf4CazraE2bUws9KeCaz1xTxX87AjHjMqAG9JwD1RcN+PObhrVXFnffcK
         sSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423049; x=1788027849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VCctgv05Xaxb0nJYkWTCE+fM2fXbXJt0bAOp50gZWuM=;
        b=SHFxNhFlXLJMw17VOzDyWoDJy8AX6xCzWYo9137m3biXdFlESaXKCupqtEc5eFutdM
         BP2sgiD83SEr8XocR0IDGTr6A2hYmZlsMeZdXnSXCDlCMCSijLc+SCKL48wrNDZrXWfP
         C6IBZrDKmgTlWrzWtnU+Cx+QXaxVxT5AOwlQ5OGW1w7yeR+s0NeGVMS47EGrmAINIxtz
         NFdznBPRvHi07qcvJEVXS+HPIUOf/P55k++Q8Lr+fCX965fI/ZQgQ7PAig/+AjbzGjZQ
         xXIiFwNEWRdMOGpDWu5RQH3yBenMzxXkO/AuS7Ahtjq4/BC3/4NER2chZvn3Gb1ZZPjR
         KlaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVeFtxXgiY0rMn6GgKS2ifOTHrR0CH/T8K9mImtJV9SY8PEHQHP9xklWIdd5eK0CYWmzR8/e5BUU/gunl7@lists.linux.dev
X-Gm-Message-State: AFuF++nA+Wth/u9L4YfjPaY0Xp3rq/yU55YmhcoIvS1MSNBl/+P3waq9
	iTEdLUtrDWjNh/aFDHp6w7VuvjyOv8KdVC20VrIFUHGbs2Q70gv6I0eV
X-Gm-Gg: AR+sD10sP8YU6pUdFip/jORPQPBkMr/+lGazNdtZsSJqTVqI25i1lmwbVjhKQJoZn4q
	Ao++zC1ArBTv/W+RSlvPa24tSw10/75vSUeeQLAMPOw0Sf2JxBC5nQe0kjKVl8EHe3o3WN1illf
	rjBSK89XaXGyTpXj6wVGV0UNj5P2gNWS6TJ0NR/qm1eCy+Qys3NCHHru/9bT8x7FMKdOwHEQ6hO
	9gk9pP79pC5flRSRhtqlG9jdfHfCZo+eKNVA+1jsem2L/VMlQLgprckVfn0rdnYLBOOTF/evi32
	qwC4SEPGrFBk8a/3ivkfCg63hzunRnnc1HwXapx56D6eQz1jYmHHPrcbrcv2suZSvxQLC8SduIF
	ZgdGAn60VtOg/TYMcHlUoNKhj1tswXL5pk7ilsnXLcpYUEPhQIQVUMhfMaQUePeVdXXTuVvrWNJ
	LwhW/tGB/usg2jukWPl6VquLxkWernp72BDiZS3RE3khhAWLm+5hXXmx9iRrU+jai8Nty+MbZW1
	FfZgppnza4rjF4NXFglCJzpMtLiSZdcih7DzAzoO+tnhNBU+9tGidXTyvyt7hpHSTZYZql//egI
	sIWPS16QzUs/VtHHUuYVd7Vd
X-Received: by 2002:a17:90b:538f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-395df29e128mr13351942a91.13.1787423049493;
        Sat, 22 Aug 2026 11:24:09 -0700 (PDT)
Received: from i-use-omarchy-arch-btw ([203.110.242.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm13677462eec.16.2026.08.22.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 11:24:09 -0700 (PDT)
From: Samrudh Nelli <samrudhnelli@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	azpijr@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samrudh Nelli <samrudhnelli@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: use scoped_guard() for mid-function locking
Date: Sat, 22 Aug 2026 23:53:47 +0530
Message-ID: <00636f947374922728394534428180bb804bd562.1787421961.git.samrudhnelli@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787421961.git.samrudhnelli@gmail.com>
References: <cover.1787421961.git.samrudhnelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace classic mutex_lock() / mutex_unlock() pairs with the
scoped_guard(mutex) macro in functions where the lock is
intentionally dropped before the function returns.

This isolates the critical sections explicitly within block
scopes, eliminating the need for goto-based error handling
(e.g., in rpwmtimeout_workitem_callback()) while ensuring
the lock duration remains strictly identical to the original
implementation.

Signed-off-by: Samrudh Nelli <samrudhnelli@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 121 +++++++++----------
 1 file changed, 54 insertions(+), 67 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 18163a3dbade..913d77351725 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -69,9 +69,9 @@ int ips_leave(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	int ret;
 
-	mutex_lock(&pwrpriv->lock);
-	ret = _ips_leave(padapter);
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		ret = _ips_leave(padapter);
+	}
 
 	if (ret == _SUCCESS)
 		hal_btcoex_IpsNotify(padapter, IPS_NONE);
@@ -138,9 +138,10 @@ void rtw_ps_processor(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	u32 ps_deny = 0;
 
-	mutex_lock(&adapter_to_pwrctl(padapter)->lock);
-	ps_deny = rtw_ps_deny_get(padapter);
-	mutex_unlock(&adapter_to_pwrctl(padapter)->lock);
+	scoped_guard(mutex, &adapter_to_pwrctl(padapter)->lock) {
+		ps_deny = rtw_ps_deny_get(padapter);
+	}
+
 	if (ps_deny != 0)
 		goto exit;
 
@@ -486,11 +487,9 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 		if (pwrpriv->pwr_mode == PS_MODE_ACTIVE)
 			return;
 
-		mutex_lock(&pwrpriv->lock);
-
-		rtw_set_rpwm(Adapter, PS_STATE_S4);
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock) {
+			rtw_set_rpwm(Adapter, PS_STATE_S4);
+		}
 
 		rtw_lps_ctrl_wk_cmd(pri_padapter, LPS_CTRL_LEAVE, 0);
 	} else {
@@ -544,14 +543,12 @@ void LPS_Leave_check(struct adapter *padapter)
 	cond_resched();
 
 	while (1) {
-		mutex_lock(&pwrpriv->lock);
-
-		if (padapter->bSurpriseRemoved ||
-		    !(padapter->hw_init_completed) ||
-		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
-			bReady = true;
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock) {
+			if (padapter->bSurpriseRemoved ||
+			    !(padapter->hw_init_completed) ||
+			    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
+				bReady = true;
+		}
 
 		if (bReady)
 			break;
@@ -614,11 +611,10 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 	dvobj = pwrctl_to_dvobj(pwrpriv);
 	padapter = dvobj->if1;
 
-	mutex_lock(&pwrpriv->lock);
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
+	}
 
 	if (rtw_read8(padapter, 0x100) != 0xEA) {
 		struct reportpwrstate_parm report;
@@ -629,17 +625,14 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
 
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	pwrpriv->brpwmtimeout = true;
-	rtw_set_rpwm(padapter, pwrpriv->rpwm);
-	pwrpriv->brpwmtimeout = false;
-
-exit:
-	mutex_unlock(&pwrpriv->lock);
+		pwrpriv->brpwmtimeout = true;
+		rtw_set_rpwm(padapter, pwrpriv->rpwm);
+		pwrpriv->brpwmtimeout = false;
+	}
 }
 
 /*
@@ -691,21 +684,19 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, task);
 
-	register_task_alive(pwrctrl, task);
-
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -774,21 +765,19 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, XMIT_ALIVE);
 
-	register_task_alive(pwrctrl, XMIT_ALIVE);
-
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -819,21 +808,19 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, CMD_ALIVE);
 
-	register_task_alive(pwrctrl, CMD_ALIVE);
-
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
-- 
2.55.0

