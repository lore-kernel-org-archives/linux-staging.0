Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0E66D30
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:54 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjSPq-1l50Db48mA-00kzcw; Thu, 03 Jun 2021 17:50:50 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 08/16] staging: vchiq_core: use define for message type shift
Date: Thu,  3 Jun 2021 17:49:57 +0200
Message-Id: <1622735405-9980-9-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:z6rIQvUipuh5TeMfLBvX83SHmQH04YksXig+KlFKVE5QzZ61qDE
 DdbIP8mjMmyY8FcrxlMakqcWLq0QcLGUavNAzfhAn0Z7VCMlibfvyYAlZwSBopsfIrFDk3y
 DsHnp0XPysEhYimpky1QuB3D4/z/ZwGjOTGP0WDKlVdZikklVmhoo3ZmtPIpG9fJq7ME7et
 C9/89f1vb7vjgUfS4PjDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WQ2s4IC2A/I=:3VeBmf1FpxDC8H+uL+h1ie
 F4AfTJLoaf6ep0ZUu+PHdQq1wtLPqcNvglGi4UkNQSJ9BXj0cfbJ9v73232JwrV8VwuHp0hAM
 mvWCA/EHOtyFnnqaw9jMhkfsPR3S2wCfGEcNOaPigf0KRvu6lj122O8QpVGJRMRVh2Tl7GlMc
 DcQIATnOXLEjKPHZuWnez6Zh7YElzkuKE9Ur9xb2rnOXyVs/8VGlvun7uK9J/o/6XijUWYKzO
 QVPk0o3zFSbYJGGGS3EfdeSgk3uEY2+MfXRLYAeiExcdhXW+lAEsdthnkJqb1t9E5di+HBNi+
 yAI7/96jmwyOEhrwjjT/Gz+DpCCS9DgUq0MAMRGvSARsQWU7FQ6JYrE8lJHL7jSB4yNE58eXz
 eizT9RBmISruLOx53D0UMyQKDWguAQ84xAg1XMt13CuUX5UE8mp5tYdczL4e/fV1yyRpt3zZK
 VF2+d5Gpa7/kTW3kPB22zXP3Qu0L7a/1PoKriMSdolMuPi2O/YPmVe4q23eQghwSWkTKOKOtE
 ZXdhegZpwRI7RgRPg7Zneg=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Make it clear and use a define for shifting the message type.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 0afac46..f6ada95 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -33,12 +33,14 @@
 #define VCHIQ_MSG_REMOTE_RELEASE    13  /* -                                 */
 #define VCHIQ_MSG_REMOTE_USE_ACTIVE 14  /* -                                 */
 
+#define TYPE_SHIFT 24
+
 #define VCHIQ_PORT_MAX                 (VCHIQ_MAX_SERVICES - 1)
 #define VCHIQ_PORT_FREE                0x1000
 #define VCHIQ_PORT_IS_VALID(port)      ((port) < VCHIQ_PORT_FREE)
 #define VCHIQ_MAKE_MSG(type, srcport, dstport) \
-	(((type) << 24) | ((srcport) << 12) | ((dstport) << 0))
-#define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)(msgid) >> 24)
+	(((type) << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
+#define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)(msgid) >> TYPE_SHIFT)
 #define VCHIQ_MSG_SRCPORT(msgid) \
 	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)
 #define VCHIQ_MSG_DSTPORT(msgid) \
-- 
2.7.4

