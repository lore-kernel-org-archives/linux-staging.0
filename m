Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BC47E3
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 08:24:17 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MP88z01P5znV9Z;
	Fri,  9 Sep 2022 16:21:39 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 9 Sep
 2022 16:24:14 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH v4 0/2] staging: rtl8723bs: Fix return type for implementation of ndo_start_xmit
Date: Fri, 9 Sep 2022 16:20:46 +0800
Message-ID: <20220909082048.14486-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected

Fix the return type for implementation of ndo_start_xmit to avoid CFI
failure

GUO Zihua (2):
  staging: rtl8723bs: Delete un-necessary return for _rtw_xmit_entry()
  staging: rtl8723bs: Fix return type for implementation of
    ndo_start_xmit

 drivers/staging/rtl8723bs/include/xmit_osdep.h  |  4 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c   |  3 ++-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c   | 17 ++++++-----------
 3 files changed, 10 insertions(+), 14 deletions(-)

---

v4:
  Remove the un-necessary return of _rtw_xmit_entry, and add a Fixes tag
for the second patch.

v3:
  Provide detail on CFI.

v2:
  Fix truncated subject.

-- 
2.17.1

