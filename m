Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3F345751
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096036; cv=none; b=hDg9F4jOtxBziItQIu7C0//vyCskZUVe+x3QAfDSLQbmYUL/+Ur6FOPk2MXxDqgHG/cD9LRN485G2BYfNgzXVmz9ZBDzlK92ikIZt752P5M+9UGg6mtPznqJheyb5p1nlzD4UTUW7ASjlzrLIsb7IHqXMMb9lnB1k4oub5ltoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096036; c=relaxed/simple;
	bh=HhxupGz1WHaq42O8GavvnZENK1sHfqrxEzKdKto82ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L6Mc+M0nV+6VSYyxC5sUFuUqgCb/lIsyV/lCKSHhlIj+GbX+hEN4AkZFe7fIKQJPbpQ9mm2k60JbUwMQBM5LQ1RrSfboLeWWv5x6MxYYSwyFlXqQnqGAIneOZQ+VHeGUANY2q4j6b7l3zW92wYzUc4AIA/ERUok5/cLhRUqs8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REkS12Ot; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REkS12Ot"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c998fd549a8so2469529a12.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786096035; x=1786700835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Ex4kLoFeCE7JpX1METI8NE7HW5gn3lcnhSZrjT8Evw=;
        b=REkS12Ottios5PhaUO2Gz0Y/amYZmWM3wrArdRr9HcgVv/lR46ckanTt2gBXF2WsJ7
         BJNThPneTGtMqOZMbc2Hy0gKKkRTK6tRl3ORqyZpUPuTDPv+kXxVVdUfqzSXbdR2SNNW
         MOLghF253HmOZymQcB5vCqm/CCKghQJvRu/7IXqA2xWDM7lphiduTwkN4lRwnr7+4A/K
         N8PxxggtFX0QThBURFvmaxFo4ZPdwnzpHs0nwNzfpOZWdVq8Ij+g1ITBmcqyKhR+bQmN
         lo12VTTK8qd4/vM8kxsrxY7jkP706NkA2Mg0R8ScAr0Ef7AikLtjuDvfmrd17bjGJhz2
         SdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096035; x=1786700835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ex4kLoFeCE7JpX1METI8NE7HW5gn3lcnhSZrjT8Evw=;
        b=Kyt0LM3N+xjImqqpMrfgaVFLMKxHH5o0868ju5icOJV7xR0lq5ljNB8+f8oWHnjEjD
         nFh6D9O9bkFkhYPovE5sM68i+a48dNa13NzN/fgXxyA3nvuqTiVlGx03TBEEaolS7/UV
         Et2vInSRJ04NoNhLZ4IWyBZUHxOGYponwjEm2IAkuGB78404+AW6Rv17KKo3F7MEjI4v
         wsIfGwZEsPPvsvzkYF1S3WdC+Kl6XS3FXSMnlVjLs+yfnswDb2Z7XHKIfggtHSoKaNIu
         ROvkv9aFAGnk15T35ycWCyvQrEKgef6VujILuitDUsYYhbQX793eMjpb65malvI2+GDZ
         VBsg==
X-Forwarded-Encrypted: i=1; AHgh+RrFw+2S+0Bw1EX9sHigAq9701/YxGkuq60KJld+XuQP2kurTl/w0TBtUYOkFNrOcre3gGoK8Cz5UKewSEfF@lists.linux.dev
X-Gm-Message-State: AOJu0YxMK82mKsrk9LwZgWfU2rP+Qxtkm3kNugKGEz8DWC/zuSNXgE+7
	KvR7y85UbxTF/ryyuzD1+hyV0tAXTXX9+f0KXSoMX+CvpigSWIe/UohV
X-Gm-Gg: AR+sD11NRTvm5Cak9QeGokUrncRoZyCSYJd1pjmRqi2BQFBwSSvJm5weMwfQIvBNB2f
	J/xcRjqX9LhUsfS55GmcozytkH4Mrs7MqDBDfNxRxTDesPrRFDfTeJzdI2tGQDGpMVXCUqti9Q6
	xi4EAHcNq3Y58mScbf9dNsni/Eac9L8Yzwe4VE57jBviVPGGlZn3RM+CBQKuOF9s5zjap2pgb1f
	1a7goOn+20Sg865jZPKE7ztiAygM5gWN+5MQwCRfNACkuUlzitc988aubyPTb6L/D91Io8XUu3/
	U7DO1MFJ5wqzqKfmLx3AO6sjnpxb9THUGM9anS/PwScOnW72Os47sJRyO/Mn/ADj2NH7UdmS7TT
	4qmrTQE/42FJAURHz2f+3hq2ifuaNs/bY+xHeThiT3gxoSY/V+qZ37w3OSdGNcqJPY0k14/3V5i
	uYi4BiB+KXUWSLIStn9PoV0YHTG+PqjgNeQG2nBuHFeVAWoM44Hna6rBJ/ZLG6XN762gLHVknPz
	ZvMJg==
X-Received: by 2002:a05:6a21:3a86:b0:3c3:ad17:eded with SMTP id adf61e73a8af0-3cb8603af51mr25109132637.36.1786096034883;
        Fri, 07 Aug 2026 02:47:14 -0700 (PDT)
Received: from kernel ([45.251.35.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec5aac2sm5832048eec.30.2026.08.07.02.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:47:14 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: andriy.shevchenko@intel.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com
Cc: gregkh@linuxfoundation.org,
	joshua.crofts1@gmail.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH v4] staging: iio: frequency: ad9832/ad9834: add comment explaining do_div usage
Date: Fri,  7 Aug 2026 15:17:03 +0530
Message-ID: <20260807094704.5371-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous attempts to change do_div() to div64_ul were rejected because
mclk will always fit within 32 fits for this hardware, making do_div()
safe to use.

However, Coccinelle continues to flag this as a false positive. To
prevent future developers from submitting unnecessary fixes, add a
comment explaining why do_div() is intentionally kept.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v4:
- Fixed typo in comment (fir -> fit) as pointed out by Joshua Crofts.

 drivers/staging/iio/frequency/ad9832.c | 6 ++++++
 drivers/staging/iio/frequency/ad9834.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 60c33e10c46f..2e216c950c53 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -118,6 +118,12 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	u64 freqreg = (u64)fout << AD9832_FREQ_BITS;
 
+	/*
+	 * mclk is an unsigned long, which triggers a Coccinelle false positive
+	 * warning about using do_div() for 64-by-32 division. However, mclk
+	 * for this hardware will always fit within 32 bits, so do_div() is
+	 * safe to use here.
+	 */
 	do_div(freqreg, mclk);
 	return freqreg;
 }
diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 33dfd723923c..e089a94db97d 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -103,6 +103,12 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
 
+	/*
+	 * mclk is an unsigned long, which triggers a Coccinelle false positive
+	 * warning about using a do_div() for 64-by-32 division. However, mclk
+	 * for this hardware will always fit within 32 bits, so do_div() is
+	 * safe to use here.
+	 */
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.53.0

