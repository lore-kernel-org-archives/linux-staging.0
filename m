Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322271
	for <linux-staging@lists.linux.dev>; Thu, 13 May 2021 09:42:11 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fgmph5cwzzlc8Q;
	Thu, 13 May 2021 17:39:56 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 17:41:59 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabio Aiuto
	<fabioaiuto83@gmail.com>, Hans de Goede <hdegoede@redhat.com>, linux-staging
	<linux-staging@lists.linux.dev>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 0/2] Clear several unused local variable warnings
Date: Thu, 13 May 2021 17:40:05 +0800
Message-ID: <20210513094007.6435-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected

No functional change.

Zhen Lei (2):
  staging: rtl8723bs: core: remove three unused local variable
  staging: rtl8723bs: core: eliminate erroneous reporting of unused
    variable 'evt_seq'

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 53 ++++++-------------
 1 file changed, 16 insertions(+), 37 deletions(-)

-- 
2.26.0.106.g9fadedd


