Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFA21A6828
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775910955; cv=none; b=dxUi3V7Fg7QP7Jdd21gqwxMzVzxgKmSQ3oaKgeeRQTSSFcoVirz2lKHBYB8bUIct2TJ+fhy2tihOIIX+oUQcKuiso7BMw6EWsbjRZDUCxaNGVZ8+qvt6SqsHYBVtXcTCKTqBux9x0LoeCzypqCW279OsBwBg7k6eJ3pbi/Ksb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775910955; c=relaxed/simple;
	bh=efT4gFsu/j92HZWkfQpIUd+RFDi8g5WcBoyNbiB7f6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hSC3FwdmcFHW8f76lmddQ8SAssj+4a/DuVGdH3AU29xVdRRfuS4H05jnqalMcxMlhE0Ak/XciyMRclV/ybGrNewUgW/ivSL84dY2WepBflbIwoyuh4YljoLSVHKJUMGn7ZcizFAyu0hzB2aEzwHaSbywlOE0h99bwZkjv32FP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLm9MKlK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLm9MKlK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso27806345e9.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775910953; x=1776515753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X85TaJiSk03ThcLTorKFKgIn8WKe/qweX0BaBKvuylU=;
        b=cLm9MKlKhh6tWwTyzLQFWQ/g5WmdSoB8/brhdkkkljJqO6T/B1I7Avy+0S9Da2PWnf
         wAfWc+iQ8X8ggCe+XosRMASImgkAJ5GExNZ7QlWVM4VRgYmEnUWoxd08gXzpI5ZCjDq0
         UojrNmj8U69+jlCzH0rAowaAnqtA4dK3CDlJvR9oV76DXA6eKdKoEVFZSUaV6yXmPO/o
         Nhjq3AXc1XvtaGnW7G+L/SOwPTWQRyB+lIq0hbAMxqiKAYgCLBJ4FzOMippnoqSQieul
         XHPU7Hnw0yvZieH68T+ta3y8TZvWlCiDuW9E/a9V6leWtDCrmF7e6annRkGisPdL4YkD
         jvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775910953; x=1776515753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X85TaJiSk03ThcLTorKFKgIn8WKe/qweX0BaBKvuylU=;
        b=oRvYT6veA2sUj4fNPcSBqCCO6kgtNs47OdfGsfHVvCQTrirhK4t5QEuzeRz+gMZ6L/
         5kV4CVou8WjtxDhTbR2uEsQyGSS81hFz4qWWMOxVgd15T5GWVnLdYxjDTpGw1g0ODJMG
         ywmOtb1KHY7zGp9Q2Z5ZQuW7+bCdupWlbg4d0jKuopaVgicT6VmWYkgmpRJ3NrqBZeHR
         yQ9oojpKauGuw3QGSDUoNYZP5Ufumq2XA37LGEJOvJ+TBOxk58SPDhw011PHUy7yjr+C
         /QHH8y8yjhK1xPCVI8kigmnwyqvUlO1WNLmTuekOHr7dOA9tLBweKdOG1Pxc3tXQ7Dk4
         wP9w==
X-Forwarded-Encrypted: i=1; AJvYcCUxga9BA6+dh/FGnTuePDp5JUf9F53EtVGQWvmG0Dxqkj/8zNMqea607+AJXBEpyIS8DK9fQb7yGVVr/AYf@lists.linux.dev
X-Gm-Message-State: AOJu0YzuHDWM5Nd+ePsht/8LrX+uCp+NpKEDRRwLLqYc9h1tuK2DcFo/
	SdnHG92QE/dh/2HGH9ubb6Tzqu0WHN5+fP0uN8x7xiPmCUMO1QIBk8DH
X-Gm-Gg: AeBDies3odGkLmlqPGvUhBAcTwjvsRTni0d+dWiTDmN1AqBGeKU3RgH/V+G+Ay1MX2Y
	zmYhsxDM9V/yg0YimNiym4N11PA/rK+aTKCRIXeBx87GqDszion+o0lAMlxtWlzn7Xzl3w4GLUN
	TmCJufRAyVsr9iH4ryGZKq16dwEtlbuAH01EtKLfex4m0qf9K3OY1+6O91ARlVBQPnuc5eBx5PW
	24HDKOw13RuV4KGSE6EgeFqXPioK/Lv+DLruQ5et9f3S690epatqZOzmQqh+ChlSfKX0U3Yety4
	GKTXRVP/RbYL216QnwMzrM6Y3X3m7vE+bJhV4FonpLfmfjNNFvSj1bLMvvA0BrRAziMIvvx+sca
	5TkFOKkhbHlVeXnQ7vcGqdx2QjgmPy4qA2boIT+B1BnJXCn4CUgs39rDBedf/kNDkRrNItP0L7O
	mu2CKxjZlqHC5VC+n0TF1TElaCY9EenVRlbiupXxFdILMS8DSTqcHsogFi9LpJ+MSXIHt62FYM6
	e1Hy04kjADV7TDqYAYZ2w1L1KORm3unjwE09U/jrNJ+UcnVonMpAxylw8a32lret9+XEFpO3+kC
	gUy90se4ZKdjbmd5FA+ggZt+pn6EIiTaezOy+SuxPUMUqTAkvn36GutlZHUCY7K3ALDxXF6Ro70
	=
X-Received: by 2002:a05:600c:5397:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-488d68a4765mr95095325e9.23.1775910952548;
        Sat, 11 Apr 2026 05:35:52 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm103104385e9.5.2026.04.11.05.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:35:52 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3 2/2] iio: frequency: ad9832: simplify bitwise math
Date: Sat, 11 Apr 2026 14:35:12 +0200
Message-Id: <20260411123512.84739-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260411123512.84739-1-joshua.crofts1@gmail.com>
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the ad9832_calc_freqreg by adding a BIT_ULL()
macro instead of manual bit shifting for better
readability.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
 - changed ull to u64 type
v3:
 - removed rogue vim typo

 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 8873a6d11e..778aaa8747 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -112,8 +112,8 @@ struct ad9832_state {
 
 static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
-	unsigned long long freqreg = (u64)fout *
-				     (u64)((u64)1L << AD9832_FREQ_BITS);
+	u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS);
+
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.34.1

