Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3393229B1F
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 05:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770875670; cv=none; b=OpwpCLe6a4fTb49+JladsfoNV/JagtVe/DiT2n4BahrDe5K50sMTQ31sVeoe/39PEhMLbaqb4jZtNwYNLNgtlfuPAWmt/wG6/kI/i0CqdZTbQcGAZhqAyPooLetTza70yYpvytpSM7FW7fw2E19On/cU+K2Tz7DhrYy7eBTDa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770875670; c=relaxed/simple;
	bh=MTAwob2NF+9GAn7U3A87NplqDTEMUbr6EFem9efgS+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuPcbXF5NKi6n9IP3HnKdrtCopC5AQ3rxEORAeB6kWgK5oBXhyefKqBbwB6EPUJlaH8uCJ6Bj9ij4T7rpH+SeHa0Eb4GDC0/wVxgjkQTGt+tPY4r6vfqn9r5IKyzqzXGGSpT4fQlGkvTDUakCUeoR0N3jtBKaw7BRiHEuLhZYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEJhhC2D; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEJhhC2D"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56737fe4888so859908e0c.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 21:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770875667; x=1771480467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wv7fC+77kabaY3T6dk+n72ScAWF3mVqaJNSwQ3ny5i8=;
        b=VEJhhC2DVpjMCrghCyNG2qFbRzROC9tllwrQSVxnTkS6td4fLSQOSSmU0RmVjhYz7f
         2tjWbkbFkWrgtAJ5d4nXw5hlRommGHstXz1BMK+Hy2PnuogVzeMy7yDdMmboIqAkVuGt
         H9kF0qTSfiWiQ2wlkOuecz/jwxjx5B1x0dC1KY2k3LJMvXvFAs9v4w0v+fCsykkD+czt
         doof1tHc9IVQh0SpnESpOaCAdcWF7vaahkILYCcdCJYN+NDAVQuhti9JM7Uf2KvKy+iU
         Wsw+XqRls+82LIQgOE9La8UvTDw2V8JaUHIqPRP5455kMuCIdWUrw8eJI//hpmKfDMu5
         Zh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770875667; x=1771480467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wv7fC+77kabaY3T6dk+n72ScAWF3mVqaJNSwQ3ny5i8=;
        b=sz3MID0o/FtUGdb6q4+Zgkuizi0QUjV2c8pAHmnbk+BV4Cka3ioUeshfuUkii5C61o
         GlJDhA3Y/oZ3FnjlqFcOuj6guaZOYC27YOWBdm8nS8mZOYtRH5QUoqw6A5tdnwQ41Okt
         x29A460XiPKPhZcjSxrOnrlqHhouw43ulfECgi32+jhtWm82mfInEYL5kfgL2sBrrhET
         K/t3C7hGEwjGNnKjhxPz9JB0if5VSo7S2EGdK1pj1NwBAzU8ScnMbpWT6zNnFVHXCi1z
         hjoldwpczq9YRdNMJ5kygjkx3pM+y9e8ZB/fuylW0kyqsc3svzmE6MvRJaiBQJ+tH/7F
         YZZw==
X-Gm-Message-State: AOJu0YwAnRZL7DRREjavQMVQU2BlSuKh+S4mgX4GDDsmnwGqZ87+uydD
	KslLA1fZWEbJA/SwIQPg3rh+Q5c7WWOF8UpFjwN3TCiBtvMSKmZv8HH0naQ/9Z8D
X-Gm-Gg: AZuq6aLtZBUGa188FsndzNwefGSR3fP1HYTs/hAndSZAaZwD7dta4tTDv6NivUuLcFw
	Dt0heV+eitWy7oApo/0mRQq4R696TR0lkTPUxl1n7E8IpPiIwbM6jcr0v9IgAPzXIh0tyXPzN8s
	G3RXwDMw+lBXf4yYzCutQrpjNLZEylRK/lKjy+MG9+134ad4wEvWUj+JnjJ2UZXmOS/4eRMHCmH
	bL90KjKHuTJQj8gOBiHP3cmI+GJooqqG4plAhXcTA82gsfd6QqBqvRNA+k0dfTpnPpFU0MVmNF8
	OVBU+S6R6b2oJTl8SMG1h/tZpBaWmRHgHZ6mZw1l/S6nH6xCuQx6yt+82SCHGEastRtRVyIUHqz
	3JTRf8BATJaBD+sQEtOz4owajP5yD1V0MtikW1y/4RASVUKWvnW1lS0dUWK0696I/XZlF07YlFx
	pLhnps/sJ+9FlPf2ImNZJeoN0ierXlSYy52IiiL5yUVWkOygQYTP7bjCI=
X-Received: by 2002:a05:6122:3306:b0:566:ed4e:8320 with SMTP id 71dfb90a1353d-56759da6f3dmr384991e0c.2.1770875667438;
        Wed, 11 Feb 2026 21:54:27 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:28c:10f2:1ece:51ff:fe39:a5f1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674c20a760sm1423354e0c.13.2026.02.11.21.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 21:54:26 -0800 (PST)
From: Santiago Almeida <santiagoalmeidaburbano@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Santiago Almeida <santiagoalmeidaburbano@gmail.com>
Subject: [PATCH] staging: fbtft: fix spelling mistake "dinamically" -> "dynamically"
Date: Thu, 12 Feb 2026 00:54:02 -0500
Message-ID: <20260212055402.457375-1-santiagoalmeidaburbano@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a typo in the fb_ili9163 driver.
Found by codespell.

Signed-off-by: Santiago Almeida <santiagoalmeidaburbano@gmail.com>
---
 drivers/staging/fbtft/fb_ili9163.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9163.c b/drivers/staging/fbtft/fb_ili9163.c
index 6582a2c90aaf..a2b5033a9860 100644
--- a/drivers/staging/fbtft/fb_ili9163.c
+++ b/drivers/staging/fbtft/fb_ili9163.c
@@ -60,7 +60,7 @@
  * configure to constrain the memory and resolution to a fixed dimension (in
  * that case 128x128) but they leaved those pins configured for 128x160 so
  * there was several pixel memory addressing problems.
- * I solved by setup several parameters that dinamically fix the resolution as
+ * I solved by setup several parameters that dynamically fix the resolution as
  * needit so below the parameters for this display. If you have a strain or a
  * correct display (can happen with chinese) you can copy those parameters and
  * create setup for different displays.
-- 
2.53.0

