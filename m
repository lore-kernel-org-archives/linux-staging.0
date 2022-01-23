Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3F2CB3
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:01 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNc1T-1mwfId0xIJ-00P7LL; Sun, 23 Jan 2022 21:02:52 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 01/18] staging: vchiq_core: fix indentation in vchiq_log_dump_mem
Date: Sun, 23 Jan 2022 21:02:06 +0100
Message-Id: <1642968143-19281-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:WtGJ/fmkLsW5IhuhlXqZ94yFW1prVq33LrGqpJQvqJVT45O6oY/
 HY4U7jKsQh/2nCpNNsVZ1aNjW3uaoD9JxF77RpHF0VRgVhkHho4r4697V5hHqlV8wUIEC0e
 itCHsVkuasXmbzJSyZ/9RJXm0N2to5GQuOhmpT6wbjjax1ino44OMR6lrFQ5MSjDPPUVqyr
 wE9pey63iHcsCQzfuheoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iw0B6L64XXw=:vzuLEaxDOaV4lYgBj5jBM5
 tnZqfWmj0/XDcYKLQEUXlJQ84QTBfrYfsd+TW28CjY8+karw5GrKJLVkn3Kbn63E6w0a3EpFt
 0fVPElWabaqmIgnCG7rGCd+d4qFzE42YxGLVfMO0RJlrSBrlcJmzhTcQVO1wbzuFeK0RmvoUY
 pw/KQtcTbH8W0yKP0FfSngZ67Pwm+yQZOooReCNEDVDWnh5M07snM6UDtJftf1g/3ZzdUOzSz
 AnOdbvVWcARdv5O41cUc+lVpeAC7J/Ze+s6ouzIxm+LJUytkYHliZ3JNN8LTPqlCLqTV4nveT
 LzOKvANqCBQWirPI/lBLe+Y56EwV/CZF6zLUmNpulr15oPgAoNqXnRFK9aGUFmfT/Ndyz5768
 BVZqUZ7S90dOCXHsuMfwhLE/qlgYOs1hmD5GnU2bVM+MpfxNK+b+VdZKTmYuAXM2Z/VLvaXpq
 l7TQlzrWai6HAh3UGaYa7wbQSAl1ZOzuicdbY4Gwl0mfzzp7twBq2VIuoygKj+MdAV8txjVEi
 uQWQY0SbnuPRa9A/r+o0fF/iEtTriCI5QG2xTrz7yj4rg8L3Lr4D80YYoSPHBsvjQALO05yNN
 s7XRvHPt7Nis1RMIMO9rw38oyImH+WseXCJfCITO6r0Mb3DnyzjmsFvjJfwaTGGvMHG+JiD1L
 4k1gf18hcVtV98oh+kICbnQz7U7XMm9bdyvMp6SkpIAvF6iAxikCs6rs+B61a/Mud14Q8tzOp
 geG2Euld5pkurXMF
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This align the indentation in the var declaration of vchiq_log_dump_mem to
the other code.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 7fe20d4..2cbbbb6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3666,10 +3666,10 @@ enum vchiq_status vchiq_send_remote_use_active(struct vchiq_state *state)
 
 void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes)
 {
-	const u8  *mem = void_mem;
-	size_t          offset;
-	char            line_buf[100];
-	char           *s;
+	const u8 *mem = void_mem;
+	size_t offset;
+	char line_buf[100];
+	char *s;
 
 	while (num_bytes > 0) {
 		s = line_buf;
-- 
2.7.4

