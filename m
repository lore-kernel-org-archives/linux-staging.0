Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410F91102
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 07:43:47 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i5so59844216eda.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680075825;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zen1b21DPAgiDb/JdV+I5PElPjjV3TtfJQRRpDix7ow=;
        b=VWcBQHDq5zsfv16n5zzKQK2Bb9jbHg9fWpBYN+m5ZTpdgnEr1dSDnghFpxYBlR86YR
         Z0nIqNe2KbzrRsnzL4RTCOx8Nu6dDkCTrYXUp7Ax3dXVtjSOK97d9M62bUl1a1d/Ritd
         FuBiHB0fU3X3SnmMEIdq0rHldhdm6Xa/fP7DpyhK9erg8Ll2BFijTKRYSIEJgbOqbi+W
         msnPuQOWDTbsHcE/FMUbKqIXo4KTq2UgDAMw7Z8Pnxat727yTfV7JzzZJ+YaKMmOzyXG
         naFQvNaqxKnh3hdLCT3zF3ibFWYUQUd58MnUOYqeveuVTq2031gCtunCZTPGlZjYjDdp
         Llnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680075825;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zen1b21DPAgiDb/JdV+I5PElPjjV3TtfJQRRpDix7ow=;
        b=psTpK+2eTw/Ikv0dt0+dKU/xh8t0V0T0f7S5Ri+QJFTkqRpqcskDHrq+sUty8xPWiz
         L8HGm7PTXTgKMkuFX8agVjM+j9GK3m6Bf5sSQ/ZVL/JLl7dfysfGNklk9nylftwHBh6x
         vVngQVZT5QQkOlatZ1SGeyK4ZbW26xCdgpxPqkLOghCtf7RO7ktWUHKSv1ohv/BhglGu
         w0joVTgJUiCkvfx0brx+llY09QJscqvHi45tkFBn4+bMOtScUy4xlv7wF60gBiBrsfVZ
         QiiNhQzWCO14vssrNtHKiYbU+dNW5MpwJlfjbnV/b1Uk+UpOe7d5VY8U0IglWTk1oJjW
         4A0Q==
X-Gm-Message-State: AAQBX9c1Np+1acCImshDDiwu68/cRY4tBAoCOdpJ3hog+Q5ILeCs/Ial
	kKyNxu1rF8iN4hojqSUFmCc=
X-Google-Smtp-Source: AKy350aAeHiFEjneLz2C3Z9n2ta/6jYIS3jFLR+7PWfmWLf42OYc8VTUgL1n1frOQb8xXiyywsfVcA==
X-Received: by 2002:aa7:dcca:0:b0:4fe:97a2:4b86 with SMTP id w10-20020aa7dcca000000b004fe97a24b86mr18390243edu.8.1680075825090;
        Wed, 29 Mar 2023 00:43:45 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:d1ab:705f:18f7:3e0a])
        by smtp.gmail.com with ESMTPSA id f11-20020a50a6cb000000b00501c96564b5sm12816618edc.93.2023.03.29.00.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 00:43:44 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] staging: vme: clean up duplicate definitions of dependencies
Date: Wed, 29 Mar 2023 09:43:42 +0200
Message-Id: <20230329074342.27595-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The file staging/vme_user/Kconfig is only included by the top-level
staging/Kconfig if STAGING is enabled. So, there is no need to mention the
dependency on STAGING within the vme_user Kconfig file. Further, the config
VME_USER is already within the "if VME_BUS" block, so there is no need to
mention the dependency on VME_BUS.

Clean up these duplications of dependencies. No semantic change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/staging/vme_user/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/Kconfig b/drivers/staging/vme_user/Kconfig
index c8eabf8f40f1..d65cc5510649 100644
--- a/drivers/staging/vme_user/Kconfig
+++ b/drivers/staging/vme_user/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig VME_BUS
 	bool "VME bridge support"
-	depends on STAGING && PCI
+	depends on PCI
 	help
 	  If you say Y here you get support for the VME bridge Framework.
 
@@ -28,7 +28,6 @@ comment "VME Device Drivers"
 
 config VME_USER
 	tristate "VME user space access driver"
-	depends on STAGING && VME_BUS
 	help
 	  If you say Y here you want to be able to access a limited number of
 	  VME windows in a manner at least semi-compatible with the interface
-- 
2.17.1

