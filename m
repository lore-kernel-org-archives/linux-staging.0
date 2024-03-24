Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9831C292;
	Sun, 24 Mar 2024 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711314558; cv=none; b=I3tiXfHRPsduUi46g2g2OZnVFWxpZ2ZCibCIyr2pzJZHb6rDReNSBDaSPmHYl2RXTAJXQ0CjuAss0siXd0IBYqOVhSkdDZsFdHf5vwA/R970GZhX+Kp9/ST5VDmkixaJFsXMscyHp1HdJcvL8M0gC5D72toud60wfPLb/Lhxysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711314558; c=relaxed/simple;
	bh=1UPPzA7qGfS9iEju5WF86tQ8AT5tLBO31f1je34qPZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YG9YaIlT96TR/v/KE3Flw0wbrz9dg+VGxtNdO3xR/v3prn91apANIPIyriPEriUbDnGJhGPt3YNTC0hRA+yUKPBXEZnRm8ODliWVfneIN3IBDVfUr/HvS7LNzL+VF58Rvc4z0V1dR+C6P2J0d6dl32nvcI7WQu3UwbssjIFHnuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aApkBmZs; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aApkBmZs"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e677008501so2357393a34.1;
        Sun, 24 Mar 2024 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711314556; x=1711919356; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64D+JvyK+W4r1ZaU3GbM1lOh3S/v0YMhaiXiSCQigtk=;
        b=aApkBmZsa/JaxwxDQs+GqlScX5AAvdaOxgTu68IODKcJWOKMXIrUnyJaUz6VrWeYlY
         e8hUizlqCwCEosdm4eHV9jHJsw+2cUf6zGKZZDuwxkyjA6S2I7qeZoDrNo0QKQ2Fr259
         BTj7aL77HWKHKzB90tPDut+MVs65PiTm7jXGglw+9+nIZuhOT6LBZy0tvxVt96Ey2Iyd
         6CTYQK2s2eH4Qc+TMnScIwO0FPe+iI4wxFRk8itxUjwKJaOct8c9Nuih7MmYFJgZmgam
         /JxSa/J9MZ0Z0nvCbfA6d2WOxXwSVIbjBNJwEbVR7+To1izI6U57xfpbSYAVwQreI8mR
         8pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711314556; x=1711919356;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64D+JvyK+W4r1ZaU3GbM1lOh3S/v0YMhaiXiSCQigtk=;
        b=Xx/v7JnOR+M4T4kDjbx5k6kEqTwfiIok49YB5VpofU+awuXf+HZPdnkQ2f2PNLd8v9
         B7mgaE1LQjqxmu5O90Uy8reedPpho8fWZaK0kWVJUWeHJ1I5DbnFsW4BmP4JcWsrpTIN
         04uP/go4JHlmIZELR/w2kATTevf/P5A3rUyjbXV8Zvi52ZN9Cm0/iN6SmbiH5hHtmeq0
         3hF80AWVV9iPTgy7qw8AVcYlX9sSj4ZjFqeyl6DSJa1yI2VJeT9GRMgtMVpdYWhNDJtJ
         qAXuR0oq1PoUbsytPnP+QI7KLM9bCo9kGXcWXiFD9A/PE4L/m0CaluuduTRPrHLOvWmb
         eNrA==
X-Forwarded-Encrypted: i=1; AJvYcCWF7pwV4CoRYlJgKZ7xDEMCGDMbU8zU5Hop+piAaLaOaLYF7anzl3mY1pOvPhPPNE8N76kAR7o1IEfuwCdEweQrN/YkZxS5fwRzJQbTyA==
X-Gm-Message-State: AOJu0Ywb2jfRSGmCDdpBGZ8t8Y7WccpWusd3hP2IP0Nx21sz0QSWZMbp
	HuAEl8w+tw8mjarRs2a2pHZJLhtI4rzIyvdRa+QCFU/nkEjhx5AE
X-Google-Smtp-Source: AGHT+IHGThjrcLejKq999F3WY5CGo0Bi4DUx9T31LjW6OBIze8tvnJbF+C93iH6kJ6mCQzXj7PuYCg==
X-Received: by 2002:a05:6870:b490:b0:222:63e2:aba3 with SMTP id y16-20020a056870b49000b0022263e2aba3mr6599405oap.8.1711314556446;
        Sun, 24 Mar 2024 14:09:16 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id u8-20020a056a00124800b006ea8b233550sm3103462pfi.146.2024.03.24.14.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 14:09:16 -0700 (PDT)
Date: Mon, 25 Mar 2024 02:39:09 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: Remove additional space
Message-ID: <ZgCWdfJit4Ly14NB@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove additional whitespaces in SwLedOn() between u8 and LedCfg to
conform to common kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_led.c b/drivers/staging/rtl8712/rtl8712_led.c
index d5fc9026b036..6d9be5dec4e7 100644
--- a/drivers/staging/rtl8712/rtl8712_led.c
+++ b/drivers/staging/rtl8712/rtl8712_led.c
@@ -107,7 +107,7 @@ static void DeInitLed871x(struct LED_871x *pLed)
  */
 static void SwLedOn(struct _adapter *padapter, struct LED_871x *pLed)
 {
-	u8	LedCfg;
+	u8 LedCfg;
 
 	if (padapter->surprise_removed || padapter->driver_stopped)
 		return;
-- 
2.40.1

