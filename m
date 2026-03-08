Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCA8239E9B
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772969130; cv=none; b=nEZa1Xqiy6ulKKt92qMOIHWkcbFEcwFCSUfnCGsP6NVa/8869OC0vuvHEiPlf36qK29A+V9KJKYpbKO2Y+TL9mJJrbct+1W8d8viow8rrF/owyJD820/5RiIOuGvnT7TULDJbMZHc6wegBYa8dT4QT2N01StuWxCcwLkB/MEy4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772969130; c=relaxed/simple;
	bh=ouwN7Vj8H2yW508oJd2EU6/Hld8Q3miNunz1ffCDDiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jOP66TsFG+UvrlZyZVll+iet53BySTFl1T+V9bQCOH2v7OMxbosw7H1zzwitRDl2EpfY1PN0BsI6rUJ/VTvKzMlSjhJjBRCHP13FhzERNNuZo56s5dTKC5tFShpiLrQhMn1qa+rAuA8v9ssd4VyEKWPGsrEisk8XIJwNCpx7vi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEuvmQPE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEuvmQPE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso5333519a91.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772969127; x=1773573927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KzKDK7xE0vdC4VtPl95NT96CA+sAsLDCv7kvDuZK9Ys=;
        b=iEuvmQPE15RvvYWgxAQ9TGJ2gqyVkPJHjDMmkgNEKSMwHFviP13HaGTChuPbZ39UMx
         ShIN8rbzHrqLLSziV66EpCS3kTxWu8o2BzCWYpxAROoyaaahBxS72pSrh3h7UUEfeplb
         jgVVpbmLqniz0uZybWLgxr/IUnxKu8i8Fj6ijXFR4uPtJ2hFKjOx4UKtGn3CVIlig6yj
         49TiJ3UMpaqaHexlzqOZmtKztEoAueJPWnYdcysl26sy+k2i1GtT2fMFgmTr0K3eiXi/
         rY1hu2TEh1Ne9IZQj8gXOE4tDJ48xGwxsTElLMHxaPzjBranztLWdPl+iCeYOrrdV0Vu
         2Zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772969127; x=1773573927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzKDK7xE0vdC4VtPl95NT96CA+sAsLDCv7kvDuZK9Ys=;
        b=k6MP19tEdrC4n1HhCdqgr1OVJSzRM9eDqYhvH29t+ofuG8LSQO7UbGzVaJteHGsEPL
         hHfIPQsxnBq8k2BZ5/q+EUNa02xxj/+mcBJzZCGZxL16/r1xVd7uVyfhuQWHPasHBCdU
         0QyyIZOggcHrKbwngXwFIKn9Aq4X8geOTu2YAGhatsQ+Kg0ORWNmxNJ6VfObAScUFQd3
         9nznNqvvkSNv7UrcV8dn0EqpwfC2MrcEhnk4/29nN8mTEya6P+NcaSBZKh0Ab2Jc9isP
         INs9eLahFkk6QCqsVuLFPxDwZnAZgPfQNWijktSJf7LFRyKUDhIZLc9AGCNSeIjAvp1z
         ARZA==
X-Forwarded-Encrypted: i=1; AJvYcCVP668auHVBjB0dlfQZcIHYRQjxsrIECKJRPEC91SEbkDPvm/IYzISPO+e+GOk/sW9pP93t9MsHZEkW+BzM@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3nKj+4bQYTpzPNLFjsTkT53YGo4t/xDUIIK96oujrRLzwTaNR
	ECK95RtpvtEf8k68l5DHwtxP5UX1FkMh7+erx3q3G6Hwzb5JaJ+OlBwc
X-Gm-Gg: ATEYQzw0G+KRmYelJAw7UvdL0lE3d2/QohA7TtYigXMcszvwW16Ejza6y9A0SUZpqzF
	GwK6V1o0tZyD92KnBbiAqnb5j2dCKeLZL16Q5/HFUZkShXp8bY016xtoWs26sJEzWQnL42GcMmK
	N4W2qBr8Tdr1kJ44d/OKM7eAsAQw6ice8OAs5h6jZ6wYHCeQdPkEFARTys+X/gsO6U2h8urYDh5
	BYVJ6qccweT/JDTqP53wQx7fQbDZ5P3ymR+mCrop1YwF1OFGLveQY8Eo5FECyEfuOxM1mguifJq
	U2xNE9vFL7qSowKlG9CKMlCB4CPj3O4QFoSopWxrKCDaBkpxsLRNiiGhUJOuH0PH/g/SXwdHLgR
	YEchRqa8EfNG6k+h3eMrulCdFXgMoR2j5kbc0a7P5wiHuBLwgvWhRPq1EuIJOswLrHZJBPruOgU
	rb8xnJeerJaw9BttTnzmOxkCkonfNjnIOnzhB7jvFt8RsN4ZWJU8Odq3O5NQFg5kHOGhkr71Xyf
	I1Oqnevy2wg7CeH9luDN1/RHD0qitcz0wEohwc8O9oR97/I
X-Received: by 2002:a05:6300:4045:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-398590dc5bcmr7363457637.70.1772969127511;
        Sun, 08 Mar 2026 04:25:27 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1227-6fa2-6742-d66c-eafa.dynamic-ip6.hinet.net. [2001:b011:7803:1227:6fa2:6742:d66c:eafa])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48b2c41sm6886286b3a.54.2026.03.08.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 04:25:27 -0700 (PDT)
From: starPt <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	starpt.official@gmail.com
Subject: [PATCH] staging: rtl8723bs: replace kzalloc/memcpy with kmemdup
Date: Sun,  8 Mar 2026 19:25:13 +0800
Message-Id: <20260308112513.249948-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded kzalloc and memcpy combination with kmemdup()
to make the code more concise and idiomatic.

Signed-off-by: starPt <starpt.official@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22bf3..2125606f7775 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,14 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
-
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
 		goto exit;
-- 
2.34.1

