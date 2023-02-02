Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8337E8F7D
	for <linux-staging@lists.linux.dev>; Thu,  2 Feb 2023 21:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E047C433EF;
	Thu,  2 Feb 2023 21:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675371795;
	bh=A33USs9k6Lfq5Tg1eM1boXA3NuS4YVVHeJBpBXs1Vws=;
	h=From:To:Cc:Subject:Date:From;
	b=j1BeKWnKWKFOU6FlZ7CQZ4keM+0/D46kDC+UZexBtfbb/DA0juNOo0ic7qBwPcOgM
	 zgEBDQ1nxiiXKVzvpsX3PpTLnvHd8U1mCpLSTzgBgIM75mcB/l3sHEGilEb2iK/dMg
	 hX0RzGvUN+sfJS5DUmSkAauOLNb2M5GzB3wnGEMk1GLQZgXqYdfEm60n45JOl83fMR
	 b9tTUmdxRMJ0UOfy573k/8/xo5kql4mair2mmA2TKCy1kMTlCzRuheImeg+I61tgda
	 lBYuh2FakFS9OLxnNOT2YQNtUl5i60zr1AyyKe0x5iIiiUePWy5f3M16UewInV4ow1
	 T9mG+uWRdAqhA==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: add I2C dependency
Date: Thu,  2 Feb 2023 22:02:54 +0100
Message-Id: <20230202210312.544277-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Without CONFIG_I2C, atomisp fails to build because of a missing
function declaration:

drivers/staging/media/atomisp/pci/atomisp_v4l2.c: In function 'atomisp_subdev_probe':
drivers/staging/media/atomisp/pci/atomisp_v4l2.c:960:21: error: implicit declaration of function 'i2c_get_adapter'; did you mean 'i2c_get_adapdata'? [-Werror=implicit-function-declaration]
  960 |                     i2c_get_adapter(subdevs->v4l2_subdev.i2c_adapter_id);
      |                     ^~~~~~~~~~~~~~~
      |                     i2c_get_adapdata

Ideally the driver should just move away from calling i2c_get_adapter
as explained in a comment near the call. For now, just use a Kconfig
dependency. Apparently configurations with I2C disabled are rare in
practice as well as in randconfig builds because a lot of other
drivers 'select' the subsystem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index c9bff98e5309..8b0de0b5b4a3 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -13,6 +13,7 @@ config VIDEO_ATOMISP
 	tristate "Intel Atom Image Signal Processor Driver"
 	depends on VIDEO_DEV && INTEL_ATOMISP
 	depends on PMIC_OPREGION
+	depends on I2C
 	select IOSF_MBI
 	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.39.0

