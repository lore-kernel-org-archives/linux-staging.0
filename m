Received: from tretyak2.mcst.ru (tretyak2.mcst.ru [212.5.119.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806F110B
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 09:28:25 +0000 (UTC)
Received: from tretyak2.mcst.ru (localhost [127.0.0.1])
	by tretyak2.mcst.ru (Postfix) with ESMTP id B3EDF102395;
	Tue, 19 Sep 2023 12:24:23 +0300 (MSK)
Received: from frog.lab.sun.mcst.ru (frog.lab.sun.mcst.ru [176.16.4.50])
	by tretyak2.mcst.ru (Postfix) with ESMTP id AEC1D101775;
	Tue, 19 Sep 2023 12:23:47 +0300 (MSK)
Received: from artemiev-i.lab.sun.mcst.ru (avior-1 [192.168.63.223])
	by frog.lab.sun.mcst.ru (8.13.4/8.12.11) with ESMTP id 38J9NkLq017473;
	Tue, 19 Sep 2023 12:23:47 +0300
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
        Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: [lvc-project] [PATCH] staging: rtl8712: fix buffer overflow in r8712_xmitframe_complete()
Date: Tue, 19 Sep 2023 12:23:18 +0300
Message-Id: <20230919092318.14837-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.0.152.ga5737674b6
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.39/RELEASE,
	 bases: 20111107 #2745587, check: 20230919 notchecked
X-AV-Checked: ClamAV using ClamSMTP

The value of pxmitframe->attrib.priority in r8712_issue_addbareq_cmd(),
which dump_xframe() calls, is used to calculate the index for accessing 
an array of size 16. The value of pxmitframe->attrib.priority can be 
greater than 15, because the r8712_update_attrib() function can write 
a value up to 31 to attrib.priority, and r8712_xmitframe_complete() 
checks that pxmitframe->attrib.priority is less than 16 before 
calling r8712_xmitframe_coalesce().

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index 4cb01f590673..8a39a3c8cfcb 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -669,7 +669,7 @@ int r8712_xmitframe_complete(struct _adapter *padapter,
 			 */
 			r8712_xmit_complete(padapter, pxmitframe);
 		}
-		if (res == _SUCCESS)
+		if (res == _SUCCESS && pxmitframe->attrib.priority <= 15)
 			dump_xframe(padapter, pxmitframe);
 		else
 			r8712_free_xmitframe_ex(pxmitpriv, pxmitframe);
-- 
2.30.2

