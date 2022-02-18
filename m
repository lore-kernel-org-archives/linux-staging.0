Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27548B0
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 09:23:20 +0000 (UTC)
Received: from dslb-178-004-174-047.178.004.pools.vodafone-ip.de ([178.4.174.47] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nKzTo-0005Qj-Nr; Fri, 18 Feb 2022 10:23:08 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH RFC] staging: r8188eu: comment about the chip's packet format
Date: Fri, 18 Feb 2022 10:22:53 +0100
Message-Id: <20220218092252.853807-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structs phy_rx_agc_info and phy_status_rpt define parts of the
header data that the r8188eu chipset sends to this driver via usb.

Add a comment to clarify that we cannot modify the content of these
structures and remove seemingly unused fields.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---

Dear all,

I experimented with "cleaning up" these structures and related code before
discovering that their content comes from usb packets we receive from the
r8188eu chipset.

Would it make sense to add a word of warning to prevent others from
repeating this exercise?

Thanks,
Martin

 drivers/staging/r8188eu/include/odm_HWConfig.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/r8188eu/include/odm_HWConfig.h b/drivers/staging/r8188eu/include/odm_HWConfig.h
index b37962edb2ed..35a562372a1a 100644
--- a/drivers/staging/r8188eu/include/odm_HWConfig.h
+++ b/drivers/staging/r8188eu/include/odm_HWConfig.h
@@ -14,6 +14,13 @@
 
 /*  structure and define */
 
+/*
+ * Attention: struct phy_status_rpt and struct phy_rx_agc_info describe
+ * data structures that this driver receives from the r8188eu chip via usb.
+ * Do not change the content of these structures, do not remove seemingly
+ * unused entries.
+ */
+
 struct phy_rx_agc_info {
 	#ifdef __LITTLE_ENDIAN
 		u8	gain:7, trsw:1;
-- 
2.30.2

