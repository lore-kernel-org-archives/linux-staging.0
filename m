Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2E346E44
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 03:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776654349; cv=none; b=TW83XF1B31GjScqGVOeKauXvln2xiQRaiJ2g+W662vag3rPY2DPZsfOkCpv9VfU0JXDE67kOby3tSwkSdTqXbBAHbOgffBxpSMgjzTng44hD6ONhOF5r0oH1/IdMIy4+ARJG5YC0Y4CCn8/UjXf7/gzBIWXNCKPF9ZQKvGS2F9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776654349; c=relaxed/simple;
	bh=SLAULTiXKePCwBf1ekudrUV1+yLHD2W9CaU1X9sbknY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZUUaTzmzqNrup/hgwCVvTF2czZ1ISnSbzEWw9kFeNgVlnb7B/BUDVcfrphDOKIXdt/0CcjuViC6fII2Kl8kb+cqDcQGRwzPgqGsO5sJd0XhDJd90XULE4HtCXYfobYc3pmexJyfdC3aXvLvlQyAYPrgMkoT42yYeJus8fhehF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4OcaKAH; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4OcaKAH"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cbc593a67aso235336885a.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 20:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776654347; x=1777259147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUUApDZ9pkHSXvkQ5dDW8HED2e2a4WgBmtYY90GAGX0=;
        b=p4OcaKAH0gygLTHKhpN7lFAuAaxfna2oC0lyR6F9+bzSgOc0M8aEz/i4icidXw+AJu
         oA7uBsuIZP4tLJEF4Y0tIDijE1zkL/WXW1eKBs32rT4afPTkNzo8Bz3O5f3SkxrCmCeY
         jywrHx544V2N9cNi+Z/sp22y74snKL/UOIXCECu8cEoY0ZYLzhZaF824nDl+G2ESN0i9
         keG7eBO2L0AspYsw4kT3NUxh6saVv+KnOtlVi2xakCdneDK/v1yCT2QMYG9RHDu1KN95
         JKcGnSRRafrKehj/zeo8sCX/5VSzOlNadnqNNjYdsDhatlIrCTSW+JsvC1SQiQpc5F8s
         1U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776654347; x=1777259147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUUApDZ9pkHSXvkQ5dDW8HED2e2a4WgBmtYY90GAGX0=;
        b=PSrSuyPqdrR0FAnN/tOZBQHBZdh4met9AZnFC/gFHYCP/N7FAAKiCaJ1dWgpHjFpCJ
         CCq8HzETZQbYsNBvCewFRdkkmlp7IP2b/rKMrIN068mTGC7X9tabXJcG+Bq3wQKJMd4d
         JUuzC0sq0QM2BHQy84iJM0REYMUbbNoGd0OnZKvkTlMwVt050NzaR5W644SAluLXbFTH
         MAo67+gJU2N70d6UrN+d8bHyTSJF9fYzmC1VghyT7MFS6QV2acXf4z3OXtjFzs+dHMOd
         BJFgHHxRy5JTeiXPIui5UXujGcJyuJgnjcaUGFDKdcbvw0tW4XcvKhOStcpUWOf/tvqo
         soAw==
X-Forwarded-Encrypted: i=1; AFNElJ8/e2pglw3B9/6YjvNv94lty7BAveBHSWZdnB76ZPMKNK2MrQCVkFsq+lo2V6zzxBWAANZgB1ZEdYn+nhuV@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2cUHcs3FCsIkf9iHMyIAxG5S3vQgKeC3HSwktvJN8032JKlxr
	20Aitqvl3rbWaDwTjJCJJglpKmK0+M9mQtZCtNbYjvSMPPlt5Bayatk0
X-Gm-Gg: AeBDieuBaEpoulvgCzDWLtXKa2J3Gu7VHSda40fjPsQsJRN79EbX/2kl7MiuXhjv67W
	/9a2UvMDNXr0/xxe2Tu8Wk++1rTNGWBUUw9NJCDzIF/HxP8u8gqw7BGGFXLBUq2evtd/uzajkIV
	MGFF35Y7UdLsLYWy0rR4xK6CHAhZL4nd++Wg3OgE/c3dtq019PtmzaMLYwicBJLIjwvIRK8bvs8
	Fb9micU1yoiZT5pVo9VwE7DMdhBFRo9OHA1bXpmsE8ejxapnQcjveZHmY8XBluWfWc8NavuHQLc
	qMgnktl0vNbwZunE+9fja5EXaq+yxBreN4QKeTocUmpxE1Z3MVQ+/AzEQe73H2bi0BX7v52+zU0
	Wfl7CIpnTqhQ03CxbiXcdAEIt5oHjbLoclDnNFvv65DY4pD5bFsRBjvG5bPEAnonMmhdyKOM38j
	qgtmCtaQUO8NAhGX0vvIkoqkKJ/uRu+t+ePg+OXrkgT2NUMH3YEB8df8HcVHdvOUoWs+KeHw==
X-Received: by 2002:a05:620a:4148:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8e78c2cc4c9mr1550434785a.0.1776654347486;
        Sun, 19 Apr 2026 20:05:47 -0700 (PDT)
Received: from localhost.localdomain ([165.85.38.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe98dcsm726023185a.7.2026.04.19.20.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Apr 2026 20:05:46 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>,
	Ingo Molnar <mingo@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>,
	Taegyu Kim <tmk5904@psu.edu>,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] staging: rtl8723bs: remove shadowed bDumpRxPkt declaration
Date: Sun, 19 Apr 2026 23:05:43 -0400
Message-ID: <20260420030543.72423-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DBG_RX_DUMP_EAP redeclares bDumpRxPkt inside validate_recv_frame(),
shadowing the existing function-local variable. Drop the inner declaration
and reuse the existing variable to avoid unnecessary shadowing.

Co-developed-by: Myeonghun Pak <mhun512@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Co-developed-by: Taegyu Kim <tmk5904@psu.edu>
Signed-off-by: Taegyu Kim <tmk5904@psu.edu>
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f0..cf5698dda91fc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1534,7 +1534,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 			precvpriv->rx_drop++;
 		} else if (retval == _SUCCESS) {
 #ifdef DBG_RX_DUMP_EAP
-			u8 bDumpRxPkt;
 			u16 eth_type;
 
 			/*  dump eapol */
-- 
2.50.1 (Apple Git-155)

