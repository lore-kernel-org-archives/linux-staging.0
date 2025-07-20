Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AEA3FFD
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753023374; cv=none; b=fFSxA2dQB8LkeB8Csd/npJ3SisbCODppoo+WIcaXrSLcAuLLbc3mLNhUXCd8fsdmr0/Ugnb1z0Te6Lmi2340NvOsuHo+k6Zxgh6kEzE8YqtKW+P1XS4iO2xrd22SosT5GvENnsDow8qoiwSNb6VryaNFhdRWtN2FzNdNZUpRRUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753023374; c=relaxed/simple;
	bh=G+MNuq9MZRvu3gCgglTsVavY8jyd+fGZCbRr7TlzQOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQjOFE9ld2+cBSUnt5ernXojBwK3TtBrBkXVHXkwxtTXzhPPnT+bnwRIryzzyWrmCSftuSJxOeVsyXIu4Gn2g0EkbT1cggdUf/hnuVlO9sofkqTkl6AF+s+i9q1uTWUMIWL86UHDs15jIn1DtSfUdsBPyyRL9Y3us8Q6u6SZ1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NengFuXu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NengFuXu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2754102f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753023371; x=1753628171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbJ5TjcSbDKdfe9l3K80tY1zpRj3zD23GT0I7h+8cJM=;
        b=NengFuXuLg6w3RhdW6OASu0jEfgmAMUHmiJqKNDqZmKldoL4nGPcPqzIN+IyNYkai5
         74gzUU0+1Ij8SclATfWRKUF4RIxNOGlncQmcXpF8n+DihxHVDeffiRxGE4tdKfqLEsWT
         /wTFVD1HGTqqBjjNL/ZzQVAKRNdDr/Gcw17zGILcWpSI4NwOuQXlPwsmzpbZTBuAMYTp
         CdM/yJPOWrLiKB5EpKeTdjFjH1JgXdmJlizTkRrIytuDu7nsHWzQC52zz3TQjCUPThV4
         KbVuv3vU1MO/mclfhgNFAMuvmgyxDe58ug9+Hrxo5PlzNkXCUOz4kJq9gkG2uij+FnXm
         oFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753023371; x=1753628171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbJ5TjcSbDKdfe9l3K80tY1zpRj3zD23GT0I7h+8cJM=;
        b=k7rdrOGouYHKt2nk7ukxFZTZumgJt8CfIcEU5iSv54CY9czyCmtB+MJ+7HjLNdZSsd
         fNPnWbPw3bTjEVZAr9mhaANSmnTKTeB0ydgTLO0hbjbg+51FvV/MpLaW6QUQyQrTrPSR
         HSDZOVCM634xBb6s1ut67lIDD1D+6OOQ4G+GHaogwKYR3/KIz615dE4ZwutI8HFk/e2+
         td8iP9gBb9zaUxMCmYHHKEqPdsie1Qju4Mxs9MIM9bGKm8uGEFcjM0M+cLDFjHTYjpHQ
         PHasilKzuuJycZGkXBGhOv03P0OlfJoYVkSj8zxsn5kzjdx5Etv7YhVOQMtZXZJOUAjC
         Ldrw==
X-Forwarded-Encrypted: i=1; AJvYcCVgg3kVVFR0v2tNcuArYd/b/e6l3uEgbG8gwO4USjSMDyKvLMVUut7gL38ZE1DRNKjHz32WGIoVduK8gvct@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy0dKnfL8TweGMXBAMbbLX2DRaY5QVm0gCuekQJHoImWQMcwLw
	GCCAPf2xjbZN2Ur7+zK+FfuTmukWp2gRuE9LIBL3zi2ti6OSBWApMQikijyWfpe6hQU=
X-Gm-Gg: ASbGncvxmtHfOhIST2yWJdllWoSiVQRok377H0/Pp/D9wG4d25Esw+5WT/0J7OZVXjO
	vcTrvwJt45EVYK7H3Ic88vKNVVejanJ3PBS1VseX4U6vTQ/RKcJgbF1F71G1ruvl0OWJSh/7qAt
	eDlxARqHUZcnMY5ar/zhe8YxZHRmZaqxRULNuyIhz8VszOiFSjBPRy/5TbdVLS+eEk5gH3s/tXI
	N4sqMxU4MzrHfFjUVtNOs4gb8HpO3D1nnFZUhHxYy6XxYrKJOSGUoJAoI2b1dH6M9jdvANQ+n2x
	B4NZaX461qrS0JPJ+YeS3YDyNI/KwWw3WeWx789LROHpOQe2lOAt3PqgX6vG8uiJhrkvYNcxQfV
	uS78spts48TWQEkzZ09TB
X-Google-Smtp-Source: AGHT+IFERGOKdmgdS1XU20IWgwlPKV5vQwIRfES4HzOVvHS8mTpjdvUmtH7oHUWXtakj/7l7ZePEOw==
X-Received: by 2002:a05:6000:3c5:b0:3b5:f177:30a7 with SMTP id ffacd0b85a97d-3b60e4c8fe2mr12137113f8f.16.1753023371052;
        Sun, 20 Jul 2025 07:56:11 -0700 (PDT)
Received: from zephyr ([77.237.185.246])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4c754sm7770550f8f.59.2025.07.20.07.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 07:56:10 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: fix coding style issues and improve readability
Date: Sun, 20 Jul 2025 18:25:21 +0330
Message-ID: <20250720145524.9733-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses several coding style and comment formatting issues
in the rtl8723bs staging driver as reported by checkpatch.pl.

Changes include:
- Fixing block comment markers and alignment
- Improving function declaration readability
- Replacing unnamed parameters with named ones
- Removing redundant semicolons and excess spacing

No functional changes are introduced in this series.

Ali Nasrolahi (3):
  staging: rtl8723bs: fix comment style and formatting in osdep_service.c
  staging: rtl8723bs: fix comment formatting in basic_types.h
  staging: rtl8723bs: replace unnamed parameters in hal_btcoex.h for consistency

 drivers/staging/rtl8723bs/include/basic_types.h  | 15 +++++++--------
 drivers/staging/rtl8723bs/include/hal_btcoex.h   |  8 ++++----
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 11 ++++++-----
 3 files changed, 17 insertions(+), 17 deletions(-)

--
2.50.1

