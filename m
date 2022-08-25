Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322482F28
	for <linux-staging@lists.linux.dev>; Thu, 25 Aug 2022 12:28:41 +0000 (UTC)
X-QQ-mid: bizesmtp65t1661430511t5hhop1q
Received: from localhost.localdomain ( [182.148.14.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Aug 2022 20:28:30 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: zT6n3Y95oi3eGr0MMkYqB3kxaKnzlkS5GT+bOs+NBYTVns1qjQqzbDIQMbT1F
	63tMrJD2If/d5eI8IDoj5svIMbrJpJgaw7g3RTuFI+CwEBQZyWoNSKv+j79JH2/I2H+yCSz
	N+aud243pbTjiSYKZ9KTVlqrKtEX5umlf6ovNQO9GwtpLeDg1S9kseqGJqB4ORifAMTVXjB
	rQqDv+fPG5MY5ha+1CGNKcU6zzR2DAemmxM50cxrWl3emoDKlg07pbGvnkgXyJaCM0sgyjl
	4wUCSz1KN+PnINT+qaHL1PrcB69bmszbrw8k8W9EjQCnui89iE5AMJ9N54c1bD/H5CqNszE
	PSKhhkYIL/w4RgBAQKNA2eubaauUk4qwG77TIN1VrbuM8d5tGEj8LJfmptE04ACVtOEGXXn
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] atomisp/pci: fix repeated words in comments
Date: Thu, 25 Aug 2022 20:28:23 +0800
Message-Id: <20220825122824.42425-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4

 Delete the redundant word 'of'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/staging/media/atomisp/pci/isp2400_input_system_public.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 85cb61e34192..19a00d569398 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -200,7 +200,7 @@ STORAGE_CLASS_INPUT_SYSTEM_H void receiver_port_reg_store(
     const hrt_address			reg,
     const hrt_data				value);
 
-/*! Read from a control register PORT[port_ID] of of RECEIVER[ID]
+/*! Read from a control register PORT[port_ID] of RECEIVER[ID]
 
  \param	ID[in]				RECEIVER identifier
  \param	port_ID[in]			mipi PORT identifier
-- 
2.36.1

