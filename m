Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B14D23A7
	for <linux-staging@lists.linux.dev>; Wed, 19 Oct 2022 05:38:36 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id s196so13995733pgs.3
        for <linux-staging@lists.linux.dev>; Tue, 18 Oct 2022 22:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uagMMX7nbZs02+TkfE1zX/mQYp7hdyYKV8jbBteal5M=;
        b=FBBot3uHkHUr81e//MIjYaPs9o/zoRMyNY41LtbuQO++opJg/bW+OgGKJncVEAoBXf
         RAB0TJGBZaIVtLa60y9T3Sv8pX3rYtIhrDt/q7UxgZ5l4FH9CvfFoI2NdLIzc8oZ22wI
         YEuiYYh3VF/2hLC8Kzi5S+uJRGpe738FIX/hxXvm+jCNs07r14SZS/DDV5HNLCyIeAzd
         42uG716oTFJpwdXNoYDRAPjKTIPTZ22ONoSA4DNeYZWskqZoCMXVypoXAonLntaPOJXP
         R9JB12yKqpO8tzzb3Pg4Z1LKBcRcIAaOV65tKTDqq2ihpA9T3MRJEREcSm2yZ/Qec/IY
         ARVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uagMMX7nbZs02+TkfE1zX/mQYp7hdyYKV8jbBteal5M=;
        b=QRkMsdSpkyggsTXsNHPfbvbOL9nEogSESkgDpxV6sAcZgdqY7zejd0p0Bg8SbKcEXt
         i3IZ24ZZe+TKu1a5lvQc+4HeLEEHR9o1uiYy++SvgCUNK88KnYnC/9ebzI+Vn2EaZp0/
         NtDRrTRgBXaOln17V1/R8iyeAFhGEqw8lh3mTAp+MphZ38AaXqKMDzvPqBRuE5bcG1tn
         8gpMUqpDUjkUlCOMyQ3N2wAthVpD/fNnYvDkD6Yug0ZjMNHovrCcO4sWCCoe4YGFimL4
         we0dNfGXB6chZv7GqD4cVInUBWjopDkaW6/chpp2LokRttnF+2GfxH2dVYeXU6hrpoao
         GNcQ==
X-Gm-Message-State: ACrzQf2j59vkWVKC7UC6f4QUndt3c0iy2ZZGtgzmK7MgB+qc2AoPF4hd
	f5iggTKLlbzDjDah5Y1yhAasTYoAsLvSRVWj
X-Google-Smtp-Source: AMsMyM74hRC/jWVpoP4VZb0Apq40KLd16kllQvM5+RasaEl3DXdwNTLu63s8wz4/wYZ3V3cL6eygxQ==
X-Received: by 2002:a05:6a00:847:b0:563:b593:b685 with SMTP id q7-20020a056a00084700b00563b593b685mr6832243pfk.75.1666157915367;
        Tue, 18 Oct 2022 22:38:35 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902e54f00b0017b5e1f486asm9860818plf.211.2022.10.18.22.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 22:38:34 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH] staging: iio: Use div64_ul instead of do_div
Date: Wed, 19 Oct 2022 14:38:29 +0900
Message-Id: <20221019053829.821918-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using div64_ul instead of do_div (64-by-32 division) is more
recommended by coccicheck because this can avoid potential truncation.

So this commit changes do_div to div64_ul and
remove coccicheck warnings.

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c          | 2 +-
 drivers/staging/iio/frequency/ad9834.c          | 2 +-
 drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 6f9eebd6c7ee..cd038480f63c 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -122,7 +122,7 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout *
 				     (u64)((u64)1L << AD9832_FREQ_BITS);
-	do_div(freqreg, mclk);
+	freqreg = div64_ul(freqreg, mclk);
 	return freqreg;
 }
 
diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 2b4267a87e65..cfe933ef40d0 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -102,7 +102,7 @@ static unsigned int ad9834_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
 	unsigned long long freqreg = (u64)fout * (u64)BIT(AD9834_FREQ_BITS);
 
-	do_div(freqreg, mclk);
+	freqreg = div64_ul(freqreg, mclk);
 	return freqreg;
 }
 
diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index f177b20f0f2d..730bb31a20d8 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -196,7 +196,7 @@ static int ad5933_set_freq(struct ad5933_state *st,
 	} dat;
 
 	freqreg = (u64)freq * (u64)(1 << 27);
-	do_div(freqreg, st->mclk_hz / 4);
+	freqreg = div64_ul(freqreg, st->mclk_hz / 4);
 
 	switch (reg) {
 	case AD5933_REG_FREQ_START:
-- 
2.34.1

