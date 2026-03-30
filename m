Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E53368B9
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774893104; cv=none; b=kAkWuwAC32/gdm+swNMnKcEcUK3g4gRETzxyQKtHwI+3MWOfYHdzd0yksAY9nDpQinWhZFrJ0+hnH+OfEYcUU5UHX9RvhSA4nn77hOvo5OPsxPlpiZqDBOkQxYdSNEhESeCsMNKjEZ3cvBY/3ZFBR0oFF6r+BWJpJ5XcOfh2KZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774893104; c=relaxed/simple;
	bh=kBbb6Cifpt/Wqual2hTzIJxpjT/uTFuX399kgA9g4kA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ea5oH1YJ1ApKqasax5rFOVwlnlmykW77PVZ7/NRmjb7M8mo8jHexlkbkryba21kZKVuYhAycsxKIsvs1vJriXRh0nUNuDktTQURUJs1W4slHaY/1w/GAjdAcVYh028h382pfINKFKFt46FFoda8VdRX0mO7meKp+59uH98sySGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrcSfdiC; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrcSfdiC"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d9d929e27aso3907496a34.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774893101; x=1775497901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eYjFRb0sBqmo+T8vXeMCK2LggyaB3K+416W/bIEsIc=;
        b=XrcSfdiCJW+iLiGvyh2qSlMqFdii+fc+641YFzKm0dHxj6jBZ0rI/2JdRsT1AXHhkk
         U99dhDvic+ycElTRUmAjoSF2DLDGqATJJhOeXaXVAM4Ynvrpjiu3Ge6HC+QiXQ7O7b1R
         Sd96xXWA4QssQk5XP+oCWew3QvykBq15J9S6yjdGnn5lJjd3rd4lorzfStXgDcedICBR
         M0+fMWbODlGthnSk/PEOTCtxVOZJRh71S2t8RIjoMG+ZdfnvFM+Csa3G6y0reQqDWJx1
         zNxlCDOZVAZjEHEJ77h6e6YOC3DN36Aafak7H6zWm66mev1yTFQUm4hHMiiJS4/OGBTf
         6GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774893101; x=1775497901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eYjFRb0sBqmo+T8vXeMCK2LggyaB3K+416W/bIEsIc=;
        b=GpcvPkwT1d2RchmJ0uvAYsR6bd7SLgcvD/3mgVBqUM7/weiD1QnCSMuj7RJosHmDmF
         lr7QAk91fQ0bKdhswyFK3S9NVHBT/H/jklRqBiaonH2aJU74lO2+p9Mv2f8nbC0mXbnb
         K7yqGgpXnYvo/wnDbsD4zNHZlVCCLwGMGnWppX2b/1+EoNjWnR3l7z3X+mcS6arC4Nt8
         uOeDy8EGVv75mhaCL3+9YF9YSTHovFW/DagQ3/5DaAp4dxTLpoh5C84YEi05UW8vvO2B
         C8kIF73QQ2s1CmAik1LhZOoJoQotpOMpIBmTdfYW4uOF/QrObWoGfGH5VIISTlQeiGv1
         EWEw==
X-Gm-Message-State: AOJu0YynvTgTCdDcfj4QweiJPN4S4etavAugZ0JnwHgIvQtEzqqz+Ka7
	ZWTwbFrTp2OySi972WpLOjpRs+BAUOzUiGNqmfqmkUSWAeLOw16LKeaG
X-Gm-Gg: ATEYQzyR0RHF2v28PqPyQJZDYKyO4oAhn4l1513T+DkP2sbOPFTPtNO23L5ibNdJr+A
	Li5rT9qqh60mAikyoNKnoXK0npaMulnM0hJEhEgvMmCZZuMoguu/mZ9npWpb63vF+GhkxqMX+Z4
	+epTwMNPMpv68JGh+y8U/8X89DOf8mVRFOsBQEcI9vJbZU6OUXyOIhRSUfkthyKjF//yTdGj084
	Fw6V4TvD6WGj1S82M3A0DpwgNsiEtYEvROtcgjUiDnjApzWRWoGg2gpa7xxrcfYWG3T8H5nZTM/
	4mKxjK0Za2qEps7cbaTGWSxNBh9m+1PRjaH1KUCnoYugvaaTS0YxHWHHU5onzstysV32rVQiDHu
	OaQqQhmqQ6qc3T5pzs2IDWZx29VnbXt2PD0CoCoUHDik1nfXl9JdDXTJuBMfXa0WwyJ8Xb4pfNr
	OnkMCxNvYT8Vqpbp3aF2XVHz/35uM5kWBXgiiKv6+WE6wKnpYmgyKU7TJ/bhQYq6j7pC4=
X-Received: by 2002:a05:6830:67c5:b0:7d7:b85f:25e7 with SMTP id 46e09a7af769-7d9faf3b967mr7448283a34.28.1774893101324;
        Mon, 30 Mar 2026 10:51:41 -0700 (PDT)
Received: from angel-Standard-PC-Q35-ICH9-2009.. ([189.128.244.14])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a0f2bf9sm6244289a34.0.2026.03.30.10.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:51:41 -0700 (PDT)
From: Juan Angel Hernandez <hernandez0101@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kaizhetan@yahoo.com,
	arthur.stupa@gmail.com,
	Juan Angel Hernandez <hernandez0101@gmail.com>
Subject: [PATCH] staging: rtl8723bs: add missing blank line after function definition in rtw_io.c
Date: Mon, 30 Mar 2026 11:50:38 -0600
Message-ID: <20260330175038.14675-1-hernandez0101@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing blank line after a function definition in rtw_io.c
to comply with the kernel coding style.

Signed-off-by: Juan Angel Hernandez <hernandez0101@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 965c3cfea103..f7a735be7597 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -75,6 +75,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
 	return RTW_STATUS_CODE(ret);
 }
+
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
-- 
2.43.0

