Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DC3B47D9
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240517; cv=none; b=i64yIyauGUJAmnf7gfcs2gSjhG1GdTRlqcTMdoSGO7Hp4iSh5YHts8W3KCrQZ8lexA+BPktgA/zJmX0Q5uGXP3j96oCwgXkQAAbz5vEXPEIxoB2hbSDvYVbTPd1Yo/ifseiPMX/ylr97FvIO/6PVyiliVeVOsK7eRbRqG32fF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240517; c=relaxed/simple;
	bh=f3Sav3+fI5mgc6eUxCrdoTC+ImTmZZ+KiY6sukwMp3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PgJ1if4LDoTiT1XVGIsZksf1ixnuxbO+vU0DzvUNwndFmF4uxZoOZHW/gqWuPRsa0axX07pIs1bCq7bFb8ehPv3hweBHvTvGhookl1WDZRyW2OpD0JdzWpqpOlqCZ2cXg2j03OCX+7Hs6RwuP6flIza49yx9Y/4pIfHFN5wyIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6i+1Prh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6i+1Prh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9e00649769so326025666b.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776240515; x=1776845315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mQ+bDBDc95NGWzUI9atKZuTpO1qC2/VErOShoToB9Q=;
        b=N6i+1Prh3ZSUB5R5ESqBEtKAWowELbcxxVswXGnyBLdGU4Aj0if+oCuDl4AFklCqY1
         R9dPM6mOWK2sipFr7MN5O4q5eD17WR0Z39u2StZIviUlicttgGfcxYIdAl189RD63pEJ
         YQoiJvec1/rKeWKxpkkpmRVymFjVa6OvRMp81/XIJvir9vLrrnjxkvWzx3/Xs+7YDHJK
         hjuadPnyu1TJUBm0vQoDH/e6W1C8y4+11t5hTuoLKY0uJkt9L3GTJGSWfCo7ne8Q0BlE
         enr7SHXYFuurTfOtQ9X2g8IH9p114oajAidU8sQE2jkW/msCtmg2whAW8oPw1MVVgA4m
         iR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240515; x=1776845315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4mQ+bDBDc95NGWzUI9atKZuTpO1qC2/VErOShoToB9Q=;
        b=mHJDLiGM71FwLdm2G13lg1sHxV6cJtyuSqQi5WnuPRVoKtGyRI4JeUFN44+h7Prqkp
         znlx+42cmNs/T6SBMS52PN+s5deTiLgHWF/m+qMCeqoBEXLyDJsOFs6BuiVKGxcxBrw+
         Y1ofAno/+UEgq1DcDzeckZejlq3vh0po6gtOi6oidIgv3Y+cEj3yY2ETTfIzE1f0Jfhy
         /9X173WrEgU2wSwauRdR57F75rsGz8tIOyr134mGNLskw+2EVsI0tPwxJRbZE+lEtAmU
         uQ8TSBSRv6GYe0GHMDkmNPLWcX4NaKJ1Iv0g5Co7T6NQcE76FVXWZhNgIa3805qwMNjb
         Royg==
X-Forwarded-Encrypted: i=1; AFNElJ/kNqZnzZ4BdWWyWpJNk8ewp+sBfRNs6s+20L8IGNPO7/FEmr+AAPne+pQj5XeLtro8EEgiD9jNlJTD5cAd@lists.linux.dev
X-Gm-Message-State: AOJu0Yywc78/xJvNYmvoqldX37CqprG5C6JrRzT4qlRx1MUEG7WvAcPp
	4UK0u+RMDZUeWv22E/g3l/K9GMs21cJs3dLdHrF49Fd8mpZt09efmRlJ
X-Gm-Gg: AeBDietkRmBbrpsSldC57OCcftdNjF6SPAV8GbQpwlFNsNTeLZe4H4vae0ZnEQY2VS0
	hbmc5nHpnoEJcrLdjjc2g5UfD6NP/cpt7ro+N19GqKgi4oJwEgK/zOcD7LjQg5YPJ4kg3+ADhUO
	24YvNwroyDJiRyPDmf0Cs/XZL5z/tp/EouTNoykWgAT+8wmpAq1G20hXVUisX5MM/YkBwp/JU9l
	B4Y6q/RWI6SDeMnJc6LCq17YMh65s+3tEWMB0/1Ic51s00u17hewhEtSEVGjMX611QX3tkEMe7u
	Kd89G4U/mPt9lEzFQO+TpxZhttBKY7piIdVU3Nt7JW12uTuL4Vpas7eqF312fAuHO3BeQS/pHaD
	jv6y2pWzKr5MYzfPEB7O2kMm32gUFxTzbJLVJWFBkwjOP4UmOCCsKEAgqzpUtw7kgPV0gxdslXb
	S9jy5+WkkC6MelkXTVGkunsKmrFze/4gLu0rTfi/28fO/wbeDB+pt61JmhNfwXCfXzaApI5L0i1
	xy74K7g2kd+vUBVGdEV7ReFLBSpdqwk9TMyUVXoLy7GK2zVWiBcUxtmp34cHTiiOZV4xxpHK3Qe
	BwDijROy7bhe4uq2G6NBFHnd5ftWxQpFkXoZkeSAgxwMRGmRT8H5FMYykpALvi0XW7oYkEJh8sV
	tPqGDhhJ7ZJ4YM10/gsgpWrabC7pGZv7yNtJCQixsqxTKNMrdlcANz3FHXK2i/5F3sx8ef4QMPh
	OJ8HM/m3/0yNlcGI674qFU
X-Received: by 2002:a17:907:e107:b0:b9b:5164:905c with SMTP id a640c23a62f3a-b9d72793041mr644068766b.14.1776240514847;
        Wed, 15 Apr 2026 01:08:34 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (239.185.141.34.bc.googleusercontent.com. [34.141.185.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c2013sm29720066b.34.2026.04.15.01.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:08:34 -0700 (PDT)
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
Subject: [PATCH v4 2/2] iio: frequency: ad9832: simplify bitwise math
Date: Wed, 15 Apr 2026 08:08:12 +0000
Message-ID: <20260415080812.1284-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415080812.1284-1-joshua.crofts1@gmail.com>
References: <20260415080812.1284-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactor the ad9832_calc_freqreg by adding a BIT_ULL()
macro instead of manual bit shifting for better
readability.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index fbcfdbd398..cd7c7727f7 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -111,8 +111,8 @@ struct ad9832_state {
 
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
2.47.3

