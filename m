Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com [115.236.121.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73A70
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 12:18:25 +0000 (UTC)
Received: from Wanjb.localdomain (unknown [36.152.145.182])
	by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 75D2EAC0D52;
	Tue, 18 May 2021 20:18:21 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Baidyanath Kundu <kundubaidya99@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiabing Wan <kael_w@yeah.net>,
	Wan Jiabing <wanjiabing@vivo.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vc04_services: fix a whitespace coding style issue
Date: Tue, 18 May 2021 20:17:33 +0800
Message-Id: <20210518121735.88767-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZGh8dHlZMH05NTU1PGklIGUxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Pyo4Kz8NLysfQxMuTkMp
	LzgwCxRVSlVKTUlKSE9LSEtJSk9KVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
	TVVKTklVSk9OVUpDSVlXWQgBWUFJT0tLNwY+
X-HM-Tid: 0a797f69a9bcb039kuuu75d2eac0d52

From: Jiabing Wan <kael_w@yeah.net>

Fixing the following checkpatch warning:
WARNING: please, no spaces at the start of a line

Signed-off-by: Jiabing Wan <kael_w@yeah.net>
---
 drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index fefc664eefcf..81db7fb76d6d 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -104,7 +104,7 @@ extern enum vchiq_status vchiq_bulk_receive(unsigned int service,
 	enum vchiq_bulk_mode mode);
 extern void *vchiq_get_service_userdata(unsigned int service);
 extern enum vchiq_status vchiq_get_peer_version(unsigned int handle,
-      short *peer_version);
+	short *peer_version);
 extern struct vchiq_header *vchiq_msg_hold(unsigned int handle);
 
 #endif /* VCHIQ_H */
-- 
2.20.1

