Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97159371
	for <linux-staging@lists.linux.dev>; Sun, 21 Aug 2022 15:11:17 +0000 (UTC)
X-QQ-mid: bizesmtp87t1661094585tylogl59
Received: from localhost.localdomain ( [182.148.14.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 21 Aug 2022 23:09:44 +0800 (CST)
X-QQ-SSF: 0100000000200010B000B00A0000000
X-QQ-FEAT: zT6n3Y95oi2SlWqB1OW3bb89aDWY8dXwiD8N+oi6EAvlVRDdAR5lcPNu6Nsyn
	owKWQGbga7pWiMBW9l6JYMt+gBVHwEZS86UXKTYl+rcOlSBoX5u+PTxKJDtU2PREnW9v7WT
	tCMIrREkp2D5eTn9d/qCKfYXoJkja1dcEwbWjzdaD6hL1HvqaG0Wi/8Qs54TbNgAMurNW6V
	dhp0mFqcTZphNF4CVHTiPINTbXxrLOcHHv2odGIlah6G59IQi9Zw1Ov0Y6EgpZNsTJqrA6+
	i8l6xYMz0ppJi5D7iQ1ELxVR+TP5r/DdgJBz4nYTQVbklHkzImUzMV8j4M4I7hz2BtFuOcn
	5O8PxF34YsrFntMmTe4ZCsouqctPAShXA18FcDVm7Q2nNYocTA=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] atomisp/pci: fix repeated words in comments
Date: Sun, 21 Aug 2022 23:09:37 +0800
Message-Id: <20220821150937.53934-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7

 Delete the redundant word 'of'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
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

