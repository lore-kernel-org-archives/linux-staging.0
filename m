Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782809;
	b=pQDyvOAWgZ2+wbdzJpnDMAxgcj8pR5+IOwlZfzl2L9LJU/tQyEOAzXMyUREtWfxzcWsY
	 kYCOg4JA+zZxFtq695LOBdEl1mo4DaYbDF3eFeq7KM0TGjSaSN0Xl93+yqs8ClbW/JSwd
	 gtSkLDiuhJr+wVERYpSsLubfELNUWkmzEIhdF8QUflmRvxDzhX1yDnorg2mTdubKD2VsO
	 sgmOXLyIPgtp5jg6sUmNZaIoQN+isHSvgO4kEL0LZECFZu7+rhrU3Yq0KWE8fYpeAbhX/
	 0Y9X6omGIcBD7c1BdOUqh5QclrvMmnGxJltYb1baMcWqRP2MUy3icOPo6jSaStsteCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uvh4AWWzO4kiSVlySE0GOXT3P3aE1dpUQ/DuKk1yuDs=;
	b=3zT7NmagGpfazco/9ljAHsNglbRm7N4t2utoXt1OX8R6isJxd5WeVOA7YclykNcvOExr
	 pBfshnp1BxNVMZoExt0LYGnIhZEuL5W+gYOswrJpmLoQPUMiSb4VC0V7ahk4IrVzJ5V2e
	 X9xHovNHnBDnLgfkyczzuklVph9+OTFYBr8TVag4+O7ZmzWWouBqHhl59tcc58vw0uUti
	 obyf/5BcO/m0J67NNPQ6k0aca/wstiXNUKW6Fsr7sNsUmxJfwF2bYdcBNuLwSCMQ/ab35
	 h5CR4GnihGTX9qtEN+srKvvTiR5FPE0WFxl8FaUHhYPV5TD1XapcWwLb9wAuxSrw52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6B1wlsJ;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C26B606A31F
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 12:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C26B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6B1wlsJ
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so6373512b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 04:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782808; x=1796387608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uvh4AWWzO4kiSVlySE0GOXT3P3aE1dpUQ/DuKk1yuDs=;
        b=r6B1wlsJuV6wCqMeapHtK+BVKxGSVSIJsEDf11URB6jh2cCwu+m6L+E4KGWDfmjG9t
         v/E6jEHdS0sjumFAPHui+G2bcAp945h4dz+nliUENcNdB20OYAUKehrQDw47m5xHF3PM
         o+d6t6E6X/h7kZxc7jrPx3MedT60l1EqvnFXW2VkHEr6H5XnHJ7ITSBC8EQp23vt/LFW
         eJbzo85PURMbd093kR0F6J9chxr6+ZgBYywMEXXubPkaV4E//vYdZ/kINJpZ08zhjVc9
         /W75ADkyVBH1wR+B26BxrMl3shKq5nymvZUQWPvAJA0ziqh6H89fWA1QvcBsfUlba1u4
         XQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782808; x=1796387608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uvh4AWWzO4kiSVlySE0GOXT3P3aE1dpUQ/DuKk1yuDs=;
        b=iz2ONG8bftr8LK8J71j/QXbEAzxZqud/J4EFMdzEkJF4uSFoLvwi6JyIOTCgANriiF
         n3Z8JmXioAFrRQkdba3tkb6rEj/2Xj/RDkJd/Zw73C0/+g191dJVeq60o0RakTFlmgAz
         r2tk930MYNMbS2YlG7c7mWi9CZGl2yEA8Wzlggq19U031Q4B5coOH4r7VTZOuzolsFK+
         yBKwRzUiT6rzuEfBLFQxwhP8eFeZ5vBfExVgt8fTteO6newAieuPJaAPvKL7YTGRjHgG
         kvHbKvj1i2R/FYkqqdQcunRLXweaMlK/8knFbMBhJledm53EAidhJ00ToAJ1WOe0iSHb
         R8CA==
X-Forwarded-Encrypted: i=1; AL+hErHkkkXMgVd1+1HgiHyXfSvOnGR5Sh9n3FN0n1K9vKZVS1kFjifaNu6uAY8tRw42QtK4ds+d8qRt5Nqb6pbJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+VphHpAh9Jqf1mM31F/Yskkrz7y+OzjwKtsA5I1AUmQO3+gH5i
	zv6zyd97hT2bEeFyKf0Yg/EY416tgWFLugzOGtHJNh8SWkNTcRRZg7o+
