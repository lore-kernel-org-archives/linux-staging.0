Received: from p-impout003.msg.pkvw.co.charter.net (p-impout003aa.msg.pkvw.co.charter.net [47.43.26.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C015AD
	for <linux-staging@lists.linux.dev>; Sun, 29 May 2022 00:49:00 +0000 (UTC)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com.com ([24.31.246.181])
	by cmsmtp with ESMTP
	id v75WnJjj4R0wIv75YnCgkG; Sun, 29 May 2022 00:47:24 +0000
X-Authority-Analysis: v=2.4 cv=FYAkeby6 c=1 sm=1 tr=0 ts=6292c29c
 a=cAe/7qmlxnd6JlJqP68I9A==:117 a=cAe/7qmlxnd6JlJqP68I9A==:17
 a=IkcTkHD0fZMA:10 a=yQdBAQUQAAAA:8 a=JKArFDfnAAAA:8 a=VTP6l_gzy7p3D2MEsWYA:9
 a=QEXdDO2ut3YA:10 a=SzazLyfi1tnkUD6oumHU:22 a=8HTcXXoeXT8DLsUt73VG:22
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH v2 2/2] staging: r8188eu: Fix undersized array in rtw_xmit.c
Date: Sat, 28 May 2022 19:47:11 -0500
Message-Id: <20220529004711.27545-3-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220529004711.27545-1-Larry.Finger@lwfinger.net>
References: <20220529004711.27545-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBKE2TuOLmmE4iRaCahmKirQKcHxNQba3yni2AnYY3sRB9Z6s4176PmU+x1QvTL0jBJAwzBvJONo6nPGTfkkvGmwwJutpDH4XKBDRl6OaWi95jsrIS/v
 he7mB6PWjnFNoWX7bkNw29EE4X1OiSACSp35II6G+BLTfXVxEN+NZXASA1t3HaYwA4KH7vPSc1m0HDyUb3AEZuwFvgFePU2xgDBUbss7IrtHJsdxE3TiA5Hc
 Olc9j4A1Qti0sWQMjXmodalMcskiO9B2cI4qU+aBiUVEC3DBroO7CJu6im1oFJDMGY/PtBI1IpNg7csYoyrrLUV/kubyspsC94MRebh8GX/rk0hcpiusXKBG
 PQo9ut/KAF1BMw5hBpQnezKl2h24dMLvYhq2vMSt9lZ5ByqutRmF16E7URSEFVnCbup9Mxx6

Compiling with -warray-bounds yields the following warning:

drivers/staging/r8188eu/core/rtw_xmit.c: In function ‘rtw_alloc_hwxmits’:
drivers/staging/r8188eu/core/rtw_xmit.c:1493:24: warning: array subscript 4 is outside array bounds of ‘void[64]’ [-Warray-bounds]
 1493 |                 hwxmits[4] .sta_queue = &pxmitpriv->be_pending;
      |                 ~~~~~~~^~~
In file included from drivers/staging/r8188eu/core/../include/osdep_service.h:19,
                 from drivers/staging/r8188eu/core/rtw_xmit.c:6:
In function ‘kmalloc’,
    inlined from ‘kzalloc’ at ./include/linux/slab.h:733:9,
    inlined from ‘rtw_alloc_hwxmits’ at drivers/staging/r8188eu/core/rtw_xmit.c:1484:23:
./include/linux/slab.h:600:24: note: at offset 64 into object of size 64 allocated by ‘kmem_cache_alloc_trace’
  600 |                 return kmem_cache_alloc_trace(
      |                        ^~~~~~~~~~~~~~~~~~~~~~~
  601 |                                 kmalloc_caches[kmalloc_type(flags)][index],
      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  602 |                                 flags, size);
      |

This warning arises because macro HWXMIT_ENTRY is too small.

Fixes commit 7884fc0a1473 ("staging: r8188eu: introduce new include dir
for RTL8188eu driver")

Fixes: 7884fc0a1473 ("staging: r8188eu: introduce new include dir for RTL8188eu driver")
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>
---
v2 = Get To and Cc right
---
 drivers/staging/r8188eu/include/rtw_xmit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index b2df1480d66b..27fa536f51ee 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -69,7 +69,7 @@ do {							\
 	dot11txpn.val = dot11txpn.val == 0xffffffffffffULL ? 0 : (dot11txpn.val+1);\
 } while (0)
 
-#define HWXMIT_ENTRY	4
+#define HWXMIT_ENTRY	5
 
 #define TXDESC_SIZE 32
 
-- 
2.36.1

