Received: from mail.wantyapps.xyz (unknown [66.135.5.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231A7C
	for <linux-staging@lists.linux.dev>; Mon, 23 May 2022 12:09:10 +0000 (UTC)
Received: from localhost (bzq-79-178-31-184.red.bezeqint.net [79.178.31.184])
	by mail.wantyapps.xyz (Postfix) with ESMTPSA id B998A7D6E9;
	Mon, 23 May 2022 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
	s=mail; t=1653307748;
	bh=fspKiwxxuPX+v3E0D/pDAqxY75F4arubFcSemgV83qY=;
	h=From:To:Cc:Subject:Date:From;
	b=YAG5VRg96d+WWrde9vMKY8XWujPnX1teD51eQw0Qj9x2jfuuv2U1A6H7hNxJ4oCEe
	 qBgr/F0J1Sb06zooHnSeosU2wwEblPvL1XTANcaUuQqIZhRqqxcGxzCI3c+3+Y1KZU
	 Pjk7RuhMyp2IQCpZKbw4BvkSQiUy0L1A8YgbtqKSIr5tQbL6IzRMQzm8NXxAcPD9ee
	 0sSC3lblGgIlPCwufy4c1Ae5lTe6y0m8tVcLQuCek7VSIrh3MDLMq/4/mdiA2OFYfo
	 WA+e00dfX+Yrh+iSnZurwUzdWVkUOeMVA3ZFYIKuEAVyPdwoyyV7XsDZP9LszbCWPm
	 3NgxcBusk4qFw==
From: Uri Arev <me@wantyapps.xyz>
To: 
Cc: Uri Arev <me@wantyapps.xyz>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: greybus: Fix indentation in fw-management.c
Date: Mon, 23 May 2022 15:08:57 +0300
Message-Id: <20220523120857.8476-1-me@wantyapps.xyz>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by Checkpatch:
CHECK: Alignment should match open parenthesis

-Uri

Signed-off-by: Uri Arev <me@wantyapps.xyz>
---
v2: More understandable title, add Signed-off-by line

 drivers/staging/greybus/fw-management.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 687c6405c65b..3342b84597da 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -102,7 +102,7 @@ static struct fw_mgmt *get_fw_mgmt(struct cdev *cdev)
 }
 
 static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
-		struct fw_mgmt_ioc_get_intf_version *fw_info)
+						  struct fw_mgmt_ioc_get_intf_version *fw_info)
 {
 	struct gb_connection *connection = fw_mgmt->connection;
 	struct gb_fw_mgmt_interface_fw_version_response response;
@@ -240,7 +240,7 @@ static int fw_mgmt_interface_fw_loaded_operation(struct gb_operation *op)
 }
 
 static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
-		struct fw_mgmt_ioc_get_backend_version *fw_info)
+						struct fw_mgmt_ioc_get_backend_version *fw_info)
 {
 	struct gb_connection *connection = fw_mgmt->connection;
 	struct gb_fw_mgmt_backend_fw_version_request request;
@@ -473,7 +473,7 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_backend_fw_update_operation(fw_mgmt,
-				backend_update.firmware_tag);
+							  backend_update.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.36.1

