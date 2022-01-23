Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711802CA3
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:03 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mw9Dg-1mJkyj0HMi-00s6tc; Sun, 23 Jan 2022 21:02:57 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 16/18] staging: vchiq_arm: Avoid NULL ptr deref in vchiq_dump_platform_instances
Date: Sun, 23 Jan 2022 21:02:21 +0100
Message-Id: <1642968143-19281-17-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:inD3IDF1RsaZJ4F7mP+NXBsz3e664aWh1V4qJsGDnSxdl44egTs
 fYftljK86KChCmwgAQGLfIHW0WURNdLuJGw54Min2GQqr0ge4hrofjOIh0FCp6xeFhPz1Gr
 DWlQ42c6FJIea3bbpWZ/fHp3IdXF00rLr4JqQTaSUgfyD4YE9kup/a7ThHxtwaVL/d5n/qd
 //OaEMFcgOf3klhraMOlA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rcaeu/VtcrA=:3kR4rCrCrpA3GP/pcvGeI+
 TF1rLDOi+flIaPef86fgpxNkqMpMloLpWTg/sNvbfyqnxtP1cJtQRq8sUTDJGwfG3KGMjfuFU
 u1ZifnzRmFPbSfRnIjBLK/WJYGKDrqld0WjAJqbeoOO3fW8jNeoihFhYqXtErTltq7EZGsL/X
 U/bL832C8sbcuyq6n5r1E9nHQ27/8lDd2kpZTvEv6yYoNFq9s+PE9znoQ3leTRPlkMHT5glLu
 zLB15fd6Ixbh1jCukzqjdYQ7KcP33KsRTn8qYkM6iiSd6AAHc16xhOnNLNsJ/i9+EC/ME7M17
 3dv7jPfvIGGKfQCe4Dw52qqp2gN2v2i44ABZQGzy5z+nP17fMyw/1+v47AruDzZN1B5Fi4vg6
 lJP+wIPjKhlwvfdh7SZq2Y9hwPnTyogMvbvZSmD6y8MsLO9nEFt67JJz3ws2VDjIyqKc7dTEp
 2w2k94j7MAM2QhjJ0bcdygt4VowowpaDmaMBdYDnJ/sqOFvxI609eDqEue2hiXj35dZiOESvN
 z/7UyruFqWXe+X7ZZC82pV6zsXxOlA2ENnJEqCjScYsXUCVlaxpE7p83yrYLV7NTwIbB+2DTY
 fQhOqsVrO3DMe5GOTJa5mEJkQtf3IoIvb+4xaaH5+vWNCpB5ryUEGPOrJKiMQiI75fHpVqA77
 oxgml+7af6PS3ibenuBPHtkDrzJhPAnQ7Rn/FofagGnwLbbbXnShOJCdyxqQZ2f9YT7zlOG5d
 7Fc0IVDV2W2y5z+Q
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

vchiq_get_state() can return a NULL pointer. So handle this cases and
avoid a NULL pointer derefence in vchiq_dump_platform_instances.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6ef8f19..a9b6e4a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1204,6 +1204,9 @@ int vchiq_dump_platform_instances(void *dump_context)
 	int len;
 	int i;
 
+	if (!state)
+		return -ENOTCONN;
+
 	/*
 	 * There is no list of instances, so instead scan all services,
 	 * marking those that have been dumped.
-- 
2.7.4

