Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29BC1EB5F8
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483059; cv=none; b=g/YFW4vL82QfKh7zfPQZJMrZDcIDQk2UzqYigzMXXGHD+ubRJBDx11JJtsbv80iMKKjHb/X6IamGmoLVylY1s5RW5scghviaH+z/jJNyFsXvtdXTgqwK45Yvbu5W1EscG63LHTUC8xpk/85C0LPil8a8hlE71bVLHD2tE8rMd30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483059; c=relaxed/simple;
	bh=4UBCvfM1B3AeuqiKOXa1Rf4eLzonhLRFGoa1qWBQs9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e0ksFt5+1COxt8nIbVaTUSpZyAXgh5tN6VTqCeO4qiir9YrZPFeHbbnNeW+JWTBoSNr1ab3teOpcYOCb73cZjy5Q1w5VbcSCHfXw8bQWdM2Vg+VaswTHj6OILQ1ZTR2XV58dKHOmJQmGBdCaEkIQdRH9dbZDlcGkzaoeyIXXDvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPNCL0y9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPNCL0y9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371104ffdso989165e9.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 22:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771483057; x=1772087857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Q2vON/UUWOeXTPZ0tKO1wzDGObrsFuKAL7Ksca7LI=;
        b=jPNCL0y9ad+zhm5OYE3ppFJpOinwRAytnCeIRgIsOGnrP46rF/QVqXeDWPOZ7n42Fl
         Fm0Z97kwkqbQTW8Iin8KkjvWJ0sj0W96cVNdj1RG7aW8efyXuoj9aHbBgWXJE1qDfyTx
         YAI7ooxp6nKgReBPEmplusTqLqwwf9txUWqhdymbW7PaMcvUjnuoNRCFZ1qsl+hvdDcR
         Xb6vXeTnojOXso+P7GEPpK2nveVxpmyeB1PZDWqHZ4UqbT5mFqEvfQ4wW/40xea/jUtR
         K1yJc2/fgdaXxWrk6dZWY9n+BLcYN4W4UAt4J/uCiCpeGO+Uh/jgmmC4mqMvsNdkn6Ew
         XAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483057; x=1772087857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6Q2vON/UUWOeXTPZ0tKO1wzDGObrsFuKAL7Ksca7LI=;
        b=JO7hoN0L187dkykF6KK3U9ExA2LFgDeaj9fVFroGTFiVkSLoLUSes8K1roSwQKLp+h
         XPtVXTt4ucb2QjHCEk8elBlBURUoCg2t1KqlIK9GvEoKbuCDOBpaaX8FpumsZIMCl8mV
         Qi1U4s0hXi+kBrhr90ClhBLEi4vsQNT80nvzRsPApTBuK+JrtPrdPxP+OUUhYE1CdxxS
         6WRlrtKXmSY+8rw/sYWqNoweNQ1O0GbggULkrNc87OREoWpEk70P1sjZP4cGkKzzEKY2
         BtbKJpQxEj0hDXCXU9UieP10d63EvvLQi2VLDcXStVBQ1JC1rwc0/MWtdO+l+WXui4p4
         y27A==
X-Forwarded-Encrypted: i=1; AJvYcCW50UsDhOHcznDJ4I+ywoS/E2wB6g9GNLvafObd49z2zyOJXLCILS9N6fEDUhrjp50CtYj9xTtHrd3cEwnB@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt3PyV4hzDz43a4Ni/lRuSldvtXRZ09KzwepFg7tgWKtU0O83E
	sz35INlWNH4+hE+tiG2wQW4OWQn2rY6pjvHqcniwK2eqYKMznpUD9IuI
X-Gm-Gg: AZuq6aIAQdqQaJcFZzaqMF0qq38Ao0zgvLgZcfLbWSJ47fxVi1RCqtRNnL3JKDAnGAv
	U/MwF0W70uaavm9jj1knHr6xuEekXK37laO98WF5ZkaMjnJuWyECmRqrqEWqgaW0TsFetii1g7t
	sOemwsj9KGLgq1IbczroMCdCrBVuKCuIl+Q3gI0vZ3YybpOHWj+qvosodPCvkYqYYCFy4ZKhshX
	3SAk8hIXIGqLng4IC7WnB/nk9iAHO7kPgxrecOM9RJs3ghesLDvUfpPEwM2gXHni8c4AtTVuLki
	MpJBHZDV/GCnXlR1O8x0yrYgfGmLEMlFHFO/Ln8/32nUD4UBzHnOgNHzmh/9yO0U49MJJjaYkYW
	T8iAaa6fpuHdsQ6ef/amRSh7aZg9bTOwfeiNVIAiXQ5b+1/W0s4kZVGkIBIHXBqDKRMpVJhXb5f
	9QQDJEK0wbPob+xVNAWunV94rvMKwJsiYGoxwxt6YKEsC/lA4KTaWPVUmGQu8WyvQiebnRxxyK2
	psQZBdcLXPFkhsux6BPSq4kOMtsxUR2+9iWdhjqN8MzrKkNG5ac
X-Received: by 2002:a05:600c:1d10:b0:471:ab1:18f5 with SMTP id 5b1f17b1804b1-4837106e347mr218803595e9.7.1771483056680;
        Wed, 18 Feb 2026 22:37:36 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b4cdsm50192255f8f.8.2026.02.18.22.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:37:36 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix typo in comment
Date: Thu, 19 Feb 2026 10:33:33 +0400
Message-ID: <20260219063332.10393-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "inclued" to "included"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v2: fix spaces between colons

 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a47d0d3fa2b7..038157442348 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2264,7 +2264,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 
 	len = head_len + tail_len - 24;
 
-	/* check wps ie if inclued */
+	/* check wps ie if included */
 	rtw_get_wps_ie(pbuf + _FIXED_IE_LENGTH_, len - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 	/* pbss_network->ies will not include p2p_ie, wfd ie */
-- 
2.52.0

