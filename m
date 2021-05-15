Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B82FB6
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:24 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxmFk-1lYp212WUg-00zJRY; Sat, 15 May 2021 21:11:19 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 04/20] staging: vc04_services: remove __VCCOREVER__
Date: Sat, 15 May 2021 21:10:43 +0200
Message-Id: <1621105859-30215-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:NLMc54gdiatyzaV4+WfdeHNGn64BrHrzn7lTZ3Zol8aQ0I2Uvw0
 qyR4hl+2Sny5epNn3nZhtAXgpsL/afnmCL0UdDj/GqQoFQfoaHHyAXWeVqNS82N7jb1hFbR
 cdoFF3A4x4LpO+eogEM+0z6RYdIUWQzhEeoxOFiWiECN9YWWEaPMLDUjlYwJX7+7tT5GIRd
 QR3/c7u9b/ryvmtbHG2wA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bSvhrYsVuN8=:jWVz5ez6kBkUlkBNvGgX7a
 xaxUUv01YvfqkQ/ggHOWJnKoYwA9MBWxgJp03EwCoVj1/yTiGhclrQAdA9gy4YZfuD1jETIly
 lmXwDKpbJibD848FX8BOnzdvJpzdybalfUihj0CXTLS5Ahm6mCa/fz2YpaJ+vEeOv9kDINLnP
 gqVOY88CNOpEfX7rAG+N8/Wq5cjQKCtrubJ9XUS1HXQbK9lWZMUlqTOYnkLokmNZYTzBOZLa1
 oYkLkXwcSs2wr/F6q2RRaQlLSiB7rwaKlw8O3Q6jXwWisgWFGf9bSPAVz17i3aUn65C5118bY
 JBCo4lSXTCYQFaMb6FQ2NmEo/G4CRem+wwLW0+J9H6NNK4tDKc/w0561nGUaCNgNQOEbzs9+C
 Y6QwjINU9GrtpeUEpsQYzpcsqdGmOR1thgwuZ/wgv4MClo3mgLjrsZ0+r0Km6an93p283Pk/v
 CcN00IIA3Spf/b1aS9xCJjxSohSnpFlRVGqR33+z6XXKbE45JRF3+VH1fw7G8GPh/8A6w07aS
 rn/Uivo7mh3Ft66Jx9tByE=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This define isn't used anymore. Let's remove it.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index 7546d70..e21e73a 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -12,5 +12,5 @@ obj-$(CONFIG_SND_BCM2835)		+= bcm2835-audio/
 obj-$(CONFIG_VIDEO_BCM2835)		+= bcm2835-camera/
 obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
 
-ccflags-y += -I $(srctree)/$(src)/include  -D__VCCOREVER__=0x04000000
+ccflags-y += -I $(srctree)/$(src)/include
 
-- 
2.7.4

