Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656083BA252
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 21:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775943626; cv=none; b=PVHcpZSsPsGDjNDsJ4NQ3OiCfsFxDzOBBBH9fCE6I8Sbp5VAfhFY2WRDKxmv7NgFYLdHjYzb66wS55MoP27/TiVLuPFs7GRW4XbTiof/6W8dsyRVND5gnDAhfSFbzy4i3+V093kywIjrUDAJF160hlpyczhlHDyHcV2Uj/ydhsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775943626; c=relaxed/simple;
	bh=bePS0LHY/XBZiiDw+jDncWIdnCU3jVFC4XIWNVlCOUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQlEg+f+wwYHbJntsJml8RFB4fMwirrSNI1+XuGs51sl+4ER8Rdq5HCia6zMSGZv6sxxEA3nP9lub6qf2/9Yx4tOSAxOAYlubuHf83xL7i1Iz6IzoCcPyJfbbnfGVBNmFDng1lcJ0Du5oacqIUtOKuUqdchwdF6eaHDWiJFrNew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf7UB2vD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf7UB2vD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso33998675e9.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 14:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775943624; x=1776548424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH1Kr4ThpuO/iwFp6LEyHBTxAFVof6om7YssDJZubVc=;
        b=jf7UB2vDvZziIn1S5iFc3kmyofcPrsZxG8BVx2EMr9C8wAidqqzv46dDidQ7VbJtQ+
         P/+kJrOdYDnojtrnPFQAXiMux66bS/PGpQX18d+/3Fo5Z5hgpTOeyCpkI5ffisn+Uecv
         2Zue9LA1qsqpDIIlnJUjLDa9wste/Hrvd3PIk5J/Uc7pPtN7wi0RVjb3qPJEAGUb9Xpv
         eyukV1jCmqDC2WB1RXJu2LoNUHpGiam5ijTWzFbbMSB8TZ7kbJTPyUoITVn4xUhAt2YN
         sIllXkUzC9hUul4y2R+Gi4/jxLpdJdwRLj6W2pn8LhjtjARjamSSdwdunxi9i3+zSAmk
         wgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775943624; x=1776548424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DH1Kr4ThpuO/iwFp6LEyHBTxAFVof6om7YssDJZubVc=;
        b=XCy6PqUj+p+Gj8GcGHzQRk63vdZgp7jkXHctUmmo5SNwr0kwj2akni6UiNn0uGQnYi
         8LsC+KGbMdr8T7t3klNgx55i3qFoUW1SRRq/1EjFrMXpAXBdIVb8PHbyniSxuCg+O4Se
         NDHFNNE32xGNKuI/HddWH0SOiaxGiHR0XcD+a2Uq4WId4UWRrMu8t2wGCmZ/KHBsWVbu
         W9IEO5NYTEYqajsML7M7Yj4IDDK3cWMIJAOHVBctwRUFB1TTCZuEVz+Tnuz75Yml6dDm
         0+PWjI7sunZ0EfYLFmlg5+2txSNCYuI0O9kd+slJiohEcT0+kKFMdf+EXOtf4l3ZsO+m
         zlHg==
X-Gm-Message-State: AOJu0YzMKMozY69MMK6O0Cx2FlyFYjEwtqzBadI4Ga0ihMW30vJLSVbD
	MDqF/Z4krD/d6iQo2dahJTP044yWU31ZV/hGXiB2HmrHpA1pI/O1+/i0
X-Gm-Gg: AeBDiethDg/RRS6o0FcyhW9nPCWjga4t8KylxW91Rq9w09UdmOa2pmUt/nYH7ADItNl
	KBlQ8u/z1fHKAPXK8118KCc+L2eK8LrNDSb4376bMsWfSdRc4VRpFA/MIzTWXQrsMtp/k7+Wd3j
	Q/92CR3rRi35Jd5PSAHqOPld4zlCpXT9yWk6u1j0ZtIMrJ6+xAcuWIE5Qf4HMVlGUJEYeB+v2GT
	dppBn4WooE83fnrDi3zRjDy6HzCY5CyHK1BDy/yRmAIQoVrvUmSHASew59n202ol6od5i77wbQA
	cxAMB94nJAU+8cmBtlDGsrt9FpSeetrHGx4rMa/Xb9fD9EcKSs4boquGQ4sILPMuMfpn9PmPwmC
	YVSxa8cOwkyE/6wIBbhcsZKAY8mFzfcze5/OOv5pY8wJn3vwfWz+pQxTAZiQGohL4x7Yv4kCuJh
	AYSvOpYYlRqNf+N3YjKn9gG7usO009PLXSreOli3WK4zv3/Lgwi/l45VxqiIgMZ8rmGOJb3WTLO
	2OF1ECsazWe6HuIzN+TRGo=
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488d68057cdmr97605075e9.1.1775943623743;
        Sat, 11 Apr 2026 14:40:23 -0700 (PDT)
Received: from fedora ([2a00:23c5:4a5d:3701:b24c:c1d6:5c61:a2ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d684406bsm51649165e9.24.2026.04.11.14.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:40:23 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: Michael Straube <straube.linux@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unnecessary else after return in sdio_halinit.c
Date: Sat, 11 Apr 2026 22:40:01 +0100
Message-ID: <20260411214001.8849-2-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411214001.8849-1-josh.hesketh@gmail.com>
References: <20260411214001.8849-1-josh.hesketh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove else branch following a conditional return statement

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 81b6025fa8d9..31834232eb38 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -655,11 +655,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		padapter->bFWReady = false;
 		pHalData->fw_ractrl = false;
 		return ret;
-	} else {
-		padapter->bFWReady = true;
-		pHalData->fw_ractrl = true;
 	}
 
+	padapter->bFWReady = true;
+	pHalData->fw_ractrl = true;
+
 	rtl8723b_InitializeFirmwareVars(padapter);
 
 /*	SIC_Init(padapter); */
-- 
2.53.0

