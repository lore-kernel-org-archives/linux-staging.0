Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915353385AA
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897962; cv=none; b=TbD3xfZ1mKXiaF55sghZUi9YzJwoBwAdMS3JJuqGt5/xkwYxrxvTLOeZEJ5MVBMylRBV3MnZc8RDe99r07rLIyi2r9eVPsDVhsF0e85mJv6A3jHEySIVs45Ihhx0oj6UKSOogivJTzqwGhNSvm4x1RRWFx5CTV2P91ArSl7xfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897962; c=relaxed/simple;
	bh=7Q5mva72tlCTFYBzwEvO2ZFGsF1JnnlsFqj/wvcMAdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lf9l4r+3B/zwMtYOVbLkSv4daiDH09KNGc0xflme18U1RDUX+Xn/kN4THf9wCFfSEKKC7Weyspjz/qdHZInM4MYFACPkhm/qnoRVVchan9eoWkcYw2GrruZYzbn8+NDrzpim4I2EeI6aLlGgo5YpdKdOODz0ehDQgAPOfblbMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0xOOrVV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0xOOrVV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd96354aso1697945f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775897959; x=1776502759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z9NrwlpQUG/cW4s7HQM8LOZblhF59Jnsa4w00A3aEw=;
        b=G0xOOrVVzbDpap1YP2vCktav+INSFyC/TNoLcyEuOlR6kICIFYzPM1XFwSVjcceLAO
         TkufeYALJ/u/fiHGct2EFPoN0YVg85Au55nmcHJiuFoYlwpV5UJvOEMdVoTiuXE3yBo7
         OH3iVj9sgA7t6I2iH7Ucvd5YOY1dueLaCrWLmVu45UvpNYi/c9VGdZfFdRQZWCWkFzmY
         gbj4cv3R+sO5dm4LWWd8frTudQ6JOyBiO/gNrQjBY8lbJIcyIFQqKd6fGMWCWNfs0r0m
         Rf/a6440ACLTdgfYWbB8jI2mSLUqMQsgCYkooQISle3RtBs0SJ/0PpBN1Qj/2lERsMnd
         OgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775897959; x=1776502759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/z9NrwlpQUG/cW4s7HQM8LOZblhF59Jnsa4w00A3aEw=;
        b=nJCW1GVLr6MMrpo05LXDJzHSlzyIeNWVrW8Nd9+AjF73q0F4fHf4+QhRZSqnw/IJjf
         VeQ3/qI7rpNV705J3Jh6ZvOzJ7kciaAx+Z/5VnIKkSz4nUZOE4xcb5KjPixKu6pKkCit
         LxD59uck/rMQZ9A7V3PuCX7mhH4bkjTFRuKNSeL7x0ZKajZMSWq242dlX2nzI6EMi75E
         n99qbgNRq/yNSrgBU00ZNqM7Hev+t1WNOgUCc3Ihwa3odnM9qqalzP+OyErAm3UvGJJJ
         wNMBTkPX5S1Uks7HfT8N80Az6JJyu6lG2YeoFqq8SVDGszloDLEgNWK/sgEksJmI6/kq
         YqgA==
X-Forwarded-Encrypted: i=1; AJvYcCVAelfYrnfigHvT+Gt/zOEICRAo/dPyEvJRBpOqpPCkrI7HoZqzpHfyd1vPNjXpBWU6PICMn+LSDZ9483ds@lists.linux.dev
X-Gm-Message-State: AOJu0YzCO4k97voimYA3NuXN+nPqh1Q4K+TfFFgMa9dD/cxGja53g42u
	6xpbF6YOGo4+28GVxw+4TRVKxBfLwf3pWPrfpPiFFbEDH7OEd9Kq5KCu
X-Gm-Gg: AeBDievksvDg01iwTLmqr6S45hH/8VZj1cOsFcnyHwDOCwb6itTeyDJxm/GZ3Wcq5Cb
	Q8eeBJA62PtJRiWM5t64Vm0gBHmkmd6+r9lz7DTFYiFmT7190J3//yTs5xV+nePaU6lhOclT+Mt
	4Dv1sg3/ubh79+j2KuMOVKaYSEGxdFx6EDhGtdmD4O4tPD48yH+L/PCUR3jMPxoSnQBxGtVbtAC
	ytayLCLIVN4DYW4aTB/8ew8X+VnW0k2ESIxbZwQyIJ2X9s9EZPt0snwxWiWJtF4437FxGJ0IaE4
	1RJU8nxGy76hdFmUj+xm4X/FWKnm7gOPWHo0f41NkcLYRm0OlBUWjlWSfH2CVvQ2w/EcGBVwta0
	XW4kaitryJ/tes/xwUHuRU9xtMArcN7UZUkqmTt4DyI4vIEB3Hxscx4bDYnkW2ocVdsmmylQuja
	YoOC1tB7FDHEHgaaeGQ+U9nHBASxkvEPMPDsXwAFvzKzn5Oi4NyGmcHdjjg/3P1sjQSV3jM24cL
	MXhXZj98Rk7+2XA7E4pKyTc3vSzFuD26fn6rTpjNMRtNsvCMJMTydI/n0Ea3IimV/mWPx4A9Urn
	7mBsQmsHwoSFWPyFMZI=
X-Received: by 2002:a05:6000:1a86:b0:43d:6e0:9458 with SMTP id ffacd0b85a97d-43d642c08b5mr9723343f8f.39.1775897958932;
        Sat, 11 Apr 2026 01:59:18 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a69sm14483593f8f.4.2026.04.11.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:59:18 -0700 (PDT)
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
Subject: [RESEND PATCH v2 2/2] iio: frequency: ad9832: simplify bitwise math
Date: Sat, 11 Apr 2026 10:58:48 +0200
Message-Id: <20260411085848.75381-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260411085848.75381-1-joshua.crofts1@gmail.com>
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
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

 drivers/staging/iio/frequency/ad9832.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 8873a6d11e..4221e51dc4 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -112,8 +112,8 @@ struct ad9832_state {
 
 static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
 {
-	unsigned long long freqreg = (u64)fout *
-				     (u64)((u64)1L << AD9832_FREQ_BITS);
+	u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
+
 	do_div(freqreg, mclk);
 	return freqreg;
 }
-- 
2.34.1

