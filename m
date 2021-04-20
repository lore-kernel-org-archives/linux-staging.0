Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr [80.12.242.129])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324892F83
	for <linux-staging@lists.linux.dev>; Tue, 20 Apr 2021 12:12:50 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93])
	by mwinf5d66 with ME
	id v05C2400Q21Fzsu0305CQX; Tue, 20 Apr 2021 14:05:13 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 20 Apr 2021 14:05:13 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] staging: octeon: Use 'for_each_child_of_node'
Date: Tue, 20 Apr 2021 14:05:10 +0200
Message-Id: <eaffe388e6c51e97caf3e8fa474de74428575455.1618920182.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'for_each_child_of_node' instead of hand writing it.
This saves a few line of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/octeon/ethernet.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index da7c2cd8ebb8..dcbba9621b21 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -610,14 +610,11 @@ static const struct net_device_ops cvm_oct_pow_netdev_ops = {
 static struct device_node *cvm_oct_of_get_child
 				(const struct device_node *parent, int reg_val)
 {
-	struct device_node *node = NULL;
-	int size;
+	struct device_node *node;
 	const __be32 *addr;
+	int size;
 
-	for (;;) {
-		node = of_get_next_child(parent, node);
-		if (!node)
-			break;
+	for_each_child_of_node(parent, node) {
 		addr = of_get_property(node, "reg", &size);
 		if (addr && (be32_to_cpu(*addr) == reg_val))
 			break;
-- 
2.27.0

