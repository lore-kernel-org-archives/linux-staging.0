Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7A2BEC52
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781437743; cv=none; b=MxDVDnhfVuZ8IJqE7wzeZBmwcEvHm3q6zO2GNGIFeb4r3Ey0nwSzCnKbRkwQMkl0hM36tttMw4Fnd3QKvyWXlIwEukNw4Qz0pscDxJf7x+7lclleJrDe8VHKcB4BeOoOm1KWYg6xbRrQ/E0+j3ZvjgwcS2qp5A+gcxdNyUyAbzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781437743; c=relaxed/simple;
	bh=3eQMYrqcZR+H7vo5G+ve3stl2q1Lclf1qKjKDAMgdvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3r6kT1fgqs56KAR7Njje4GO41QQfuJefVyD+O8Z5sDWDUxOTWZydWpuJA5SkkZQn1YB3TDPduT81m+L5UFU1+q5CKrAFp54/FLCHi69wAXlsC+833TKoKM+wjbn8X+H4y6q6iJQba2RYibfCPAn3eRYJDm7kA4N2al/PNOw2fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCD10IxV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCD10IxV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8423ed8c930so373767b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 04:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781437742; x=1782042542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nst4RlWH0dhLsxuUph3akJxwWh4r5iV9JHBzF1t7XFE=;
        b=eCD10IxVlLfuJ2DimxO0x2hHEEyNbzjANe9iVXlixn82hfHbVwcOsfuHI1gDSEBog2
         K0gp8w1P9yFvwp6OQBYHCoWqLwvPcglmXr/S/itbq++FFBLr1hJoT1QB5vBZi4X7aVTM
         JL3E+DnR4NAHgH2SKtsnBzCTvvZvjHE+1cxHdHQlGwnKPvIxUxINa7pD1/4PPC/sXvkk
         7Jbwf9CAzOC8lFPwaHchv0KzwIeFA0KeBCLOf6/89flbQ/OqTUme/4Kuu6nZFc7cGfht
         B2F9EOr4QrYRk16Zsx61bNTBvJKsSoGEsd3zQkUx9TH/Za9uefa1kMRC9sRDcCxnFb/U
         ExYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437742; x=1782042542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nst4RlWH0dhLsxuUph3akJxwWh4r5iV9JHBzF1t7XFE=;
        b=Fk01RpLKRxLfUm+j+GtSHifzUeEJ7Aql3f8RV/XSqd/YDsuQLMsizoXhlt270ag+QQ
         R1kW8Gu0zoSuuumjHzvUzN7PnOU+5X7tSF+YlcOWEcg/bbmB5KbCARKrKQvAjNFoed7m
         P9L+iXvwdjSR9kpKe0vhDToITfwhlevYrrt77lzxCZCQ+X3vQTgSAoW/Le9QDqAFFXVD
         tcyX3VhKQSCoPspPa6P03Xp4v5mhnCWY2Hyfz5PuRAB8MoeZSXp5q0uZd0VClRbWmHQH
         vtthA2rDcZuXPc6OKjK/3wYhmSTIWU3wTL/+rLv6IpECpMUGPRCQNIHmRh88RP5xm5+D
         aHoA==
X-Gm-Message-State: AOJu0YzuQs2mzuydg21tdqSfnfajhN/TIrFEMl8opGvWPT1nQc0vJVi/
	chM95gDD8RLCKaPUxom+ciyaljzH+Ofc6Gx0xo8+NDk5bLOs55NgbdHh
X-Gm-Gg: Acq92OHodqCYNxakf4CB1lphpChyHqUMvHTG0khuQvAuHNYULzb7HXvtIZo0LoXdLJc
	khkUb+aOlMkdwGOIjkdoqrzfKOnsOscAIG7IqUl3PaJnzJ52waf8RfRSuW1auhmRHvwwJ2L6OOv
	YyRI/tXMmOC8fxkcLYioDGG1rSMQVLvUSAblnL22lPbRejYdcICUahAoj+gBKUJ9QoH+nRNaybS
	ceT1Y1uSWAUmusbz7e9+HDNg7xzIXBI4D0zgnk9saYufC5kAU0jSRZr9T5yh56jGyuSqrN7Yi+a
	aopK52vWBiMCm/Tv1xIM7G8hyslCZknsf/eZqVGQz3TA7tRvHEur+WO8ttZPTxF3zTrfqRCG/Xf
	6hTHow83wPkbRDa+LoLu5kno9XDIaHxDGkuqdFQC+wLAa25Hsjjf+RcSOyDFHgswMtnMsn1hX5D
	ENWZeA/ppNRdpwAAZLRivsLVG4dyj7Own2s8PIRaxNu5JfOERlCvCzcN/TJbPyHofyk3Hr4kKdl
	fRapBGuB8r+rryD
X-Received: by 2002:a17:90b:2dc4:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-37a0156049bmr5522444a91.2.1781437741984;
        Sun, 14 Jun 2026 04:49:01 -0700 (PDT)
Received: from fedora ([2401:4900:79eb:8cfe:b4fc:6fb1:4b23:8420])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2179d743sm7388808a91.17.2026.06.14.04.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 04:49:01 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 2/2] staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown
Date: Sun, 14 Jun 2026 17:17:39 +0530
Message-ID: <20260614114739.87061-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_rx_shutdown calls free_irq and netif_napi_del without
disabling the napi instance first. As the free_irq only waits
for completion of hard interrupt handlers, the napi poll
function could still be active. If cvm_oct_remove proceeds to
free the plat structure (which holds the NAPI instances), the
active poll function will access freed memory, resulting in a
use-after-free crash.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index cd36b5ba6f6c..3e9d58d32156 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -535,6 +535,8 @@ void cvm_oct_rx_shutdown(struct platform_device *pdev)
 		else
 			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
 
+		napi_disable(&plat->rx_group[i].napi);
+
 		/* Free the interrupt handler */
 		free_irq(plat->rx_group[i].irq, &plat->rx_group[i].napi);
 
-- 
2.54.0