X-Gm-Gg: AZFdTZeVbEwDMy70bx/rjxbca0iCERS67nHuo5xm97T6TDDAym2uQTniYNQBrspx4si
	23BZmvYSZ99+H8F+U2ohMA/b7ImQt2+Gj6Tbl3hbo0xpQpSmgNhDsSMoUBwvAD4+s/FMo66u+/u
	LYMRdch0WhmwVSa4/ND/MmF1H2XAgu57W3aGcrC6pzNw8iSrRQzjFNUazMueU136by66J7QpGCJ
	7UNeWrKeIqgwIaUXpOUZ8F/6orqCQbRVN3nmNp71R3D3fSE3DINyVq4kJfrE9+vOgAvVmb/kfeV
	qNdfdEd82pdzgEq1X19V6CIP9iEuQIGbjS/K2mr8GZpyI4k9mqaOfM8PcJWpQKVD8BHJWPRRO5w
	dXW8eG9mpPlOPkMYdie0NztIxOErdTszKqJ1bZzTcOh/EQadsVMfkfN1B4BCW6Eq/8a9jbg/CMV
	HRRA10Rbth4Te9sQ9EgIUOCsyrhitpVQO7JZ3yOFr87MEsNHjwtZQMMimctd37aTebzkftGexl1
	daB4/zAhpCA33uq7qSTlbhpvr3hCH3+TZSiuCtXyDJ+wn+xLz7fZ6Y56ipj5+WC6oLL/bVieAtV
	RIuCYCSapVaQWQPHyGlF9yEcyrV+BhMFztIkVZxPthCsZhVtYMyw7dL4lWvcu652C2yZnkY=
X-Received: by 2002:a05:6a21:7e84:b0:3fa:1dbd:7f75 with SMTP id adf61e73a8af0-4014cd4a8dfmr23334113637.36.1795782808548;
        Fri, 27 Nov 2026 04:33:28 -0800 (PST)
Received: from localhost ([2401:4900:1c2a:12da:3176:e694:92eb:c932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12568899b3a.2.2026.11.27.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:33:28 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH 2/4] staging: iio: impedance-analyzer: ad5933: reject frequency code overflow
Date: Fri, 27 Nov 2026 18:03:01 +0530
Message-ID: <20261127123303.144052-3-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127123303.144052-1-punnaysharma805@gmail.com>
References: <20261127123303.144052-1-punnaysharma805@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a 500 kHz external MCLK, writing 30000 to
out_altvoltage0_frequency_start succeeds, but the chip starts at
14374 Hz. The attribute then reads back 14374.
out_altvoltage0_frequency_increment has the same problem.

The start and increment registers hold 24 bits. ad5933_set_freq()
turns the frequency into a code, freq * 2^27 / (MCLK / 4), and writes
only the low 24 bits. A bigger code silently loses its top bits.
ad5933_store_frequency() only checks the fixed 100 kHz limit. With an
MCLK of 3.2 MHz or less, 100 kHz already overflows. The datasheet
suggests a 500 kHz MCLK for measurements between 100 Hz and 1 kHz.

Move the conversion into a helper, ad5933_freq_to_code(), and call it
from both ad5933_set_freq() and ad5933_store_frequency(). Make
ad5933_store_frequency() return -EINVAL when the code does not fit in
24 bits. With one helper, the check and the value sent to the chip use
the same math.

Keep the 10 kHz probe default, because a probe failure breaks boards
with a very low MCLK that work today.

Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---

Notes:
    Tested in a virtme-ng VM with i2c-stub and a fake 500 kHz "mclk" clock.
    I have no AD5933 hardware, so this does not check the real output
    frequency.
    
    Before: a write of 30000 to frequency_start returns 0 and reads back
    14374. A write of 15625 returns 0 and reads back 0.
    
    After: both writes fail with -EINVAL, and the register keeps its old
    value. 15624 still works and reads back 15623. frequency_increment
    behaves the same. With the internal clock, 100000 works and 100001
    fails, before and after.

 drivers/staging/iio/impedance-analyzer/ad5933.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index bd85cb37ca4b..da07a75ad3a9 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -187,6 +187,11 @@ static int ad5933_wait_busy(struct ad5933_state *st, unsigned char event)
 	return -EAGAIN;
 }
 
+static u64 ad5933_freq_to_code(struct ad5933_state *st, unsigned long freq)
+{
+	return div64_ul(BIT_ULL(27) * freq, st->mclk_hz / 4);
+}
+
 static int ad5933_set_freq(struct ad5933_state *st,
 			   unsigned int reg, unsigned long freq)
 {
@@ -196,7 +201,7 @@ static int ad5933_set_freq(struct ad5933_state *st,
 		u8 d8[4];
 	} dat;
 
-	freqreg = div64_ul(BIT_ULL(27) * freq, st->mclk_hz / 4);
+	freqreg = ad5933_freq_to_code(st, freq);
 
 	switch (reg) {
 	case AD5933_REG_FREQ_START:
@@ -307,6 +312,9 @@ static ssize_t ad5933_store_frequency(struct device *dev,
 	if (val > AD5933_MAX_OUTPUT_FREQ_Hz)
 		return -EINVAL;
 
+	if (ad5933_freq_to_code(st, val) > GENMASK(23, 0))
+		return -EINVAL;
+
 	if (!iio_device_claim_direct(indio_dev))
 		return -EBUSY;
 
-- 
2.56.0

