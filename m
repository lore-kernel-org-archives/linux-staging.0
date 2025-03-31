Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F22757F3
	for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743446472; cv=none; b=GiDQDbyjz+VbCFGqANwMSzCmI9PLh8RacfgGn7Ib/CVljax6mVcfEWxZxv60zCCbbhGGZUcDD4mWUXIjScFamDupQnWZd802VOR83jJb62Dm5hCQ5p51imMgFixQsx7iLXsnyIUZHwFc0Do3Cm8uvbrUGwAKjlsI8uPmfiqXyfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743446472; c=relaxed/simple;
	bh=5/YZB8u+qpXbqRyjAm9GRmqnvejvLZhEcczBjOt5dko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/ea70iHO+dBYIjnahy/fVGNyR4whjee7/CRcu3q9HlzYZtj9oTonBBFAanRGqX/3U09aJ/5eIFp1+qMxicWinfCY09f19fWGzZhLSM6qpA8WF5xknucRQdACkwvP4EYnojt+rpPAEAI4jD8Epz4muuS8y0etOyJ7N61Bx755Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fzbi9CCm; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fzbi9CCm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743446464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HcZZ3xXi7jtAHyO9OCCUYW9yL683KSwMvch++4nggX8=;
	b=fzbi9CCmDYaUwgI+RnGLhVwxdzpiZxoF2gVaRiBAXUmJCtpBMnTrsOAubmpf95G1oEQK8R
	rXmIssbmvaIulHZrNflUKiZ01dVgLCKlysdULnl31i03z8B0Tmmd8jkobKmp51QAC93w5w
	hIQ8gJObgUynMiN6vLDnV00xEaOzkMY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Remove unnecessary NUL-termination checks
Date: Mon, 31 Mar 2025 20:39:35 +0200
Message-ID: <20250331183935.1880097-2-thorsten.blum@linux.dev>
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
buffer is NUL-terminated, making the checks obsolete. Remove them.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/staging/greybus/fw-management.c | 39 +------------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index a47385175582..852c0830261f 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
 
 	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error but
-	 * don't fail.
-	 */
-	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent,
-			"fw-version: firmware-tag is not NULL terminated\n");
-		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
-	}
-
 	return 0;
 }
 
@@ -154,15 +144,6 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	request.load_method = load_method;
 	strscpy_pad(request.firmware_tag, tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "load-and-validate: firmware-tag is not NULL terminated\n");
-		return -EINVAL;
-	}
-
 	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
 	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
 	if (ret < 0) {
@@ -250,15 +231,6 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
 
 	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
 
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
-		dev_err(fw_mgmt->parent, "backend-version: firmware-tag is not NULL terminated\n");
-		return -EINVAL;
-	}
-
 	ret = gb_operation_sync(connection,
 				GB_FW_MGMT_TYPE_BACKEND_FW_VERSION, &request,
 				sizeof(request), &response, sizeof(response));
@@ -301,16 +273,7 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 	struct gb_fw_mgmt_backend_fw_update_request request;
 	int ret;
 
-	ret = strscpy_pad(request.firmware_tag, tag);
-
-	/*
-	 * The firmware-tag should be NULL terminated, otherwise throw error and
-	 * fail.
-	 */
-	if (ret == -E2BIG) {
-		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
-		return -EINVAL;
-	}
+	strscpy_pad(request.firmware_tag, tag);
 
 	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
 	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
