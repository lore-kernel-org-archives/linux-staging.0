Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB13F0A96
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243319; cv=none; b=S3xTXRUM/pMc0ly7xeMtI1eqSkHpXw+28cBP0omb1rGmUtVbRppVW7YyM2fT+SHJnTZXm1qD0OR3CNHFaFidHhyHF6dBMPAk+PX/lG5/QnclcHDQ7/nLEJvvskF5RUYu7axTFE8PcfcwbFUH+mvl0UlsezDlCuwXEqpXB7hjExI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243319; c=relaxed/simple;
	bh=H1uaarUT/CzOlIYk85IhS6PC1+AMvnoZlaiNlT42aGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3EPLUcYGNPiglLWljMO+8tHjZh7Oek02MVNn064rxah+65Y9Nj4g+Nl6eLrEh2sxnBHFrW31sgoWoEFSM3cv1unnRcNfd6T8D+45ZWe3r6Wu8/7Y1SWQSmjj+c9++lTE+SQ4b8wtLzRMzVlMz6aKepASEX4Of42qihFnKTujEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=St7kBnGG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St7kBnGG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso19976605e9.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785243316; x=1785848116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6Y+pKPXjSHKlGYu4KK+zrCXrOnM9HLfJHcJjmz+n5A=;
        b=St7kBnGGQVAWHaPrVoNVVIEk5BFQ6mcOCGVHaVJiQ0Pr2/Z2EGCg1s+MdM3qTlG2zM
         If3pr8ip/gFt2Syx6BmWKVPUhsQYcp6raqNjT4GPa7pTVUD6M2a5nYduCD0upv8VF8wd
         Vix8h23IRUAVw4sHYqzJL99yrsGPISdg70W4exlzj2hcF9hOkDowO4pLRIbAfSvxrAXK
         0HxezVWy4EHgYHdOuk3/oJJQlHbcf2g02MeTfl+YHI+cqNx/AxxNRKXTx1Z3oOgMXKwd
         Vvd/2Mm11O3rNKJM4FI/FRTzGUNM4KDWf3cNkozD1bHYNI4dwUn9Pm9NqForm8NgYlHb
         OdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243316; x=1785848116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6Y+pKPXjSHKlGYu4KK+zrCXrOnM9HLfJHcJjmz+n5A=;
        b=BRy1AXs/f+T/sfMmhnOLwYOLGG8w69g88FUl0GATN8AtE25fDFnHdkN+RcK+S9tbar
         SkkmhQj7ts4nGax2xB7EE17h5+HCi0hd5Qb6DKVbE9b3W7o245R9mZdITP15HzcjipLb
         rvqWXWM4Y73b17Zv8ab48PKCwum1Pl/AZdalbtdiBibzPu4lUmjKlqRHaS8DXeFQ0WuQ
         CO2twfgCe7U0LZJyb0JdOnulNo1oKzNwxALX2KlqS9hLiOylda5O9zr7zath6URFB8iU
         quP9EhTNWTWv//PgPaKt8GLey5JyJXnEEZTTDeUR9zCiKOtXYGKvhyNjhqqAltEPkzv3
         Gcxg==
X-Gm-Message-State: AOJu0YwFJJRU19oXF/ngYPzyiARtENlJhW+SCq0QnOVm3uyYNEKYmx/w
	6GCcLXSWEwXty46ttBquua7svkvjUVx8MM5zpuFsFscY3lnJ4yh94G/HGGJ/Uj2a8oA=
X-Gm-Gg: AR+sD12yri+hOohW6hfaoen2B+9Ab8SQeLuaX6YkxGWP0Plp7piU30Rr677dKMBA9fo
	wN/FX3UYF4IYllB8fQdhQd1achdpim/6RqRzOOKm05Qg6xbGksDQjCPswQ8TsNXqyjyUE/a1L70
	fELr146XIXpXQrWDdxCAaJFQvM+gz5XOygvO0n/3XtD6Be7gLgxuXH1umDlnuVVej3KF0sGxSlA
	vygIQrHC/5XOgJLiEp9DHBA3rv+xg5pocgnuZ6L+Spo/p7eAI96smekwIhXd1eK4jWTSO7bhi2M
	ExiqaaSZZwTmQM/enZl6dCu1IgDlLu5OxAJp4JAe7BNTZZAtcqXamK0+aqxBUmnIwNejp987eKt
	DLixfnoRCXyThhuJHMJttmaQlSdz/R43X1ISLZl49lN4KszcNbWzRTDlymKuFzAuEknJS1NxAvJ
	CUgHOMQGhZ+ImJ69Ka/D6MeTL+lD7MBVeo85SDLN4gXLFSHCHmApMadKs=
X-Received: by 2002:a05:600c:34c4:b0:495:8a1:7670 with SMTP id 5b1f17b1804b1-496c657ec72mr24247795e9.35.1785243316289;
        Tue, 28 Jul 2026 05:55:16 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm74096505e9.0.2026.07.28.05.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:55:15 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
Date: Tue, 28 Jul 2026 17:54:56 +0500
Message-ID: <20260728125456.32359-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728125456.32359-1-meatuni001@gmail.com>
References: <20260728125456.32359-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_restruct_wmm_ie() scans in_ie for a WMM IE with:

	while (i < in_len) {
		...
		if (i + 5 < in_len && in_ie[i] == 0xDD && ...) {
			...
			break;
		}
		i += (in_ie[i + 1] + 2); /* to the next IE element */
	}

When the "i + 5 < in_len" match check fails simply because i is
within 5 bytes of the end of the buffer (i.e. no WMM IE was found
near the tail of in_ie), execution falls through to
"i += (in_ie[i + 1] + 2)", which reads in_ie[i + 1]. If i == in_len
- 1 at that point, this is a 1-byte out-of-bounds read of an
attacker-influenced IE buffer built from association/scan data.

Commit a75281626fc8f ("staging: rtl8723bs: fix potential
out-of-bounds read in rtw_restruct_wmm_ie") added the "i + 5 <
in_len" guard to the match condition itself, but did not add an
equivalent guard before the fallthrough advance, so the same class
of OOB read remained reachable through the non-matching path.

Add an explicit bounds check before advancing to the next IE.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..7bdc5fe6dc8a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1980,6 +1980,9 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 			break;
 		}
 
+		if (i + 1 >= in_len)
+			break;
+
 		i += (in_ie[i + 1] + 2); /*  to the next IE element */
 	}
 
-- 
2.55.0

