Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FF351C06
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708563; cv=none; b=BKsKG5OHNcwtB56ulyTOxaDDl1MeNugahf1ATjnykZKl+g5wOAacAQFYhfTSw7tY5etBe9VV1z5et/8cvjbR8qVDkNZ5oMzetbLHXKpFCM3rgYd/rhcaBLbMOsdYch/q0k5ldE8BsFMj/2VqNk7lpV1ZrTZhOfnt5HRWQf2wD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708563; c=relaxed/simple;
	bh=8sjnnDQnT7jKHqKJEZURpFQY6loTbMgd3W3ybquddG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBXTS+WU/4wz5Svqw8Z5jKJrGzFMn+Ij8gI6Z6kJC90q+hKz1+p8STOFZ/bG9KWk29+ici+ddUnwkVwn/fm8oqsKCeNsYcCjOHvlJt+CV4F0VH7M/lkO0e/zlY8zShLF12wsBO8TqCDxK04hsSYbcuwpxa9ve+FbSJuS2d1p5O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQAfOBWR; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQAfOBWR"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca913a601fbso8196405a12.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784708560; x=1785313360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwYJXRFCTwCHf9sWn/igVk2h1daNGsDuOKPemb7/q8I=;
        b=jQAfOBWRbNH1kb8bHhljuqHF5uWdsro0LB2+vlhA0v70lv0pEX3JqcjI/bRerX1uMC
         qYntLPozGFqhdMGykpWR9y4gbgcS0Z2oYkP2C1FceUe9D+Bb32kdiu94jlRf6y/iF3c3
         rSeGOxptBQTrImy1G578C7JWPmXWfPV9bCzlzXODjXyIp3bmDpa57uNHcNUKTYEkoKIY
         zGRBmswOgPpHCqS9sN7UxtXrk/Z0j8WB1DON8ck50x7WeQvrNzuyWTwgicT9wl8Ob+56
         V4GIQ3IkE8nBW7GjNz64+Vlmtbws8Bb6xRDEIdhiv77K9B83sMi/5J94p+w+folba4R2
         yHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708560; x=1785313360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwYJXRFCTwCHf9sWn/igVk2h1daNGsDuOKPemb7/q8I=;
        b=ixHemLxcUv6RH3cxhrjzc5UK7r/+TclE+lIqOg2qK9MaDMbViw1Qy36iB9heujRBEX
         VWzA0yWCUCyBhkmfdGt+Xl5/9BmdmHreY5ckppWXeu4nue48IMrHrb52EWdviUG6Z/2D
         JTZrXxrTQ2K2XNfu+zSX/kfvt+foHsYCyx20MwsgQUa1mlg++UwO3vX210mA+cGfdwX7
         2MN2M1nc7phzkzJl1DLmUurDScGVxXwWjZILi2CY3cTTfg1uByxq2rzurNmt+dxR6FvZ
         GribySjkPXvVwTS0Ny7wymItTS+E/Q2E2kSw73QIOTnQIO3J1RIURshdBp8fpx7n5JDd
         a0PQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzflYe3U7oFVGstJiv2leiqnaCVQeFgz/afvIU5KmzAAmySyZd2p08Iq1MVnT1cJXXXfGx6PrQBm2diEHo@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5/stdBqQjIvICAH22na5Q2g1ovw2OED17Fjj8yLtuEz4DS0F0
	vd7Bzhqd0AjWpm3RO8uJSSz6zNUzB6IqwWxGLq9CFpaLg3diquiHVCi+
X-Gm-Gg: AR+sD13yVRcUQeOSyL6ULs5vMWRDWcn6zKw5RT0HTQ5pHER5LfUiU9qT+Y+ujbjuTWx
	KH5PkdQ5rUW0CEU3W7MmI4hBqEkYmmd9l4TpIAzP4NYxvYlqYKo+k7bNAcm+9Rh3srduZQK/LUo
	D2MlR5gBBSeG4q/PhuHVacwpj9KCCJGXp1ZBNDIA3jMUDTQp8gv68g2LPfUq2J6dpgPEiFVUP0a
	hu0i4zdiUAxfhXmbi4whMi4rv53FtxvuzwRyUEmGE5C2E8oZ+V7PTgR3yqi6MPG4tmFXSYeLCqz
	feoI3DHbwZ0V1HCVDX14Y5s4dSQnYcNnnBQmS1EC13CpnBhFzb3tIWpz3v8BbvBuVsjpgCpVvpj
	y2989IfQbGpYKdkSXyJ4U4YXPa/J2EuLfiIM/UtYoa4IeETbJ2BQ4jOu/nPe13KqeInZ49pR/0m
	ZSU7lzHXnU1pzvHwmHl3w=
X-Received: by 2002:a05:6a21:103:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3c3ad677d8amr23252278637.28.1784708559999;
        Wed, 22 Jul 2026 01:22:39 -0700 (PDT)
Received: from kernel ([45.251.35.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm13343234eec.1.2026.07.22.01.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:22:39 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2] staging: iio: frequency: ad9832/ad9834: add comment explaining do_div usage
Date: Wed, 22 Jul 2026 13:52:27 +0530
Message-ID: <20260722082227.18768-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
References: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous attempts to change do_div() to div64_ul() were rejected because
mclk will always fit within 32 bits for this hardware, making do_div()
safe to use.

However, Coccinelle continues to flag this as a false positive. To
prevent future developers from submitting unnecessary fixes, add a
comment explaining why do_div() is intentionally kept.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v2:
- Instead of changing do_div to div64_ul, added a comment explaining why
  do_div is kept, as requested by Andy Shevchenko and Joshua Crofts.

 drivers/staging/iio/frequency/ad9832.c | 7 +++++++
 drivers/staging/iio/frequency/ad9834.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 60c33e10c46f..6d046e9121e2 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -118,6 +118,13 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	u64 freqreg = (u64)fout << AD9832_FREQ_BITS;
 
+       /*
+	* mclk is an unsigned long, which triggers a Coccinelle false positive
+	* warning about using do_div() for 64-by-32 division. However, mclk
+	* for this hardware will always fit within 32 bits, so do_div() is
+	* safe to use here.
+	*/
+
 	do_div(freqreg, mclk);
 	return freqreg;
 }
diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 33dfd723923c..8722f3a01cde 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -103,6 +103,13 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
 
+       /*
+	* mclk is an unsigned long, which triggers a Coccinelle false positive
+	* warning about using do_div() for 64-by-32 division. However, mclk
+	* for this hardware will always fit within 32 bits, so do_div() is
+	* safe to use here.
+	*/
+
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.53.0

