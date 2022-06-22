Received: from smtpbg.qq.com (smtpbg136.qq.com [106.55.201.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B5610FD
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 14:36:25 +0000 (UTC)
X-QQ-mid: bizesmtp83t1655908488t2wplegy
Received: from ubuntu.localdomain ( [106.117.78.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 22:34:45 +0800 (CST)
X-QQ-SSF: 01000000008000B0B000E00A0000000
X-QQ-FEAT: HMSvG+9aVfOvI0ncvrQ8fWQeSncCCBYRAdRTgt6HQakK/JFo+V4kshxZkvURu
	5Jr07Eii/6jb+1TtT3Lb93QyyAa14rh2sG5ZWLiRyN7tNBwTHvHDfn8qmdBXuip19YL5HaW
	KtzUVrHNaMBADg562QdMQlAGTWGzvxEraGzFVmNQHr+jJmvqO5PQZqLhZnftBj2kV0qtgGt
	xsWWRV3PIdB9/sXs8PaPNE0KpyRdMXCOwF25UPCmXZmBozyicffLyenYVGRbAS65mXJKeX2
	uCVIsTUsFqLsH8T/JXmvMThvc0Mx4swUNzznVMVY35eKJIVQ6RUCFyL9RN/LQmIxWWLLq+1
	hLalhlqnkHeJDvKK6eMZ76o6LFloEf38E+533tz
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jiangjian@cdjrlc.com
Subject: [PATCH] media: atomisp: Fix typo in comments
Date: Wed, 22 Jun 2022 22:34:42 +0800
Message-Id: <20220622143442.16942-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Remove the repeated word 'and' from comments

file: drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
line: 28

* The buffer has a remote and and a local store

changed to:

* The buffer has a remote and a local store

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 .../media/atomisp/pci/hive_isp_css_include/host/debug_public.h  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
index ee861ddb8e92..5660bd4221be 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
@@ -25,7 +25,7 @@
  * Simple queuing trace buffer for debug data
  * instantiatable in SP DMEM
  *
- * The buffer has a remote and and a local store
+ * The buffer has a remote and a local store
  * which contain duplicate data (when in sync).
  * The buffers are automatically synched when the
  * user dequeues, or manualy using the synch function
-- 
2.17.1

