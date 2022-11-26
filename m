Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B18A17CB
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 13:08:01 +0000 (UTC)
Received: from localhost.localdomain ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 2AQCuhbq014203-2AQCuhbu014203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Sat, 26 Nov 2022 20:57:02 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Martyn Welch <martyn@welchs.me.uk>,
        Manohar Vanga <manohar.vanga@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dongliang Mu <dzm91@hust.edu.cn>, Arnd Bergmann <arnd@arndb.de>,
        Mingyi Kang <jerrykang026@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 2/2] staging: vme_user: fix coding style
Date: Sat, 26 Nov 2022 20:56:34 +0800
Message-Id: <20221126125642.16358-2-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221126125642.16358-1-dzm91@hust.edu.cn>
References: <20221126125642.16358-1-dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn

Fix coding style enforced by Linux kernel

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/staging/vme_user/vme_tsi148.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 0171f46d1848..5ba097e4d17e 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -1755,7 +1755,7 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
 err_dest:
 err_source:
 err_align:
-		kfree(entry);
+	kfree(entry);
 err_mem:
 	return retval;
 }
-- 
2.37.1 (Apple Git-137.1)

