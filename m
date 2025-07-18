Received: from outbound.ms.icloud.com (p-west3-cluster2-host10-snip4-4.eps.apple.com [57.103.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567C31E7C34
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752866438; cv=none; b=UhYSXTVI/KAlpASKIKkuIxMleuiGQFJk8GtTGo/HcsVslmAAaa2YcXWdL7e4PUsPpbsF+3EPk4juUfj0U/Jc6ULSB0lU7hBoAQuTuFsmxe2cpOMYEPKcBRgahORLmTmVxEtWL2YjAhQ6T1ToMCUA6+Jom0mkRuvVQv67mj8C3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752866438; c=relaxed/simple;
	bh=gb8mSNxhmA6bM61T+szspUcafabz/KCOU2t1kGhFpVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6ba/NKzlEamYuYUNzFKIuZm8k4MKTxULLSt/Cu0UjWInyZMtExOEzPM+3PwUIPDCjbKqFTVVm/ZwOGfFUdhG6ECmJ7c5z4nJygnarfvrqFgz7TDLLqB8+D8tSR8Rh2XsFwjCKcjSa6anbxU8LH4XJyEQodfubdp935HJdvMsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; spf=pass smtp.mailfrom=mac.com; dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b=VpMeIN70; arc=none smtp.client-ip=57.103.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mac.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mac.com header.i=@mac.com header.b="VpMeIN70"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPS id 7CBFD18005AB;
	Fri, 18 Jul 2025 19:20:32 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=Gn/exlCkPK++V6GU6sVPsFS9hbcFTg+v5uHcMJYAbFY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=VpMeIN70Nh6lsG+BmKgD09mwIxyjM1yvwX+jzZ+4wA1qM6axJOkrSaKjxmLuKtyuHjUEiR5vAkXhlXn9FoN5dqA2erhhnnhQJOQiU1sOfwBtHtCeAImGhPEeffqSPjJV9YnbMvA22XKFQURwypR4MjSLnd9Hc7bfssY8JWQHIzyZOx4jqKwwI7uae515WLy3p1RzucLwVeziQr9+Mv+Rapw9pF6LJl+szhyTFNXZNJCpvMjkRPI4s6PwKJUEdxdg3NSLOBUgHCJkxTSQ3XkFmjSpCMnCBS75/qpgwXCp0MW8VWQ93H/2lM7mPg29h+5TnZGapJdcgPyu3KM0a7WlqA==
Received: from localhost.localdomain (ms-asmtp-me-k8s.p00.prod.me.com [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-6 (Postfix) with ESMTPSA id B104C18005A9;
	Fri, 18 Jul 2025 19:20:31 +0000 (UTC)
From: Tony Bronzo <abronzo@mac.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Tony Bronzo <abronzo@mac.com>
Subject: [PATCH 1/1] staging: fbtft: fbtft-bus: replace blank modifier with identity() macro
Date: Fri, 18 Jul 2025 15:19:35 -0400
Message-ID: <20250718191935.5918-2-abronzo@mac.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718191935.5918-1-abronzo@mac.com>
References: <20250718191935.5918-1-abronzo@mac.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5R9chqEDPzihSK7V82JzWp9ETmSUGR3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE1NCBTYWx0ZWRfXwh93EQq6k6sI
 4LjPWC7OqTqYjCdOqBqhRQiqEm2DSxTvq8WyTMxzPwKF56onlQ3fm8GThCRKkwpnBeumEDizXG4
 iFXnzNCbTxic3HSBKbjvO2gGf4fHigdic0oc/BhjF4pa+xHNL0jxFqTIihyDgDOXZ6qkNRDIAfl
 wyAwhmmYQ1lBLFSamHeWshosBzlzEjZlxxTPh/v7PHG6wmF9nUVxld5Nr0hir3FRM954tv/Dl+T
 mXCS3xY5a8AN4Tf7Dn88n/faUVx/JkH2XAwz4Y2bbUcXI++11W9kbdYkxP6JGPqCBQqozEUYA=
X-Proofpoint-GUID: 5R9chqEDPzihSK7V82JzWp9ETmSUGR3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507180154

The previous blank 3rd parameter in two define_fbtft_write_reg() calls
created a trailing ', )' and triggered:

  ERROR: space prohibited before that '('
  ERROR: space required after that ','

Introduce a local identity() macro and pass it instead.
No functional change.

Signed-off-by: Tony Bronzo <abronzo@mac.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..46fcb6fa804a 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -5,6 +5,8 @@
 #include <linux/spi/spi.h>
 #include "fbtft.h"
 
+#define identity(x) (x)
+
 /*****************************************************************************
  *
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
@@ -62,9 +64,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, identity)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, identity)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.43.0

