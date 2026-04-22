Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827D63D3305
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860083; cv=none; b=ig8aTmZVHMihzcw+zmG2CpJuAjdNGxlOKG0R9K37TPWDboV15oXUq+N4V+75BoYKxB3bPJNyQamxxuJVoBIIIRVyzUXDXJ+hwWjLhrIaxq8J5ez1v4h+2XBD90COHfqQRoIC99rUGj89r5gDBmbkSzH5GdLAo3dFUU5Dz4jBh6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860083; c=relaxed/simple;
	bh=jQxP7pSOIPj/XZ4bDSyBwX9BJpG19s4IvRqAd+5opmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xue5hQx3D7fEHr7uDBJIbYAEo/pe6u1sURuDSgS5ya0xGkzfDDwQlMsqe5PUY8I29vBQTv1Xl0eh78M4M+1JbQ4hGwic+m5T1G/LVOzZexN93lzrGd/SYCEaZMoUMhLyQBa9lrmyIipY8He5xRU1wybqTQ/KUVbQbZPNX3Rtz8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5ACgxfX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5ACgxfX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48371104ffdso6477355e9.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776860081; x=1777464881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aos4IBum8mY9XYTK87r6mlFD2czkhCnGagJT1CEEBGs=;
        b=l5ACgxfXp/77UBasoxNSKAhzOCBYz2NQb8//dGKR22UtIwZ/RsnsOGoIIXgpS70/4v
         ySR6T3lr2GjrgpgmmXjjPnP2PUAwbAEN9fDSl1CLKojtrL3nlggE1fWMh4XuYTbGVOfp
         pMWbW4dmHiDhLfJUR9oCox//aDgKwmU/QQrVqqv2TKadXeFCl+R1Y7pH7wH0CXySHvAZ
         6vAna8FbXQerN7Al4D9fFqed4o1+eaN+fxh4/fXfIfO/utS+Xgrqr0XwXXT9id+IGVgw
         0QgdvJ3OMDrjfA6xxER9IV8JedqX9kgMjksl5wXgNs2sPvZuHaCFZ/Mw5Cgx49PVPOEt
         DxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860081; x=1777464881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aos4IBum8mY9XYTK87r6mlFD2czkhCnGagJT1CEEBGs=;
        b=sFA2xr6h2RHpHsuwq2jgv0NwjYjdIBw2d/PJUQ7UcBXW9+T+DkwUc6kleHa6IsovQv
         be/za4OnvyzWLH37AmWfU2wVtLg9AKqItKzDxfMYBLqIsDPUEnmyJlmfoK9N6wc8xQUc
         hdEEj6TqaVThps56FXL2uKJe78SawHIwXFmUjtJOlfXlZaJnyRgiPojAm5a9gsT0T3gA
         enDbn8pPyDaR3ZBHCzwVBc2H6tE19HuRrsw5/3+YOzeeOI+GBZGdhIu/c2UCoS6lb+n9
         HAQkedLG5aDvmvVxixTKxj/7lHFDZzpJsT3iNP+GUP7PxOrKiKHDI4JH7DNGLO0K9Rux
         FtHA==
X-Gm-Message-State: AOJu0Yz9X9xBRZ4Qo8sbsR2ajaIxi/6/28eNx8dPBlRknRs4e3bixAM6
	0sSTCyX81PemVqiVK1EljzjcjMK6Xt4dAs1Z30pSInSGaZhHH3kIcDbO
X-Gm-Gg: AeBDievO9E1osxXzjg8qj2c/Xs4erRScdisaqun7gpc/yn+uaOP8sWDPc8FIVkvWNdV
	DWt5rtTJcPJnwPACVkZod3xOk+MQGnluejrZjqJP6ZLG7PtpEdWBmnwKOeqvHhlUDM+jST9BmOn
	VnqGnw1qEdiCZHBnIwYMubE/JwuLugJSMOXZVEtWjTyWF6Q66PiolYCfveolIOAglK+C5M+37Ef
	lsn4CQSMhThept8wsy9b0IiEBikDcCH7vEVcG5k+Yk/oKEjpkaC4uoRJRJKmxDoS4w1fUd1aQZt
	rAMY33rttBn/gwUc8VnrU9DUTyoyusTac9Jrc2j4nvq6ZUTWHDXAABWar1uJ25bIw2C8XOjq9X1
	e79ZKDcqv9VYBui0KRfm/s04XzZBOJTY37nX0Wskb0xwypTbAhhhvAk3jVIn+vGJbAgn9PBmcFl
	xZC1saefl5Cb6CQ0TxurgvFXeRaECTzuf5/xK+KC3nvDSkWH/lG3PHOk1SCM3A3Rg0OHzmc2Pby
	HSQtSrQQzmy60yVnYkI/YtnRMgOQoFeuN+wfO6+aLPREg2JKYIsQXdu3996uMo=
X-Received: by 2002:a05:600c:1c0f:b0:488:a797:f099 with SMTP id 5b1f17b1804b1-488fb78dae2mr184001935e9.3.1776860080789;
        Wed, 22 Apr 2026 05:14:40 -0700 (PDT)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm78835395e9.12.2026.04.22.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:14:40 -0700 (PDT)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: gc: Remove extra space in memcpy call
Date: Wed, 22 Apr 2026 16:14:00 +0400
Message-ID: <20260422121359.78021-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an extra space between arguments in a memcpy() call.

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
index afef48ebd818..e40b0656a960 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
@@ -58,7 +58,7 @@ ia_css_gc_vamem_encode(
     unsigned int size)
 {
 	(void)size;
-	memcpy(&to->gc,  &from->data, sizeof(to->gc));
+	memcpy(&to->gc, &from->data, sizeof(to->gc));
 }
 
 #ifndef IA_CSS_NO_DEBUG
-- 
2.52.0

