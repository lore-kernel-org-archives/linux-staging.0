Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC51277017
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775897958; cv=none; b=cRrCKoCHezjnMhihjSTM75nkJ3MQJQTQx0hZJSVWgmS4YIlWB0snT/V+srmD0o4zQZzMW+UvB1BOI73P34FM7cRKpYI+PpYcAPRjFpkseTPVgWjI8pioV6CLWIAd64GDgWzwAfiCe2xX4Hy9MEjg+/d8XAgutg8OO+4tyL9mGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775897958; c=relaxed/simple;
	bh=M2rvNeKl7obm3m7H8BnOy8LI0gbihauZRf0XJiGZU5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=obvckPI/pN02LK5+eV87A6zNcrxrZCZfc7ZOjowP4I5H6AoZUxzU3zSTnWhd1tcNSD64cTEFutVQdo2l/BUbmALyvEWgPmMm06FCuHPXba8uDvshmKRut97sO3U3d3RmclQA4z9uIcDOERnVthS1UoYBQxF/ErvUarN3HmmuDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBeQrBKD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBeQrBKD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1635249f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775897955; x=1776502755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpn90LfwlQ2ld/4V5OOgTmgwzq8zjlzIpK3jFq7AUYs=;
        b=tBeQrBKDc+vSEk5LN5wQKJpScF8r5Vq1OEMw9XLRU2OIPacqZ8gOkxDkTzn3/mFbMC
         vVVjuDOEC6bc1pu8mSH98+Fv8/gdgMH2LYIQLoGmz/q8a17NkprYGt8JfVxUmLzSpPh9
         8xlU1sOxxpY0rcOdawBIEsQ6Ey2ag462ykPq9D9o+S5EzTzpXL6UjMUg1Ms7barZ/dyr
         YX1hXSgMnTRYB0apv1n4BXQ0b/o5no0XLG3gORryuWb1HM8E4Cmw4rQ6Z1E/ZI5Q6VYN
         60ToqAC371ARJzuQ0S1pfx0xgWaCx2Kj2D3mvJywwRMMpHbVEvb8gDXwjyJQvULlBuLO
         ww4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775897955; x=1776502755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpn90LfwlQ2ld/4V5OOgTmgwzq8zjlzIpK3jFq7AUYs=;
        b=h6V2orGD7/wbW5Xq/NXLjI1PJyP2qBEtBlWOTeKUuTHP/0Iexi+enrDP86rmPsOjXJ
         sK9R8ljyik3wGhlXxUVP5Dqok6fToBLYwAEpjEBiuk5oe1FKPoChy5VVo/NRtgRE8mT5
         rBcAjTTeNVe64rDp0aeseZdVpmmN9UoC6EVs7ITChDgxhGs7XKaUM8MgRbGGsQUaQE0m
         J2Yhz/YauE+G12cUQIdIxEn+EK5Ik0B5tzT5qG4Pw1KkqnnQKt3dW1tuYJGmpn97x/xb
         XHZ5FhBYE+XIijk/byS3AXuRgoDetN7iJEGM1ZMWDXtfTvJ3kklFxEpT5SelAyrs+Oaf
         I0PA==
X-Forwarded-Encrypted: i=1; AJvYcCVN7NDUXAvVcUiHDyB+PbHG4sQaKvIwWOF7/d0D5gCW5tSCJWzDKe2uwDxLPMHfpxfvZ5okxVELKNebQRS5@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq6dAolwyGX03/eTW3ZBahGduLe2OBzJdLkZYyerXlETeQxlJ4
	yOdIfn46TQJAYGNPzMBoOrALOgzqRAXrdifFwlB6TqoFC+SomrQNMDxa
X-Gm-Gg: AeBDietnWuwlgAD5m30XlahCFdWAk9GE1/GjjRQrHnsdPvBFalKcvU63MxDlaLcQp8f
	SRyGac5tpuI537Q4hh/lbR2RrGouYByIfDpOHuol1e+vt0w2ZmKW8R8RVl6DOFomXfkgi7d2iRx
	RoOmt37LlisFVYHyUR/ZdO2P2ZJL+85bYks8tfWCRZ5wr2VHwvubg4KAjuOgYPM4j6vQjjsJiyF
	/mhkIfRFJT2AynSirTmCNw41AxYUOJKuGJ6ToyPDPHwVhiFgigUxFLzAhL0ScEq+CR05HFFwv4i
	j7DhVwCOZbQZxelUDCKnUXxPbsjCahUU3JaD5yex32IjZDnzxB+0xZLzIwHLAnMPBP+PAaOhexH
	O9r3Ha1toESOKaaUiVoGqE1KBKwRFQGde3tLKW0D2BujQZtbPQ/fk7qMMMCE84W6Bk62QtpI4+o
	7sgdcm31UNyne2q/fgGhFFHcrgWK/COUM9IdmVnm1qMhDIL2pAIE9hpYP9fVEXKg9dg2faibIPF
	lY2jqGlDNBYRsk0rmlHzE1OGjcMIGj+PtvJnxT3qHgZejtmWWsT2EWOWlEpbuFX2Q+1wMyCgsI9
	6O9THte/q69HQwZKTs/x5KF0+eUtuw==
X-Received: by 2002:a05:6000:200f:b0:43b:8806:be32 with SMTP id ffacd0b85a97d-43d642552f3mr9239453f8f.7.1775897955263;
        Sat, 11 Apr 2026 01:59:15 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a69sm14483593f8f.4.2026.04.11.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:59:14 -0700 (PDT)
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
Subject: [RESEND PATCH v2 0/2] iio: frequency: ad9832: cleanups
Date: Sat, 11 Apr 2026 10:58:46 +0200
Message-Id: <20260411085848.75381-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up issues in the AD9832 driver,
including proxy header removal and bit math
simplification.

Resent because of typo in linux-staging list
email.

v2:
 - PATCH 1: removed redundant bits.h include as it
   is implied in bitops.h
 - PATCH 2: changed ull to u64 type

Joshua Crofts (2):
  iio: frequency: ad9832: remove kernel.h proxy header.
  iio: frequency: ad9832: simplify bitwise math

 drivers/staging/iio/frequency/ad9832.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.34.1

