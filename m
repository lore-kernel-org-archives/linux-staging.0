Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2BD7E
	for <linux-staging@lists.linux.dev>; Sun,  7 May 2023 00:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0558C433D2;
	Sun,  7 May 2023 00:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419726;
	bh=CMvlrlyOjabN6Is5vk5sBrNyteEXDKTkYWuJRzFFcLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ST3G0C+BTIzvOy/wS2BhTjJlhwjbQMayHMVuwMRtIBSp22Yw/DFYPzlwoVBKrGhB8
	 Cmy1Jvk59YCjxcMA4kbHaA/zYXNqm9YwF5wCm7PF9o3JDUeeSW6KPXsP1fWX1XE4Vv
	 25SOsjbrdVTlDC9n2e2GZMpBCV3wGa+yBHQ9WC5NtpobROCCZfhnA049kC3bOcCpWE
	 Lhb9cvIK2Ub73dkOA7jJqmbf4EbSMcyYe5UOcu9vF27xBaktVwgl+dLkBRji6RIRs0
	 iBDAVsxfGdzYUJvdZ21kNQzPYBFeHN7QZKS+1QYGr4K+ROg2Byl1Z4C1B8r5xyXbod
	 RkZOSWndNU8Lw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 02/10] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
Date: Sat,  6 May 2023 20:35:08 -0400
Message-Id: <20230507003517.4078384-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003517.4078384-1-sashal@kernel.org>
References: <20230507003517.4078384-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Philipp Hortmann <philipp.g.hortmann@gmail.com>

[ Upstream commit fda2093860df4812d69052a8cf4997e53853a340 ]

Replace macro RTL_PCI_DEVICE with PCI_DEVICE to get rid of rtl819xp_ops
which is empty.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Link: https://lore.kernel.org/r/8b45ee783fa91196b7c9d6fc840a189496afd2f4.1677133271.git.philipp.g.hortmann@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 5 -----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 616ab3c8fde4f..58dc69de94fd8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -49,9 +49,9 @@ static const struct rtl819x_ops rtl819xp_ops = {
 };
 
 static struct pci_device_id rtl8192_pci_id_tbl[] = {
-	{RTL_PCI_DEVICE(0x10ec, 0x8192, rtl819xp_ops)},
-	{RTL_PCI_DEVICE(0x07aa, 0x0044, rtl819xp_ops)},
-	{RTL_PCI_DEVICE(0x07aa, 0x0047, rtl819xp_ops)},
+	{PCI_DEVICE(0x10ec, 0x8192)},
+	{PCI_DEVICE(0x07aa, 0x0044)},
+	{PCI_DEVICE(0x07aa, 0x0047)},
 	{}
 };
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 698552a921009..197f1e3d7aca7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -55,11 +55,6 @@
 #define IS_HARDWARE_TYPE_8192SE(_priv)		\
 	(((struct r8192_priv *)rtllib_priv(dev))->card_8192 == NIC_8192SE)
 
-#define RTL_PCI_DEVICE(vend, dev, cfg) \
-	.vendor = (vend), .device = (dev), \
-	.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, \
-	.driver_data = (kernel_ulong_t)&(cfg)
-
 #define TOTAL_CAM_ENTRY		32
 #define CAM_CONTENT_COUNT	8
 
-- 
2.39.2

