Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED2C70
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 17:42:31 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id k4-20020a17090a5144b02901731c776526so32748667pjm.4
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 10:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/MV1SqfZDqSjnKYz3E5OcXaLSAPtXM8imp3PF9KeJ6w=;
        b=JLNcDLdrJL4Msy1I++J0coVrrw04XRKQKYLkrVQqlvV7ynZR3/mzLHiZCIutzaJb/F
         +ga2yTsO+R0O01s3DtrT6d8eGglUWa7zoEblGB/j7Hpd7wnGwlaFeU5Q2ylrngArPeSP
         fw5NIqB4ld6FaVXXNsaHstiIGrWnRJoD+pkMJn7W84+HQmoT9+keyvMLx0y95J3ToNWO
         Z+gld0gS1P3k8Y5pD2vy13mp8Gsuyy4roBADyo+Kvmgx8si/PHgZ9/fZ2gvtJMhpJnjx
         3NK1acO0PUswo45s3fMsvt4UVtocvYsRVR9ujZ6qhquvGeQpitN4wDJPEunYkHeM5NFt
         sIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/MV1SqfZDqSjnKYz3E5OcXaLSAPtXM8imp3PF9KeJ6w=;
        b=RV6kh9T6SC8yIjCQuOHPNCrWLNhULU1uKAtBcEET3LGeCFegnF09eD2ZWOiy1a5jHC
         7GMR66jGvR1Gvx/wCD2L225Ms/9ExHaqhd50zZ0HjJUjeIljtl4atBOPStooUhUeur/e
         MJZlLNxt2khNId9IjYBuHBdkUsx6Eg5btfqTsShQmfsw1aApl+frEMUEWg3ehz+i4bVe
         hTNGTXGgx4B0ZEG66qy6e+3Om650L24+YTOIDkz3WOruLJyNC83hX8bp350tjVlxI4X0
         AA8JRXDfzbYP9S2xf1/c48/anyUmhKdkCSO3lumCm3WGURxzVe6+ny6qI8fPUIgdWl4j
         khMw==
X-Gm-Message-State: AOAM531+dtF8Gwe3FoX5/FKyiLLw55Usz6C9hjSJUZp23RBoAAS4siUh
	p8CZikLomj7mNozpBifQXns=
X-Google-Smtp-Source: ABdhPJx7XEJBaMfGMfcOgPNafXYpdRUXlETAutPhyUdStQehHy49ljO14dC6oz1k7NaQYbovuLfBXw==
X-Received: by 2002:a17:90b:1297:: with SMTP id fw23mr18066334pjb.115.1627926150679;
        Mon, 02 Aug 2021 10:42:30 -0700 (PDT)
Received: from localhost.localdomain ([122.161.50.148])
        by smtp.googlemail.com with ESMTPSA id t30sm14449236pgl.47.2021.08.02.10.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 10:42:30 -0700 (PDT)
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com
Cc: dan.carpenter@oracle.com,
	phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: vchiq: Add details to Kconfig help texts
Date: Mon,  2 Aug 2021 23:12:11 +0530
Message-Id: <ab88d3222088aca29a319147b50a9d1e9f0f8b81.1627925241.git.ojaswin98@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627925241.git.ojaswin98@gmail.com>
References: <cover.1627925241.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some details to the Kconfig definitions of $CONFIG_VCHIQ_CDEV and
$CONFIG_BCM2835_VCHIQ to help make the motive behind the configs a bit
more clear.

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 drivers/staging/vc04_services/Kconfig | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index ad44b80f13ca..cb7c82403dbf 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -15,18 +15,27 @@ config BCM2835_VCHIQ
 	tristate "BCM2835 VCHIQ"
 	imply VCHIQ_CDEV
 	help
-		Kernel to VideoCore communication interface for the
-		BCM2835 family of products.
-		Defaults to Y when the Broadcom Videocore services
-		are included in the build, N otherwise.
+		Broadcom BCM2835 and similar SoCs have a VPU called VideoCore. This config
+		enables the VCHIQ driver, which implements a messaging interface between
+		the kernel and the firmware running on VideoCore. Other drivers use this
+		interface to communicate to the VPU. More specifically, the VCHIQ driver is
+		used by audio/video and camera drivers as well as for implementing MMAL
+		API, which is in turn used by several multimedia services on the BCM2835
+		family of SoCs.
+		Defaults to Y when the Broadcom Videocore services are included in
+		the build, N otherwise.
 
 if BCM2835_VCHIQ
 
 config VCHIQ_CDEV
 	bool "VCHIQ Character Driver"
 	help
-		Enable the creation of VCHIQ character driver to help
-		communicate with the Videocore platform.
+		Enable the creation of VCHIQ character driver. The cdev exposes ioctls used
+		by userspace libraries and testing tools to interact with VideoCore, via
+		the VCHIQ core driver (Check BCM2835_VCHIQ for more info).
+		This can be set to 'N' if the VideoCore communication is not needed by
+		userspace but only by other kernel modules (like bcm2835-audio).  If not
+		sure, set this to 'Y'.
 
 endif
 
-- 
2.25.1

