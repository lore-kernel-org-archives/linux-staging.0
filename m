Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5715870
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 00:55:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA8C560EBC;
	Wed, 11 Aug 2021 00:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628643321;
	bh=DTAl8Wi9FD9YleLLXVNMvg0hoef/6IRV9MZimfYACKs=;
	h=From:To:Cc:Subject:Date:From;
	b=S/on2pMTwZaJSwkcXzWZVlrGebs2GrailsKp9itDSYbLhN3bH7whN4Iu24MX2FEO+
	 wG7Ks4XZPTTBGeuIbXwD+949oawDjbNMcEtItsLRBsGTiDZaQE30PfF+YfaHcWFbvQ
	 2WGyWZRYRRw/5+V5vOxC6Dh7kB2cCz/GThFIeJO3eSxviYttpxXux2Z5CisxLUc1JQ
	 /mAqsCdVOe65QDcTV6lwlDO/w3Rr9OYK14IUXWc37IzOLhofTERPlWKF2vZmbEf7+Y
	 mQc1q9bJbb0y8iL6U9dIG0f+ewoQCAMg4CO3YVxCj5uGpoxfMEdzKMErl4bh5OuxkS
	 fvPVsOKVdmPFg==
From: Nathan Chancellor <nathan@kernel.org>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] staging: r8188eu: os_dep: Hoist vmalloc.h include into osdep_service.h
Date: Tue, 10 Aug 2021 17:55:05 -0700
Message-Id: <20210811005505.3953122-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

After commit 71f09c5ae9d2 ("staging: r8188eu: Remove wrapper around
vfree"), the driver fails to build on Hexagon due to an implicit
declaration in several different files:

drivers/staging/r8188eu/core/rtw_mlme.c:129:3: error: implicit
declaration of function 'vfree'
[-Werror,-Wimplicit-function-declaration]
                vfree(pmlmepriv->free_bss_buf);
                ^
1 error generated.

Previously, vfree() was only called in osdep_service.c, which includes
vmalloc.h for vmalloc() and vfree(). Now, the driver relies on vfree()
getting implicitly included from another file.

Hoist the vmalloc.h include from osdep_service.c to osdep_service.h so
that the driver continues to build fine on all architectures.

Fixes: 71f09c5ae9d2 ("staging: r8188eu: Remove wrapper around vfree")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/staging/r8188eu/include/osdep_service.h | 1 +
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 7e002009f9a0..0d1419af8274 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -39,6 +39,7 @@
 #include <linux/interrupt.h>	/*  for struct tasklet_struct */
 #include <linux/ip.h>
 #include <linux/kthread.h>
+#include <linux/vmalloc.h>
 
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 910da0f0004a..9ea4e1a7c45f 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -6,7 +6,6 @@
 #include "../include/osdep_service.h"
 #include "../include/drv_types.h"
 #include "../include/recv_osdep.h"
-#include "../include/linux/vmalloc.h"
 #include "../include/rtw_ioctl_set.h"
 
 /*

base-commit: ae7471cae00a432d1c9692452b1b9175a8f3c1b3
-- 
2.33.0.rc1

