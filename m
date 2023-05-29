Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38BD8F4D
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 15:33:15 +0000 (UTC)
Received: from pride-poweredge-r740.. ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 34TFLoKa032373-34TFLoKd032373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 29 May 2023 23:21:55 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dongliang Mu <dzm91@hust.edu.cn>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: move the sanity checks before variable dereferences
Date: Mon, 29 May 2023 23:21:30 +0800
Message-Id: <20230529152136.11719-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn

Smatch reports:

sh_css_load_firmware() warn: variable dereferenced before check 'fw_data'

The variable fw_data can be NULL in sh_css_load_firmware, resulting in
NULL pointer dereference.

Fix this by moving the sanity checks before variable dereferences.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index e7ef578db8ab..38b757c3df0a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -229,6 +229,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	struct sh_css_fw_bi_file_h *file_header;
 	int ret;
 
+	/* some sanity checks */
+	if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
+		return -EINVAL;
+
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
 	binaries = &firmware_header->binary_header;
@@ -243,10 +247,6 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 		IA_CSS_LOG("successfully load firmware version %s", release_version);
 	}
 
-	/* some sanity checks */
-	if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
-		return -EINVAL;
-
 	if (file_header->h_size != sizeof(struct sh_css_fw_bi_file_h))
 		return -EINVAL;
 
-- 
2.34.1

