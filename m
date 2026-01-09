Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B031577B
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956707; cv=none; b=dfFxEryZqFbh96tDEIz93LcALHs3kkniiFuBd2iBMMn2lzjCv0vFmk+0KSRCeaJ4f4nRVOMgafgvEa7QSa8SUnD5etnOYy3nafxEsZrieLFgFCDypmcYdWqoWpYUIJTongBbcwQ/RjuMp0LSayPPIYUdwmApIFpomPYacg9qn3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956707; c=relaxed/simple;
	bh=c4nGlG7g5k0pyGglUIdv26GU5aT0EvFsas/+WmURApY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqK5Y7xu0Dwi2YpXBs85fYoc6aKwWC4skx62+WuIYelAYXcGEWgAsSb94LtOF5IirOESyw4vD+QS4vW1OOsIKjBmXGEz01OdCHlOrzB/3BEnH/x7douW1oq/Ckg4iWUe6fQ4NC5ijT/Ofl1DfA7/HF0zysIiB7UNwgp5Y/FV7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHnDRT5Y; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHnDRT5Y"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso2530557a12.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Jan 2026 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956705; x=1768561505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrGvw2leaOau8CaO83+b40kh4e9meJ6JDbfsmfJGOgc=;
        b=LHnDRT5YGgTbRtifKHxIA6waSvuNxMS4AQinYp/zWA6nLl+MGWTJyoFYNnsAMPldk+
         4i7VBMpvBdabc3c4qRjPVGxDurr+gQOojnsDOySDtt18p3MXnVOO/nPaIaVgr1tQx17J
         3M/UiwmrYgzQN/nq5IAeKVbgbhEBIeaso7owu5TBfPmVqMxrDJi2QQYPuGilIJclrktx
         OD5Xu8pbk8uCS8YuAJ8BEz7yG413N7VPVfGoyOniJupYxgc1NNQJetAvEU1BBjm1Cw4n
         FdbAQuOfSinF0QCP7cC/53Tp7+wEAEtbzo/v49Y1YFmyviTpe11sCnNvlHhoeBhcP3zw
         /Ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956705; x=1768561505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrGvw2leaOau8CaO83+b40kh4e9meJ6JDbfsmfJGOgc=;
        b=S1D1zz3h++rD+MUM9QC0YN8b/MsbcYwrl/Gnr5gUiRr9l5JYScYWAirslek0CXfKYT
         Qe3p0KnGzDtP6a6cHi1/GnbeUkx+08ukVqpwkjVpbB0U1IiN1JO1JOC3snrYG9e9CT0g
         IUeAUnkqo6WSCjRU9qptp9waebdQScpWNKeVjkn4hT6WoQMnsr5bjUJZYL3uDTltgGsm
         fwtxGH/hsqPp9vLpqgRYg9cmor3eZZw1s2aoOExcfERwxz6t3YBdBvAJuCAhBL7Otwb/
         BPcXFmiY7RZGgax7vqJydQEAxoTGCJPnFPotuh4kZVO5GRgnrf9HXRVUl1O6mHCDhhKH
         xH2g==
X-Gm-Message-State: AOJu0Yx0etVO+rA2VkkMTijCdoka3oSRjNlFEQeyqVYH35FG8v3Yq4uD
	eBFQZogBkwFADaiagyU6NaRO2Z/Bj6bVje33t/qrpv1srk5ZkSc5FgIp
X-Gm-Gg: AY/fxX7SEsuVMOevrZ7JITRndPDgbgwzMdRhEASOBi/yIOQ2xkvSMPBLn820isEn4fG
	/70iUhcQ5G4NMOo5bwxEurCHibs0mDn+9vA3pl+KTpEdamM1DAHBoKy0Df2kN0s8i7HRk/MIbps
	5zhEa1+gplfLuCNi4ejw7k0mop19sINR0MovM5DyLHlZmNdRMElfbBMhP9QQ4ZoX3BZRBWNN3MU
	G3q5dFQMEWvtq+l3KcNmTjGhe0qN7FPfHE7rgqRBqjHFcUczI0fbB4oCGCrbHL+GFihajK7jWEF
	LyeATE97r/W/SyEorvoq1XuEl4RdBglUIkOhQA5j+Y3ZMViw2YE8kMjmy7zZUIZPhCa5M3m5jA6
	Dc/yBrx+SR7ijVK/a2OMtjb3V2oHdfK1MXdRRtJseUgPVJ+AONcaeAzLb1oA3bKf/yYjrKsZ+dL
	lbSQoSs0v8+/DgUGPj159VXW3OjV1x4ys=
X-Google-Smtp-Source: AGHT+IFVq8QFKldQih2GCzS1jAis1trf+/eG/+3BGCDg7fGTB+NzO9atLC/5AKUp0VrQYvRkWMSpcw==
X-Received: by 2002:a17:903:4765:b0:2a0:c1be:f436 with SMTP id d9443c01a7336-2a3ee4bfe10mr97232905ad.59.1767956705037;
        Fri, 09 Jan 2026 03:05:05 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e26sm101637725ad.48.2026.01.09.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:05:04 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: fix block comment style
Date: Fri,  9 Jan 2026 11:04:17 +0000
Message-ID: <20260109110417.16359-2-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109110417.16359-1-nayana.mariyappa@gmail.com>
References: <20260109110417.16359-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed multi-line block comments in osdep_service.c to follow kernel
coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..8f6dd3560303 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -6,10 +6,10 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-/*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+/**
+ * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
+ * @return: one of RTW_STATUS_CODE
+ */
 inline int RTW_STATUS_CODE(int error_code)
 {
 	if (error_code >= 0)
-- 
2.43.0

