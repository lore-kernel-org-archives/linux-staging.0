Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15CB33D6EA
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773462900; cv=none; b=NB/s9r4ZU7Z2urRprfhghDbnry2Yo5FCJdIqAQR3UYxTyzhJIIT2TONH+Z2Y+4JcmFpOhqVvpL3/ctYSM236n6Z7RC1pz75qMr8xfVWlcKg7vXJohvbx7sL8HHNeDNEiN0UebpkZ1DjR/rhiclnp2hOTtlqEHEBp4X1SMlll8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773462900; c=relaxed/simple;
	bh=TqWsH99MrdUuA81CkQUWoiet7II2GjxXfuhu79/IAuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mq80+fySIDUfVTHjwiwbyFA1GBzhSLq7WPPnZsR4mSk7brGnYSJEXaIWUX5s5oaVreNh1IqWDwxUTi4M5KI1tgyoA23DvY6Am1C2BNYcWTtwN67f3KF75mENlHar8jD7RgGn8YQQ4LpIa5g7Y4prefpq8E672hIUWek0tx1JsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO6gicmv; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO6gicmv"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128e4d0cc48so3329659c88.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 21:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773462899; x=1774067699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrltBox6rNcigaijxZMED+fJ8thmrzhMuv49DAUnvpo=;
        b=iO6gicmvdPRV1zCdn1an84ugZN3O05wn1vmSw3CKzAuwp8p5RVDz1+zpWcg8nPMQjb
         M0dW+IbPoAB/d/R8yQiR31DORrxLz+D1VKtiHWL9aFtC3d8LVkQeDOGgZU/tC0LS8vJe
         YxIRo1aRGobQs1ep5mgKASGz806mfvc+rmmMlS+oaYavDCIAh/YOhZKGBJwCMEQn1Y0D
         /c+YFXIvKlKFh+CC4FXEFtsD1jWuqYnDW5dRLgSXVneABSbnIPeTHm7M3rvZ1Lfp+zG9
         yBpv4TNKW2+92KzsEExSbPImgmm4ACn/dpi0g/7TXs5FXZlMTrbpeEwEQwKQkMdV/0Sh
         IeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773462899; x=1774067699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrltBox6rNcigaijxZMED+fJ8thmrzhMuv49DAUnvpo=;
        b=GjVf3N+t2LHLsPzD5kSYJ7KdUoxGEY3FMklFcF3DfG7A7Ljhp/ReTozgdl37icqfK2
         aZeQ/Z0zaTv+zef2Wo4+ujCVEbN/Eg+jCBn58mu4QpCyt1i8O1y2q53yHivJRf71oATH
         vq+ugdCCD4j8j4xFnEzunj0P56sqJvX3jJe62XKd9ypXhgmKA+/1aRF39V3tmdRQLFkp
         X9r4wWlJH91L0tnKvdYEAJysZsA1U0eOBYZW/L21M531iT5rCvXNKdgiezapubhwXJu3
         z2ZD563a48dhOE80fEYIEh/5Ih3L9BzGwpUXQQI83rYpwbfEzE4WZJMYVPsWb3KGebdt
         pjDw==
X-Gm-Message-State: AOJu0YyXNVKmWJ5dK850GaJusrQF8TILHtuuPDwkWVi8G38Zn62815pH
	BQ6nM9+XxBFd4KDmaY9lRZ1QHCpUl7QR3vaY8837X2NqEw+UAMkOk5dX
X-Gm-Gg: ATEYQzwqkyui3ozpmDNup1LbEfpsW0iTbK+0uMDijcnkQFh0PmN0mO0CS/QvsnrdnwL
	vhA7tc17b0IrmABXD3t8GLLFyyh+Yv8X9yQG4G1jtd+hBCmJVvo/zdX6CvxasmvcQjwfHhQVn1/
	OLi1FD+2D4Wtrd8/N8d9YJrK6lpvUwOiavVIyTvikl34g3U5NYkZQJISYRDpqbS2XkaCfxdNZTQ
	+R+4QCMKiJ4wJB1byyM5/oNyMkEivAcjLKFCCzY0puwz9MYuLDFwRyVd+JY3Kk7oAw4XL2IkZeA
	skV+KW1itiCI4rVlAiki1fPE1ijr32tb2ihgz9hZzRUCkaOVKLDFKw60KUmaKP+hkrHREAP5kR6
	3Ti6j/ku0vCzKFGkKsuvq75Ywqa30hOD/8D3eyZAJdxchRVBUJJF+PRpYH/uQ+dtQ8ukENLitFU
	ruFQOePpFHPQ+GGExlzT0sn9tf+efLlIdum20yjhzy37P85DE=
X-Received: by 2002:a05:7022:6708:b0:128:d5bd:3572 with SMTP id a92af1059eb24-128f3e3f69dmr2656753c88.31.1773462898709;
        Fri, 13 Mar 2026 21:34:58 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f62b01eesm5467490c88.7.2026.03.13.21.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 21:34:58 -0700 (PDT)
From: MjScrim <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MjScrim <marcosandrade95963@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces for single statement
Date: Sat, 14 Mar 2026 01:34:11 -0300
Message-ID: <20260314043411.86087-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces for a single statement block in an if
condition to comply with the Linux kernel coding style.
This resolves a checkpath.pl warning

Signed-off-by: MjScrim <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e2549..a86252cca 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.53.0

