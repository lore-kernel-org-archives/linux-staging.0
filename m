Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDE23CC
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 17:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1647365531;
	bh=8Dq3UHkiF8sKrd4rL50cJdnD1RwPcpD+6IhqnTkCDWc=;
	h=From:To:Cc:Subject:Date;
	b=Hi9oRUIytb0PC2VZ+QacQfKcu1HrdceNlOwLRb4kokw+scoyppVguDejXNiAkjAD+
	 yrL7kXE1sR0KlSt/xL6hf9dNnxVhCH4T9V8DAfzkBXvrGjUCTigEnptUpaZ06W86HG
	 cCEWtdQRoyHWAMCf61zNY/HKIuLjOOKr5hqdKdW4=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrszb7.qq.com (NewEsmtp) with SMTP
	id 61E19C3B; Wed, 16 Mar 2022 01:24:30 +0800
X-QQ-mid: xmsmtpt1647365070ty68a8iup
Message-ID: <tencent_F721901366AB5C720E008AF7F02DA5D3FF07@qq.com>
X-QQ-XMAILINFO: MyirvGjpKb1jQdcb8Zmu3PrYNR/0MQcRhpCOvUEuVfJxKw4fIwFXfZXYjfqlHU
	 twfs+UBPOw70nFBIBCOG8t0WK/dNeP3RlSbypp2XIntvVKB6RJNfs0w0tyRisMcQtInPC275fg3h
	 by3Yk0sfCzSdxjeiiNs48kp8VW+HW+b1G83RyK6VGUxVoOBLLLivQ/f+kvtQjuwO88YQJba5zJEY
	 /GGUJJvuF/nfiyhpeS4Uf6lF/A9PkXIVCYufTbdjRGQWXQdqsIO8jyIODupCGixUpPzZaLtL4Edc
	 UawjL+6m6oVibUSVOXYLk60WccIHvs9CZRf9djySUCZyayGZFi11/rQGmWmWnYv1gTgliCiso9j2
	 BDFfPm5UQlhb1xDVnEA0YyXwBGaHKogkby7PvXfERFEZP1ghxEWrZt7/K8C3+jF1+Ue0uAxgvm0d
	 aXkM22Dif/6dZGXK3CQnt439wWuzshxXih8LrNTyQcnT1a1vG5L5hY2JBON2sOSvc2gKKEHSCzRd
	 UpoO9xucGwNJZETdF7CGwjb6I6IFR6fdxHGthqQRoGJIKQ1YNY9u8+KTQAJQ/UJrSgei8cC5Fbs0
	 WMrKwhE5eWolYdQKDIFburkfbkz2SNlIg/iCisDsj9qx3LIaOx1W1ra/Stjp/ULYO0iWt1JigmzU
	 Gpsv//ZEJnfZgHXS8CXz1zJPVITpCE93FKO3cVmGJRBrHOQOWHLoZhEeqKdVgINSxYdYNmhljkT9
	 Lm/QwEIJgvvkVuWhTUXEaKZPIRmtWcbvdD1uKyjkztb1kTsSK1vc/XlYMfxu8nv55q8Ye+oiBTl2
	 qKy6TJZK2hAx13Dh4jHAkEdm8UZqkm1/1WhQQF2hEWs5EUV+PQNdGo5W7iTVrje258DV/5+GbPCC
	 /4LDOJ4fTJoOsdzT0lgStw1IKTCUWceLOuK+lm//hVxfKDJJgqK5Ql13ke6b5dfU06XdLoDRJC
From: xkernel.wang@foxmail.com
To: gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com,
	nsaenz@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH] staging: mmal-vchiq: clear redundant item named bulk_scratch
Date: Wed, 16 Mar 2022 01:24:12 +0800
X-OQ-MSGID: <20220315172412.1024-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

bulk_scratch is not used anywhere and the original allocation of it
does not have proper check.
Deleting it directly seems to be a good choice.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 76d3f03..6615c7a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -168,9 +168,6 @@ struct vchiq_mmal_instance {
 	/* ensure serialised access to service */
 	struct mutex vchiq_mutex;
 
-	/* vmalloc page to receive scratch bulk xfers into */
-	void *bulk_scratch;
-
 	struct idr context_map;
 	/* protect accesses to context_map */
 	struct mutex context_map_lock;
@@ -1847,8 +1844,6 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 	flush_workqueue(instance->bulk_wq);
 	destroy_workqueue(instance->bulk_wq);
 
-	vfree(instance->bulk_scratch);
-
 	idr_destroy(&instance->context_map);
 
 	kfree(instance);
@@ -1908,7 +1903,6 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 
 	mutex_init(&instance->vchiq_mutex);
 
-	instance->bulk_scratch = vmalloc(PAGE_SIZE);
 	instance->vchiq_instance = vchiq_instance;
 
 	mutex_init(&instance->context_map_lock);
@@ -1939,7 +1933,6 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 	vchiq_close_service(instance->service_handle);
 	destroy_workqueue(instance->bulk_wq);
 err_free:
-	vfree(instance->bulk_scratch);
 	kfree(instance);
 err_shutdown_vchiq:
 	vchiq_shutdown(vchiq_instance);
-- 
