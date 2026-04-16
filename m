Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955937BE7D
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 06:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322314; cv=none; b=Y+Kv88WKf/rJ2EALzoYj7Y9xHzP2Eqxr4QoT0A2kCQnDdkkWxOHSeryYzu0aNNBORLzM4fIa7jCeVRQEVRS7cnDc/gSx/2lZiAXIikpa24WjCM8gUsIiknuyMuZUjJcXk6nJFS2lxlytZAfXc8ZHjqptG3tDNwvnqdxQPXrJmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322314; c=relaxed/simple;
	bh=TszllyWbbslHvIqbXKuSvcCJ8gOyWVJtop3miHR4uMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RNEmUZWUQ3S3H5DzS5lUNvsxTQgn7g5T0+3aerefbZI0S9zGRXd2rt9VP4SLkumRRMSnEsI1xN4q6JzMmwHLVNoHN9xc7jCRT3ucIiar6vX5xqpXbqcbYh5mHKH1BedZeziNeZJ1D33RPIQG2FIP7QWvq53lYegyCpnh9e3IrIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bp+4/cmN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp+4/cmN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9d9971d059so787990566b.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 23:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776322312; x=1776927112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTSCZfRBVTSuZG92UJniTjMaAJat6GyvrFNfwlqbqIE=;
        b=bp+4/cmN56Tz+7+ZlIGtCeXwPa/S13q7/CDaRzMxvRyZM/snxXbBqIIoR2IC79VIJL
         H0cqWx3j45xhdIgdxgTBL7ZT3qgX+m8OUD/FOrJGhUVy9ysDKK2BwDlkrkLqFiEtXf20
         vs5ktt9Sc3zrGnEmwgcoZj2bFO4ZZJ/b392KmGkH5HNL60zT4+RwArNqnSAXxe2JLCOq
         pHhloDC5OKBKvMZ38e9l2/iasLc+EIRwoDylakljtCSp8wiVqYOwUHeXvaft7AdtnB3t
         QU7IviSRL9AJZj1/ooPj7w3jyQocUeVH/0ZoaH22wXbIHqW7X/SppH8vcj0xbxP0HtRq
         Lnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322312; x=1776927112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTSCZfRBVTSuZG92UJniTjMaAJat6GyvrFNfwlqbqIE=;
        b=KZU7TlsMeW3NTndzUvCmiccH9M9wcJR+blzRQZCSUd/pK63THHs6ZPLKqQyufqsLYi
         0EpP60qpTAuqVSScges0Fmiu78u5wVc3V2f+w4Sj0LC9rJd7//TL2B0c2Bo4btbqC7II
         MatJf/gU3DYVagfwczA0kJ7qZOCfLw+ls5WuWoLqst1UIU5Gs41Zm4YS20MIE4UzMXrA
         OlQ28Cy9LaVv8oSzEcMFdYRkVwNtlE84g1/IMDUq2R7NwACl7wR+J4EhqRqf0NWF9+CD
         3yrfFeOtWhNRieuXpZD03zWsuDKqgu+JF6LQiH+Z/SabV5LMNLuyaflJn+ewbXXxxgq7
         CFIg==
X-Forwarded-Encrypted: i=1; AFNElJ/MVAyDyxa16rIXTaL92NzNbYDBcxRfgJ3XIylmAGStAvUhMscWD1VI8mDa6vBBT+T5/wuPwuBtCB0NFxmV@lists.linux.dev
X-Gm-Message-State: AOJu0YyXHBfOl1CDJ3HXIqX118eXR0lMQTzm5rKFcVTDR5heJm6o0u4K
	KwOTPi0jhLzHBJs83TZVswI54tvn3Yl5XGJsnZY5LN8OSQIn2C+WBQH8
X-Gm-Gg: AeBDiesoE70LtN0Gt9BpJSDlM2QsUz/yjAJ01v0QT9hT8m7+gggYQ7Qk1s65z5ButQ0
	VwyUGJgUF2Q/oHZcHw/aUD8Rzi00VjEX+8/LROoXZqsCskulZ2bPr7FZmSIeU/hTSPiUz5NxQJK
	WafU7y8dwK9s/SEPn4EZbUUZra1zMOCmCAclKzjjYva+qvzk3c2aaq7fc4WMeukPfzKg6wbSNU2
	s3y/MZRWzaAMegxHKzMMaODG4goSdHll0RnHdnaVNL1Pc/Iq2ONIsz3m3w2PGjTDGRAgHif+sjA
	ZcQH65Fne3er1nGkC2bolGBKZrYPPCegDdy9/5kUfKtWXtPX1EcggG9vwsznFOohyo4SZucKRWs
	gnfuxe4boIUUrwBLKWTDY3WFWjM+Tj9cQjrR8xCkBLdt8qfzecUS0Pqleo6EqRyoPMyFgnEUruq
	BY3yXtj0ngJssaQMyZpD9VHp4wR0rpbEOnuvwssHlSvINvTnmoCvmW87igWd6qdj9AKadpq+ekh
	9t8sUeRbiax+r1l1DWqD4Q8L+TSeX+tjnUu8m1NUuaN7CzYsVbrEuJ1YqQyScrYeI91QJbKRdEj
	Ix8+0Vxhz7dy+xuz8Zi36tPNbbZEtfDodvTmm6mgd6OVFekE9xGDTBYaTs3b7/na1egsN38gPKo
	EthhHplrt/n5dcWa9T5VZshuZQCYgR+AlrGISaz72O+Zq1Fynm94Afx3fIRPVAFgJwJQTq9mo6P
	sBtqg9a4w=
X-Received: by 2002:a17:906:518a:10b0:b9d:6d06:b78a with SMTP id a640c23a62f3a-b9d727934dcmr985985266b.17.1776322311268;
        Wed, 15 Apr 2026 23:51:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (119.230.32.34.bc.googleusercontent.com. [34.32.230.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341a8e3sm132530066b.6.2026.04.15.23.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:51:50 -0700 (PDT)
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
Subject: [PATCH v5 0/2] iio: frequency: ad9832: cleanups
Date: Thu, 16 Apr 2026 06:51:16 +0000
Message-ID: <20260416065118.1299-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series cleans up issues in the AD9832 driver,
including proxy header removal and bit math
simplification.

v2:
 - PATCH 1: removed redundant bits.h include as it
   is implied in bitops.h
 - PATCH 2: changed ull to u64 type
v3:
 - PATCH 2: remove rogue vim typo
v4:
 - PATCH 1: removed slab.h based on IWYU
   recommendation, header reordering
v5:
 - PATCH 1: commit message stylistic changes

Joshua Crofts (2):
  iio: frequency: ad9832: remove kernel.h proxy header
  iio: frequency: ad9832: simplify bitwise math

 drivers/staging/iio/frequency/ad9832.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.47.3

