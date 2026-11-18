Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.87.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017709;
	b=N9hnTCipSF2eCKATemoP23QUcBs7KXBV1eRhlXqwlqThTiK1y1Pt3hglOKntDkKSBMMr
	 QaFFElSzda6e1crs0hBTs46o3cQPfjzth1Vzp4rDKiBbi+rrp9eO/XNa5WPur3wglF4AD
	 v9KlWW4gZwUL9ji8YlAx7KeFRBtfUD6h64LBsunPNXGbh+DCH+VokxrQW/zlWAfB5IXYL
	 yDKEb852gC7XpnNIfVQEUEqBx7ZlxQlSnLVqq2g5HXSoNMo2YeBU1wWQXZ2JoIpcCMnfe
	 UBYjFwcNJhj4USKs/zhYlT4K8/FIP82vp1ndR1YaZpIJL7Hq+fgPIuPof1rDa01Kxfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017709;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=J4x7vG2kgvMTwSisv2CKrXIxEnzvTohn05JwlURcXCo=;
	b=X5rMZ08HMyDy74tKSfLlgvLX/aBiwgWvcGXRNvTtKFykeZGc0RjDJvVFwK2ceACSESFz
	 kWXaLbtGYrHwy7NC64V/k1Bxvnhh6+nHxgeOmCS72ZDiG3T9mHHaEBRklnaN8e1tWQDB3
	 kHyEI9fClW+RsZVdNtK+ZhYousNtUjBuo/v+r9k7nMmVrAupUcIHljqJSF2OWifPBvET2
	 oMrTqgKULf61c4RORyiKiAQjVC0rpH27Dd9LOjC5HDpoRot2aow2bIHZSXe6f0Ff1bF3u
	 LucUaLs3xBf3eutzHUZXPrEYkYSyRxI6zX57UvCxE+ba5aW7Pp3Rhu21HQSh+VCvbTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Ne4oErZJ;
	arc=none smtp.remote-ip=57.103.87.225
