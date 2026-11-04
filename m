Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758484;
	b=NcShwknN4ZcQJN3k5eRT/B4PiwfIky7UfD5ajNv+0ozVSslDLN/H1SpgWTqEpmokVWh7
	 wTmx6I5kIenZbS4SriCGDU9KIc9bNq0ej74V01kAFEaG2AaJyN5uXqYwWJvzGfcBT4JNA
	 hPHU8HD4znLDhRI2zgt8O4g4n6fU4oohEsiqLJJhhx1md5ugZFIBteKj6ZTuoXRqCGK63
	 329xGYFpgZGDzv6AH6S+YuAbW7IIJgEGjS+9OSF/pCXTU2sHaDx89YHnA4dDxFQoDoGbx
	 B2y7TJi3m1VM/ZuqwrdRWv5NG3BihQLuuZHOPhKqsSHKxK5MPL/PqB4+5mg9pMzv+pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758484;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=7ce1f3+NVT/2DmrT9qST+VFvQOlRL9d+rVa22I17lO8=;
	b=yotCLOTjqP/2Iv4rDUFpPpUQO38+e4a/ZTD0WAgrg3Xh+2ob1UekiKW0tSRilxtjbQ+E
	 YNAfZ3GNTA5xAFcfmNL0si+Iuqdv6Bop0IC0KMp3X4pMf8zA/8eVR1oVamjlPtmDE5t5c
	 9ocAsFNVPk4KKgW3NrujxqBNhfENGbejSleo/gbSFF+6R3pGD3nIIrLFJvmZyBT7p7kSR
	 PTrqnmmm8Z/zNzMRi9H7YU9Zv2/Zs1wHr6pmgGV3N/Ulj2Fdp1Nx80ovAFcbqDwhBr0rG
	 HeEx35kN5z7HPDioPvntROTRA8CgAwwDWykNiXiidm3Vz/0OnElrz0AOZEAYNbbFVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB6D606A338
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 02:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB6D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADH7vgRlepq2nU+AA--.9520S2;
	Wed, 04 Nov 2026 10:14:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: octeon: release the port device node in cvm_oct_probe
Date: Wed,  4 Nov 2026 02:14:50 +0000
Message-Id: <20261104021450.1468423-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADH7vgRlepq2nU+AA--.9520S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWfAF1DuFyrCF43Aw1UJrb_yoW8Cw4kpw
	4jkas8ur9YgF1xGFn2q3WUZF90ya1xtrWrC3ZrGw4I9w1rJry8XFW0qFW5Wa45tFWrt345
	tr1Fyas7uay8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5EQ6tUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUBA2rqY-m4NAAAsI

cvm_oct_probe() looks up the device node of every port with
cvm_oct_node_for_port(), which walks the children with
for_each_child_of_node() and therefore returns the node with an
incremented reference count.  The reference is stored in
priv->of_node and used for the lifetime of the net_device, but it is
never dropped: both probe error paths free the net_device without
releasing the node, and cvm_oct_remove_device() does the same on
unbind.  Each failed or torn down port therefore keeps its device node
referenced forever.

Add the missing of_node_put() in the two probe error paths and in
cvm_oct_remove_device(), which also covers the error cleanup done after
the ports have been registered.  of_node_put() accepts the NULL node of
the POW device.

Fixes: 422d97b8b05e ("Revert "staging: octeon: delete driver"")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/staging/octeon/ethernet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..bba46127ef9d 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -114,6 +114,7 @@ static void cvm_oct_remove_device(int port)
 
 		cvm_oct_tx_shutdown_dev(dev);
 		unregister_netdev(dev);
+		of_node_put(priv->of_node);
 		free_netdev(dev);
 		cvm_oct_device[port] = NULL;
 	}
@@ -919,10 +920,12 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			}
 
 			if (!dev->netdev_ops) {
+				of_node_put(priv->of_node);
 				free_netdev(dev);
 			} else if (register_netdev(dev) < 0) {
 				netdev_err(dev, "Failed to register ethernet device for interface %d, port %d\n",
 					   interface, priv->port);
+				of_node_put(priv->of_node);
 				free_netdev(dev);
 			} else {
 				cvm_oct_device[priv->port] = dev;
-- 
2.34.1

