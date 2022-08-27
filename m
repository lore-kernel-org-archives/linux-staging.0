Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600B7C
	for <linux-staging@lists.linux.dev>; Sat, 27 Aug 2022 16:47:00 +0000 (UTC)
X-QQ-mid: bizesmtp77t1661618800t73ozg1x
Received: from localhost.localdomain ( [182.148.13.26])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Aug 2022 00:46:32 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: 7eMeDS5LHEbiHJSsAFdEgcyqheNAdPRP0MJT8SooaTM6gMOb+CVtND3PJdTfD
	j7prpqfHx9Nw3Du3rRWe06NTmwgubAEaxPX5lxE2jOVEf7YK6hXi9uUZXHU1RXPtw5D8PG/
	uBsu0OrNwUK3VLx+RTlb/SgaGZ5bFb+1U9djCzsZgBZhFmZim+bx6UkhR3YtEg8+Ilpm95A
	bjEJAbuM3r+G6UcrvqH8ZqEnQoLue/nkO23bKSoN1Klp+Z1EKSfLKRlrlZNBVkTulSzv/5E
	EC9Muc3/G31vwITFWPX+/sU1XikSqjChmvT/ryQ0Ab4Ox9L6kBlwm4ZJ+ZPcszfS11b0PyM
	AwQzXfCS65iQ5tStrAxe4Wutvz5Sg16X537ZPqOcUAOC1k/5XMw1L7aSizYlA==
X-QQ-GoodBg: 0
From: Shaomin Deng <dengshaomin@cdjrlc.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH] staging: r8188eu: Delete unneeded variable
Date: Sat, 27 Aug 2022 12:46:31 -0400
Message-Id: <20220827164631.26448-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4

The variable "ret" is unused except return, so return "0" will be okay.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 047e9c7d38c3..5f309739b493 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2989,8 +2989,6 @@ static int rtw_p2p_set(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
-
 	if (!memcmp(extra, "enable =", 7)) {
 		rtw_wext_p2p_enable(dev, info, wrqu, &extra[7]);
 	} else if (!memcmp(extra, "setDN =", 6)) {
@@ -3037,7 +3035,7 @@ static int rtw_p2p_set(struct net_device *dev,
 		rtw_p2p_set_persistent(dev, info, wrqu, &extra[11]);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_get2(struct net_device *dev,
-- 
2.35.1

