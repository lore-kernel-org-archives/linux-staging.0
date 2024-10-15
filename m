Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21D51E00A8
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 18:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188883; cv=none; b=ePZCnE1X5aHaIO5VpmPtMlz6606RZCCCZ+WFse9XhkhcOyzHYZPTaSnvG9Weizaaaq3gy+SWv7U+KUvVJXxXIEftPYHQg7FBqcuVdVMAS0ZPPTTmdRruyRHz0P4tNqHPI/UV4iqtcREjJrh+OZyn8SNhGS02D9WFH3/a7itAxO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188883; c=relaxed/simple;
	bh=LRz7jjq2tgqpYw5SboGGBZ9WqD0BfyfdwH2XhJ6kj2o=;
	h=From:Date:Subject:To:To:Message-Id; b=fLHn/qdvakv2ZjNKmKjfauWveMX9AS8qa4utEDesQZL41NQqYI1u4xOa02Qa8QxpipVaji5UBmVxtfqgppigER5tVvWO7l51ZBjsxojv0n79xJMvcx+HZa2Suq0nC5T9IErBYhk64Gu+x489b5ynxqTGmjxCNafBagMYmmxAlx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=FevBbXjR; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="FevBbXjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729188875; bh=LRz7jjq2tgqpYw5SboGGBZ9WqD0BfyfdwH2XhJ6kj2o=;
	h=From:Date:Subject:To:To:From;
	b=FevBbXjR1+eh+V9gysEUo9ubl5GxrKXoy2vTlhYkmAq/m2wbSTYhaD2onbA9F4bNY
	 /4TCf24UOleTtGyYOr9zvN/Z0kjPP/LghJwhAXkpc6sq0Citvhnt8o+SeEjFUo92Id
	 v0hMjAq3pI2YEQme6H/8mUAJhCb0SmVGxcWMymFEPUpFVMDoZG176Tr7Oxp7CTa0ad
	 75Zm9jQzSj4jZ98GoAuW/qgIbodA5HkYZAnjItRMbcLzYMv4Y4JIkiFofkrrsALRyW
	 PLTZFt/RgXgB6GPJ+pnUZXqwAGfHyYNvq2MFN14yiZkrsdpwtj+iXFWl17RyyHrjc+
	 zx+Ep5ux0Eat5JO+C+V3M3OCJtIEvuPgFGr1pw5TSwNGKR1IsOcg3PZIPuxvLAfpeh
	 XTAvCiMl4c480V6uTUOzw7jNa567c95hgRHOwva7hXdwLGn+V+NWjpExFO35wBD5Nh
	 cD7fx+8bij019dwMlQouUmhIU0HRDkZ5M2zTSW3hFOtKcnyD4NWoZLIALXQ9NXd6uN
	 SZjB/PDkD/znYMUBH0ktahZ/CL43lh75kkZNV0lXsqEscXJjaOTBJt/kXyGNPM1Z4R
	 QoPdIsaUv57UZ4MSccXbsfglMCGbh3eqOXpaz+iGSa2ZkQn6NiRAxnCn0ZSPldZ4Tk
	 rztz2ARqS7/CZnEKLcPkNFFQ=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id 70D2B18DAF2; Thu, 17 Oct 2024 20:14:35 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Tue, 15 Oct 2024 20:38:13 +0200
Subject: [PATCH] staging: gpib: avoid buffer overflow
To: Dave Penkler <dpenkler@gmail.com>
To: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241017181435.70D2B18DAF2@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The remaining buffer size for snprintf also depends on `pos`.

Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 1da263676f2a..4df1ceaa138f 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -364,7 +364,7 @@ static void ni_usb_dump_raw_block(const u8 *raw_data, int length)
 			pr_info("%s\n", print_buf);
 			pos = 0;
 		}
-		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE, " %02x", raw_data[i]);
+		pos += snprintf(&print_buf[pos], RAW_BUF_SIZE - pos, " %02x", raw_data[i]);
 	}
 	if (pos)
 		pr_info("%s\n", print_buf);
-- 
2.47.0

