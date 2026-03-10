Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C21929B8D0
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132498; cv=none; b=RotAeLCCCAMuFEOzW6j+2eUHnmj8iYlCSqxdK+aoJNVABwI9vD8GsaFf50C989YVH7O6XdfziqYd9Dxo9ebZ7J7Y4tK2yU5OImyNlmmzoV8BTCmUUi2UaYpw56ULqkJOwENNTAfBAvr6k1B/0P/YpduDn5XwYllT73QUCOZnxLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132498; c=relaxed/simple;
	bh=M0ZztYX6XRmWSqHzgOelHyQPk4p+bgeFeT1g/vz2rbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bv0YlXyEfh7aM1pJ21nEwqCKKHIQ/0tjPYyyN1q2fCGwZeIrXZcfzqn1uDPJqTdelZenTYOVzAo8vlHCIc6irhHXVMyLGxyV0iOSyLqJ2uyoDVawSK7caafkj7HdSX9SNrNtkKcJUW2AM0L4us5RX/Rm2iKBrl+cyBL/UM8701w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzTiPn7y; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzTiPn7y"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b1b9899d2so1992183e0c.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 01:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773132494; x=1773737294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/EAy2MVpM6BLWCr0lSgTBShFy8nkz0zet194wv8fhOY=;
        b=HzTiPn7yBrMkNmMiU6mV6RLqMAmggQni+8DC0ryfZvh0HkUDlkvBrdNYbObRItHI94
         X0/Fg1R8B2WfH9wjOyoj5Us1PwOk0mEa35dioxq2gYKTceES5lO2mvPY7WS30ah4UKnB
         C1yl5dPTJfZqHGQYKB4HoNWrNMbRBbmYQo0+D6itV+M5kqusbi4APAP/Phl8nXrsknzp
         dnWegsmN9p21Ho5Xsyiija3+KQwys4tI+Ghlam897/NFc/dbYj02g5zNl6EFdU7zEssZ
         uL6V/+Wzbs5r9zr/tOKVuvXkIbdMjk/7ANZEWY78OJ5g+gz2YCupfrW0dY0ABOEjq3ds
         y8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132494; x=1773737294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EAy2MVpM6BLWCr0lSgTBShFy8nkz0zet194wv8fhOY=;
        b=lYWt/3SW42ZsANmkktu5xX7QGfMSA1jOBF3g/sS2z8t3hCZIncPaUw0vVDyBfHP6ui
         /xRcIdgpv0XrOfYMG2vvpQpOYCraFoC/beIsfeWnOdlkbV3FnVyrduCtH6aiWH/CE/aM
         V6LLNloVOMja3QvWrF4Hq5ZWAtyZ0qZ5IJl8hs5vVCKVY5dPTy9NGBjRAsdRoOknJyzU
         YymXpwdpxF7j0Lc7O+r7DubwG0mEi0QZ78tjNcJrBiRrZ2aE6ZBVlMEaz3LXCu/O+4Wu
         ILKEaITwLHdtxRq2VIHTLRPpj6SSEmoq6e0/aeGD/+ei75eMVEzQJUxLv55y6v/Lxcxj
         y1GQ==
X-Gm-Message-State: AOJu0YyuAxkv9fFE6JcLUChu10hUtUXYgboYZKMg8GJJjJgHcrte56Vr
	Pt8N3HDAYLIlOUs8s/5ldSN7fW+a5cjdq2rwPjmCB8yp3L1vxjI581Vt
X-Gm-Gg: ATEYQzxPDPYL03msRUyJCGVj68a6bn4PG+XQWxOtAR1IyTMqkn456vTGM2mljErsynt
	ll4upF90Y77oTnRlHbgLSncppA7fTETlUYy6xC0KvHAwiszXGHbswFb0X4sjgG4uIkjIcSYSLUc
	fiTcLKkr71yP66Yg8O278KQWp4xyJ27CBVm3rPEP4bckm0NqHH0dp88Gt6uwdyx7af5GhNX5udv
	56JiWp/kVAqMg2q+7S0sYmB9l7/oMC90piSabIIGWGGtM18r91QGUOkJ4l2TRI14l/RdKymnDtl
	oBq1Q5fmZllPpWqyUaPpghP3UTsSaRI5TjzdUL1GfViJwBnYK/axT+6ojZ9x9TIKGj56tCVUf5u
	iX8+KxlFcN6bNZiz+/E2cnTglaIQBWjl6xb8nHM9pLBGWjAhqIVwMwU0JUkrD7AQI4wJwom+8hJ
	Q3vDyk4HRbgurNnYJHmZaStQpRc0P4AB6Ejdk4jNQwDUY=
X-Received: by 2002:a05:6122:e46e:b0:567:54cd:f258 with SMTP id 71dfb90a1353d-56b07e3ace2mr5744642e0c.9.1773132494042;
        Tue, 10 Mar 2026 01:48:14 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b6ac44sm10831811e0c.19.2026.03.10.01.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:48:13 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Arantes <dev.gustavoa@gmail.com>
Subject: [PATCH] staging: rtl8723bs: convert mutex_lock/unlock to guard and scoped_guard in rtw_pwrctrl.c
Date: Tue, 10 Mar 2026 05:48:06 -0300
Message-ID: <20260310084806.34265-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace simple mutex_lock()/mutex_unlock() pairs with guard(mutex)() and
scoped_guard(mutex, ...) in rtw_pwrctrl.c, simplifying the locking by
using cleanup.h guard API which automatically releases the mutex when the
variable goes out of scope, reducing risks of missing unlocks on error
paths.

Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 27 ++++++++------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..d9b7956f6189 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -7,6 +7,7 @@
 #include <drv_types.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
+#include <linux/cleanup.h>
 
 void _ips_enter(struct adapter *padapter)
 {
@@ -37,9 +38,8 @@ void ips_enter(struct adapter *padapter)
 
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	_ips_enter(padapter);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 int _ips_leave(struct adapter *padapter)
@@ -69,9 +69,8 @@ int ips_leave(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	int ret;
 
-	mutex_lock(&pwrpriv->lock);
-	ret = _ips_leave(padapter);
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock)
+		ret = _ips_leave(padapter);
 
 	if (ret == _SUCCESS)
 		hal_btcoex_IpsNotify(padapter, IPS_NONE);
@@ -138,9 +137,8 @@ void rtw_ps_processor(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	u32 ps_deny = 0;
 
-	mutex_lock(&adapter_to_pwrctl(padapter)->lock);
-	ps_deny = rtw_ps_deny_get(padapter);
-	mutex_unlock(&adapter_to_pwrctl(padapter)->lock);
+	scoped_guard(mutex, &adapter_to_pwrctl(padapter)->lock)
+		ps_deny = rtw_ps_deny_get(padapter);
 	if (ps_deny != 0)
 		goto exit;
 
@@ -494,11 +492,8 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 		if (pwrpriv->pwr_mode == PS_MODE_ACTIVE)
 			return;
 
-		mutex_lock(&pwrpriv->lock);
-
-		rtw_set_rpwm(Adapter, PS_STATE_S4);
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock)
+			rtw_set_rpwm(Adapter, PS_STATE_S4);
 
 		rtw_lps_ctrl_wk_cmd(pri_padapter, LPS_CTRL_LEAVE, 0);
 	} else {
@@ -1114,9 +1109,8 @@ void rtw_ps_deny(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	pwrpriv->ps_deny |= BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -1129,9 +1123,8 @@ void rtw_ps_deny_cancel(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	pwrpriv->ps_deny &= ~BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
-- 
2.53.0

