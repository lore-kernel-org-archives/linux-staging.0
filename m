Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2057235BF0
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595118; cv=none; b=FPiRnB6dcL4bz6HxblE01eYWdiiJiImFuzuRKtUGcbamwlkzyPWw3NfLU3kbF1Z1bdgTejb039N6II4imsHv/AsloYNRGBjz470izS4ufHReB3LAErUAK5EAzSs04xw+0B0fgJtZXbk4vBEPkaQDrzDl9yfgp3QqDFMtx0mQB+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595118; c=relaxed/simple;
	bh=pZPdCTaoWC1/7dFCjd2O1sOG2cCN+FGVNvy3q8/ObVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKJYPInTRkWrhWe1dWWJQWceE7Yx1oYTxW3FIb+5TbFihEfcLm2ve8DCooi3qy/HvLDFAQ0RZBTHEALU9lHpVCPGbTLm4gk4Xz3b5XWwtVKA4d9FH5M/ENLqH7DlLdwIaUZK0CM5+4EXuE73shMM0WWGm7h80ix2IdjfaDkhSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D/Q9sGRM; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D/Q9sGRM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743595104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U6s5Q93fZJsXAS6nby2Y8nIyT8Bor7D/QRKLwNJnvT0=;
	b=D/Q9sGRM1jql8E7+oRkENiw36/pF+FpK3DLPJ11tTn+gNjvCZAIY90YYYJaDd/0c0TI4qL
	fsjcAjp+0NRy2ndD2ZQuZNhm6TtUql6L2b/xnyg7pOnxs1jgoxj2gmj9LfUHMs6tmNHDxc
	wyo8OpSY0oJrnZiSAo8d/KEAN8uQhZI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: greybus: Check for string truncation instead of NUL-termination
Date: Wed,  2 Apr 2025 13:57:54 +0200
Message-ID: <20250402115755.1929043-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Commit 18f44de63f88 ("staging: greybus: change strncpy() to
strscpy_pad()") didn't remove the now unnecessary NUL-termination
checks. Unlike strncpy(), strscpy_pad() guarantees that the destination
buffer is NUL-terminated, making these checks obsolete. Remove them and
check for string truncation instead.

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Check the return value of strscpy_pad() for string truncation instead
  of NUL-termination as suggested by Alex Elder
- Link to v1: https://lore.kernel.org/r/20250331183935.1880097-2-thorsten.blum@linux.dev/
---
 drivers/staging/greybus/fw-management.c | 48 +++++++++----------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index a47385175582..152949c23d65 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -123,17 +123,11 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
 	fw_info->major = le16_to_cpu(response.major);
 	fw_info->minor = le16_to_cpu(response.minor);
 
-	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error but
-	 * don't fail.
-	 */
-	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
+	ret = strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
+	if (ret == -E2BIG)
 		dev_err(fw_mgmt->parent,
-			"fw-version: firmware-tag is not NULL terminated\n");
-		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
-	}
+			"fw-version: truncated firmware tag: %s\n",
+			fw_info->firmware_tag);
 
 	return 0;
 }
@@ -152,14 +146,12 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	}
 
 	request.load_method = load_method;
-	strscpy_pad(request.firmware_tag, tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "load-and-validate: firmware-tag is not NULL terminated\n");
+	ret = strscpy_pad(request.firmware_tag, tag);
+	if (ret == -E2BIG) {
+		dev_err(fw_mgmt->parent,
+			"load-and-validate: truncated firmware tag: %s\n",
+			request.firmware_tag);
 		return -EINVAL;
 	}
 
@@ -248,14 +240,11 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
 	struct gb_fw_mgmt_backend_fw_version_response response;
 	int ret;
 
-	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "backend-version: firmware-tag is not NULL terminated\n");
+	ret = strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
+	if (ret == -E2BIG) {
+		dev_err(fw_mgmt->parent,
+			"backend-fw-version: truncated firmware tag: %s\n",
+			request.firmware_tag);
 		return -EINVAL;
 	}
 
@@ -302,13 +291,10 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 	int ret;
 
 	ret = strscpy_pad(request.firmware_tag, tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
 	if (ret == -E2BIG) {
-		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
+		dev_err(fw_mgmt->parent,
+			"backend-fw-update: truncated firmware tag: %s\n",
+			request.firmware_tag);
 		return -EINVAL;
 	}
 
-- 
2.49.0

