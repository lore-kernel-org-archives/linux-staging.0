Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B52B8827
	for <linux-staging@lists.linux.dev>; Thu, 27 Apr 2023 21:24:31 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4Q6pSl4NrBz49Q1Y
	for <linux-staging@lists.linux.dev>; Fri, 28 Apr 2023 00:16:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1682630183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=I/n3uS94co8BNPTwp6zmfk8PIZTBgMaZTOtf11T/5us=;
	b=pIx8tgDjJGRZSuh31z8w9yqFXVDSNmn1XkE7xrf+dadFgwZLSVNBkHO2mpTPU+korszHnj
	1tt1S5rZlyqGG/EMyC10qErilQzCsKvXEhShfsECkN7aLfKMPoDzduogvToJbFjW88KmuU
	oUXGNOp5bkuuRnHMzZ1a3JDNa4xJYOFgTdv1vaHXTi6+Pd5sTZCGz0AOXKTr5KA7dE3Tws
	gKs6Cg5/tmJHAX+MSVXAHbslXOC26deMX4DgAdktnF9yYsyqX8oHWeCYjhoXHlaaMi2+Yx
	+ygZZ944eCI6UcUjpJGt6kcOL15cYbADFviln5FHQxEgut2z/byrjKrKdNJNIQ==
Received: from darkstar.musicnaut.iki.fi (85-76-14-243-nat.elisa-mobile.fi [85.76.14.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Q6pSS28BLzyXq;
	Fri, 28 Apr 2023 00:16:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1682630174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=I/n3uS94co8BNPTwp6zmfk8PIZTBgMaZTOtf11T/5us=;
	b=PpR61pCBkbTem5N/A1chGIBVAuoMOs0QZSwh2QzF6L6wXtKhWrrpwqv9UHIA2rXPLRxuT2
	aPkCptI6M0btcVOf2lnQRvmTvYbVtY8ALCA4Dt17N2VH2CMkSnPdp6cxlrj2uckmlECDGB
	6tvxr3fgCbjwVElWvDp7RFAQaP78Uuc=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1682630174; a=rsa-sha256; cv=none;
	b=yUHcnHt/o5aWrRRxoMkHkqBgSNPW8PAIaKUZzGy0l3itqunIElD5JNqsn3ie/XjLNDrqgQ
	pW0ygg9qQODhH6sokXHtBFgoFLKhy3cX0tnuP+AeGHQy+DvQ0rlVmNhBssYawUCQHEd3Pc
	tgSftJ6/WvgKTF3djXj6keK7DMFZ29M=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1682630174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=I/n3uS94co8BNPTwp6zmfk8PIZTBgMaZTOtf11T/5us=;
	b=M0blky4OjUv13t8VaotolpeotVWDa+pNTY+mTI21wiWuSGdQ162DbwWEdTMu3hASuOZzJr
	aHJ/eL8Vyb8G9GrZpdtLx/kcZRJGxxNJIRuZfY/yFCz0ljqzDIYgAsAaoCEMuDFvkWZyeV
	2j4c+S1hfYKc5ctLC+t3ZTI3c51aUv0=
Date: Fri, 28 Apr 2023 00:16:06 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: delete my name from TODO contact
Message-ID: <20230427211606.GD881984@darkstar.musicnaut.iki.fi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I gave up using MIPS OCTEON hardware after the drivers were deleted from
staging in 2019. Afterwards, the driver seems to be added back but the TODO
contact name was not updated accordingly. Delete my name, as I still get
mails from people asking help with the driver and their systems.

Fixes: 422d97b8b05e ("Revert "staging: octeon: delete driver"")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 drivers/staging/octeon/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/octeon/TODO b/drivers/staging/octeon/TODO
index 67a0a1f6b922..044e48e3d65f 100644
--- a/drivers/staging/octeon/TODO
+++ b/drivers/staging/octeon/TODO
@@ -6,4 +6,3 @@ TODO:
 	- make driver self-contained instead of being split between staging and
 	  arch/mips/cavium-octeon.
 
-Contact: Aaro Koskinen <aaro.koskinen@iki.fi>
-- 
2.39.2

