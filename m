Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D623B612
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389864; cv=none; b=kGeHvJJZdc/JEsN30k/Rn+H88pgS5LlRYYQefZN1E1pgA05ZhZ5xaVN3nFk8cpDyGrU0dC0e0aqPSvPrrtX3xMPjRuVsKoxm9UksLbdVRRtYYUy0yH3KEhW6uExWuWxFck8dU4JDWI1s5qhHDN8FD9l7fTjJZa48WmEk4ItVpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389864; c=relaxed/simple;
	bh=4f6DOT62ggBGsTASA6oSlYNYuz92aScisGHpB22l1FE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E32LHzKeo5jYni/I6szfu6l5sIpHIHd2wwfDOVkRFwgFPRRLIYeYweuURNKCk35qQhiNY4BaVU1yLMNxKwAnhzZaom76itma4N3/kTIrd3RGV66GQ0V5bnOEG9TtWXxMf1UoMcfRTp7R1qG3TAmd1g+Bt44s/Zh1EZFCacS2DxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6+QoW4y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6+QoW4y"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso17278385e9.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774389861; x=1774994661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNdaz3fx1NTeJPY1Kng7X6wkER+os8LVlbI6aoGJx+w=;
        b=V6+QoW4y1NgXU3/pSM5GPud2w9ZMG0kBTnvWf2DPVkvygO2cGLSjKS7Gl1TmhCRHiQ
         pL9VBCUbSASANoMH2T7fY7rH9YmfWvLz1j3yQ//9hE12+7SBPrUZet0XJAFWUQxC0Kzb
         V2f5Rxf+w7bE9Td33mKFLt0EYUGSIyGufrJJtONWMjsZOXBO9KSoXUN6+wd5YySiv/Jg
         DZ7gUTNS9NyjE7DG+SilnQv2mFQrLQqwdfXM3Id34H1npYEkRKPbqhLKnCOrCPnADyVI
         eXpglw8OHoPh5t1lbZhZc+8D0fbNnxrnYAdrOTpIC2jMPt+uJ2tUpzTrwjPl8vfuP++L
         2bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389861; x=1774994661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNdaz3fx1NTeJPY1Kng7X6wkER+os8LVlbI6aoGJx+w=;
        b=f04Obp6XMd8C0joNiNhBzIFDmMeYOVH8rwZ25CPN2X3nOqQxnazynRuNFP2AodKYMI
         GxYJtUPLqYqM3HYAbqn++Ya1WoEsoXRwEGPAYpHBDIFHFFG9ngCRJltoD5QggDxlReNA
         n7ZWPEOlVjiGelj2ZWj79hSvkGYC4d5555sKKwj1k9BxQz2fQNGYZS5YCASKCOU7ktlU
         v6NQV7HhtOEuePwNV/YpkDHZ/y8bctcEqcy/eFCyBJyVi521rWqbXfdggqpFinSAGFX2
         QDBc08cbFMx5xlKN/Ioaob6vDT9+G1RvFsyn4qLxLWeO4QIKgU2YTMu6bgFd3SZmZJpS
         z6SA==
X-Gm-Message-State: AOJu0YycS7PnFnuauSYU5DVEg+lU1QUTv0TAYOKQ1GGvvWxc1v+u5MfT
	e+n1Q4pFqLLgPxxuG0HXAtwnyPcfZY/MA05YI4kKsRj1KFiO5lyD2uQr
X-Gm-Gg: ATEYQzwAcFqROxD5V5VeV4IQwGI3chJpIqqhnGeL3FU50kV+hJ1Zm/4AxcaKSmn33Jr
	lNZzPT0jbia3oG34J5KElwWkp6U9x3z5GCn249X3WIjriJpxbix2x72y61LdFtQR5HvnaSeBB6p
	pSF54DhPcCTRtdB+54Q1yZfennD/fdT80U8cmMjowlXivfsY+ghaIqFISKFyeRS32W1NXxumIA9
	cbTBdc3GgHyWXxutPSRVcmRF+hCfjLj7DUTXczXsR+e3og9c0J+loUQoZcDXlVQoBXbT0Inizth
	2kJIqAct3Zc0Zxc6ukTYP1kuNl3qQhWn2mXQGto0p0IPxnyW1YJokuclpk+SucppAhN6ixbYixv
	SlVPdd8FHMFwgjeYI4bk2pDYuccWGAIkhdJWb9oesMmHVTHp8tlSgRodldNoHZ/pdp0KrmbBpvK
	WEix/Pa1XMl/9mg5SMMw30K4E=
X-Received: by 2002:a05:600c:4685:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-48715fc38e8mr20784295e9.7.1774389861131;
        Tue, 24 Mar 2026 15:04:21 -0700 (PDT)
Received: from potato ([31.176.161.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm99264615e9.2.2026.03.24.15.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:04:20 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 0/2] rtl8723bs: clean up error handling
Date: Tue, 24 Mar 2026 23:03:44 +0100
Message-ID: <20260324220346.47157-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up error handling for function sdio_init()
and sdio_dvobj_init() by using conventional errno instead of
vendor-defined _SUCCESS/_FAIL macros when returning

Omer El Idrissi (2):
  staging: rtl8723bs: use direct returns in sdio_dvobj_init()
  staging: rtl8723bs: cleanup return in sdio_init()

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 21 +++++++-------------
 1 file changed, 7 insertions(+), 14 deletions(-)

-- 
2.51.0

