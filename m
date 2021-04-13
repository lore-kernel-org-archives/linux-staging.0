Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B970
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 00:52:56 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FK6Th538vztVdd;
	Tue, 13 Apr 2021 08:50:32 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 08:52:41 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <TheSven73@gmail.com>
CC: <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>, Tian Tao
	<tiantao6@hisilicon.com>
Subject: [PATCH v2] staging: fieldbus: simplify devm_anybuss_host_common_probe
Date: Tue, 13 Apr 2021 08:53:03 +0800
Message-ID: <1618275183-56792-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected

Use devm_add_action_or_reset() instead of devres_alloc() and
devres_add(), which works the same. This will simplify the
code. There is no functional changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
v2: Fix the problem of incorrect pointer assignment in host_release.
---
 drivers/staging/fieldbus/anybuss/host.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
index 549cb7d5..c97df91 100644
--- a/drivers/staging/fieldbus/anybuss/host.c
+++ b/drivers/staging/fieldbus/anybuss/host.c
@@ -1406,32 +1406,26 @@ void anybuss_host_common_remove(struct anybuss_host *host)
 }
 EXPORT_SYMBOL_GPL(anybuss_host_common_remove);
 
-static void host_release(struct device *dev, void *res)
+static void host_release(void *res)
 {
-	struct anybuss_host **dr = res;
-
-	anybuss_host_common_remove(*dr);
+	anybuss_host_common_remove(res);
 }
 
 struct anybuss_host * __must_check
 devm_anybuss_host_common_probe(struct device *dev,
 			       const struct anybuss_ops *ops)
 {
-	struct anybuss_host **dr;
 	struct anybuss_host *host;
-
-	dr = devres_alloc(host_release, sizeof(struct anybuss_host *),
-			  GFP_KERNEL);
-	if (!dr)
-		return ERR_PTR(-ENOMEM);
+	int ret;
 
 	host = anybuss_host_common_probe(dev, ops);
-	if (IS_ERR(host)) {
-		devres_free(dr);
+	if (IS_ERR(host))
 		return host;
-	}
-	*dr = host;
-	devres_add(dev, dr);
+
+	ret = devm_add_action_or_reset(dev, host_release, host);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return host;
 }
 EXPORT_SYMBOL_GPL(devm_anybuss_host_common_probe);
-- 
2.7.4

