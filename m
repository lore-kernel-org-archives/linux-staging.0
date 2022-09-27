Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3FA1363
	for <linux-staging@lists.linux.dev>; Fri, 30 Sep 2022 00:59:09 +0000 (UTC)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id YZJ00049;
        Fri, 30 Sep 2022 08:57:49 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.12; Fri, 30 Sep 2022 08:57:53 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <martyn@welchs.me.uk>, <manohar.vanga@gmail.com>,
	<gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>, Deming
 Wang <wangdeming@inspur.com>
Subject: [PATCH] vme: fix the typo
Date: Tue, 27 Sep 2022 15:21:02 -0400
Message-ID: <20220927192102.8623-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 2022930085749e3d034e8e7bb5e2c10667cf3b02fb6fb
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

fix the typo of the enty.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5555683a069..d9c64c60ccc0 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1090,7 +1090,7 @@ void vme_dma_free_attribute(struct vme_dma_attr *attributes)
 EXPORT_SYMBOL(vme_dma_free_attribute);
 
 /**
- * vme_dma_list_add - Add enty to a VME DMA list.
+ * vme_dma_list_add - Add entry to a VME DMA list.
  * @list: Pointer to VME list.
  * @src: Pointer to DMA list attribute to use as source.
  * @dest: Pointer to DMA list attribute to use as destination.
-- 
2.27.0

