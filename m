Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA47636
	for <linux-staging@lists.linux.dev>; Wed,  4 Jan 2023 08:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CFDC433D2;
	Wed,  4 Jan 2023 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672820542;
	bh=utRN27Crk/ZIcPnWApQgp9KevDbSfGZb7A9BBAaftmg=;
	h=From:To:Cc:Subject:Date:From;
	b=Q18SJ8QQ3upDQg3M1Zc9jZECSl7qUH/fuENzm2tdENAqqKC2ftIRGnEesl9TcV9iu
	 wrT0NF9q9NIe5XxSeszHd/xklFaRAWdEBXbsPnV97BldertzSmaK94E0gcTU279rj7
	 iJsjGksw2qu0XW/p2OSCYe4hwzbkghHFmWpXEXmqUzoPYyLJ4dZ5zyNOcfqs9PuM7a
	 ICBglqSBFW92pqFaQu/U9+SkvfF81k+Dy+Y3tTHTptwK09sW0h39sWhqc6S3fmOJSr
	 r+PxdgQyMTMto9Vmi2358CAKCSgDE3oGzKsF2DgMov5xIpFFD1pKFBrgDfMWGywktT
	 kpDjeIiOHs8Ww==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix videobuf2 Kconfig depenendency
Date: Wed,  4 Jan 2023 09:21:36 +0100
Message-Id: <20230104082212.3770415-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The recent conversion missed the Kconfig bit, so it can now
end up in a link error on randconfig builds:

ld.lld: error: undefined symbol: vb2_vmalloc_memops
>>> referenced by atomisp_fops.c
>>>               drivers/staging/media/atomisp/pci/atomisp_fops.o:(atomisp_open) in archive vmlinux.a

Fixes: cb48ae89be3b ("media: atomisp: Convert to videobuf2")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 2c8d7fdcc5f7..c9bff98e5309 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -14,7 +14,7 @@ config VIDEO_ATOMISP
 	depends on VIDEO_DEV && INTEL_ATOMISP
 	depends on PMIC_OPREGION
 	select IOSF_MBI
-	select VIDEOBUF_VMALLOC
+	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_SUBDEV_API
 	help
 	  Say Y here if your platform supports Intel Atom SoC
-- 
2.39.0

