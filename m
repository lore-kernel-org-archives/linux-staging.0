Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D7193
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 13:07:57 +0000 (UTC)
Received: from localhost.localdomain ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 2AQCuhbq014203-2AQCuhbt014203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Sat, 26 Nov 2022 20:56:51 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Martyn Welch <martyn@welchs.me.uk>,
        Manohar Vanga <manohar.vanga@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dongliang Mu <dzm91@hust.edu.cn>, Arnd Bergmann <arnd@arndb.de>,
        Mingyi Kang <jerrykang026@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 1/2] staging: vme_user: add list_del in the error handling of tsi148_dma_list_add
Date: Sat, 26 Nov 2022 20:56:33 +0800
Message-Id: <20221126125642.16358-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn

Smatch reports the following issue:
drivers/staging/vme_user/vme_tsi148.c:1757 tsi148_dma_list_add()
warn: '&entry->list' not removed from list

Fix this by adding list_del in the error handling code.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/staging/vme_user/vme_tsi148.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 020e0b3bce64..0171f46d1848 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -1751,6 +1751,7 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
 	return 0;
 
 err_dma:
+	list_del(&entry->list);
 err_dest:
 err_source:
 err_align:
-- 
2.37.1 (Apple Git-137.1)

