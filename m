Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281217C
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 12:57:06 +0000 (UTC)
X-QQ-mid: bizesmtp63t1662641574thqhzbh3
Received: from localhost.localdomain ( [182.148.14.0])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Sep 2022 20:52:53 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: xqT8U4SkSpjzv/yCnXlPzVgU/S5gofddB/t+tauGOQ127k8QUxlOwfNxeqRIT
	YKbpmC6hGhhzyfqOWBNom4JTYSVjwYkLVNiN717ID3Wmy9r4ABFfr65XkaNHgKaOFZDvlpy
	KNwANaEVLQh5jd0O8bCKcCHFBrjhZ14JOqzakti3aEGGjssfGM4FJnrpE3/IGEKozyNfd5z
	CiFOmsRJw5mP9YUYAl+sUOv+kxSK9M8kKFZR0knZovgjKkyWtVFEUhefjudK50+cLIij8+8
	nEt46iYU/FYVfS2ruyRzZDkZ0o1emOcXo23oTrqe08WazqmXwnNlyQ9vjnvyE7COYpEz2x+
	5HfQJunStuZtesMvGucVhbRw1xPZ/WLM+pIPQbvQE/haaokiZs=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] atomisp/pci: fix repeated words in comments
Date: Thu,  8 Sep 2022 20:52:46 +0800
Message-Id: <20220908125246.27419-1-wangjianli@cdjrlc.com>
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

Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/staging/media/atomisp/pci/ia_css_irq.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_irq.h b/drivers/staging/media/atomisp/pci/ia_css_irq.h
index 26b1b3c8ba62..8f2e876a0b2b 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_irq.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_irq.h
@@ -84,11 +84,11 @@ enum ia_css_irq_info {
 	IA_CSS_IRQ_INFO_ISP_BINARY_STATISTICS_READY   = BIT(17),
 	/** ISP binary statistics are ready */
 	IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR            = BIT(18),
-	/** the input system in in error */
+	/** the input system in error */
 	IA_CSS_IRQ_INFO_IF_ERROR                      = BIT(19),
-	/** the input formatter in in error */
+	/** the input formatter in error */
 	IA_CSS_IRQ_INFO_DMA_ERROR                     = BIT(20),
-	/** the dma in in error */
+	/** the dma in error */
 	IA_CSS_IRQ_INFO_ISYS_EVENTS_READY             = BIT(21),
 	/** end-of-frame events are ready in the isys_event queue */
 };
-- 
2.36.1

