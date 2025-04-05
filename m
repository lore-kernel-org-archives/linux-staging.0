Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D081A9B58
	for <linux-staging@lists.linux.dev>; Sat,  5 Apr 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862050; cv=none; b=DV9wso9nlOBcaauIT5i3ZvbC8FWzBdW17TKqdVy9Jq6G4NdqapLmMupZM5jXUPnURdcriuZbglTY24ZCtbyDWhAfkQVPknaycGtYfY85rNoao+tZrJkZ+rXwM34iquJuo8EHLh5zoT5GgmVY70ZfNPI8uOwr4Tfbf8tD9yMgH1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862050; c=relaxed/simple;
	bh=WAzQpWTHGs2knewJBADoVPJrHhiPoULxeRLz7rQjwR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJ0jcFlriaPtxmdDC6EHexlxJ5HskjTnzDD2W8dml9NVBoKaH1OuNRUEZ/QAWVhwkQ+VcIx9+yfEosygVB2pXIe2hc0o/ctRFFOQ5GxScYrNyAbNIehLBEQWstFZ3jtXMLk1vrWW9PmZsgBEov7BaUMQ38I2XWnrxhYCrLP1tbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [221.222.48.127])
	by APP-05 (Coremail) with SMTP id zQCowABnpAwZOfFnQk5GBg--.46821S2;
	Sat, 05 Apr 2025 22:07:23 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3] staging: rtl8723bs: Add error handling for sd_read().
Date: Sat,  5 Apr 2025 22:07:02 +0800
Message-ID: <20250405140703.2419-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABnpAwZOfFnQk5GBg--.46821S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryUuFW8JF4UJF13Jw4UXFb_yoW8JFy5pF
	4kKas0yrW5G3WUu3W7KrWkAr9Yk3yxGFWDGrWqkw4Svrn5ZanavrWFga4jqr4UWry7Gw4Y
	qF10ka15Ww1UGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW5XwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUkwIDUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsDA2fxOIgBMgAAsY

The sdio_read32() calls sd_read(), but does not handle the error if
sd_read() fails. This could lead to subsequent operations processing
invalid data. A proper implementation can be found in sdio_readN().

Add error handling to the sd_read(), ensuring that the memcpy() is
only performed when the read operation is successful.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org # v4.12+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 21e9f1858745..b21fd087c9a0 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 			return SDIO_ERR_VAL32;
 
 		ftaddr &= ~(u16)0x3;
-		sd_read(intfhdl, ftaddr, 8, tmpbuf);
-		memcpy(&le_tmp, tmpbuf + shift, 4);
-		val = le32_to_cpu(le_tmp);
+		val = sd_read(intfhdl, ftaddr, 8, tmpbuf);
+		if (!val) {
+			memcpy(&le_tmp, tmpbuf + shift, 4);
+			val = le32_to_cpu(le_tmp);
+		}
 
 		kfree(tmpbuf);
 	}
-- 
2.42.0.windows.2

