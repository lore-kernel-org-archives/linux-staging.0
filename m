Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141522CB0
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:03 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWRi7-1mnpak2wNH-00Xx1z; Sun, 23 Jan 2022 21:02:57 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 18/18] staging: vchiq_dev: Avoid unnecessary alloc in vchiq_ioc_create_service
Date: Sun, 23 Jan 2022 21:02:23 +0100
Message-Id: <1642968143-19281-19-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:rGrRpSuUwNaGvxuffojOaXU1Jmz8jYDLP28WTuGcZAE5gK6VL04
 Vo6SdZx3AomiSqeOt7RtluL+vmGi7x7wahhDij41wacIJLUe75/SyNhN4qvs0mIFFOMrBKf
 5MT3uZJAbxB98xmqjJtlfeLppUbpt/D0uB/ud8o/483NA8ghEA9/xXdZTthorFwsL2Rx6T2
 uwl2B5HNByJjZFxFfYEqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sv2OxIsP2G0=:tzLPClHGYarY7WVwNBcUeD
 kXJUgGeqTiWCqmXrPc6kME6qldt+Mh1mG333jxluVb3gwNGcaEwVccVesbo5DqkLhhWmgUOCF
 v5jwT+JVCB3Oy5wiDAVKag50h5+OHABEL0KJXhyFN6BDQW0e1cLDOUC5QTzG53fTX5tev2jlJ
 MzsGSpAzEopbz6IwKXEgGULgkv4ZD8QppjwE1UK/Xi51bKEOP1e9XLC1xjT6P7EmPHRh1525E
 Q2YLo9qcBW3lbAvGZ0s/Pd7zQlLdYC6+4jL2kCZ5Lur27V3nx3+0mdk5rVIVbR+qnwRABTTgE
 BHlg9Ca/Op7V++KYcEM/dCuphTM1ECGWtYTtgjmYj2vlRBNJeNg9zy1s6zlf6uewGdfTJPTdr
 433IJ9cVWggfCPd5tqLGFgSNP+m4TQ5XWAp6lj58pJpEkihFdn+PD3eYPCq5NrtwibS+vRIE9
 DL98+vAaYZJ5BnJmZbhgIyKNJ7ANJx/qO4D+KBHx1V6poE2fZNljtWmmK/f4G++luSPqN0bE+
 Q+uA4jdWdGxZcpA18I5m/q/G3B2K1lL0PmvKla7dBMBRIet7BazML8u8Na4VtFJGEp0tcQPoQ
 X1Ms6R98pusxVK1Ql1sVImPYTZLbGvTF3ijl/3nciISxRsjjZDIclYisc8JJl+pkm0bc4FPLW
 OtK8TFaQhuB5YR7864tUADO0hGKRzEu0L9dLQcPaPZRFJsE2+TXJrSUs/L2BblvKuUkDyo1U3
 ecTogmhNl4nsIB3r
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is no need to allocate the user service in case there is a VCHIQ
connection required, but not available. So simply check the error conditions
before doing an expensive memory allocation.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 2325844..b41c2a2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -146,15 +146,14 @@ static int vchiq_ioc_create_service(struct vchiq_instance *instance,
 	struct vchiq_service_params_kernel params;
 	int srvstate;
 
+	if (args->is_open && !instance->connected)
+		return -ENOTCONN;
+
 	user_service = kmalloc(sizeof(*user_service), GFP_KERNEL);
 	if (!user_service)
 		return -ENOMEM;
 
 	if (args->is_open) {
-		if (!instance->connected) {
-			kfree(user_service);
-			return -ENOTCONN;
-		}
 		srvstate = VCHIQ_SRVSTATE_OPENING;
 	} else {
 		srvstate = instance->connected ?
-- 
2.7.4

