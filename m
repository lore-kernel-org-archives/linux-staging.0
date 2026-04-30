Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47630401A0E
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544750; cv=none; b=B1F+W0JxosRgcH6vPdmFd65ZzbfSHpFbpDORFNdA455XFOOdFGSP4D147q0A3A301EpVddbz6oLzf/f84igDsvwI8s5hxBZUNkE73OLqTDSkZxBYoVI3dnmlaITmpHEVEBeAI5/LRZ7c7NpP7OuCEBMaDjM+hty804k+QpWxgco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544750; c=relaxed/simple;
	bh=3uV3oobCX+C+KtmVFK+xxp2L0k+Bn/WYb55L660d+6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g4V2OJL/yQDoFUJNyc0dV1UZfv95lJENUYMW66OOIRcVPpMMpqbTaS3/ZGGKgpePhpq4JfhO5vYkkK6hhLoq/JeTuzP09qwmkVC30kEmIaGIKMkaR78tAQtMwkwz8OB1S/9rcXD5tp32KTMcisTfmB2gEnn2jIuXPJ/BCrJ4pKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDjMvH4F; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDjMvH4F"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2d96243c91fso166136eec.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777544745; x=1778149545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyYaWTV5ahYl27fxYzw7aiTm9/pi+cupE4KnUEMoGHo=;
        b=GDjMvH4FAjMHfjMgz/Iyhny08mx7DU+oYvSK2g1fudiKqlgxVhr2uduZyDG4oCZXEB
         jM6M2BRFzDWC/h+h4g4VYnnjD/9YgXrcxT6WZJQUU+UYLIMUdJdRMZKKlVzR9qNWLFFC
         7HR8/N5omn7FmxqzF6wSBfiCPH9xETQ1C72dbHsAZA1vefwQebMChQpoEd4Yed2GW5wS
         ffkjGZeV0TLukKbe9UsdX2vstjEQwQpcZfhnTrxsxnVj4jvUHJ+oXJlP48nbF39tlhWO
         JNFp5GThjvH67E1GDyon1woIMKBjlBHttr49M3a7wo8AFt/rscMBa05qvG8Ev2qbkpa6
         Bphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777544745; x=1778149545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyYaWTV5ahYl27fxYzw7aiTm9/pi+cupE4KnUEMoGHo=;
        b=rrJE0dGbbozvaGdzSkAlPSJRqrUL9gxW4388ZVvvK41WdTufimInofnL5zwFuyBiFE
         RgxvYL2h2UAy5l/x1ApalEVxJb2j6K/N8v6ZnY0F1mdWTYS6gCsrB57jBfb/i4klPCG9
         R9Xrp9CWxeo7FxaeiytuEy7Hy6fgGqIGPaOvCAjU1DzIjEpP+1ZqjpsDDIUZOeixSL/j
         T8nx5t4MfyRefRDnjQVVw1xhZPuHxAyADGH9Gn8F26DDyigm9hG4w6X0NNv1uhJIW/xR
         STOb3Yluw3jwVhAJ+wqM5xAtG+bF9qXjPV7Uo4kCdZlc2PEYzAtXqgSYRvpfpH0t7/Bw
         x4UQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RYJazP1bs/90SMEcVrEnuZ5qI+GWiT/GyIk8eqPZ9i/qx1ZPh29mGCIMvmmawT4Q1PeHEb2OCbaJLMZLa@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/LzmNaH6FICv5WKUYvE9NqPWZQ3+8sPpTZgAHMXME37EQ/8MK
	RpRhn9CwFhdWrj/RqTzbPA0SP9Dvk0sncSJ2n4CWkpkLA1V4rooDeJSb
X-Gm-Gg: AeBDietlrJK84VrXxUhBi39Y1ModdpPnbQlrwLnpnpdIeDNA3auWtT4I8Za+WOwIhyM
	cCNivHY8c7UFQM89sxR4UmboChntclXNXYNMhKJmouIKhzrnJ/WciHeGRN8gIjwcqzvcf2GtcrP
	thUTflIwZ2Rkj9tUN7xbipPr00tGMKTK/pgF38rUC3Zp2bEE6Guy1b5LtsqKqvuyUUjC6wlW0HR
	5i+kYq3on9MR4gpAQj5VIhhS5D6jkiRUHDCvviu8Lw/1DWtJOFdg4dp9WkMPwCdofYzWpyita2z
	/4q1zYysP7AMSa8evf9xCBZ/h37zAIqp/qpoZtjHKzaHdm0GZ7j8SrNIg8f/ONyq9QyBmwNYz8C
	ICQVL3shB1uahqM6IHhUAzNAoCdD1P7Sv7yqlau591VsA31642glVJQrfPrJs0RL2J8y/mmQRwJ
	Sby3FkjyzrCbwBOozSxr/n3Y3+kqzpS1IXZXYoHDYijYE9zyWiHGfPj0DhB4ppyZh36w==
X-Received: by 2002:a05:7300:e614:b0:2e6:4d6e:2cbd with SMTP id 5a478bee46e88-2ed3bef29dcmr951391eec.8.1777544745512;
        Thu, 30 Apr 2026 03:25:45 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf6d419sm6191614eec.2.2026.04.30.03.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:25:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: fbtft: remove unused function fbtft_write_gpio16_wr_latched
Date: Thu, 30 Apr 2026 10:25:29 +0000
Message-Id: <20260430102529.25019-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function fbtft_write_gpio16_wr_latched is not referenced anywhere
in the driver and only contains a stub implementation.

Remove it from the driver.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/fbtft/fbtft-io.c | 7 -------
 drivers/staging/fbtft/fbtft.h    | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
index de1904a443c2..7d331eba947a 100644
--- a/drivers/staging/fbtft/fbtft-io.c
+++ b/drivers/staging/fbtft/fbtft-io.c
@@ -227,10 +227,3 @@ int fbtft_write_gpio16_wr(struct fbtft_par *par, void *buf, size_t len)
 	return 0;
 }
 EXPORT_SYMBOL(fbtft_write_gpio16_wr);
-
-int fbtft_write_gpio16_wr_latched(struct fbtft_par *par, void *buf, size_t len)
-{
-	dev_err(par->info->device, "%s: function not implemented\n", __func__);
-	return -1;
-}
-EXPORT_SYMBOL(fbtft_write_gpio16_wr_latched);
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 317be17b95c1..c7afb0fd3943 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -262,7 +262,6 @@ int fbtft_write_spi_emulate_9(struct fbtft_par *par, void *buf, size_t len);
 int fbtft_read_spi(struct fbtft_par *par, void *buf, size_t len);
 int fbtft_write_gpio8_wr(struct fbtft_par *par, void *buf, size_t len);
 int fbtft_write_gpio16_wr(struct fbtft_par *par, void *buf, size_t len);
-int fbtft_write_gpio16_wr_latched(struct fbtft_par *par, void *buf, size_t len);
 
 /* fbtft-bus.c */
 int fbtft_write_vmem8_bus8(struct fbtft_par *par, size_t offset, size_t len);
-- 
2.34.1

