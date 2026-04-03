Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686A933689F
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253801; cv=none; b=SSCgaBY6XReCc6bT0Je5ln0Q1Ghc019iLzJdy0uolatyr2Q6ouIbsn/wXh33cscRPqbhYDzQLKdeXb3KdAuBxYWfoUvxKDOvKZiQ0sPlQ9+rxo7ZAE2TX/KyReXJ/bEjnEjkuYkjoRW+DewlWgRZ87IZn0cxBgMIOAVnH3k502Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253801; c=relaxed/simple;
	bh=b+5EHRdkPJD+lCuedCFeXygfvEv6K55aDgU8wG7Juew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FG3Vux/I36GujDUM0DGxl+OaURaMYKaBUe99abXo94Mdnoc27hWOGoalqcp9Wh1ZhWrwA1lKkj/OkdSVYmnfm+LnagVzH+/g81S3pDHRPXlK245cAfxZ5NPy8aJmASfbbuYctDe5ZrlGObY3xm8kpvEgTTf8DyEu2COOApbr3iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLuH/+Vy; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLuH/+Vy"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2beae348eso2564387e87.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775253799; x=1775858599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oy60aR/nGbKjK4pBH1KxQ7dGecyXwu6eLd/SAuLXN6M=;
        b=PLuH/+Vy7NQBXHherQ5dAnCdq4ReesdQjS5Oooqz3QsEBgjuTzTKQsHoVd0TlMe3E1
         cfK0YGEE2iJTmBzv3E1ihihNLhtohxUlAC522a2SWW/lNO9W8zxxbZD6fhwstHIXejTQ
         xdcPqgd3oeplcKfGyuSpwW80it3lK1Va13RaHowJU4uZ0x5jwk7mHJjCseojfqe2+fei
         NHvE9RH2N8z3nsH7qFPMPV+dMhL4eVCSFNrqqsd28bB61E2xA31VfAcvIKGddbPSUcBv
         /a3MCSGlXaUbj7yHyRBD425Kxi+Wlhcb2ehsrFpOMmy0k2BXS2IZFm/TV9b4+HfLS3x3
         W2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253799; x=1775858599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oy60aR/nGbKjK4pBH1KxQ7dGecyXwu6eLd/SAuLXN6M=;
        b=Vo5V4PhIXq7hzzjJ3JPnyHUcYNUMfo1cRRLdEbIL/dPFjFTrhuL7AX647Tm4vLtdM0
         mDPJEcIgM7Mn1WCsy0d70LgcJ6iBaLLgJp5ZGf8nbW1tKpQIWi/ybNZUCBp1mUAuwSd8
         MGFrdxs5Uox03rWfl+1PWb4ET4cJWxwS1NEB1bdUwtyDaIr6yPRRN3Sjz9NQ+SfXrFjV
         JBAGR3f5mAqA2pgXGi8xKwohoY61dCqMO5mZZCSG2RMzj6qyl9sWzW9JlO57zLd9A2L/
         wXHkf8j3F/dTKU60z91tIY07xh2RnaTHwcCkERIVbdHeMIyiDjJK96BVACcnD/lxIYUL
         5uXg==
X-Gm-Message-State: AOJu0YxMtcaCAD8+RykrmJt9x7imjNGynSmvb2yP9hEM/BvV1y3nY/Os
	KwU7xpYr3TOzTimV5AeEB4EY4Wqb6wnelK/OB8zbEZiWgWi28KkBHxCq
X-Gm-Gg: AeBDieua7UAKzdshmCMNbTLJfMy86j4+Ycz847+OqH8v41atnczPrJr5UIjGAJGyql1
	g4GbNcO+dETSfbZ5GYKX3aigrhvkS3f5sHQe/JwicqYamMYWVQjaoCZCc4MF0GBPaoiQ/Xg3ubw
	rkjjmXRPNpIYa7cpR1ujlZsRwg3c7T44pPbqZ4C71w3lTSBUJBXrTWCzhGoPlUn6+TjSYGeW3Vg
	aaZ4cvAssFBMFdm9mnEm0y9FfGqcFMeCq60Y0yfgmUkDFY5eUvm71Me3Kdiq1HNf5IQMy7DJaKp
	0sVnpy4PjYMoi9+TINEXnEeMHu8mVL9PKSnvJVLTzkqESrPpoWW14f6BdjTm1J/Z3ErMfBs2Et4
	oIp3+9LwdE9TmrKjZZsuuL2Mn3OcVAbHPKfxYiwo/oTdB2imZq0kIKZ4me6w32xipJ2EEH0/Vjl
	4BJz44Iaxizf9hDH6EHNfPIFr0clvKnn6h00n5o94tdiONxbMoiQyhJrgK2dfN94Y=
X-Received: by 2002:a05:6512:3089:b0:5a2:c1aa:415a with SMTP id 2adb3069b0e04-5a337580948mr1250414e87.22.1775253798380;
        Fri, 03 Apr 2026 15:03:18 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9513asm1751662e87.2.2026.04.03.15.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:03:17 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove multiple blank lines in rtw_btcoex.c
Date: Sat,  4 Apr 2026 00:03:10 +0200
Message-ID: <20260403220310.1824969-3-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403220310.1824969-1-linus.probert@gmail.com>
References: <20260403220310.1824969-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes multiple blank lines in rtw_btcoex.c.
Discovered and verified using checkpatch.pl

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index caa757b8dc0a..574c672419e6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -65,7 +65,6 @@ void rtw_btcoex_LPS_Leave(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	if (pwrpriv->pwr_mode != PS_MODE_ACTIVE) {
-- 
2.53.0

