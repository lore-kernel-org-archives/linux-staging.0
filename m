Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF1F15A3
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 02:28:23 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 5724F1E80CCF;
	Mon,  4 Jul 2022 10:26:29 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmXCCiR0_TTr; Mon,  4 Jul 2022 10:26:26 +0800 (CST)
Received: from node1.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 88FD41E80C90;
	Mon,  4 Jul 2022 10:26:26 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@nfschina.com,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] staging/media/atomisp/pci/atomisp: Fix typo in string
Date: Mon,  4 Jul 2022 10:28:07 +0800
Message-Id: <20220704022807.3215-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Remove the repeated ',' from string

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 97d5a528969b..b80f6c9894fd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -6504,7 +6504,7 @@ int atomisp_set_raw_buffer_bitmap(struct atomisp_sub_device *asd, int exp_id)
 		ret = atomisp_css_exp_id_unlock(asd, exp_id);
 		if (ret) {
 			dev_err(asd->isp->dev,
-				"%s exp_id is wrapping back to %d but force unlock failed,, err %d.\n",
+				"%s exp_id is wrapping back to %d but force unlock failed, err %d.\n",
 				__func__, exp_id, ret);
 			return ret;
 		}
-- 
2.18.2

