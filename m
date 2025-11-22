Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80926E6F4
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833573; cv=none; b=N/tPfaxiUYeQRLVyhEaSzOnZ2eKQSkNTeXxR9keYml3GpvXs/HIj9yoKoAxfJL7qIH/6TDSrQqMUsS12ys26GuynGnCJZ49nyhLZlJp3mYDzh/yqpx94Yjz9DqC1zS7alZyKN2IEs0bMZcu9Aa471LGIclS4P6GCIus6R3ltHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833573; c=relaxed/simple;
	bh=C6+7OFs0l5HDY2ychQEOgz9AfGrqGYZTiPyKSzgxzmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIUFGLk8AsccJfZzd2eX937nj0Kl5urwdK0KWV2KKqx4ULtQGzlTgli4sTPsqW/D2lsADYmWsqztMO+ELg01fbk3o6emSkk6gbzJqOjEcktUWF24b6E3tFsxK2xaTV/zq2k8fzAPJU5/NdZIlbISk5ajo3rmvYXr2j0XCILiDpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U56i5s7M; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U56i5s7M"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298287a26c3so34618185ad.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 09:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833571; x=1764438371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8le6LVxp06k7C8GFq+HG95bbznZ1I5nR7RLVmSD126k=;
        b=U56i5s7MgOdh5+onzblFNK8wJNC+GTiikyBIDbGCjNQFA8AEgfWOpLPzjTlu5KX74w
         DzcUwN1aVxl0r5uW0Lmj26bF5tAj0OaBxKx0C/7B9hzvaub4Sci4vsICE72FoXYU1VCC
         glcsYh95jq5Ogza90Us5xVLGkXXqZKOhcw3G9QE2KP4Om36IhN7JHkL3vMxbz3C2cLtd
         O6GfMshKsh3sVrleGYL/O3pYN1j4kYTFiMwXCbAcN1cYnQdsaJc8oeFRWDtmssPilgfP
         2tNiMQy10gkAKu4jqlRB89xb/8ytm9BNDtXgGP7BZwcfkt1xkPNSgEecf+cnjTFdfmVy
         kasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833571; x=1764438371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8le6LVxp06k7C8GFq+HG95bbznZ1I5nR7RLVmSD126k=;
        b=huXjndaCgXqN4l6DaqPBcBbpEedrKARlSfG3a1ccCEmAV8SNscKCGbPA71sYI6Mono
         qe3TY47dwxJgzzXFAsBFimnzzmBy7g//zZ8sGDm0ViBXbc8LHzmQwx3xQR9jsFX08UHQ
         p4BXnbUClCpfypeh4IfAlOylsa/BNk4RMAnao84aneIZdHIl0nDvpjdHouuBdD4BRoQ6
         YyWrpo6IpCXqtYyz344L8osAwB6sLwS5+LtkFL7IgkqAazUS64htYdIMuKGeYDlDDSz1
         l0Oou2xB5tOD0wb96bFYNRxt5uKRw8FoMuL0Zbb0nlniL3DqA6PDrtT/LC3RVeQF6Rfy
         VfIw==
X-Gm-Message-State: AOJu0Yz51o+hsojOtnb/sW/m2azwidQWJqNLjIR5XRn6nobkotr4kKYq
	ZDHeP5QtpmY+BEP0nulpKPFhRWYrNlfU1vzfiAF1uWVoFHgFhN/fBKX8Gm5RXx7M2BdHUbSw
X-Gm-Gg: ASbGncs/lm6euFkO5Y5x8bRHaRhVZFIoyZejEtvwCxR2n8S7+trRV8aGjsHiDUPhNK5
	dX6vPDLzMExwDAsk+5ZoBwjUBIkx4e+FLXHPnvqZcgAHSfj7Ym+Ntt1Cpv6/Zg8bKO6oO2DaEkJ
	RNTKnFAhlA9LQYigkRjyfMopmHmSWlLfuyQ+snVwhMCwzsxNgMNYGoFjGm/qgwC9ssRj2N0QBsj
	j9cNWGZ0WVzvZI5tFxGeIPVlMDEExMdPHCA96I40sZ/BV2HpA5/XHfWqYw0M3/1R6AsmvTfERK4
	YXNCO/+ojMujAStPgUQyhesfCFU06W4Vy4bPAlFCIEC78YVdiLfZVnfv55ji9m2al3YMYLX2rQD
	oplYYEzwciEwQF2eTraUjBjetbeffJSFiF+SiAfLIYGiN0PnbtFDAdKNqYcPNWuQtdfVmgoTgl5
	9oJIZ9R+DJjp0r+GgveltqsnlEHf3C08c2OFXxKgzPDcOr3HjKdjnCBK5ZTRu7LUuotfDmxA8ZS
	6Mf9Qu+FbDYFOZrYq0=
X-Google-Smtp-Source: AGHT+IFvSpkQs2sfHkUC+7xxmb23tHL5WztE/69Rl7SaiYSR9hAvJ3VuOCjY8VEWpFmYYaZBHlhXYg==
X-Received: by 2002:a17:903:2c10:b0:298:42ba:c437 with SMTP id d9443c01a7336-29b6bf75998mr74007195ad.50.1763833571428;
        Sat, 22 Nov 2025 09:46:11 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm90186085ad.35.2025.11.22.09.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:46:09 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: remove custom FIELD_OFFSET macro
Date: Sat, 22 Nov 2025 17:45:51 +0000
Message-ID: <20251122174555.215109-2-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122174555.215109-1-knavaneeth786@gmail.com>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defined a custom macro FIELD_OFFSET which duplicates the
standard functionality of the kernel's offsetof() macro.

Remove the custom definition to clean up the code and rely on
standard kernel macros.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 1c2da18e6210..8adb95f9f1e5 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -12,8 +12,7 @@
 #define FAIL	(-1)
 
 #include <linux/types.h>
-
-#define FIELD_OFFSET(s, field)	((__kernel_ssize_t)&((s *)(0))->field)
+#include <linux/stddef.h>
 
 #define SIZE_PTR __kernel_size_t
 #define SSIZE_PTR __kernel_ssize_t
-- 
2.43.0

