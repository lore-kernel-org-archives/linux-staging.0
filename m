Received: from p-impout004.msg.pkvw.co.charter.net (p-impout004aa.msg.pkvw.co.charter.net [47.43.26.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31117C9
	for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 01:33:14 +0000 (UTC)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com.com ([24.31.246.181])
	by cmsmtp with ESMTP
	id vqjLnnv0kgPEBvqjSnJB4H; Tue, 31 May 2022 01:31:38 +0000
X-Authority-Analysis: v=2.4 cv=b8OhX/Kx c=1 sm=1 tr=0 ts=62956ffa
 a=cAe/7qmlxnd6JlJqP68I9A==:117 a=cAe/7qmlxnd6JlJqP68I9A==:17
 a=IkcTkHD0fZMA:10 a=yQdBAQUQAAAA:8 a=JKArFDfnAAAA:8 a=yPCof4ZbAAAA:8
 a=T813O89Fk1KhD7x66Y8A:9 a=QEXdDO2ut3YA:10 a=SzazLyfi1tnkUD6oumHU:22
 a=8HTcXXoeXT8DLsUt73VG:22
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v3 1/2] staging: r8188eu: Fix undersized array in rtw_xmit.c
Date: Mon, 30 May 2022 20:31:02 -0500
Message-Id: <20220531013103.2175-2-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531013103.2175-1-Larry.Finger@lwfinger.net>
References: <20220531013103.2175-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
c: Dan Carpenter <dan.carpenter@oracle.com>
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPs3TAaI8hV8TKjc34ABI9+CfuSxrbyzSdviviHv+OdjSHStMfavYCRR9Zu+v2HBRLbjvydwbofOlFqsTMSIC6EVL4LKCK8pUVI+3z37SZ0cMcvsZIN+
 wgoDPvPyWpj0o/0UiAwDvFh6Wu23nsZdpdEX1ANljKz1wEPFFREKLbVwe/HkAOWM4AiEnie3sfyfRcPE19YFU8apo1eDxwKfmQ/Shjsz8XE7MVD84p5cXLBM
 Rc+hfLrCT+b6L0aZjVHXFHb7hdIHOfZMxm/3lC8gGdgQoKpoYd5YAwyoJvEKunDc6duorvqhp2dFON6jSkSUgN/d/LneYX8gHsEeDGzutVf3nAi5ETbmHjAh
 svhZC5HEtc4JOE0tjSE47p8ZTM7YAxzTj1rZYMpV4uLHfAgG/1+2S2xJj9jhzyJDWD8XlvFcfQ9YtLTA4KLvTaDHHf3vZYV/PpHBwo1Gd3ho7B+XFz4=

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

This warning arises because the test for (pxmitpriv->hwxmit_entry == 5) is totally
bogus. There are only 4 queues available. Thanks to Dan Carpenter for suggesting the
correct patch. Thanks to Dan Carperter for suggesting the correct fix.

Fixes commit 7884fc0a1473 ("staging: r8188eu: introduce new include dir
for RTL8188eu driver")

Fixes: 7884fc0a1473 ("staging: r8188eu: introduce new include dir for RTL8188eu driver")
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
--
v2 - get proper To and Cc
v3 - Use Dan Carpenter's suggestion for correct fix
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 3d8e9dea7651..066308150b42 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1483,19 +1483,10 @@ int rtw_alloc_hwxmits(struct adapter *padapter)
 
 	hwxmits = pxmitpriv->hwxmits;
 
-	if (pxmitpriv->hwxmit_entry == 5) {
-		hwxmits[0] .sta_queue = &pxmitpriv->bm_pending;
-		hwxmits[1] .sta_queue = &pxmitpriv->vo_pending;
-		hwxmits[2] .sta_queue = &pxmitpriv->vi_pending;
-		hwxmits[3] .sta_queue = &pxmitpriv->bk_pending;
-		hwxmits[4] .sta_queue = &pxmitpriv->be_pending;
-	} else if (pxmitpriv->hwxmit_entry == 4) {
-		hwxmits[0] .sta_queue = &pxmitpriv->vo_pending;
-		hwxmits[1] .sta_queue = &pxmitpriv->vi_pending;
-		hwxmits[2] .sta_queue = &pxmitpriv->be_pending;
-		hwxmits[3] .sta_queue = &pxmitpriv->bk_pending;
-	} else {
-	}
+	hwxmits[0].sta_queue = &pxmitpriv->vo_pending;
+	hwxmits[1].sta_queue = &pxmitpriv->vi_pending;
+	hwxmits[2].sta_queue = &pxmitpriv->be_pending;
+	hwxmits[3].sta_queue = &pxmitpriv->bk_pending;
 
 	return 0;
 }
-- 
2.36.1

