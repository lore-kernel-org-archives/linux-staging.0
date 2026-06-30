Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7A36AB4D
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 03:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782789814; cv=none; b=oZF4bidG5rwpTPm4ecIj0v9ONl5vOV5adDTpZRLb/bUUU7Bp02UadILdx0AhenSgOEb6UslFSU+rkg5LjPel/W6Gss5sIhiLoK6oDREqhVT92c69RhTuUJj7Tg/tmjQifeaNXOLULiXa7h6dIMc7afFH7JEEHquFK8ZygF8deB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782789814; c=relaxed/simple;
	bh=GEWQmwoNCJmCwgrNxAvDHtsa+YfvsbHxx8LGeyKpryU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r76zeojqw4uc+QQSuEviQUbA+28ySxMRSwzNDR8MBsEhgolUFth53hlIjr/qpFQPNQjuuGZpT+ImB9Pr9g/PpIxNnAiketcz9xPuWpZo3KoCgbEwXCPdwoKYCgUGq2c+a1jykdmbJhVTNh5th3N0QVlhdn6er2bheWwzhYYaRgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaeuwYbN; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaeuwYbN"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137335bc3caso8270350c88.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 20:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782789811; x=1783394611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1N2TEaibcJ7GIyHQYkU2Fx6MeyHpeL+NE+JylwXxFFM=;
        b=NaeuwYbNzeRS2oxM1L9+wU4YacyAaYqoF5cikMJS9PKp0kKB2YMkVWlD5XugreqLiu
         0y+LEgMDKtjgD+EtLv6fBOIWI80JL05you8o+9/3OIYn3le/9lrqyHWgQOObYkAkmf0B
         f4O5tfbJl7DGdL5tx+PeC5Lez+OyujTOXcMVdBUzp6sG17BXabDswz7CetF3qMQaETSj
         CCTEbD9d4zXJQ9h5uu0cB48TSS/hjXvplK0t68R1BPWJ91KdkcHC2I6MKvgRIRZFdZxK
         gF02l+JgikoWWdjRFnh8DwQ0YDLLYxXrnW5/nvurXjQdgWpLXQwMO4mHuu/7RzTw65OC
         Y28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782789811; x=1783394611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N2TEaibcJ7GIyHQYkU2Fx6MeyHpeL+NE+JylwXxFFM=;
        b=hd/A2OW0UtCN+PcWWJp7L59ATYM2ZY1RU/cPpbpJxRU9EW+GKV9/VzwR6lt7eEq81v
         /20Wgs6V7YnTutPVgPmZAW1jYThVqjb7L7i8W8hG7G9DSOVBMF+kPE/kGv3JvvC835Wh
         +u3SHQIZHB8/0tgPVBuGJzGIR4zOP2QHCcXvPNlW7jF+//TUKybqhmG84rDCuN1lXTMC
         qTp94nU8m49+u9L8USZ8o23N6m2xHI+BsBYPz5AO1tHnATz3ct33ddHewIqnijstkCsn
         xiKrLv857S03LludS591ONAGoHxDzUwHSea/9KYuLm+sXv3Z4UaikEzC+P0S87yBvtHC
         L2Kw==
X-Forwarded-Encrypted: i=1; AHgh+RrbyTnaxQhSSHTb8cR7kiIDld3Qtscd94oSPYdzxuaMeFkpGXG0FHIB6RUA77HVVZV6EgYOx6jbQ6a7lmah@lists.linux.dev
X-Gm-Message-State: AOJu0YyeVJYJSRqeNSGApVSmFUUmTRL9617IXuKrAUor46MH/Aa3Kyua
	AVSibgUO7riH1p/trCVWO7Tkq/QXZZHTCfoqKtQXetgFJ5nwQwLnYgoD
X-Gm-Gg: AfdE7ckTxpGz9Kwn3mtZkbnp+MQeGE7neq+3ZbV41CZA6uoaUXoBWVAFgkP/H967suX
	ZLUzcpk6AoNFfrFziTeX82yFJQZdzBZ6z5fBmO25n5zKmYq4h9q+zXodsADB+pYiKR1qrdeXmMO
	rCJo7R26xvNG/LrvGinE4cR6hmtcyIp87pTYGznthSD4dIOk3eAIXkAHf9E9ceJ53pYxNY3zB9r
	gdVfMR0lBkZKecQ48MARLIDUWS7PBM4YwFspVEY7U2BIgNxCG8I+1+CwvUPHHJM1wxyBlsyFunW
	0v6IbFCg5CPagdyCSaqncAxSWAoNMafVhwntDnFaaVud080Kwaoq850f+CZAKpmDJnXLualEoBW
	ZMeO0a0msDbU8mmDqeMMvmxkCiX6uwpujY+3F+J7Rwempn8YnDfRUCY8IsTKN1862IgFEJ82vyY
	vBKDVZu3k5mQir1uGMxJ+6ao6aaaS0WWRuPCtuYw==
X-Received: by 2002:a05:7300:a994:b0:30c:ab4f:9ba0 with SMTP id 5a478bee46e88-30ee14a4556mr1290207eec.40.1782789810939;
        Mon, 29 Jun 2026 20:23:30 -0700 (PDT)
Received: from raiz ([45.251.35.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5ed29sm2992571eec.1.2026.06.29.20.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 20:23:30 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: iio: frequency: ad9832/ad9834: use div64_ul instead of do_div
Date: Tue, 30 Jun 2026 08:53:22 +0530
Message-ID: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coccinelle warns that do_div() should not be used when the divisor is an unsigned long, because do_div() expects a 32-bit divisor.

In this case, the 'mclk' divisor is an 'unsigned long', which can be 64-bit on certain architectures. The correct function to use here is div64_ul().

Because do_div() modifies the dividend in place, while div64_ul() returns the result, the code was updated to directly return the result of div64_ul. This keeps the math exactly the same but fixes the warning and makes the code safer.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 3 +--
 drivers/staging/iio/frequency/ad9834.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b27..91df7ee65bfc 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -115,8 +115,7 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout *
 				     (u64)((u64)1L << AD9832_FREQ_BITS);
-	do_div(freqreg, mclk);
-	return freqreg;
+	return div64_ul(freqreg, mclk);
 }
 
 static int ad9832_write_frequency(struct ad9832_state *st,
diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index bdb2580e29bf..70b310488237 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -101,8 +101,7 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
 
-	do_div(freqreg, mclk);
-	return freqreg;
+	return div64_ul(freqreg, mclk);
 }
 
 static int ad9834_write_frequency(struct ad9834_state *st,
-- 
2.53.0

