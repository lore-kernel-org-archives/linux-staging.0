Received: from smtpbg587.qq.com (smtpbg128.qq.com [106.55.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E102C82
	for <linux-staging@lists.linux.dev>; Sat, 11 Dec 2021 09:18:04 +0000 (UTC)
X-QQ-mid: bizesmtp34t1639214194t6xo5mdq
Received: from localhost.localdomain (unknown [182.132.179.213])
	by esmtp6.qq.com (ESMTP) with 
	id ; Sat, 11 Dec 2021 17:16:33 +0800 (CST)
X-QQ-SSF: 01000000008000D0H000B00A0000000
X-QQ-FEAT: qwt6al2KEqgevBLvWz99rmooOb53MQZxBbMK7rtCrMtOnVMfa7T+nQ3TMI0cd
	+bUYd3eJzCbTVQtOouTdfOJI05DC9zRgvXUwebrbtmjRqJZR5kK+IkGMjQPkhgPDK7FFE7c
	OEXtIvyF/XL8osLqWzgBo4Guy7pCUVGw7U4RkbiWQP6C6hd6mE3kSJ8ewTZI73BPHxgJ+8q
	i41sDiL1Uc7TNj1w6PzM+12fgJs5wuFyihX4Q4SNQJ7qc/EwwB9MJCyhUHUAjQdg9/3HX2Q
	g/RwQSI3HHD9VRhHY0S+PZ7YSIc/bHshE8Y6NTXglcT/zJIbgxDznbR+QPfKcb7gSiVsENi
	8E5vOC1b4c1NQ6l04+HFKia9yF1PcV/iBW92Km4SsXg6n1/QFw=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	arnd@arndb.de,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] staging: rtl8723bs: fix typo in a comment
Date: Sat, 11 Dec 2021 17:16:32 +0800
Message-Id: <20211211091632.264035-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam5

The double `for' in the comment in line 2203 is repeated. Remove one
of them from the comment.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 0868f56e2979..5157b5b12597 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2200,7 +2200,7 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		memcpy(src_mac_addr, dot11_hdr->addr2, sizeof(src_mac_addr));
 
 		/* Skip the 802.11 header, QoS (if any) and SNAP, but leave spaces for
-		 * for two MAC addresses
+		 * two MAC addresses
 		 */
 		skb_pull(skb, dot11_hdr_len + qos_len + snap_len - sizeof(src_mac_addr) * 2);
 		pdata = (unsigned char *)skb->data;
-- 
2.34.1

