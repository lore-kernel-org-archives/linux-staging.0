Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2F7E
	for <linux-staging@lists.linux.dev>; Sun,  7 May 2023 00:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA858C433EF;
	Sun,  7 May 2023 00:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419833;
	bh=WCDkNsUG6O6kzoOSpg+xE7gLvYMvIYK0BNQ31HEB0sE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HMtwJ4JybTQfsMeDAQb4zYvXRa6WMTbw5HVUiA2m0vEZJlV37BqcmCXPCcidpPgcp
	 9JmwBXuPQTTBuvKrGbsCoIFfxflGlDTm/IQpPHpp6il2eRtMZDHJCaxPOqkzWVRlxp
	 eCZ/FFFkIz1QNyGNilYWnx5zFDTYJAeZ0pI/esbBcHSFfrpAzeNKs3CbcTwKdsAh1m
	 Yjm45ZmpEBOZUgoJM97B2qhQd0KcGjkg9lMzRV9s18ukLJyD24/cITZgk9iKaR7NhD
	 FknlzcFY6Pw+t/F6i3KevZ+cu0oNQvz7dSWOmQyvIwaBvj8CpIhffvc5xJAwBSAPKL
	 YpIooQYmQaaPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 4.14 2/8] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
Date: Sat,  6 May 2023 20:36:57 -0400
Message-Id: <20230507003704.4081392-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003704.4081392-1-sashal@kernel.org>
References: <20230507003704.4081392-1-sashal@kernel.org>
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
index e1ede9fd4920b..1a5218e61ec91 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -61,9 +61,9 @@ static const struct rtl819x_ops rtl819xp_ops = {
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
index 9d3089cb6a5af..ff9b544edf875 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -67,11 +67,6 @@
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

