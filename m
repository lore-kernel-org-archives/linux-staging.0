Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FA255244
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151122; cv=none; b=RDAWMa/SqYD34GiXfjsdDIKHTsmfsuPCeqNYWmI2mHcPOUSD4pwwIFso4v2kQyc7T/irBZJ6Oy9VKzrqHmBEj7zgeBXn277d2vCfmbGyKBnnClqbWnuMjB+nhxt2IWgzOfH2pGQ0kSnqTq4sI1GdFzCgx60bFZkrJyPL7Ufoz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151122; c=relaxed/simple;
	bh=+zRK44sFZdwIvc4vU9sKnG1BcKymUzbd0L6oa969Zxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQq1H+M7vSTIldGnKnLkMtuE8HCJy4Zg/KGYeU0iFEabsrYI4jBiyd+2XrA9pGK+KHNj1C0bLmMSIhFw7bC+elZoO3yxYzsjvC1LyngBiSP8auIXy95PnVZLRDARW94X1Yr+gMtXw1GOF2J3B70IhH/8gcTnWIMDwKI7zX67exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=j/XUUD4h; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="j/XUUD4h"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22403cbb47fso66263425ad.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151119; x=1744755919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUL7ykty5njGdegmOhjg8oPPUwbsVjeLq2w2Q/Kqzw0=;
        b=j/XUUD4hzNxJ7pRKJLd95XuVzfQUdZ7OdvZDB5hlc/FyRUhOFq2XS+jW7pEUDMZ/st
         LZESM1b17J8auuPJZDCzwMVTZsVD7nQrywLkMu5IN6Cln2ybAcBqeo6p6B63BK8PKyhf
         FPrYf5LY7Xbst78oYl7o+cX+zSsmSd2UWyoPBSKSMh/Oy0ArSpJU4GLKOSOOf5DINGxT
         8HvhrSr9SX9xJJKSWx7SLZOWlvG8/5vhlkt4za72gKATUrn55YKNv0tyyss8wBos1Srg
         7465ADbRhfEGlH8XlzL8drArNcwx8beeYA/XXey8kGd8bpbjAo3bwzj1/bcG/N0VUOVB
         uKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151119; x=1744755919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUL7ykty5njGdegmOhjg8oPPUwbsVjeLq2w2Q/Kqzw0=;
        b=RHthx+ICDMqv9snLSdDZvAdIVW8QaEUgNTaFuVKCWM71ZWcGbm7iuR0URXPUARItSa
         U8/XzsxTpEMg3smI2ugKjiwLO5ZsUk2V+TGGX1dPw/5QllZ2bkH4iUyKpx2kgxEyl3Xk
         WyW5qwvPTTEldWbldPJ06UchULelPpOHcXitstf9WBU7dppIbREcmanL09IXcSmo/Qnr
         XOfFndVf6wNwoXHU1GjF9Ejm7nS9EjxFYZeWR9JByAO2oaGBb6RAV9OIQkHqPP28ASgJ
         IOmOOWu9AwBNab/FbGkidPl6k1tZPG37IoaP3Oc7pLG6ObUZ1vsWXHXAFf2VMMXf9RUA
         0bXA==
X-Forwarded-Encrypted: i=1; AJvYcCXpSFEmGEYDn2zmklLxiOPRx2D46kCY2xD86PLiMF/eZ/rWXSYBiGD2ek1/wF+MaGNxieZ+diynXbud7pLV@lists.linux.dev
X-Gm-Message-State: AOJu0YzkibJZbdnvaanyb6N3oUKDLFcI2kOI/LoLbfNqvsGQu8T8+yGy
	mWaEUR5pIAsxD1uPcEpVRaRBp/eLyx/TlDlk+kyr3ubI9ymx584udIM1icGMfz77KazWkk/ais4
	=
X-Gm-Gg: ASbGncv9TXcpPukN9zl70HaGEk9czkHIk8I4t36PFumocR+sq5dRR1UDZpeu0YAiwiT
	ALWrA9f9l9LSfc7VoPZeNX02w3bWLP0O/Xy8EDzvp1zmqnR4sRBlZqWDGBrkzaaFA+RaLKC0wj+
	yExMyKot4ylMm+Cn4Fu9ZyWWwiGUKBzSRAWm1Qj32In6oTN8aD7dmqDPhiPgkhovt2UiT46Uffo
	z1pCrqyMe7ViVQDVHGLCj8XvFFbRywa+N9CS+Qmbp65e0cLI2Jqa03wSzIlk2COuylYf7X6J5bj
	kGA+m46IeSZUNU1iZHDvuBtcF0HxQe39fTrqsBAR5SLKWG2Gts1k698lL6sMVKDScV5h+0NK4eS
	PWV9ZRY39hugUoYFPoOto
X-Google-Smtp-Source: AGHT+IFOv7l3SpdOls75EIztcizBRUqY2SsFnO0yo4hxoGcc1mnpzvAVTB9qXSAHu7nc58jKJZnDXQ==
X-Received: by 2002:a17:902:ce8d:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22ac29a96ccmr12494055ad.12.1744151118768;
        Tue, 08 Apr 2025 15:25:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad982sm105915625ad.25.2025.04.08.15.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 08/18] staging: gpib: fmh: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:54 +0000
Message-ID: <20250408222504.186992-9-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 733433d7fc3f..b2c379ce4c88 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1011,7 +1011,7 @@ static int fmh_gpib_fifo_read(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static gpib_interface_t fmh_gpib_unaccel_interface = {
+static struct gpib_interface fmh_gpib_unaccel_interface = {
 	.name = "fmh_gpib_unaccel",
 	.attach = fmh_gpib_attach_holdoff_all,
 	.detach = fmh_gpib_detach,
@@ -1039,7 +1039,7 @@ static gpib_interface_t fmh_gpib_unaccel_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_interface = {
+static struct gpib_interface fmh_gpib_interface = {
 	.name = "fmh_gpib",
 	.attach = fmh_gpib_attach_holdoff_end,
 	.detach = fmh_gpib_detach,
@@ -1067,7 +1067,7 @@ static gpib_interface_t fmh_gpib_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_interface = {
+static struct gpib_interface fmh_gpib_pci_interface = {
 	.name = "fmh_gpib_pci",
 	.attach = fmh_gpib_pci_attach_holdoff_end,
 	.detach = fmh_gpib_pci_detach,
@@ -1095,7 +1095,7 @@ static gpib_interface_t fmh_gpib_pci_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_unaccel_interface = {
+static struct gpib_interface fmh_gpib_pci_unaccel_interface = {
 	.name = "fmh_gpib_pci_unaccel",
 	.attach = fmh_gpib_pci_attach_holdoff_all,
 	.detach = fmh_gpib_pci_detach,
-- 
2.43.0

