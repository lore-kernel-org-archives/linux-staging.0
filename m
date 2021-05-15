Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D072
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 08:14:35 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fhym02TbgzsR8Z;
	Sat, 15 May 2021 16:11:44 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Sat, 15 May 2021 16:14:17 +0800
From: Luo Meng <luomeng12@huawei.com>
To: <gregkh@linuxfoundation.org>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <fabioaiuto83@gmail.com>,
	<ross.schm.dev@gmail.com>, <marcocesati@gmail.com>,
	<matthew.v.deangelis@gmail.com>, <linux-staging@lists.linux.dev>,
	<luomeng12@huawei.com>
Subject: [PATCH] staging: rtl8723bs: remove unused variable
Date: Sat, 15 May 2021 16:21:50 +0800
Message-ID: <20210515082150.165660-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected

Fix the following clang warning:

drivers/staging/rtl8723bs/core/rtw_mlme.c:2356:6:
warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4707dba90397..c2bbb66666b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2353,12 +2353,11 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 {
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
 	int out_len;
-	u8 *pframe;
 
 	if (padapter->mlmepriv.qospriv.qos_option == 0) {
 		out_len = *pout_len;
-		pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
-							_WMM_IE_Length_, WMM_IE, pout_len);
+		rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
+				WMM_IE_Length_, WMM_IE, pout_len);
 
 		padapter->mlmepriv.qospriv.qos_option = 1;
 	}
-- 
2.25.4

