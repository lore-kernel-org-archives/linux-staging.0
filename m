Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34017E
	for <linux-staging@lists.linux.dev>; Sun,  7 May 2023 00:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE0EC433D2;
	Sun,  7 May 2023 00:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419779;
	bh=MIvPxjcmKdltahsy4kdgddZDQ3d9UoS46j9QmEXBL/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iDD0dMrYnMbwx1vSvIv1fu3HNPfcXrOCICxRVKLYkrvpD10RCqQCt28oygnXfcczK
	 bZICzvOFg5SCJUk3mLUOhzuk1o+kIG/ujcMTelruFHpvNnXMT/NfupK1H+PJAZQypU
	 Cnmap3d/vh6dU0OkbOYlsEogaCvxSxZ8S3NO0aDNFUAuBu3ACrikojCbZ/20cC84dl
	 q3bPcOrG8h8D6ySzi3VZaHDf7Au2KcdElnCIRgKtAuUte7GPUCx65Yap62R54n9XxU
	 OplEkhSLh0YSujjDJimeVqAQ4gkIcSECrrHcmValq/yPE9HBgLZzLyqTCqYlGl53BB
	 SJCJ2CNPc0yJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 2/9] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
Date: Sat,  6 May 2023 20:36:02 -0400
Message-Id: <20230507003609.4079746-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003609.4079746-1-sashal@kernel.org>
References: <20230507003609.4079746-1-sashal@kernel.org>
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
index bcbf0c8cd4209..eb46b14069bb1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -50,9 +50,9 @@ static const struct rtl819x_ops rtl819xp_ops = {
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
index 736f1a824cd2e..7bbd884aa5f13 100644
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

