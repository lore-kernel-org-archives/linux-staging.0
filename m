Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC7B70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 10:10:16 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F6HM44GWSzkgj2;
	Fri, 26 Mar 2021 17:52:16 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 17:53:48 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, linux-media <linux-media@vger.kernel.org>,
	netdev <netdev@vger.kernel.org>, linux-staging
	<linux-staging@lists.linux.dev>, linux-kernel <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: atomisp: Remove duplicated header file inclusion
Date: Fri, 26 Mar 2021 17:41:55 +0800
Message-ID: <20210326094155.1441-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected

The header file "ia_css_isys.h" is already included above and can be
removed here.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ddee04c8248d043..afddc54094e9f8d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -49,9 +49,6 @@
 #include "ia_css_pipe_util.h"
 #include "ia_css_pipe_binarydesc.h"
 #include "ia_css_pipe_stagedesc.h"
-#ifndef ISP2401
-#include "ia_css_isys.h"
-#endif
 
 #include "tag.h"
 #include "assert_support.h"
-- 
1.8.3


