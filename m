Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E422B8AB
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737895; cv=none; b=pM7Dn3tRjC71O76wevr8HDNxzgTutdJxAg3l1xP1Wr/PKNCnL5A3l2BMQMXtd4MbrqaGaCtwp5Aj+iuCQfjKh1BttB7ZIzkJRNwk7pgOS8ev6mev1x6R9G5marBSRWP/Vo4Mb2pjPB8+B0MXnMQ9w7cmUnpBNch5H5AbsrxXJEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737895; c=relaxed/simple;
	bh=vXyRsH+clsIAXLS//CsR2saG0oC+A3BuReyTY5adEio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bu7VZouJia6e6yBsoXPRC5EOI/LLZBld5RpMQg+fT6wEpTWT6j/Rnv3QMm4JPOfbj6Fyck0RBfsW8rAxOrvPb9eIFRtIYTt3Ifhxs2BXXxr9nPcuWIMzpiwosf2fQw556sh9K957pnM/og/BdeaQeT/L3Ux5jxYdUkS7YsSd7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdfqIvz4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdfqIvz4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so894526266b.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770737892; x=1771342692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCVsd50y9Vs1kXm9MnbrZNGk4b2Cvx3GEVe1AL5Gxmk=;
        b=JdfqIvz4ydNU96t258uLyIy+1F206fIKcOtT0q3rtot5LbljCMf99lmHDpEp2gz6vw
         9DnXuFwU9Rm6SZmo5qy52HHYtZzpFCVno1Cm/wC7wS/AkQVfkS24TPUkn+QBQjjBnhNC
         MyPnDs2AzCtn0gP0zNGhksxcJiPbY3ox9nhoiaOixDzHxbk4U9rTaND+hwWbn133jnya
         BarffnPvI8CAOrgFxK0XrA9kNRi7Gczj6EOAoLEh5eCVW0G4h+hFXOVYFzuzEmF1B3QJ
         t639iv0kfnoLHhUSoWKcWGdDbfss6Vp7byOdABagDq1uSv3x2KnqHwuD9ImD7Uq7yi24
         Kung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737892; x=1771342692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCVsd50y9Vs1kXm9MnbrZNGk4b2Cvx3GEVe1AL5Gxmk=;
        b=oHxSyPG0YMMga1DCj1sH2Vh6blerFO18TzyO6NagS32FBc5uhsxRarl8zJas0mvddG
         nAWe6wtyjK2yFDn+zw8SZtlpDtW3Xz6exvp6wOJvYlSKvlBEiOWHDBmLIzQypOCQ6JMh
         yrMmmRXfGXyMa0KpNiPFBfiZ/ZDe1aP1gEJye1xQ4S48ReklgaH+/eaJ5aVs+GMgyMtu
         ip8JCtvl3I5GSLL4rtWd192PP2GGfmKJFLtZL0ArtKhHE6ADpMb/ZXBjOk7VZEjwkIWu
         YENsuybVFs0CCXfePbS8Z+vq7DaD3bSM/k5mijkFhBPiEIYDmLN4vW+cUULCMCnZvLGO
         MRzQ==
X-Gm-Message-State: AOJu0YwOPE6DhJM+I5MW1MhEQ2Ytmuj08hDKgC4L7m6YY9dvWhIFhlXr
	FFsGf44qJs+CjAAf7KD9EhUs3e+1TA/y4fkUZCINhSMwuKd0CRHc+Hn6um90NOAbDAw=
X-Gm-Gg: AZuq6aJ6CvKsC6hMXMSN+E/jGUP2lGOFoBDzjUjCML+j/dutMw4BxWTL/WJw6N8ZiVB
	BxfwuvWyrW3526Hyf0weWkefosX5V7nmULDM+TpG2VGpPu8SisyhMA4dIPQv9jf82FdFjMxdcae
	JQFjK7wdDxCHwQ+OtJ+8Zj6IR2x4NrlXtbJm/FqZpsLBhRDnd56Mkgb0CPCC3o85kKsMHVr8o28
	ordF1YFaDedE4wn6ttK5Bz+tUMFgiEHGaWH1MfuqKpsSlJ3sWidhhq/NhJ1AfS5xasgjAUfZUms
	6A8NbbsavV0XFOJPAZpI7OEmUDnhvPftTPZdWoanF96oqRt5ZkPSSMoECeFzSM7xb88Q0C7X1ti
	WkuzVX9bYFIO5Uz/fklC1/Cu9UGFTWMRIaYxKr5MJhU+2PfPjHVTteb8hez2BHXUjgUzwC7f8OF
	h9cSjZAKZW/LX7Gyylo5wLiJ/C+NXURbZR1/sqkg==
X-Received: by 2002:a17:907:7f87:b0:b83:b7c5:de2c with SMTP id a640c23a62f3a-b8f5438e12cmr163820766b.10.1770737892097;
        Tue, 10 Feb 2026 07:38:12 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a578sm523994866b.6.2026.02.10.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:38:11 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove explicit comparisons to false in rtw_ap.c
Date: Tue, 10 Feb 2026 16:38:09 +0100
Message-ID: <20260210153809.30733-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks regarding error prone boolean comparisons.
Replace explicit comparisons to false with the logical NOT operator
to improve readability and match kernel coding style.

These instances were remaining after recent cleanups in this file.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ebe73abab892..ca9c59773255 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (pmlmepriv->!htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (pmlmepriv->!htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
-- 
2.53.0

