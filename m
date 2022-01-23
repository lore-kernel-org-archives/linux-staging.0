Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902E2CBB
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:03 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MryCb-1mWYtA1W57-00ny0f; Sun, 23 Jan 2022 21:02:57 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 17/18] staging: vchiq_core: handle NULL result of find_service_by_handle
Date: Sun, 23 Jan 2022 21:02:22 +0100
Message-Id: <1642968143-19281-18-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:w/XLKvjMVnFuD8OdFtagVULetkfVksmETT85kQ3DK2e05KCjff7
 JIlS8pIrwOKjwlo/AC/ZmLe+SNGgQosPa4x4UZrjBf9kvDbdzWOjChYcPHROFtbxrMJct0M
 87VCtdxeccd13/yvxn0rbsT+Sv/wLFX1s1xilbsBSGv8NX6czCxgQLXbk4GsKHyYbKrQh1R
 uQaO30ZwC73Ificrk2JmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nVnWNJi7lmA=:NjRnyBuCfP9TBZpLQXUtV4
 aHXqiGb7m4pj6MxTlfuAK+nnuOtd943E63+3dXqwRhUYF5quL+gFicrXY+4HFZS+mDfPCgahg
 +HZ7Zfq3kP1d57yefsHClIQEKGMfQ+gc2S9sDcRdsCyCw5SWTakamBAsORU2JkJv1Nu7qE4JX
 ftQ/yc4ivin7qIzAKdbQb9H4WBm0RpRU9L+qHdw5FUTA5+Su/2bJufsfvzKKVTNeFLRbMToQV
 LxVAgQEh8PHtJbn7CAfeK685nlnnLhVZknx3yGNtoOZYSMxaAke3UsvWlahXIFAyZzh9XEamJ
 XzN0SzTRV19j6drxD7wm5llI4zDXaLgI+f32bp8GRlL4qZ3zEeGv5NT9ajcUPxL7N9qvxBDJ4
 ZDWCu71zKJxRUc4pasHOMAcirhgglu07v08Hfpiezt7S0f0A9ZIIqgFTBWlehZGr6ehMAVJwf
 0CxSpbHnFdwCT4XG6jBctrEDbcLPvbORCLYIJDvrzdsVj3l65fj6860vz9B9kIUXnm19MNoem
 //ZufzDmcbNAV33fNIt6s60b2veYYzDaIJ6wi6kp6+yd3+zkm7Phc1Nar18DMfMSDdGGRGEke
 W4ey1Co7MEmD054CmtXq6ChiBTp34SCyHM5ROgu1lPfsV9Xtrg5CteuOWnIQzSyxaDuxoYcPD
 DtPVXamoxkdKoy3z1l70kFF9gx/z6DgAn1rtLe/Xj4VXuSaqyod2UVl0P6djraP5YNLFnd1Jn
 YeNdlBCM5Uw4s94c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

In case of an invalid handle the function find_servive_by_handle
returns NULL. So take care of this and avoid a NULL pointer dereference.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index b32cd12..8f99272 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2292,6 +2292,9 @@ void vchiq_msg_queue_push(unsigned int handle, struct vchiq_header *header)
 	struct vchiq_service *service = find_service_by_handle(handle);
 	int pos;
 
+	if (!service)
+		return;
+
 	while (service->msg_queue_write == service->msg_queue_read +
 		VCHIQ_MAX_SLOTS) {
 		if (wait_for_completion_interruptible(&service->msg_queue_pop))
@@ -2312,6 +2315,9 @@ struct vchiq_header *vchiq_msg_hold(unsigned int handle)
 	struct vchiq_header *header;
 	int pos;
 
+	if (!service)
+		return NULL;
+
 	if (service->msg_queue_write == service->msg_queue_read)
 		return NULL;
 
-- 
2.7.4

