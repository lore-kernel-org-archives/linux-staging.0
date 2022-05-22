Received: from mail.wantyapps.xyz (unknown [66.135.5.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A132F23
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 18:52:33 +0000 (UTC)
Received: from localhost (bzq-79-183-83-88.red.bezeqint.net [79.183.83.88])
	by mail.wantyapps.xyz (Postfix) with ESMTPSA id D76867D5A3;
	Sun, 22 May 2022 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
	s=mail; t=1653245547;
	bh=HSHomg1+PZF9S2AE2J3Yhrm7QPBTAHwfUatSdKbFLUc=;
	h=From:To:Cc:Subject:Date:From;
	b=Wue4TwFiibtqmM287PABPs2S/4Urm0jyPoyHXD8RZ/0xV4dkpI31Ps1mu1gFoO7dL
	 W3id5X9zrpiX8+vbB1+Blip/g4KfeBbWQrmVy7UW8cNjmKRymp9C0rdnODNdphWfx+
	 wd8BAkhfZUypz2E2ys8EtJ1qoOQ/hHQYa8RIW0lYYewjPMGACpMZJYE/3ikdoSJt25
	 Ov1xdtgcd8K+iqICKZYXS5x4DqE0WJBMXWxuS+RwzSH7zqc+oXBzZkey8czXuixwAI
	 RFx+Et7GIxD68Z+0HLjHo0/pBz7aQHNERs33bSipjya7Aye7eI1yvaXPg9Bc7EkZfq
	 8Hi9Phf3CFJbA==
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
Subject: [PATCH] staging: greybus: Fix indentation
Date: Sun, 22 May 2022 21:51:56 +0300
Message-Id: <20220522185157.151125-1-me@wantyapps.xyz>
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

- Uri
---
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

