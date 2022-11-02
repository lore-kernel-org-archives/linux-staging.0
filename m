Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A35C622
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 01:47:13 +0000 (UTC)
X-UUID: efe0bba1d6934841a12ef0fcc175c150-20221102
X-CPASD-INFO: 171b20a2f4f14c768692b6887627d064@eodrgl9ij2KSVKh9g6aCcFhnaWKSYli
	HeXBSZ5JgYlSVhH5xTV5uYFV9fWtVYV9dYVR6eGxQYmBgZFJ4i3-XblBgXoZgUZB3gHlrgmJekQ==
X-CLOUD-ID: 171b20a2f4f14c768692b6887627d064
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,OB:0.0,URL:-5,TVAL:185.
	0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:0.0,CUTS:83.0,IP:-2.0,MAL:-5.0,PHF:-5.0,PHC:-5.
	0,SPF:4.0,EDMS:-5,IPLABEL:4480.0,FROMTO:0,AD:0,FFOB:0.0,CFOB:0.0,SPC:0,SIG:-5
	,AUF:14,DUF:7206,ACD:128,DCD:128,SL:0,EISP:0,AG:0,CFC:0.612,CFSR:0.068,UAT:0,
	RAF:0,IMG:-5.0,DFA:0,DTA:0,IBL:-2.0,ADI:-5,SBL:0,REDM:0,REIP:0,ESB:0,ATTNUM:0
	,EAF:0,CID:-5.0,VERSION:2.3.17
X-CPASD-ID: efe0bba1d6934841a12ef0fcc175c150-20221102
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1
X-UUID: efe0bba1d6934841a12ef0fcc175c150-20221102
X-User: chenzhang@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
	(envelope-from <chenzhang@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1560400082; Wed, 02 Nov 2022 09:42:03 +0800
From: chen zhang <chenzhang@kylinos.cn>
To: gregkh@linuxfoundation.org,
	error27@gmail.com,
	ztong0001@gmail.com
Cc: chenzhang_0901@163.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	chen zhang <chenzhang@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] staging: rtl8192u: Fix typo in comment
Date: Wed,  2 Nov 2022 09:41:54 +0800
Message-Id: <20221102014154.14344-1-chenzhang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: chen zhang <chenzhang@kylinos.cn>
---
 drivers/staging/rtl8192u/r8192U_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0a60ef20107c..f6a0992b059b 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -4574,7 +4574,7 @@ static int rtl8192_usb_probe(struct usb_interface *intf,
 	return ret;
 }
 
-/* detach all the work and timer structure declared or inititialize
+/* detach all the work and timer structure declared or initialize
  * in r8192U_init function.
  */
 static void rtl8192_cancel_deferred_work(struct r8192_priv *priv)
-- 
2.25.1

