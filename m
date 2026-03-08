Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FCA59
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 22:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773008400; cv=none; b=W9voPioMPcD2TyJnwin6r3Pdu/evlzLlm37k+qsYUab0ZaG1cmRJWy9tREvgppa2luHsqreuefj9lJ7Qh3xVUyz8spQN6YMxCb8QhnrAZ26vR2GZ1o401VloGOi9/LwhKr7UlXf0J5Jv+AuErAKxm1M0jy2XR/8jDvpcLvPuhZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773008400; c=relaxed/simple;
	bh=EFY5cgNh0SDonO2ZNKqkY9fYnsot/P8HBAXEdw7MyIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0JxdpraEuhsZcwHge3i8WgqcsMIgcMF2vfCUtziGWsASCkiCDa+giru5GTSQG4RS4I1engvrOdwSNxThnwYmpAfmILMhma129VbkDiADir+naDpT7Y+OygNoVVcdL0CSIm7eIKLWzHPX8Hz0elwrBjpxwMU/yiOdrmUjUpgR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1wzEgaT; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1wzEgaT"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12732e6a123so880347c88.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773008398; x=1773613198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9HU+asGOhL+0xgcTp950pv9RoTMyviZzSFlOQMQuxE=;
        b=e1wzEgaTnqaCkJE97z8XvxrJls4BY3qiF9Dldw5ayEUVn+HVo9EoaS2DRJ1adS1EeP
         RQfYQhOAf1u0RDV8pd+XQ661joewqOskt8XHnvDZqvrlvp1jgn4fbr68V7iKLhyLDCiB
         ZQdB9CEdfXjPni0IhKsMQlzVtVTILMKI9kUAYuXjE7QXx/amy3H1uXJwahN/lJmk3tSC
         QriD55F6PFe6IHuyjemBftwpRH28YBwIcwX9bICw3rhSIMXrjRDn5i69iIBRsYrWTvjj
         ClExGtQi9pWi1elaRWT0J41RkqPIDb8lTWbNiLzWKdkSIidBfBrUOJFIwPWHSgFHcZB9
         qOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773008398; x=1773613198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9HU+asGOhL+0xgcTp950pv9RoTMyviZzSFlOQMQuxE=;
        b=pxOr1KGLjWGd03Yzq7v/Hk68ZVLpnbkVUACek2QAeYcu2Di1umCc9ilEhJ8z+nhdkm
         pRmGUAEMD3TcNVNgva2LG8pMQwB6wZ29Q5EdkC2yAXcZMEVLA7QBj6u2A2aJMdTLad9P
         J/3q0qKW5+yZmDJBUU3K9otq+v8zzbGPmYNt+yrvVg+a/UsuJGF65k3fWJ2zz5AdMFzE
         fR0BoV7wdWiisZFnU/StTrO0/RHlwrPficOK9PpVJl2YOSZELwWcjgRBmch1ebpdBe/C
         g8MMDZvuMOgM/X7XCAc9Lj3Gmlflt2lD4W1KjNdzN5Zmk4oBtXhh0zPJLP/3pNuV9adR
         qgmQ==
X-Gm-Message-State: AOJu0YzsB5Z0suWhBlT3pmYFCyQYEnm0WgpT38fLYfGl9hDOg7MYKgNE
	23hdKPIH+dGcHx3Sp4t5zQ86llHIQbv/scayOhrV1cIx23OsG4Pn5Bci
X-Gm-Gg: ATEYQzxagcSEXHgi8A4WFV0JOe6tTl00pXOqjX4Pl28RlfPRXuViHIWS+xJrNa24yxj
	Q5TBnYGwM5KHNU80YDvJWYReQwlxUup0PvSpqKxZ0BPGrjZpPu1MG7Io3ffkcS3XUr9epQwJPXg
	Zgk8k2XyfGmBpS2F/pifep23iJjeXY8KsG+a/vcLxrm/XCv8vKgeIdYlHPE2s4wQ2BbxjAilUq7
	yi5mOvHSjqOcEprWwA3BQKI5YRluSyFQz0EK++MBdxgNg17NN1kDVwUcZaMd1P8/1KLKHi4Ee1u
	7PIs1Qrjarh6bW8anWeyXiip2FeYWzp4IhJtwSIxr439MlI3q7aU7UDBcZvA9z3VlTd96WyNydO
	AdW89JbYhksqj8YqdkrrMepmNGdhknSbJiNF07fcBq9SSBcWvvH6D5pn0y4OPekx42+bU9VzjYr
	6J3aa6o83ESBy570UxttcKQ8jPPhQ349B5qPKAIkL31R0=
X-Received: by 2002:a05:7301:4090:b0:2bd:d5d8:537f with SMTP id 5a478bee46e88-2be4e03d29bmr3721472eec.23.1773008397640;
        Sun, 08 Mar 2026 15:19:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f8078c6sm8142978eec.5.2026.03.08.15.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 15:19:57 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Arantes <dev.gustavoa@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_suspend_common
Date: Sun,  8 Mar 2026 19:19:50 -0300
Message-ID: <20260308221950.6721-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(1) with usleep_range(1000, 2000) in rtw_suspend_common(),
since msleep() for values less than 20ms may not sleep for the intended
duration as documented in Documentation/timers/timers-howto.rst.

Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f2d64b05debb..47b1c791ec8c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1091,7 +1091,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	pwrpriv->bInSuspend = true;
 
 	while (pwrpriv->bips_processing)
-		msleep(1);
+		usleep_range(1000, 2000);
 
 	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
 		return;
-- 
2.53.0

