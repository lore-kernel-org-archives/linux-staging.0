Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E3135F8D2
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237192; cv=none; b=VeXk9dbjJfkDT7YJcL6SdzWcz+eWwcaDFzB+L3I/sKzmP4wh/Cc18SbFnTktrWVD/ThC7gG4Yvvx50DrO+9H367Jwlo/E7yo69PTvElfdAn2jPWBdKNZ1pLJdn4AHMoXgHW0yVZBK4dOmnCaRQtrhIVlcAduUkEmOh8KkdlCerQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237192; c=relaxed/simple;
	bh=yF5rt9iRq8hrQat1ucTgNI+On7HgGlfjNDReTf6j+GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HujefBayzP4CfwtOPTI8ZX5/g2yoDGOQ1C7MXnLF8PaDzGmC2KyQsjFKn4sOCm+pJMjUwEv9xk7RFrTv1pAzRhPkHt5WQ2b/RxuZ2JxCZYWses/tD1d6OUF8nCeyI27PddsfBJHku6xCJsaQiLRSdjvlvTylwcAwm2N0D7IoND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVvP+zoL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVvP+zoL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35983877dc5so4812639a91.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 06:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773237186; x=1773841986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAOTE4KAFGKM6/rvrF0ZwMtwr3KkPnHMCpSh+ZuGrbI=;
        b=RVvP+zoLtdTK3ufZliW+XA/SWFCjBVbowAghLkGlHQ/oips+kSa9R7cRgR4l8L24PN
         5VEVDqOQMQWPu/Re8V2hbdbf02GW5o8uAPOnCvVaQIUUeqQ/uwoDuDyPjiwREao8M+XN
         B0Zl0yn33KKLgH+2D3O+tuBhd0ilD6vUUNY3hwIdlZdtA46hfIhKAAG5GbCLjZOJAsU+
         URHpE/54ByIAJhg3IIieq7Si7nhdEjKcc78UFdssoM/SPp1vIFTnIS6QG7yXs+4bmVQu
         L8ASYlGUl0IkXRYUpN4RbDCLz3nFgyhfFvDMuJ2UN3Z+6y9WmAKdyZegj/Yg1l3d1gR7
         Nj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773237186; x=1773841986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAOTE4KAFGKM6/rvrF0ZwMtwr3KkPnHMCpSh+ZuGrbI=;
        b=eFB3W88C6UjLdEbNwAIJ3UP2e0qJwdoLWPMnA3WJwIVFHPl9EAt+zMy/0EAmbYkpKE
         50kLVCXzenpTFOHosr0CtcwOc06oIfAeEZWHyvqVNtomnt2ZJITiaqBTUYaWJZZC/Pn1
         arUyF6PfgMOly8gj7qP0JIwucduF755eeaaFSDQ5Ra0f6OYOLIIyJ0ktnx2cYYzVxkLp
         w+KHoO/ReWmmRi0D/7X+9B7i4qkI8Ygz/sEdVdvdiVdiHrBaANihoMnpRc5clmIX+rKL
         S/6go4McBlQgF+e06omiZ7hmZZaOVO0tS4HYwNdRrMoEHYVWXTQ1t4XLep0Vq9kI4vIB
         CyHg==
X-Gm-Message-State: AOJu0Yy0Yg/DOyeBrC+YNGdPDNCuMV1QcdIt5xeO/4QDFecmjK4BsmC6
	R61yISa5I6oKQ0YiBa3WRJn24p+krPGyCCYpX6hUXjabuOC52M7lbAGt
X-Gm-Gg: ATEYQzyOvglrLTKVEoPiviNyKrdazum6WxyaOUN6s0oVWL0iZWwdXx9KteuGOCpTDR3
	TsS0UT3zUSuAZVeHeMz3Z7vF6nsCgjlQUmBe6OZNxUUKV1xuVJ+N65bzsq8QrB08VTDISLv4N+/
	c4+bCy3s2Axr59FNTY/0v95ZJthZg+pliwXNnEaZydqJ4BktejVySkRft91NQMYEMDttuQuzRcG
	googFoTAvyTuLPiRLdzopkbdmKJbVuP0zBpbHOPWq5THhNKruE401k99KUN8c7vFO5tAoFog/TK
	GZCJbWr3mqoctcUrCX+haSJoNCNhiW8RbUK8sN5LOewGZMPoUZJ2yCG3qzzcOsnG+u+YENAT9rW
	/mK8gcVwXK63USUzAFGgVa8na6V+jttMH9vy0b/SAv2yiy6w6truXxYMIZvvBaQMtLem7VnNSEv
	eTlJxbiPCduXptUaFAJU6ho7ndsNnVsNmzTZQpkA==
X-Received: by 2002:a17:90b:5112:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-35a01286208mr2377581a91.7.1773237186244;
        Wed, 11 Mar 2026 06:53:06 -0700 (PDT)
Received: from ubuntu.. ([152.58.130.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0250f014sm1065992a91.14.2026.03.11.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:53:05 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] staging: fbtft: fb_ra8875: replace udelay() with usleep_range()
Date: Wed, 11 Mar 2026 13:52:45 +0000
Message-ID: <20260311135245.32730-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace udelay() with usleep_range() for 100 microsecond delays as
recommended by checkpatch.pl. usleep_range() avoids busy waiting and
allows the scheduler to run other tasks.

Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..d2400bb44f1c 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 200);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 200);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.43.0

