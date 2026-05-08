Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781443264F2
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269194; cv=none; b=iMVqhInNoKnMfQ4tJcbwS2Ny6fvz5UMzqOWO7XeCSP1rgwamM4+eH0i5cE1HijyY9WEUbCOTJ1prPtAI4KjNy0fHHpzw4M/gpqLwqLrFVDRSibfdnnHmZDr0OjPVVwhisoNZ1URXGT7JXrz2QStcnesE2g05mts2NhaCVWUZmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269194; c=relaxed/simple;
	bh=kz9Y0WN66+vx1tzieEBRp3PfqJHOMf/thgqmufLb/NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmQc7JQ/Hdeu5qaMsDlOb/NAoIPUngM6vTS0xFLTRXlUtr9K4qVkBvNsGT7EFFsjRTuYDh2VgBv3Hnm8QUnDm3LWILC9A9NbiHcWgElcY0j3RX5Cm0D7xM0PTakZ2W78CH5Jpx08S8zXqajZsvgCxZzP98ljQa+hUuEHjpQYpPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guWJ/0NH; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guWJ/0NH"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-393da8f389bso21530071fa.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269192; x=1778873992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=469lO2bVQwt3MiANg1OhtME0GvlHXkdD0DRW/3rpC1Y=;
        b=guWJ/0NHuiDsrwpCSYqZQYCvMqwBb2QRDO+nc8dE4MnkB7cTq7ZvjhhXqIMaL/fUAi
         MNGrRA8fgnmI7821nuHRO7RYkHrcREfI+5ob5dpDWTl6SIO794Yr4PH2TB7Hvm8MXXzU
         O6E2nqgpaRFYYUuq/UV5jLveCpjN48BMFEpsx/1RzdVatmsxe5UkcZ1sN4Tl6EgotNYr
         vSHtFuQfHnE6ZfdOitc2LtbRb4ORZGnzzu6Z9nxknwaSZhHJHIzo7T1DsG9i47xU7txC
         Q3zlZYlVrAv8PgPPdKO7K6a+5Cx7lh6uWRe0VX8OPLaY5i710pU6MrPFLGq2/0h+rH44
         hAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269192; x=1778873992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=469lO2bVQwt3MiANg1OhtME0GvlHXkdD0DRW/3rpC1Y=;
        b=JMSri7EKZRRG//xD4EuUYeIiOO9ghJl55EAwpDokWDUPdER3GXoI5s2JblqGZ0B7dl
         J6Ph7pPxQkd/tn5s6JCt1AKAvq5WLJZlOgzaxww37O+HviyVco3wQQFzX3e+VBAqvOlQ
         b+C0r4bC1nRcqk0/XyXan0JV6+1HzGsRTQXtGmGhPvulxZGnmdCToPY0UmgQ7n0CkFj/
         9EdKuuFeEODc4DiGSHWSwpHJNvfxWiDULLwWZhX2qcXcXQqAdXRC0D6/LMyLPVe/N7GN
         TM79P5sU/PbzwoC480yKAZSxGAXmnXaRrCqb/ZPZ7D2cAbM0T/bsNU/4CRXIMxJl9V7P
         2LlA==
X-Gm-Message-State: AOJu0YxSYnVxP5/f5Opcy2qpVVLBgnNGARlzLx91mDfsbsB8bOKkInou
	uM9IMCCtO4FrxXN2ltN5IANg59kDL7JikrL4+oMVuskpunRSA5J4vUUr
X-Gm-Gg: Acq92OEoWyklPDGRB79ChohcnJXcKP4PH/SR93glPyqp0ULUmQ+y16nXCeuQ8hbCjdt
	n2BRyHEnmFfHE4bz+cklPjx7FYwkdzdm3sA3EzawaX/b6IRUakusRuI4kIuWw7pdjn8sRXKmI/N
	Md544Y0lydzUIpHllTLQ4Ta+ZkqkxLgRv9l/DS18yCpoFnRqVtmt+/A8nh0MhldHsbzq9F82PPU
	BlGwybCLWBkZ+oSq6HLzYRiz+HdYh+qqC7nX8BICy7vl7z1ZwrI63gSNdT6KiyRRhN54ef/NXTT
	brCZrWyZIBWgloDv0ThHB+/6cSfmpaVwpyUM7atRFzFGybkf2RYOl02GvtuvpNSyNXnXj6+Ew96
	0AVYHPuV8uUfxhRbOXOa4oCcKA7hyJaN/izeUYhZKqxQLSPsErk/G81AJH1QNWd5j4z4Rb21Dfr
	4xvyVFvS+N4HQHxVzXjZRxkJNaEmVMJMos7hU=
X-Received: by 2002:a05:6512:1304:b0:5a2:b3dd:7a74 with SMTP id 2adb3069b0e04-5a887ceafc7mr5218680e87.33.1778269191702;
        Fri, 08 May 2026 12:39:51 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:51 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 11/11] staging: rtl8723bs: remove empty struct _io_ops
Date: Fri,  8 May 2026 22:38:40 +0300
Message-ID: <20260508193909.16015-12-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508193909.16015-1-nikolayof23@gmail.com>
References: <20260508193909.16015-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All fields of this structure were removed earlier, so remove this
unused struct.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_io.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index f86ad3fa46cc..cb26e74162da 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -10,14 +10,9 @@
 
 struct intf_hdl;
 
-struct _io_ops {
-};
-
 struct	intf_hdl {
 	struct adapter *padapter;
 	struct dvobj_priv *pintf_dev;/* 	pointer to &(padapter->dvobjpriv); */
-
-	struct _io_ops	io_ops;
 };
 
 #define SD_IO_TRY_CNT (8)
-- 
2.54.0

