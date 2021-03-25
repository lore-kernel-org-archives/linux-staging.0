Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com [59.111.176.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1EA5F
	for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 07:43:04 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
	by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 7021C9804CC;
	Thu, 25 Mar 2021 15:42:57 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wan Jiabing <wanjiabing@vivo.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net
Subject: [PATCH] [v2] drivers: staging: _adapter is declared twice
Date: Thu, 25 Mar 2021 15:41:47 +0800
Message-Id: <20210325074150.860167-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQ0hPHh1ISklITEJJVkpNSk1NTkNKTExMT09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
	FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhA6Sgw5PT8cQz4LSQ02LCk1
	SAtPCgtVSlVKTUpNTU5DSkxDTU1MVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
	TVVKTklVSk9OVUpDSVlXWQgBWUFKTU5MNwY+
X-HM-Tid: 0a7868561e6bd992kuws7021c9804cc

struct _adapter has been declared at 23rd line. 
Remove the duplicate.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
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

