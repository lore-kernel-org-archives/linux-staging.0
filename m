Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4F71FAB
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=b0MMs
	s7QsMlVIzDQCA4Ez6OQ7gh+DTYZigg0JBslxso=; b=MWEDcK3a5nJmAXt/Xadgs
	vujfjpzKTnqtuIgL89DhIyoVYKkEElgqG44TBe6p1nRXMv1DEA8x0Gyr5HYqlfH9
	0GIOy0uDMmiXIpxGFcgN6tIys+Fir9zJrNPpgvSDy86UBiLdq15/Z1DjMZZW76fK
	TYrUejTHXvEmdg0I2oHdTM=
Received: from localhost.localdomain (unknown [116.128.244.169])
	by smtp2 (Coremail) with SMTP id GtxpCgCXGKUhjUJjFCHAjw--.47996S2;
	Sun, 09 Oct 2022 16:58:10 +0800 (CST)
From: Jiangshan Yi <13667453960@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] staging: rtl8192u: fix spelling typo in comment
Date: Sun,  9 Oct 2022 16:57:46 +0800
Message-Id: <20221009085746.3149599-1-13667453960@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GtxpCgCXGKUhjUJjFCHAjw--.47996S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrury3GFWUXr4kJFW3Zw4fZrb_yoW8Jr4DpF
	s7C39rCrWrKF17u3Wjyay8Ary3C34kWrWkKF1j934rXrZ3W3Z7Xrn0yFWjyF43Jr4Fk34a
	vFW09r45Zw4DGrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UGtCcUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: bprtllyxuvjmiwq6il2tof0z/1tbivgKV+1Zce8IfVQAAsr

From: Jiangshan Yi <yijiangshan@kylinos.cn>

Fix spelling typo in comment.

K2ci (Kylin Continuous Integration) is a code pre-verification tool
independently developed by KylinSoft, which is used for ensuring the
code quality of code submission. K2ci includes the comment check tool
notes_check.

This spelling typo was found using notes_check tool.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0a60ef20107c..f6a0992b059b 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -4574,7 +4574,7 @@ static int rtl8192_usb_probe(struct usb_interface *intf,
 	return ret;
 }
 
-/* detach all the work and timer structure declared or inititialize
+/* detach all the work and timer structure declared or initialize
  * in r8192U_init function.
  */
 static void rtl8192_cancel_deferred_work(struct r8192_priv *priv)
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

