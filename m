Received: from mail.nfschina.com (unknown [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1922C7F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 01:25:31 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 430581E80D46;
	Tue,  2 Aug 2022 09:24:44 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-8E1Qt2Fo4p; Tue,  2 Aug 2022 09:24:41 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 74B651E80D12;
	Tue,  2 Aug 2022 09:24:41 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: gregkh@linuxfoundation.org,
	sevinj.aghayeva@gmail.com,
	hdegoede@redhat.com,
	fabioaiuto83@gmail.com,
	duoming@zju.edu.cn,
	keescook@chromium.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] staging/rtl8723bs/core: remove inactive initialization
Date: Tue,  2 Aug 2022 09:25:13 +0800
Message-Id: <20220802012513.2824-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The allocation address of the psta pointer variable is first performed
in the function, no initialization assignment is required, and no
invalid pointer will appear.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f2242cf2dfb4..6498fd17e1d3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2521,7 +2521,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 {
 	u8 issued;
 	int priority;
-	struct sta_info *psta = NULL;
+	struct sta_info *psta;
 	struct ht_priv *phtpriv;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = IS_MCAST(pattrib->ra);
-- 
2.18.2

