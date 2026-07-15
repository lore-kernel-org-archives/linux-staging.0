Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072F47F2EE
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119840; cv=none; b=JTujXQWvzi7Ld8rgVrprXo0JWFsIgpBH801BboaHfuB+X1eWx/H5n0bKzkUhsALLiEk8W/52fK+0GJo1uUQf86+2AP6cDeFg+W58+PVxPeUdl/e4g8kPiJ8WBBhldV63VqFtV+ErjJpdVrz+TX9a9u0+mAMD5SLMr197cwn8zCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119840; c=relaxed/simple;
	bh=6FEsm9xy2/G5ePTRB9/G5MfuZCJpfgDFjyq6xDkTXBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1aoA6GQ9ewFCauVVdv8DXdvtAkJrJ3YggIqdiMjZ9OWvxZAIzHCTXLvArT4u2raDDVW4+LgSahXwapvlE7sl6RkmCUL1J9T6zPdkJ5HSirEecd8NCXAnc4Q6sWd1pt+0PelA7yqTmO6sa7Fv7COBMTIO4eQbgjCfi/hIibI60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7rpvlOh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7rpvlOh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso6094566e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119835; x=1784724635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4T+BgF6vFyikfScyBULJ8vIlQDG1v6/afOfd/dpITo=;
        b=N7rpvlOhvEcD+icBa3vBpJdzgbypJORTCtLeyjdG2Ogkg569q9aDFi1z1mgExuT6qO
         ++CLVutv0qT5s/lpyoPRYQcTIlTAtXw7ThQ4ub8B9rPOxaoxbQp99GecdUexr3GUedDz
         gPZDqgk/MSs5/5mHzkFItqAVzlqyu7TIW5tzg/gKt7Dm2Z7WlkrYz+Avl2y6E8Zy9cC4
         BDSkzUjKJr20d9Y53P/CrKQzprPpXgfFenVN60lK+GNWsKxwTqIi9B7t93KY7UZa8TOn
         lLz2IgfHMWDSNOxMmnImH5yV7m8MZ55LBBJIBqJ64MJW1SkN4Fv73vHiYH6i2myE2KRj
         D+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119835; x=1784724635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4T+BgF6vFyikfScyBULJ8vIlQDG1v6/afOfd/dpITo=;
        b=AU8KW0EDubvsi5nusTwD7f5r9GbrNUWbx/ttEKogsgITvjcBKDGXL9YqyAjvpG4KR2
         zup68LAePxcpqxR4aT9ni8koz0aV3SkflPp8Er5wWP1M3gdOokATWFxqo5+TYkT+u1sH
         BJj3VqhpKGh8j24B0FOy72MPlhVuMP11+vGJK3RSXjVGb3l+PEQICiwdKSA4hF1+lSo9
         eFQOMjaQM7GQUQ3ZBI/pUvI5hTI7z5+MAHOeNxIid/PEteG4yRwS0AodP7lhvCmJRIMe
         5xdoTf8nBo/jSX0Nk1FmmF+4r5ORbyiKN9Obog0RhxnPjz7ZPHQGXAFz5ZzsFXup//I+
         Ywjw==
X-Gm-Message-State: AOJu0YyDVhz8vJRW41rkk67u9tzacwW8u3QiE+pujdaNNCw/RJtUHw39
	DAMo0VsFh1Ve/OdZAufxyHqlpehkkOCiUH/RMVfEwRpmVS4Y/5P85rdwHUbYWdJbcUE=
X-Gm-Gg: AfdE7cmDHxbevVivs7B01+FMWCqIT3bPaYI66kzlan0Pc0UFKTKy2vxIHl0LijvSIQU
	DYtczm74Nji0SGbabFub3W4zpHMElNSgjOWdn4hYJLP0LqM6q6y+bxaJrxOkG5tQzQADFmQjpFs
	o6yoeVIRYOjdcn1uwRoXfxSyNRcGSZjxEfAiVzUcIqAIpTMzzYWQIkIrHH1TEZ8TkVZTG1MT2Je
	KgxlTFiS7j68fGltOZ0Ne2vhKSK4PLcixdQ1CDjFv9UM9t7CS2FocZaUBa5JS3CORGAW8tEyaeI
	IcD0SUObJqQAGqI2ZI1SatwP16eHXPev/I9E1xukmslQARjcdVNjmh3K5ByorrxSBCdZYZ8BsAB
	/AWnyl108sj3Cy7x+W02JMgmRtCVT1Y+IDB4B1ikbFlIuwG2tjzornRk5jYFLHGk3TpGPIboMov
	+fA74fNTvYppMC8FGzn5k9M+0QJi0SvMCS+Sdotte0Dy4dWG+1Ir0raOkPoooE3MkDRa3hYL7uR
	sANGE2AfID57g==
X-Received: by 2002:a05:6512:3514:b0:5b0:11e5:6bd5 with SMTP id 2adb3069b0e04-5b15d7a945cmr628452e87.40.1784119834393;
        Wed, 15 Jul 2026 05:50:34 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:34 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 24/61] staging: rtl8723bs: remove register_task_alive inline helper
Date: Wed, 15 Jul 2026 19:47:52 +0700
Message-ID: <20260715124829.90290-25-ulijg308@gmail.com>
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

Remove the redundant static inline helper register_task_alive() from
the power control management code.

The function provides no additional logic, validation, or locking,
acting merely as a wrapper around a standard bitwise OR operation
on the pwrctrl->alives bitmap. Replacing it with a direct expression
simplifies the driver's power interface.

Clean up the inline definition and update all its call sites across
the codebase to manipulate pwrctrl->alives directly.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1d6fe3734..c52988cfc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -667,11 +667,6 @@ static void pwr_rpwm_timeout_handler(struct timer_list *t)
 	_set_workitem(&pwrpriv->rpwmtimeoutwi);
 }
 
-static inline void register_task_alive(struct pwrctrl_priv *pwrctrl, u32 tag)
-{
-	pwrctrl->alives |= tag;
-}
-
 static inline void unregister_task_alive(struct pwrctrl_priv *pwrctrl, u32 tag)
 {
 	pwrctrl->alives &= ~tag;
@@ -704,7 +699,7 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 
 	mutex_lock(&pwrctrl->lock);
 
-	register_task_alive(pwrctrl, task);
+	pwrctrl->alives |= task;
 
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
@@ -789,7 +784,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 
 	mutex_lock(&pwrctrl->lock);
 
-	register_task_alive(pwrctrl, XMIT_ALIVE);
+	pwrctrl->alives |= XMIT_ALIVE;
 
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
@@ -834,7 +829,7 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 
 	mutex_lock(&pwrctrl->lock);
 
-	register_task_alive(pwrctrl, CMD_ALIVE);
+	pwrctrl->alives |= CMD_ALIVE;
 
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
-- 
2.55.0

