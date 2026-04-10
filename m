Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B2E3ACA65
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815724; cv=none; b=dF09JuszR3aEVr8sAifB6SrVhF7beh95vICPM4WNbS8mfvNrzDrZfKxCK1qhjPKj9609SQzP2NAs+9iO50yt8Ljc5Hahd9q5UGVLXR4xL2LF+HEp0ewzFOP2qB4BpHXemYjSCAuO3ebo5mDkFfd8cn8Y/EneNIwQg40FiVWStsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815724; c=relaxed/simple;
	bh=zTnHLQD2HNQS3TBUN35WzG70fp7XRFIXVsjGjAp3eAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzLc1LA44j1Td7tgL+bZ135ONLML+TeOORioL+PqJ8tpTjQ0NzI2aAR2ON85zgjdtkbbnE+Tx7d9IavKnTQezqt+CB15I65cq6td+2Ldw99d0VeKZySWN0LySqI3l+Yxlot9kfm5kgmIWK8wvAHZGeD4O9O0we0FUU2If4UKFiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhnP/K4v; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhnP/K4v"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66c4c7e2bb7so2454588a12.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815721; x=1776420521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEmRdRU8ohaMy0h7XL4yvnjYX1agG/OYKNFzIwdN3F4=;
        b=VhnP/K4vFOvXb9W+nIIf2OSb+JDso7eCwtL3NcUqW01inDTrsOwDEtjzvv3J9nXFWn
         PMvIYifquRoPYK/bl/EJZB+RRGyHByiQL9lFO3VzYjHyTZ1xFXv806NzNtzaR1ib8Qox
         Fj+JkB5/re/JM5GA3K0UkFVpXxCeRjyvcg074lAKv1xy9Z17zqXqBM3I1mhlpUsMUI6q
         aVakUNC8PlVWSl3T/ZqluXWRhMJ8DgGOR1uelCXSb1XC3OgNZfOnCoAgsrhp5qE/byfX
         BtF6j1wHykaEqd8Ot7LUdZN/tCbT05AYGnn8NP+uA32xqLAR7jC8oHLZZmme/4whS215
         Cn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815721; x=1776420521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEmRdRU8ohaMy0h7XL4yvnjYX1agG/OYKNFzIwdN3F4=;
        b=osaSVCsq+aBTvJKjUT0qChcBL0937KossSFDmRc8HWR3riSmyFAzU4bZGKlrIPTCW9
         DoXNV9WRH81yTUiR03fe/o4C5DumjMb4DKnJkpvZiIkX48zlp0Nu7wEcXyPC+ns85vW1
         97YIvikMqMgSlfyVeWFkyBR6jKTtwPyneTxhta50LxK2aZAux4KXFRGnjUM0ta5N6O1a
         Y0va3u9J4eamxexP4cagFp8hz3yBDnyjueKPCeEK4C/BLtJywmv9WS1PbSKWjFC8U+kH
         QxGISfQgHqO85rsuDRySHzwNmNm2G55kfm2EVjFQBHYZ0gGMaplYSn5imAHghczjst8F
         YcGA==
X-Forwarded-Encrypted: i=1; AJvYcCWaSDzqTDzj89yeXRJusMttmoqSRFTFW2sclkRlBggUhW+lB2vRY8jZVbuY3mITGHm2QJpzTE6XJYN+DOdB@lists.linux.dev
X-Gm-Message-State: AOJu0YzkHT00cJEirDAn7LQatZwR1YjhrhgETV78AkiGK2e96wc2TsKW
	cYDXSBQdwFPI7OLNevcx8dEMRp98tnxhKIXNP5JGKwLTIrIvE+4N6hI8
X-Gm-Gg: AeBDieupQVD7CSp7tssGHILr3Cucmx1P2ueybjtw6Ohi+UVuitK0X0SGvbvpJoAOyBL
	vFcBYzdEn8w2kwHebQ9tex+cwyH2Drr7vNgHTrKmh94fM0fdIzHHgwqVVPg0twlEwRPmfCWJsHj
	gvJp3/m3B7Am3ijwxNiRFArFYo7XKFkPvXqcaDP1TgFtPs9rlyOYfYqoAK9RNLS/zxwEw5OQXZa
	DA0qqV94bjA7jVIbmJDFB/HSxu04byC6+R9nt7eECwY5xWgYe/yIrqbVUkgLb1Fwe2YUgRBRWhy
	/2kz9LxgvLxKakWsCrPa3PEVgtn2+6eG3eoDpnMo1KQNvJirVIZzTEGv7nFSqQgvE95KkfG2p1N
	vcb27ODbBHlx3Kd4OpDiSgZeQR3yW76/NNqkDB0NKeQAnh9rQPaHOVT/T2kXIQ2Gi0H7Gpi5mOX
	ndMWfXfAB4dH7OLmHR6EJ8ZnsE6cdOob01K9xnrPkLOVve8Y0VMBDcaDV9kETPoW5AwlYSDlT/y
	yVX260k3bS3tdM2ZEK05CZHjXyxgqbFJr3YRVf7bo6Hcd04J0w16vrM8PdR0BCY041rHtG14DFV
	DHa0M58cgycBEPHwyEA5JxkyR3Vdq1gfBX4MhcedsD0iy93GkItDvPlCX7KmtN9I+j7Dx5xMKl2
	UPfmDij/Xwv1xRLtJvTGszgLnWp4NXw==
X-Received: by 2002:a05:6402:2486:b0:66f:9480:c1e6 with SMTP id 4fb4d7f45d1cf-6707b1066d4mr1095629a12.26.1775815721312;
        Fri, 10 Apr 2026 03:08:41 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.153.158.34.bc.googleusercontent.com. [34.158.153.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm433488a12.10.2026.04.10.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:08:41 -0700 (PDT)
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
Subject: [PATCH 2/2] iio: frequency: ad9832: simplify bitwise math
Date: Fri, 10 Apr 2026 10:08:32 +0000
Message-ID: <20260410100832.1388-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410100832.1388-1-joshua.crofts1@gmail.com>
References: <20260410100832.1388-1-joshua.crofts1@gmail.com>
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
 drivers/staging/iio/frequency/ad9832.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 1f6ece79b8..260c2e3a9b 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -113,8 +113,7 @@ struct ad9832_state {
 
 static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
-	unsigned long long freqreg = (u64)fout *
-				     (u64)((u64)1L << AD9832_FREQ_BITS);
+	unsigned long long freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS);
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.47.3

