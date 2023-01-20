Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com [198.54.127.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F3C3C38
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 18:26:44 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
	by mta-12.privateemail.com (Postfix) with ESMTP id 3B6EB18000AE;
	Fri, 20 Jan 2023 13:26:38 -0500 (EST)
Received: from bpappas-XPS-13-9310.. (rrcs-24-173-168-34.se.biz.rr.com [24.173.168.34])
	by mta-12.privateemail.com (Postfix) with ESMTPA id BE92018000B1;
	Fri, 20 Jan 2023 13:26:29 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1674239198;
	bh=254NmRTKKpoPDDbLe8JkEKobrM4zw72lP3QGnoDEAjA=;
	h=From:To:Cc:Subject:Date:From;
	b=D8RTm9mcholnkiKBj+Nepe6m4W+9L8jfvSJmEtJ+XlCZIyPNzKmup55Iua8wD/LVf
	 tEs9v3nLPKGjuPputi28LHngKkiQ+EhMrx1mel4A1sLat38J332en/kXtNrpPTwLQN
	 csGcOM7UP8X6EHy5V3JEE1N+JYEcBTeBPZs2HDRk7W+Zp58QW9E1o48hsOBUWsLNS2
	 hMO/zkYf1DwJRnhuEBA3vmIr0/36vkPzFc0rSNdiUd/nz7w8+OwJofv+zr7z0973Hw
	 91JxTA7mljja5Q/NyLLInwbX3btYABuqkiW6rNsOHFFzGs6TxakIe9Gd3QukmiDXGs
	 tDq5ZxeTAl00Q==
From: Brent Pappas <bpappas@pappasbrent.com>
To: hdegoede@redhat.com
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brent Pappas <bpappas@pappasbrent.com>
Subject: [PATCH] media: atomisp: pci: hive_isp_css_common: host: vmem: Replace SUBWORD macros with functions
Date: Fri, 20 Jan 2023 13:26:25 -0500
Message-Id: <20230120182625.23227-1-bpappas@pappasbrent.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Replace the macros SUBWORD() and INV_SUBWORD() with functions to comply
with Linux coding style standards.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
---
I am not sure if it would better to inline SUBWORD() or turn it into
a function.
On the one hand, SUBWORD() is only invoked once, so it may be better to
to inline it.
On the other hand, the macro defined beside it, INV_SUBWORD() should be
turned into to a function because it is invoked multiple times, so it
may make sense to turn SUBWORD() into a function as well.
I have opted to turn SUBWORD() into a function.

 .../pci/hive_isp_css_common/host/vmem.c       | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 6620f091442f..316abfb72a83 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -28,10 +28,19 @@ typedef hive_uedge *hive_wide;
 /* Copied from SDK: sim_semantics.c */
 
 /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[00000000xxxx]LSB */
-#define SUBWORD(w, start, end)     (((w) & (((1ULL << ((end) - 1)) - 1) << 1 | 1)) >> (start))
+static inline hive_uedge
+subword(hive_uedge w, unsigned int start, unsigned int end)
+{
+	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
+}
 
 /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
-#define INV_SUBWORD(w, start, end) ((w) & (~(((1ULL << ((end) - 1)) - 1) << 1 | 1) | ((1ULL << (start)) - 1)))
+static inline hive_uedge
+inv_subword(hive_uedge w, unsigned int start, unsigned int end)
+{
+	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) |
+		    ((1ULL << start) - 1));
+}
 
 #define uedge_bits (8 * sizeof(hive_uedge))
 #define move_lower_bits(target, target_bit, src, src_bit) move_subword(target, target_bit, src, 0, src_bit)
@@ -50,18 +59,18 @@ move_subword(
 	unsigned int start_bit  = target_bit % uedge_bits;
 	unsigned int subword_width = src_end - src_start;
 
-	hive_uedge src_subword = SUBWORD(src, src_start, src_end);
+	hive_uedge src_subword = subword(src, src_start, src_end);
 
 	if (subword_width + start_bit > uedge_bits) { /* overlap */
 		hive_uedge old_val1;
-		hive_uedge old_val0 = INV_SUBWORD(target[start_elem], start_bit, uedge_bits);
+		hive_uedge old_val0 = inv_subword(target[start_elem], start_bit, uedge_bits);
 
 		target[start_elem] = old_val0 | (src_subword << start_bit);
-		old_val1 = INV_SUBWORD(target[start_elem + 1], 0,
+		old_val1 = inv_subword(target[start_elem + 1], 0,
 				       subword_width + start_bit - uedge_bits);
 		target[start_elem + 1] = old_val1 | (src_subword >> (uedge_bits - start_bit));
 	} else {
-		hive_uedge old_val = INV_SUBWORD(target[start_elem], start_bit,
+		hive_uedge old_val = inv_subword(target[start_elem], start_bit,
 						 start_bit + subword_width);
 
 		target[start_elem] = old_val | (src_subword << start_bit);
-- 
2.34.1