Received: from outbound.qs.icloud.com (qs-2002j-snip4-4.eps.apple.com [57.103.87.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB6606A325
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 16:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DB6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Ne4oErZJ
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPS id BD27C18001F4;
	Wed, 18 Nov 2026 16:01:46 +0000 (UTC)
X-ICL-RepId: 01a1ef64-8cc4-787a-a372-8a9489bfca27
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1795017707; x=1826553707; bh=J4x7vG2kgvMTwSisv2CKrXIxEnzvTohn05JwlURcXCo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Ne4oErZJVllgniKkEZqqeI3i5oHtxbwR0j3gnBM1iBbaS3WOZouB/hu3ZSwm/j1hjDycLHzd8wrpjFvdYEM03ViPfDgwX/DKACt+w4B8uh8BJXwRJhYsj7fsI15O/6snbJjEOZQhJkGPgAXlS4Uz/7cn8DEtdC9pg5XHQHdwcK8pV+pNwvPIS95Q1LyqbhpgvpEBnrXq56P8Vvbls8ef7ynozAj8+xdIGd7YF7x7PNLEamFcy3NZws6WA7wgc3gZY4VpLpp7FDtuUV5S6V9brHlgGma5tYhMqcwtgm5HCdzcfB/1pc2GskVx3C6mbvDN0DCzjuKbvamOz5h/YAxHoA==
Received: from archlinux (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-3 (Postfix) with ESMTPSA id 5BD481817E9A;
	Wed, 18 Nov 2026 16:01:45 +0000 (UTC)
From: Philipp Prell <philipp.prell@icloud.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Prell <philipp.prell@icloud.com>
Subject: [PATCH] staging: greybus: uart: convert from IDR to XArray
Date: Wed, 18 Nov 2026 17:01:41 +0100
Message-ID: <20261118160141.341572-1-philipp.prell@icloud.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MyBTYWx0ZWRfX2VVr9tfHB6WA
 xPjjeTs8LLrbOlq1VpzCatu+xX72uu8saRICRC5F8wrfmt9wrFW0HmcISCSTm7CNOtHZo3ybmn7
 PuGEKpfVvZBhkgkUv2JSo4h1k9wjBLw=
X-Proofpoint-GUID: zpouYMdnh7fsXqy3pQeu1wojZ1_-jmPP
X-Proofpoint-ORIG-GUID: zpouYMdnh7fsXqy3pQeu1wojZ1_-jmPP
X-Authority-Info-Out: v=2.4 cv=b5QncdGx c=1 sm=1 tr=0 ts=6afdcbeb
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=BXpT7KiN_MIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kibvr5HLtuNvmma_iept:22
 a=EmTZQha9bAnfYDchpHGQ:22 a=v3ZZPjhaAAAA:8 a=159dhF2HwaxKWhnN5oEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MyBTYWx0ZWRfXxeBgeLv0fVcX
 oUlXFMAIP/y11rtSG9oNtvT6UrD81fmBubkKDW7Iawn3l+DhLq+QQ/bjdTm3xCT3EZaqzBnbUZn
 +gTqCc1GGWpQAMhq41ol7JLgbBck414wYR9S4pyQh8oFxLDpobxxRvUr6uYUq00FAH/kVjWcKIF
 80IbBaGDtKYO0vVnxwx175XXk0F8yaBwB8HwGyXIbnjs7kRDhvMdSd3Jj+SN/zjuItAWkE3QRPK
 vKPFAifDy15OhwTNEwdYgLRZsEQXbQL5Q5P8z3thEb4Aj6YuYqn9Rk0jccwKUk3hqphkPhcFD6L
 MWIkCwxa/zUeFzGx5xbod9DbSlD3cyToFf7+YiDhAufIXce5MrYPW0vpQVslDo=
X-JNJ: AAAAAAABy/kXVw5OtEtl1t3Kimj6KzQPlcY5KEyITMdpz7aVa9LhprsjjjbBaJnyniA1U6
 IZgvKKJ8U6ccqv8FPE4ixUvZgTNGcvEqJSjcv8Z0+nktYfC2ytqsVlM0ypbiAASR6lSaCo
 xmNnjqbi+fUMyE5LuhZvoML/a1S279a+VKc5koQDy302i+Jk26jQbbVXhWZYozJZdR4A5s
 l10gON4+CDhDyGi8GQFP5TamqCaHoVl7dGXuFUA3jm2ELEI28UC/xT/6SwMieMYxH4JCwm
 p3Ol5xPXWjEm5yvbluxVATHLotRUE5oJC6iR2c3WyRFK5DnduQyLWw2aeJa4DjZeb6H1Tr
 MyX3jWztueIxYL2PE810tSJfhiihx0W2qvzHN9N437OHXePSz727AVf7T1QykcRCRk4NFy
 qX4igZ7GO8PddOl0HQS4eo2AT1UMmmTUniPLD+wi0Dzr2waHjc1YOVDC6RqTVVwQOMr8mZ
 lOeuDUYqeIJimJ2h4/E8eFkZiXbkmLUTw6ygidWQEvc37SsiFjcv7dHY2OfMo5lkZwFghx
 TrlG/mT97EjUgjVdKgfTqAj1tHCbdPWYe1/bd+TQOXalhXJeOfo14Ua7KSHuZv1mveuHAD
 +C5/jcpozzuufB4vJCRkSNY6JJKH+uPQVEOQIkbFKkMLqnWSTac3C/i/SynMUr38/V8bwr
 3txfCmw7CfVe3ins/1DWtmZF57YjxiGWj3YY57kUDYomzjqupkxL26VvjBlAD6uZHzHOc1
 PK47MImPWD3MOG5eCtEj94S+hHfy7T4UuNvdVX7tTdOtSROhaF/IpqEQfL69tyExhG1+it
 AFZRu8OXprL2KPt5zNwMzDbUJUbTsjm2WHNMa2xpJNMPmQqzZ3qEVCei12saltwOv6HD+1
 QuPx6UD2hJAn4rbMKvvhF5IgJORZebpSRDVkORq7engF4VoNBSG/veVigMHRuCPSF7nu/L
 5ZonatHE436ZU0ieIJp942su+fVY9zyuMOR61O7iWfIeIv643fuZ+lRyBW8GqI0ntpWc+9
 ghU+pRde7JOW7Ob3KA71GvCDDNXiGr1c4PWcPxD7tjXvxLElc3XYX8uIDnoWNQFh4T+ay5
 6gzp3qkKJJ1AmUN+o0MI9H+xn16cqC/5f6jwaAXIue66vc9kCtgssivU/vKi6pQPHIBEtj
 KNPRxWBGy7ZG+NgVVttJ9dZUGHsVswazooOoq3f2Wcaapiis9Bf6hTA/xNoJqWR04Jr8l1
 Pv7GRh1eFBSz12kXQFRmqGpjw6r9KWm5KK7uynXN76Ua7OOdJpRfVA+pEC96PnsqoOBr

The IDR API is deprecated in favour of XArray, see
Documentation/core-api/idr.rst. Convert the
minor table accordingly.

XA_LIMIT is inclusive, so the upper bound becomes
GB_NUM_MINORS - 1 in alloc_minor(). xa_alloc()
returns -EBUSY instead of -ENOSPC when full;
adjust the check in gb_uart_probe().

table_lock is kept: it prevents the entry from
being freed, while get_gb_by_minor() uses it,
whereas the XArray lock only protects the array
itself.

Signed-off-by: Philipp Prell <philipp.prell@icloud.com>
---
Compile-tested only (W=1, C=1); I do not have the Greybus hardware.

An AI assistant (Claude) was used to review my changes and to point
out bugs in earlier drafts and to help with the wording of the commit message.
The code changes were written by me.

 drivers/staging/greybus/uart.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a17c..ff33991562f5 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
@@ -66,7 +66,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -341,7 +341,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -358,13 +358,18 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	u32 minor;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+
+	if (ret)
+		return ret;
+
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -374,7 +379,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -860,7 +865,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 
 	minor = alloc_minor(gb_tty);
 	if (minor < 0) {
-		if (minor == -ENOSPC) {
+		if (minor == -EBUSY) {
 			dev_err(&gbphy_dev->dev,
 				"no more free minor numbers\n");
 			retval = -ENODEV;
@@ -991,7 +996,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

