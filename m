Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D423CC
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1647362831;
	bh=SpliapCVlfa+D7lo3BSKvVkGgWUYrJC2HluZ0dliScA=;
	h=From:To:Cc:Subject:Date;
	b=tnByPbq9Hi0mA1JP8rQNbJ79mQpw4K2NTCL1ty5Z3S5mUbN1uJcMkhNkhfVPh5yCJ
	 RSEFKjMSr4ppl8GjVpVn5JLl2z81R0KDvnOiZJgxmRJMVA4IzfaPKgFLpqRZHNVUBt
	 v3Pk/W/mP0dqSngWaWArGI78kJgUkFpwthQaRYzw=
Received: from localhost.localdomain ([43.227.138.48])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 9E6B06D9; Wed, 16 Mar 2022 00:39:38 +0800
X-QQ-mid: xmsmtpt1647362378te3kqnwz3
Message-ID: <tencent_7A338FE792721C51E887BB2A8DFC0B815C0A@qq.com>
X-QQ-XMAILINFO: MyHh0PQai9FptZrresos5TGYovrAI+b46m/OEFalwsYWPXYAt4CGzqGpH4qHzf
	 2gZ+SVmeOSV+UivL+Bfa4Ikq2zTwtG+Z97smM5IdHLqkcNd+luPBz0Yb+eYpR7i0DFS3jCwESFsR
	 m5tFS9SuWgxRbyJsQuBbym8kuCs7Cpwz3dW7XyK4yzc1hjTNFGwpRT25qBuMBFNIgOtrk4x/1Vsb
	 ZfE4+seSM2vdiI69P51oSn4a0ocKVw44nJZgWtBWyrgbUzNerW7mhuNXY+QT+5f2oYZEBwq3FZtD
	 hCJvQW7bb4mUKYry0ovwXK5UQO7v5NPbyHKtKFT0otiVgsp5TVOn4NO6snyt/0CkyDoFhfmgZw3U
	 6VK/Y0i6M5mbbfP70ZKhA5/7pCMXmZfs02vRHzEkqv2HOW5Zt3FnQ8+UlATL0O648en5Id8H69pv
	 42PRteqSxGASRIo9+7RB3ZJOgt+rEuhz01U9Mm17pZdCeSWvAmplhxrw9KbykJTmsK1Q8dBBFUD4
	 t0FuTeXnxskrXnGqAOueZRCQRoRnYrM/vnxqNRCLEeo1dIE9noBWe60UBs/AT+D0E+Dw/xODQ3by
	 rN8ZQrtJpAJv3F6DXS5r02PiyqzoOdET3nEE7ksHV3DYjAMtniHgvCHgPqmtnl/BvC/zwZbbuG1C
	 /Weayy7PbYKZwaExiDThhLoiardMm2W56CGXKv6dZQgj1yM5W9M+a7b9L61E0D1WFFvUHjzYec8t
	 pNpZkzrB188Jj76LomGTLX6/I/0HqURM7XhpmTpapQ3gWHOs/wLpVBsDiHQkA55vH7Z16TxDs/L2
	 KVEUi1MmCoPBqc00STWVF+RDT2cCAdiF2uT1AA0W0wjo4ycMmGQ0JNtKdbw6Ih4B9v+IIsqsq2yo
	 2SHgxsLj0g+7SV+nMKJF0r7lWIVVCh29/UM8db5wANkZQ5ci1FFOnBS1KmqiukFGmurUnR3Cr3
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
Subject: [PATCH v3] staging: mmal-vchiq: add a check for the return of vmalloc()
Date: Wed, 16 Mar 2022 00:39:13 +0800
X-OQ-MSGID: <20220315163913.878-1-xkernel.wang@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

vmalloc() is a memory allocation API which can return NULL when some
internal memory errors happen. So it is better to check the return
value of it to catch the error in time.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 jump to the proper location and remove redundant instruction.
v2->v3 fix the mistake bring by version 2.
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 76d3f03..24cc0fe 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1909,6 +1909,10 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 	mutex_init(&instance->vchiq_mutex);
 
 	instance->bulk_scratch = vmalloc(PAGE_SIZE);
+	if (!instance->bulk_scratch) {
+		err = -ENOMEM;
+		goto err_free_instance;
+	}
 	instance->vchiq_instance = vchiq_instance;
 
 	mutex_init(&instance->context_map_lock);
@@ -1940,6 +1944,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 	destroy_workqueue(instance->bulk_wq);
 err_free:
 	vfree(instance->bulk_scratch);
+err_free_instance:
 	kfree(instance);
 err_shutdown_vchiq:
 	vchiq_shutdown(vchiq_instance);
-- 
