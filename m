Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8F62D879B
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692836; cv=none; b=MU0ccLHKU5+yca6wdmBdDXBZdGS+0axywu8JXhe9opSPXBPcnlezklP7z+lLyBCCFaxRdWwgirW4XqdtSxG5JmYHjgNALo075r9E+eKK/DsalyXNfbBo7QIYGbQqmijLoa+VX/BnQFidvHfYiTESOspWA32kHiMHMblmmqVmxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692836; c=relaxed/simple;
	bh=JGVZPkVppnHMIo8P4cfkz88wsSVkgOGuQwKwjobYF0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvmAuGdVDkiklEvsUthYgfCCCInSGuW80mDkbdgPL58Dv1ESq0spIDj8w8dsM3gLvU95NtrHUGNn74hAwhDVfjWpXKPFUFIDg0DoBnntD2qR/OHCCq+q9EY1toE0T21um23cp0gj8ZDZtOljlEGiET7mVpuagP0DpH0olFlYqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7HD1mzQ; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7HD1mzQ"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a7a23f5915so33612045ad.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692835; x=1771297635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYdUAAN/G5UFlt9WjWri0jhsBKaunl7bzWpCbawTbVU=;
        b=C7HD1mzQgkw1/gqEK1wxYJrRyF0KZhY+Gbqp3S7MC5Y7Rlp5cqHSblZIrTMXWyw4mR
         ozmcAo8RwS3grE2iytP/nnAmTdp6hOrQX4hAAL2euy1rXpchPAnhvQWaeKcS/Ltv79tO
         ut5U9aEiFv9wgu2BL50CDjfpnenVBRME/juotuZ9XPRYoA5G8bpxk7BTPCfDATlUUWCZ
         m8znnKNDvEsEO26ds3QPR6D7wHesQAL2aBgQ66QT+UkUz4gvTEseFYJFuz42fTzhpAF2
         x39kEkcTMFKo9srBTQ4drug1HXQpi2uGUrPSI1OZF89SmHny+UXWaqKBTJWHO1X6J0Gg
         IWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692835; x=1771297635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FYdUAAN/G5UFlt9WjWri0jhsBKaunl7bzWpCbawTbVU=;
        b=iMuo6fl6JKDClb4wo1yIncrxiUYQ878AOqZ+OoMH3mF2sny6AaeU9plV+Uag3lidGM
         3BNOxoJObyslx9kKBL5kJnYvck80KRZ5imlwxD1FpS+LDx/Bk56CyaxlaOH1TJnUgTt+
         uz2xOCHCZrWLgzPQtN4QBWorwZAntE1iIYgsEtfaFOHh/U4LgXWIGTC5Acdu/z5qXABZ
         Pu3qIxihKi99Hm5CwU6MbV2vYkDpoNWEj/cdFaLm4nJZ02HPnzrnKuF7aFsvGDAcbf6n
         LUdM38R7df/Z0cmpigtdWhYvTX0E0cvxWrxxRnrA0pMbd7clapEzsNKywhYrTvX+mF+w
         0PuA==
X-Gm-Message-State: AOJu0Yz9x8gDYN6dcyCD9qXQ2EsPjYY3ah2bC3B2cxzs0myVLNxn6/gp
	CxBlpRg8SLJsCeuNaUlaNproCmKP+RJ1+PJnsLUEB/DaL+NoRN+slrETZRNh2x5o
X-Gm-Gg: AZuq6aLiYDpg/xmaF5QtyHfaj2RejTdLGC3ola9LuwimxJNkaAHOEALhl7W9JzDXj+0
	TaO6k3dSOpXDFzL02H01EU3ueiq5fiUoWD3B81TRBsPkmYn6OAy0gk8gB9/sXAikTd/xAsxlYOx
	YVu3KRsYhPCqHcDYwGkrWIWKaBMesGNWUSc4Go+R8nYnwn/MeocDAOmqBb6I3MJz4AVJq7hQJpT
	lygJohEVyLzhWJ5wHti1nxeK3WF6iTyHuwUZxYITW4+VfAAWzViIzV0ezarpCSlsmeyUPe+sGSp
	XG4z5p25SuW7p8vyK/M8h7f/wO3bXSeyBJHNLzD/lvhYRypM6e9+XVBd9zFA/i6ccoz2vqnjrb/
	w8nGiggWWMHJCBFHmxyqMUN/P4FhajyYtQNQHDtMLxfAGqESNJ/Lc72r6aRWd39KLSZ+Fk3Dd75
	Hp6/6YME7zireAoCKrjSJUX6MdJTUgQfZ6aSO2sxKo
X-Received: by 2002:a17:902:e84c:b0:2a7:5171:9223 with SMTP id d9443c01a7336-2a9522756f4mr133025335ad.56.1770692834423;
        Mon, 09 Feb 2026 19:07:14 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:14 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 3/7] staging: rtl8723bs: remove unnecessary void * casts in rtw_ieee80211.c
Date: Tue, 10 Feb 2026 10:06:03 +0700
Message-ID: <20260210030607.1430567-4-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210030607.1430567-1-horstaufmental@gmail.com>
References: <20260210030607.1430567-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88a6d..d9746679a5f0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -108,7 +108,7 @@ int rtw_check_network_type(unsigned char *rate, int ratelen, int channel)
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
 				unsigned int *frlen)
 {
-	memcpy((void *)pbuf, (void *)source, len);
+	memcpy(pbuf, source, len);
 	*frlen = *frlen + len;
 	return pbuf + len;
 }
@@ -125,7 +125,7 @@ u8 *rtw_set_ie(u8 *pbuf,
 	*(pbuf + 1) = (u8)len;
 
 	if (len > 0)
-		memcpy((void *)(pbuf + 2), (void *)source, len);
+		memcpy(pbuf + 2, source, len);
 
 	*frlen = *frlen + (len + 2);
 
-- 
2.52.0

