Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1928482
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 07:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwYJ/FsO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cf57430104so16787035ad.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Nov 2023 23:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700553130; x=1701157930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o2WX9z+qXmObEydEr4Jsr/fb5FQuMi975OooEeJzj60=;
        b=lwYJ/FsOZcLkBM73BYsi7ycBNbjiV0NxZyB0Ifmk4iGD4ICOmOLePf1UMct7FaqoBm
         4tOD3+4zJKypOz6s3kwunHFGXpEq+emeMPv2AubEXJeJQddoJaw98xGDc5lG4Si8pW4q
         mucKXXr6fXutiW/j5ajOqGvFLZVXDFmtKMDjftuGHGoaXSsBhTHtmKSa8NNmsBARfaic
         DOzDVnfB2E+UeKJv+Ojdegf+jy63KuslNl9mgGMoipm9umwj5fnv44KmMpKTY6Jvxxl/
         vEjZ7cJK/1lG6zcfcHu8+u5qdwVnYPPq9MCmBIxnZGU2mk7NcWCD1kzcmHapE0k0SiSZ
         n1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553130; x=1701157930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2WX9z+qXmObEydEr4Jsr/fb5FQuMi975OooEeJzj60=;
        b=cBYNqTUhVkzGf+X/w41UEqG7OSUTaG0hfdz5EdiCphRoMHp03R9YKGzybvb308MTOK
         zQMD3saiJp07BYjKjiTqgHQ0uGKymqRlRbnSE9UtbvSUho27OCE4IA6hjjeiH9/yuCWy
         +2s9eZBiPOqPl0ylJrmbZm/LT26gcpjXAYvVmSKlm4+sWuyfvp3iPFs5wR/gk7CdcsWE
         0eHw2xt4YlX2Nb81db+b8nKiGjd5VPQThbsrwWwMDZPx4cnomp2cx5GhVkaQQI6Zqdbt
         vjzGdI+qhHxCecLBwFRnx43/NOINn7y6EclPd5UPuJNTqnJFW6NHc4Rn71FU1gsDfRTC
         dw3A==
X-Gm-Message-State: AOJu0YzOMjPrUNHomg+NdatbNtwBCba+QVLw8JGaK2NxaBb6NZa1F2qw
	xoJ7erYpc7lWrtr1pE2un2U=
X-Google-Smtp-Source: AGHT+IGnCYzS+fogym/NhlsT3aV1sdcgMvY1MnbUkzlSJFH5N5nR34K77Q3GFneyd42Vv0iJUgjJVQ==
X-Received: by 2002:a17:903:11ce:b0:1cc:49e7:ee1b with SMTP id q14-20020a17090311ce00b001cc49e7ee1bmr11373490plh.58.1700553130536;
        Mon, 20 Nov 2023 23:52:10 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s12-20020a170902ea0c00b001c9b384731esm7272113plg.270.2023.11.20.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 23:52:09 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6CAC51026512A; Tue, 21 Nov 2023 14:52:07 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Soumya Negi <soumya.negi97@gmail.com>,
	Alexon Oliveira <alexondunkan@gmail.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Matt Jan <zoo868e@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Dorine Tipo <dorine.a.tipo@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Charles Han <hanchunchao@inspur.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH RESEND] drivers: staging: vme_user: Describe VME_BUS and VME_TSI148
Date: Tue, 21 Nov 2023 14:51:55 +0700
Message-ID: <20231121075155.16078-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322; i=bagasdotme@gmail.com; h=from:subject; bh=gd9leacfyMnMQZLW/LkwOu83xlPVFP0/KeYNEpi0Yds=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKkxiaHT+B3mz17gm6H40bZdt7/BfKNVT6+83Zq7PNcfL VI73CjVUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgImcnM3IcHy/6q6+lkXO347r MPOfYOz0uzC57cSflbva/ramFNcz9TAyHA15tsdG6f9vvef/mZN6dyufnfH85dbla60jhH9c+3x biwUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Help description for both options only tells users to enable them
without description of what VME bridge and TSI148 device are.

Briefly describe them.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 This is a wording alternative to Dorine's patch [1]. The wording is
 inspired by [2] and [3].

 [1]: https://lore.kernel.org/outreachy/20231029180346.8570-1-dorine.a.tipo@gmail.com/
 [2]: https://ohwr.org/project/vme-sbc-a25-pcie-vme-bridge/wikis/home
 [3]: https://www.slac.stanford.edu/grp/lcls/controls/global/hw/users_guides/cpu/pci-bridge/Tsi148.pdf

 drivers/staging/vme_user/Kconfig | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme_user/Kconfig b/drivers/staging/vme_user/Kconfig
index d65cc5510649e9..8e5df6ce36e8f9 100644
--- a/drivers/staging/vme_user/Kconfig
+++ b/drivers/staging/vme_user/Kconfig
@@ -3,18 +3,32 @@ menuconfig VME_BUS
 	bool "VME bridge support"
 	depends on PCI
 	help
-	  If you say Y here you get support for the VME bridge Framework.
+	  Enable support for VME (VersaModular Eurocard bus) bridge modules.
+	  The bridge allows connecting VME devices to systems with existing
+	  interfaces (like USB or PCI) by means of translating VME protocol
+	  operations.
+
+	  Note that this only enables the bridge framework. You'll also
+	  likely want to enable driver for specific bridge device you have
+	  to actually use it. If unsure, say N.
 
 if VME_BUS
 
 comment "VME Bridge Drivers"
 
 config VME_TSI148
-	tristate "Tempe"
+	tristate "Tundra TSI148 VME bridge support"
 	depends on HAS_DMA
 	help
-	 If you say Y here you get support for the Tundra TSI148 VME bridge
-	 chip.
+	 If you say Y here you get support for the Tundra TSI148 VME-to-PCI/X
+	 bridge chip (and pin-compatible clones).
+
+	 TSI148 is a high-performant, 2eSST and VME64-compliant VME-to-PCI/X
+	 interconnect bridge with support for PCI and PCI-X bus interface.
+	 It is primarily used in industrial and embedded systems.
+
+	 To compile this driver as a module, say M - the module will be
+	 called vme_tsi148. If unsure, say N.
 
 config VME_FAKE
 	tristate "Fake"

base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
-- 
An old man doll... just what I always wanted! - Clara

