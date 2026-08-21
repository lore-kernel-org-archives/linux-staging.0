Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99B3DAACF
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787342315; cv=none; b=jrrGggZN3xjWQ3n33iH0BC9CzRW6s2quTpgKVpXKnWDShgCQMmxdsJe5jXs/Dhf4eub5rRiVK1sgGJYDsFs8f5WUf6v0xgZfAxCyzquvErE8wYhvtomcgbBf7TXo6cfi4gniapYcdUPqdxMdrJcxMbSsgIJKhX/0R2PqpXBCV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787342315; c=relaxed/simple;
	bh=XWdAnpD1UVvL/3vBi68hi9najhLcv9/0bQglBrFwppI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rH5KTPsHNaNEAhWeip4Vyq22RgNYUlxlHdcC6vpwwGgEQ0ybVEV9dDh8cULSmCtidrJSKA6FzAxh6mnBGFzgI7eLKDrU1VNBXYD3Sds79b/eg+DvI6ALErIK4nc2mY9HMDBShmEe5XHVrT3qDKwA6eaTrSyWMrKMsAzqhyfYlRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PolnmDbw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PolnmDbw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c207cb16cf5so230793766b.1
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 12:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787342312; x=1787947112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFbkqHCSmGLZ1EGC1aGF25xj/3DcMpctUOzZEm7ehHk=;
        b=PolnmDbwxumJ+fE3RMN4cKYIWCe/+RnkmTClCFIvjD1XU5suHNse3jojgkqJW2LBxx
         8zWhAxbQ8krx9IoGQjJFq80SOOurvUMvQh6qdLUqh/EgLUDVtS6+5O+ufIvGUKs7gxHI
         qK1nxvlIBFeuX3gpo5TVcu7RaZe10NRGGN/Yti1YB6jXsczDctm5jBppgQglO8q7LNZv
         8mKXB2Qtq3SbyKbcfkKUepLJUqfCaYRC46NSQ+iec+tHfD5Iz83UKnC6/ZKoykDuR86y
         jfQA84XSWK2Fb//SdD+zN4s8RYYwqBqSxbDSjyTF3XTt1SSruaAMwpLRkiBoSl+Jc5B3
         Ct/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787342312; x=1787947112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFbkqHCSmGLZ1EGC1aGF25xj/3DcMpctUOzZEm7ehHk=;
        b=W3INDjR4kW4FrvSSblVG2sD0pFNdxZqR9WBMLh+LQgMLr5IfpygDMoJ9gxkWc2y/18
         6CLrTS7u3VAAKHg3kbOzUySN1QeafjITcG3ZrkbbxOhfddkmS0c2xN7/cTSEMj3CTMX2
         6ws0cs3jpmXT6VZl46YcYCTqPWO+5XRny+823dIKZUQYkLYxFWHyttesQ+39UCqtF9oI
         9Co6aLsAZHJ/aE8XgCCJVZlmtgM2vlEvVRsq2lrIGqO5y+SY5Dom+3GcAok7ifmrIe+D
         rX7QsOPUnvTUeWmE4/yfSVVteQPXGMuINqaBvSPcx8BGAjFkw7r4t9xt7zjYfOTiQBjW
         emxg==
X-Gm-Message-State: AFuF++ni4URxCjyJzOelNfHESgbXbuAcD/TRjFO94+S3rVs56M3hR/g+
	sia0SL3HzgcVNvqhHFMrKKEafLmhY28jpCG9uCq91iq0uEvM4LXrVhek
X-Gm-Gg: AR+sD114DhZDfu9aqwR0WcZ8mqv/VsJp0QvYLe73D3cdtYxdTVwoLpyiB06TSerb/B/
	aMpF1qOjZQduDT1ye5aV9Iry34yTuND+Sn3lJQYW+DPIq5c7gYta0HxCYpliwMybdEbJ6G6b/JK
	XssdKWD05kSNb5J5Q8EOh7prD+5bFlpGYIjrOElVnPalJuUWpfz1xn7K78+ZbjhlCZf1ApTc4H0
	ntN8SWG3gFB+AIXzWWV0OEi9HGUwxrSPpUBMmQh7Qawv4t6PNyy5xIV0wS+E+FO6WISQCGpzHTl
	EM4r6qnVYlbFCMslHuTUU09oXyo6FF9VvvtR2DdZQ9hvKuL+2/2NicOwpOJCdDr7Sm+XU3+gmYs
	rj6vyxdWW+lNFdp2MeSAFZHtaaFfWS7Msm7vQPt9vhfq0AyILEtrTn0/fSzJfU53ZUvis5kI7bq
	Rd07HQFGf2fGoRgbuRkbtkoZwjJfVjmKrUFeS8XyYXJloqkvkYzA5NSEB2/JI=
X-Received: by 2002:a17:906:f58b:b0:c1f:8021:deef with SMTP id a640c23a62f3a-c246a390c73mr791125966b.10.1787342311751;
        Fri, 21 Aug 2026 12:58:31 -0700 (PDT)
Received: from potato ([31.176.173.93])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3fec280e9sm8887970a12.0.2026.08.21.12.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:58:31 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: modify misleading comment
Date: Fri, 21 Aug 2026 21:58:23 +0200
Message-ID: <20260821195823.87471-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment suggests that rtw_unregister_cmd_alive is called
by the ISR, while it's called by function rtw_cmd_thread which runs in
the kernel thread context.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf1014ed..a4831dc145eb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -891,7 +891,7 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 }
 
 /*
- * Caller: ISR
+ * Caller: not ISR
  *
  * If all commands have been done,
  * and no more command to do,
-- 
2.53.0

