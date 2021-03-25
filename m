Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com [59.111.176.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB95F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 08:00:59 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
	by mail-m17637.qiye.163.com (Hmail) with ESMTPA id F0D3B980582;
	Thu, 25 Mar 2021 16:00:56 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wan Jiabing <wanjiabing@vivo.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net
Subject: [PATCH] [v3] drivers: staging: _adapter is declared twice
Date: Thu, 25 Mar 2021 16:00:46 +0800
Message-Id: <20210325080050.861273-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQ0hMTk5DSRoaSkwdVkpNSk1NTkJJTkxJSEJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
	FZT0tIVUpKS0hOT1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxA6Cww6KT8VQz4QIQpJORcx
	OggKCzVVSlVKTUpNTU5CSU5DSE9DVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
	TVVKTklVSk9OVUpDSVlXWQgBWUFKTE9JNwY+
X-HM-Tid: 0a786866974cd992kuwsf0d3b980582

struct _adapter has been declared at 23rd line.
Remove the duplicate.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
Changelog:
v3:
- Delete trailing whitespace.

v2:
- Delete the blank line.
---
 drivers/staging/rtl8712/drv_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8712/drv_types.h b/drivers/staging/rtl8712/drv_types.h
index 0c4325073c63..a44d04effc8b 100644
--- a/drivers/staging/rtl8712/drv_types.h
+++ b/drivers/staging/rtl8712/drv_types.h
@@ -36,8 +36,6 @@ enum _NIC_VERSION {
 	RTL8716_NIC
 };
 
-struct _adapter;
-
 struct	qos_priv	{
 	/* bit mask option: u-apsd, s-apsd, ts, block ack... */
 	unsigned int qos_option;
-- 
2.25.1

