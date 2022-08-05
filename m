Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823E1C03
	for <linux-staging@lists.linux.dev>; Fri,  5 Aug 2022 16:28:21 +0000 (UTC)
Received: from [192.168.192.146] (port=51430 helo=nx64de-df6d00)
	by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <gszymaszek@short.pl>)
	id 1oK0BC-0007q1-E6; Fri, 05 Aug 2022 18:28:08 +0200
Date: Fri, 5 Aug 2022 18:28:05 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Grzegorz Szymaszek <gszymaszek@short.pl>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 3/4] staging: r8188eu: drop the DRV_NAME macro
Message-ID: <f8d7b4ba4533a315ebd6711f17bbfd81e99ccf5a.1659715931.git.gszymaszek@short.pl>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <cover.1659715931.git.gszymaszek@short.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659715931.git.gszymaszek@short.pl>

The DRV_NAME macro is not used anywhere; KBUILD_MODNAME should be used
instead. Remove the macro declaration.

Link: https://lore.kernel.org/lkml/Yuy7Lc%2FTJMinuupA@kroah.com/
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
---
V1 -> V2: Split v1-0003 into v2-0003 and v2-0004. Remove the DRV_NAME
          macro, since KBUILD_MODNAME should be used instead

 drivers/staging/r8188eu/include/drv_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index f51b83515953..f659eac70b32 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -10,8 +10,6 @@
 #ifndef __DRV_TYPES_H__
 #define __DRV_TYPES_H__
 
-#define DRV_NAME "r8188eu"
-
 #include "osdep_service.h"
 #include "wlan_bssdef.h"
 #include "rtw_ht.h"
-- 
2.35.1
