Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A63E27A90A
	for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928335; cv=none; b=ZK5IvV3B68x2jD+QFOfk3z2Ob8SMP/AIOAJz0oZeJQMJvd2yGPjO0czmjYLJwPQ1AvRXPqH9NbrUNM780YDSQeD2ux1r2Q1/2Gk8VzDdB93p403dAofS3EAMktnkd/NkeUVaxAuXLujkaEPnWABvw3cXvoQRiPZZVFCrF+NHLBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928335; c=relaxed/simple;
	bh=xbWVDzZ5g6HJz80cAUiarlvB7BVUjAPPal8xwQHunyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQyA+2GVehgnaZlyt3PUWaQvHT/XrzX7EuVI26Fcp/4ME1jCZYgHXjmmsP5pAIsyLUpVOUgKiwQPCs5k23hq0X7x6zw0EJEbB/tiWt6veP6sagvAu4q6LafSPykcn4tRz3B25KczZ/p0aCgRMxbcZyMA0y83E37Sn9yZ7EDxPZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRgiYVQx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRgiYVQx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac289147833so1057232966b.2
        for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745928330; x=1746533130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqA12izQ8aE3OjQDIJUv3v7OdfJvtiazusPsgaxGXXc=;
        b=ZRgiYVQxTzUC1NSxmElpcmh6NYO/E+pil4/2YEID/OOMtl7Hp8+dwzI1RGfKGPwdFx
         /V5IjL4M/82rBs4JLnzikpnJ6FMabDkhOpp9U4kUqt2wwDwWSCzyw+Uflfkmc5uqxG+/
         GQQXPr7CdB9jBauHH8JToWklbXDKAzgdQMwZVae6jFv4SZngwwsTPqnTbrnsV6cVyEuR
         oMOqwzsxGwvKn6zoK/N1CNLl1jvUp7P5Vr3JvE7GhcSGSgd23GZtwQjSw1jEON+28JuV
         sBEoVnPLKjcijWJ4vge8/MdLhC3lc3yjjUEAwob+DFyMRHIBiqB5BUE6e1f7LM7hdbFd
         wq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928330; x=1746533130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqA12izQ8aE3OjQDIJUv3v7OdfJvtiazusPsgaxGXXc=;
        b=sge3/YNsfpfqrDDtOGkWxp/c8n68PAHp3OM7CJ/+oFJwNXaIAAxtCt0mGRf7VnphOK
         uKMW12og6BJigHuUph5ONF8FyHnrd87RcRxh4PFKrgKNLWsH2/NEvXuF5p5HYYFWMdap
         IJyaML58WQe7JLIHa8R82Xyr5asXoEHlZdGGN+3vzbAzhAewye2c/PVBzKJNH0ZoYD+1
         u+YpErO2bRALr2oi9lcQ5Mjk+P8nIIydgZn9/Tz0F6yTQVpU338N6lCM+IBiDcGSvehm
         TRn+CNA0gomwPQ0PXHaZyJ2as4BNUEiELMxPA23Quawt9NiPVGzNyMlAwV9LrMzbW4ZK
         DthQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOJmFfnDj2co7oSPv84Olx9CGY2kuLJuZLvFuqbGuSpnKspuzXiAidDi2ZtKE3ANOQ5+mFbVbEJ/kbQnYn@lists.linux.dev
X-Gm-Message-State: AOJu0YxBFpkdk6yF4EnsoUlIRCSrGcGm72FMgxiZKTVjHRqjBGzroYf3
	LDiNYKsHiFd3oKeWr3jUa43baeWmFK8G/UeDKxn/vKLFgr6cv/ZX
X-Gm-Gg: ASbGncsTHP6h8gqSG5XJNTfFHZnkwYHTVYs3Ui1q8eIp6lYEkXMSQEYPwiuXxlTjtO4
	zXlMoRcgnVWeY1BFd1VKnN+hccdZx0HXqABJGjU6JcVZgmPw81fWk33rxS7i7FyuNGEFSa3vMfY
	1rmIRMJJZp6QfR9xaNPAmuN5iJ9PYQG1a1CbCGFDIvui6+2RrFXngsKhYr0FoNYzt52D4+Vf2vF
	QIcaTzrsEceAGgoIwY30DMNt7Y4OgNQkMwOuB0Y+oboOJS2oMxxU75RZ2Mxn4W6SF+xKmJKf1RR
	RxbnpSrXGNaN1EbLk2Cjc+GAKJp/W7ZfiIZ/kQ==
X-Google-Smtp-Source: AGHT+IG+lJCeSHiaebW3KLC7J6BWu/mwu+oXqsKLKScZjzlaQtIaqlzH+NBX52bgpHd8qHbLKbRD9w==
X-Received: by 2002:a17:907:97c7:b0:ace:4ed4:d428 with SMTP id a640c23a62f3a-ace84b3b270mr1297967766b.57.1745928329721;
        Tue, 29 Apr 2025 05:05:29 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafb3fsm782072866b.172.2025.04.29.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:05:29 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Replace manual mutex handling with scoped_guard()
Date: Tue, 29 Apr 2025 15:05:13 +0300
Message-ID: <20250429120513.168674-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This refactor replaces manual mutex lock/unlock with scoped_guard()
in places where early exits use goto. Using scoped_guard()
avoids error-prone unlock paths and simplifies control flow.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 52 +++++++++-----------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 74a8fcf18e84..f3bfd175cf8b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -599,25 +599,21 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
-
-	if (pwrpriv->rpwm < PS_STATE_S2)
-		goto exit;
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if (pwrpriv->rpwm < PS_STATE_S2)
+			return;
 
-	pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
-	pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
+		pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
+		pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
 
-	if (pwrpriv->cpwm >= PS_STATE_S2) {
-		if (pwrpriv->alives & CMD_ALIVE)
-			complete(&padapter->cmdpriv.cmd_queue_comp);
+		if (pwrpriv->cpwm >= PS_STATE_S2) {
+			if (pwrpriv->alives & CMD_ALIVE)
+				complete(&padapter->cmdpriv.cmd_queue_comp);
 
-		if (pwrpriv->alives & XMIT_ALIVE)
-			complete(&padapter->xmitpriv.xmit_comp);
+			if (pwrpriv->alives & XMIT_ALIVE)
+				complete(&padapter->xmitpriv.xmit_comp);
+		}
 	}
-
-exit:
-	mutex_unlock(&pwrpriv->lock);
-
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -642,11 +638,10 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
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
@@ -657,17 +652,14 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&pwrpriv->lock);
-
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	pwrpriv->brpwmtimeout = true;
-	rtw_set_rpwm(padapter, pwrpriv->rpwm);
-	pwrpriv->brpwmtimeout = false;
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
 
-exit:
-	mutex_unlock(&pwrpriv->lock);
+		pwrpriv->brpwmtimeout = true;
+		rtw_set_rpwm(padapter, pwrpriv->rpwm);
+		pwrpriv->brpwmtimeout = false;
+	}
 }
 
 /*
-- 
2.43.0

