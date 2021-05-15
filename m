Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D772FBB
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:25 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MtwlO-1lTt5R3Klo-00uLcw; Sat, 15 May 2021 21:11:21 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 15/20] staging: vchiq_core: fix comment in vchiq_shutdown_internal
Date: Sat, 15 May 2021 21:10:54 +0200
Message-Id: <1621105859-30215-16-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:QXG6Q0+LsC7yEfn0qHPPM7pP3yZbAHlvUtG3flxeml+D2GeBYnO
 foniusyeoAUp4AgxP2O03UvLKHuDbj2sVx51B+LtEyHn143cRZC9oWuMcZLCsvk7tdK7cCl
 EhBDjaf88aFIp3s7XcF8X3g3nq2Tr5OpSKH0jGEC15pHC3Ew699K2TROFELNLwQk2DuXjog
 yaeq93mavXsQPvYAnBeDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4HHpW/fQNiM=:j4u8syC5MF97SBI6QAdyOZ
 pgaxKHBP2g6qRa9nAICf5w0EkX5XOWN0qDOIUanIvLhkg7KbJVpcVcvoBkwbCmiC7yOzdOUAh
 HQnIU05hWA7Vo4cS9eGo6Gr2gb1kpIAy5cCdJzgbSWaYi7kNPLxFr6+AWd5KTvGIuzg6XbxZy
 Cf6nwSfL+D+TMIedK8hMRmMsJG6RstessjdTTFo1vPpqYn3106znDsLAOEw5D3gFjYzpLvJd2
 EinreFCnm4B95G45sHJbc2Aa+MoAAavPCVgjMvBfJL9xnlkUAS6EzwaSkpGyCeIkS7cMSYXzJ
 40PjunuvvJ2R53srtZRokkmxhdv2Z1OEdTavRAPt8PHA0uJv1R1Bin6wSZ90XvC/4GWeLcHKt
 ya60FYmAnw8Yr6v65udGqRIz+GVtuWFUhy75QLzj3Yriv7ODW/TPmKL/x7K7lzo4OYD0FQ2Un
 TnMfcPTOIALvRNS8RpZh7yiDujXVC46YCukBnYWCGYMuYi5DceKqrpscgMvN+slqbeaa+ivB3
 jVVBjfbvDmc8ResjJkV3fo=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The comment seems to be copied from vchiq_connect_internal(). So change
it to match the actual behavior.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2ac3545..1174715 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2928,7 +2928,7 @@ vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instan
 	struct vchiq_service *service;
 	int i;
 
-	/* Find all services registered to this client and enable them. */
+	/* Find all services registered to this client and remove them. */
 	i = 0;
 	while ((service = next_service_by_instance(state, instance,
 		&i)) !=	NULL) {
-- 
2.7.4

