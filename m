Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3A446851
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 06:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082643; cv=none; b=hIyaCi0+32uJ8NBzpd7D49CMH5B1XvNF3w/qttEOsV4aeAKq6tREVe/pT/0yCbwf+P4WkqRqG8YZ5luIMxYkoxlG1+sErXYAuX/sKC+sfRsYwI3ufELFyH05ciSDa/HAh1RdXFLhuPTr+TtJHh9PpiZduoyzLsALuac9Fng96s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082643; c=relaxed/simple;
	bh=8VqW8kvm6CDSv32ZJLRDHAY1XXBUAN1d4rtNyqZ213Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o58BG7FsCtB3AbEQa8rU/TVWQe5h5nzQ4JGAcVBng+DJ/sv1sJwVNAwdshGQLiEUlipFpVdN1PDmWEqrF0SjuWGTEOfuWoWPygfxJEJyydQiiFvJEUYBLa3hae/4yaiL8RDTh0AYSooY8b+MgCEWpo7puRAfx++zueZbBPRBD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLqRPzgk; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLqRPzgk"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1192596a12.0
        for <linux-staging@lists.linux.dev>; Thu, 06 Aug 2026 23:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786082639; x=1786687439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bi/ZTEuo08hf/a8t6fkw1rlM/UqizQDgz+QeGcjEPh0=;
        b=KLqRPzgkZuTLQMb2c1WFexEbxK6aLkveQDU8j+Sp727N7oYJb1yhhOiogCUujogb+8
         NkrcPg5EoBlxuODFIGVbZXjTexW0SxUVaxEDruxNALmGpltFutoO5XYnZHCwKOjmyhrB
         t1p4F138oCu3Q+5luRXWtoWJWR3ZfEpJmEHHeIRn0sSF6A3rSVrEJ9WPhfr08S9HGC3k
         MHc32nUsDzjq8DubEFHOhXUHXimanF/sYKp96CY3mcE/4rhvRv+EiZBEAeQrSIDkqCMh
         HLgiUA3cs8OyuSL5bxIOvyAreukwD4k0gzZKV7RBh/Ay1KM/LFslCGhhowp0NPzYvmAz
         EO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786082639; x=1786687439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bi/ZTEuo08hf/a8t6fkw1rlM/UqizQDgz+QeGcjEPh0=;
        b=IyTDB8rKZZYLAuEx3OnP++oPjrjDk/9uk8nVtlpAnNzK/s0LgFbN2fQ/X25ZLj7Fq0
         XeSrji+Cxg7s53S5eKZJ+GSO3GAqahO2t1uHAYSUcc67UWm8oirmdxu5xWYRb6vZ4jIN
         b9uUYqHjfb2d8rvND//QVagkEQGgAKmX94BZDGuHx3nMXBoDjqphUl3sCH2GMIqucmgW
         Xmi3j+WKhcowoDJ/A3VxYhWx+Ht72lklW5FN/vCnXnIMGIQbDM/4GoS+a4amHh++517f
         1kiaB+Z7nGM83FH02rcPE1vHomZZ1zZyT+bKd6NdqK/5KI1ouqijXoRd9/OjQYv6CCq+
         g8DA==
X-Forwarded-Encrypted: i=1; AHgh+RpA6VtJR+/4iZ9LMOmC5n+SeZgN5vrxHdIZSyqLKsgYVfn8/F+4Peojzsmte311E3jDN5xzkayAnmP9yVwA@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlppsj7pFn4PhgzyyK/XJlVGBLGz6lRXhRfQnSOqdWw8XwODm1
	9BHjTPJQhS93hc3vjhA4odTYDNEbr/am3TiC119i/FaKC2lXKblfC824
X-Gm-Gg: AR+sD11BzdIeWYL3aX5IwpZhmMzKxpaX5/0Y/foGCJL/IlcIpnFLjCCLTHnWgA0TnBx
	6fAuQgdv7CeSB1rsoC2V9lwtlVh5iv9xu2l8eEzxIORqaNHm/cAUJ9MyPuxOO2Ctlubc15cs4+G
	m0Xa8sCdURTDCDz5Mgabv2iGJwJik2PF6LSE/r2E1v5o7WJ+arMxy/HwjLtUVRRaehLbOSOMBnK
	LOGn7X8125nP+L2yFbX0dOWkBcaqwxOZAEDwI7FeQzPIGYKYtIj1xKypedCIKgfs4ha794BQFRs
	i6N1GR6cxCdRLY0tKdf4XHF/Uiehd/mCXvDJ18xeWOdyGAKTb6PaGPyB8L9/VhKMau2Ebv9/0ao
	X8ojxL+3FGg/ZvHUwG5yy06BV+j7kEXVIt4ypvc1xfXvVt7COdRkL7uGisaGUG37tqRk1XaOnh5
	McxB+Nrov07++CcVQNl7wHV6ql5N9V7YNhqmmO9t+9D5s03zl4gwlyNLBQaXw+kPU0PKtly1Fpa
	+GEVg==
X-Received: by 2002:a05:6a20:12c7:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3cb9c071bfdmr12830008637.4.1786082639405;
        Thu, 06 Aug 2026 23:03:59 -0700 (PDT)
Received: from kernel ([45.251.35.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4244sm3635471c88.4.2026.08.06.23.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:03:58 -0700 (PDT)
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
Subject: [PATCH v3] staging: iio: frequency: ad9832/ad9834: add comment explaining do_div usage
Date: Fri,  7 Aug 2026 11:33:48 +0530
Message-ID: <20260807060348.6477-1-raizudeen.kerneldev@gmail.com>
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
index 33dfd723923c..85f39ceb3c4c 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -103,6 +103,12 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
 
+	/*
+	 * mclk is an unsigned long, which triggers a Coccinelle false positive
+	 * warning about using a do_div() for 64-by-32 division. However, mclk
+	 * for this hardware will always fir within 32 bits, so do_div() is
+	 * safe to use here
+	 */
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.53.0

