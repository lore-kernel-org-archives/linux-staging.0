Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C4B3246ED
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786215331; cv=none; b=iW71U1t75HF4s0i2H7sUgeZowPt+Qvp8272NsjTUD7B3h9NyoZIG9VQtuOVurUvC5jVAoOu/ObKu0UDxR/XqVj/rtmnnit8UTVKL/RgcsczLtu3EbOk9lZJU7f2gFtr7bnlC7oiNFqtGiNzQZzGc4ueKWBO6TDBJPOhGAyedWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786215331; c=relaxed/simple;
	bh=o8tp/RV19MDutoXFilVQRHPzFyUukCKdxAgfG9KzEXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UperaW0wawsiw9ILSE5Bj8o43kiZJb4YpoljtfSjs7DC1Yix9BdLVs+zifPPbC1MdT+5QO/BAB5M/iUPLpuk5+/fCW8JxGTeVCJDEtcfNn2kvZV80d5cdYu6PQ6HJHVjJ9dzcmEwZ/bS9+MH3pbCLtdqDuEWE5uEF1L7ThhlA70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wl/VEgu/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wl/VEgu/"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so5558091fa.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786215328; x=1786820128; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VSJaRed4DSAJb36RG6Zz1ejo32wRTtdzotNw5DTlepE=;
        b=Wl/VEgu/kVD4ApUKzQdnIAD+flUWoQgJ3jSV/7avZO3MMd/+DzmbZEaxmw4Mx82Qqn
         pihACK0o+u7cT6lTWgQ8CuV2bjw6AKF6eUC5aCHvfYbwVLclZbJAU7HB3mY5/uIie7pS
         WWRDeMTHJj4IfR6DZ2LNsf6QA22Uahb1neHyKg1A0vmi/UJNX5xpuDNX1j4h+3lKRekf
         vGXVx8Xe2hbeeVroBrmVSAJiIZ1074+Pwxb1qjtVRc5KmC8xpYisXbu+eQ9o4JU0ACO5
         k//xmLFE+KKnDAeJdwJ7lgdbrh/GU6r5CqdRZNCGJRtVt2BRZcaxMbgUj89aMz9dWlgI
         XGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786215328; x=1786820128;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSJaRed4DSAJb36RG6Zz1ejo32wRTtdzotNw5DTlepE=;
        b=D4Mnht/OlVHOfQ+AAv0s7JPzYLpn0NZHDxKksG3zGJhPsrEXrAEAd+ITDSzfIFJA4T
         1jS5v0qnt4ypjRYdvJKo7YTLtinkmJ6i4brHkjDkQoyNCzBF2aaIeAYioTILtz/5ht8R
         NKVSocZolxfv9FIxTo78wVhdFSb5o2sf3CXPbeDdqWwPW9b+T2/UVa5oQ2AQb16nDgDt
         icse3abUHNJgcrmZveZVFniaNvMeFw9UY0jYp2bKtap53otGXskn6o0HEFWYFPy2gacs
         /SCvBoj1hchrBR0qPSTI4zv0fvqZ0HHoeRNITK3Jt+KUVHRV9fS6joNuB7KGhNzUck6e
         Da3g==
X-Forwarded-Encrypted: i=1; AHgh+RpUM3XkA4kcxU2oPx8/iQHquFnTzK0FOcfTuJmut/LTY0LtHkpeoNO16r4zjHzIyAGQdaa270fBGd4nc89Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwfpO/yRgrs8AHLbL37Vl4/6WUfrovxQSxPjLTvxvLWw71gllZn
	WESbEWcZo8DyIuQYTB8F7YQORy7CZBmAHObX6txB0foOhsUQSEflXyiOmn8nUg==
X-Gm-Gg: AR+sD12jZCgTTq2Qgp2LrpT0V+A3M6CAlQsYgFS0iQef8Iq+YhMpcGhKgrmZeKAW/EP
	6M6mEJ5uWdVKp8TsE3Amplmi3JeO3t1p/oiPPRVLK3n7UcscAOOs1p1zwMEahKS7l3ppKjwdcBK
	wVpyRzH14EyKdVBOte0Zt+dkZUeBSBsCiDRa6+B0bveKb0V5kepcnr5axmIqe7gxM/zMVbtpCnp
	B2v21f68soXhNEPrBxgdkOCpQ6c70wdnHbRf9jAkcrPzTMYivB9zbzpz8GvqavTY+fuk73K8DdR
	dN2ECPQ7GzNa1CAtrHD/z+2vsvyumhbr2Pzs1Fk2fNkPUgGbDsyHkdUPOf3Y95H8elm1Xo+cj8T
	g9BonBb8JU9uJynnLhPxWLgJZczd9o5qSk84h8vh8EeYB50oGwk0Yi0zEelBwu9FcpgZ43RVoHE
	J85z5lg63Q+NfPDoStPi7LaH0v9roUmxM7PvYbvMPAJQXKZy6V/imnUSMdKfGSd1/vma8voA==
X-Received: by 2002:a05:651c:b2a:b0:39c:828a:ec28 with SMTP id 38308e7fff4ca-39fbb2df6bdmr34343321fa.31.1786215327344;
        Sat, 08 Aug 2026 11:55:27 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm11770001fa.9.2026.08.08.11.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 11:55:27 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: remove pwrdown field & related
 function
Date: Sat, 08 Aug 2026 21:55:16 +0300
Message-Id: <20260808-rtl8723bs_efuse-v2-0-54488b13d554@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNSw6CQBAFr0J67Zj5yIisvIchhoEeaMPHTAPRE
 O4uYFy5rKRevRkYAyFDGs0QcCKmvltBHyIo6ryrUFC5MmiprUxkLMLQJGdtHN/Rj4zCqtyY2Ml
 SOQ3r6hnQ02sv3rIv8+geWAxbZjNq4qEP7/1yUpv3q9u/+qSEEh5Ll7iL8uZkr1WbU3Ms+hayZ
 Vk+3jA1hMAAAAA=
X-Change-ID: 20260805-rtl8723bs_efuse-61a335b0d1b2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786215325; l=1046;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=o8tp/RV19MDutoXFilVQRHPzFyUukCKdxAgfG9KzEXQ=;
 b=lNMh8BOGQidir2jtPByTXZ2n4DeLnttcw2tHBYtWNfu0rjHZ4rZaIx9LBX8Y9eIBzmCdMTwcl
 5phkvGd5i3kBci+dqdOgdNe+Fb9jz9rNbOPQoFBj+V1ywtgDpGXop3M
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

Remove the function whose return value is ignored, as well as the field
in the struct hal_com_data that is used only within that function.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
Changes in v2:
- Move the removal of 'pwrdown' to a separate patch to simplify the
  review process.
- Link to v1: https://patch.msgid.link/20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com

---
Nikolay Kulikov (2):
      staging: rtl8723bs: remove unused 'pwrdown' from struct hal_com_data
      staging: rtl8723bs: remove static HalDetectPwrDownMode() function

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 75 ---------------------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 24 ---------
 drivers/staging/rtl8723bs/include/hal_data.h  |  3 --
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 4 files changed, 103 deletions(-)
---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260805-rtl8723bs_efuse-61a335b0d1b2

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

