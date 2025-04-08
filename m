Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77DA2580C6
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150863; cv=none; b=pDJJhP8DVrPp/LiZuShLeo3vMsDSbNspcH35YucA9iMYads7i7jBxESJetSkf/qb5gB8dp7vJMnXFc97r5XfFp6rqod+D7wgDFPKrDPXx5fwmxeUd5ncxhILPjU3eF9XF/8fCAHawnEjQmBhiiEvqc61vlkFbxMuokp99k36P3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150863; c=relaxed/simple;
	bh=0GHjXg9oA+3dug+C11O84G6bQD9WN8uapAig/tew87A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIQ9JqunI/ppLJilZjQMQrb8wW8JrcZRT6VGB2KX9S4AQtU2mZgjnIWGiFeh4qud6NRNbELt7WpluzABsA1tUDrPOP+5PeBWIdeuJ8djCTuW9/bkmAlDfreBdlE44LT/Qik/ZHaIaUVKYqjiTX5yTbE95qaLBf6HAt2zQmZrT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=bjnh99wS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="bjnh99wS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c277331eso106020b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150861; x=1744755661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUHiuFyPdBXiOlFTx9RUxiDTC3xrN1hTq7r3n53RdSE=;
        b=bjnh99wSANNoQHPq6rehvCLLl/XIl+ND7XtAsGMnMeDgmC9AfD19POh9x8e9QuqyVm
         DuN91CZw70H+m5edEb6VwJN/2KKqx49d5QrtRWOb959QdsgoYi7uy5wMn12w/tjBsA/H
         l6NzylzZv9BrD6kNTsdxkkHwjcMrV59q3lS60R+bjlgJ/63Wr8G7REsCmjJQ2ziEtM0/
         htejRQnxcGtUPETcD/E3vKAPOf78uaduaoeQNO8abZQfvCqTtQeqmXS7cUQCcIPFWTvj
         VkDCWRd0H/QSIw1IQIZ88NSW9XyjfW5yW+o5n1hTTTluQ/0M1HzepJBobgYIAXkar6IE
         05eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150861; x=1744755661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUHiuFyPdBXiOlFTx9RUxiDTC3xrN1hTq7r3n53RdSE=;
        b=iCjD7RFJ4wQf4oHAQ2TKy2Rxx3yyyX6ijEq3YZ//tKiCdcJq1vQeAjLiNA2V3hIjYH
         kCXzqPP1nJvxY3kfmWzHm8bFWTa3KeQ/mv0GsxxctrO4gfw2UnMXwQbvbrQ/LFR4gClP
         YXGJ4HkwhVUhx1U+SOvVXClC1o5Y4w3qZ3Sx/zgRGP0j56W/nwODK7iOdRkpAmMjoTRn
         zMyasr6vIsfYrDLSbHCw6sgiLm+8M55J2zM0ZUdOt3OwifxoQGK6qgTrZeZR9uUTafMq
         Z/NRE3iSfHrzrZ7RJEAog+O86Col7kERElX6a641ZoNgQ0MfcJWVXwH/dnM11kz+iV17
         bkVw==
X-Forwarded-Encrypted: i=1; AJvYcCUp7Ul+x66kQHKS0u+FJ3kT+ZgVGO3n3DoNSAf9kSsohkELnAGodpGwFAyw19jnu0CM49pPjxiNwAEp++hW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg9yq354g7n09feAU5AYoXN5Uoz9uC5Ten9EJPDs/rmkYK3Yp/
	oCKHoKMLml4kIiCC3vln+k/OjQ+JAhKvRJ5MLOZ+Z2/yavIoz9S9bwDkDt/www==
X-Gm-Gg: ASbGnctnmUiIKQkUPoJoJ8ZsiVjKEtOOEwX4s38o528C9nlVwtbWuSItmVu1V9XQrfo
	FXTltGu7HiD8iZJ7q8J/uYicdWPTOauttxAHzmfgwPVF1FWNHjJrfOnLumrAocH+I3b5WREFMvc
	FWyZg6b1EeHjgi5QrrlMUOlfZ89t+wUbJA7ww5v965KS42w+8epZoANrPDNSP8V0DPfwgp+ckCX
	3CZHxBwnzVTMRotGFayDhJPwoWtbigLbRmycPP47IN/hEiVJO3Lh56seu96qlz2ZwaSv89QVmhO
	NSqo3G+O279o5nWs3T6VYuWzBKjRhvmm9rSMTAty8vA1tQLmi9szmy2EiLoEYS/5Y3cQm+vZC9F
	cGZWDIWXUBQ==
X-Google-Smtp-Source: AGHT+IGwkZAbeNFJSC3+qEazzhQmoUaLB+22REfYnqNDjZaYsDfkqsut5Iv+kYGcEmAtzr1UbG5x1w==
X-Received: by 2002:a05:6a00:7418:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-73b9d2e3a0dmr6065958b3a.3.1744150861176;
        Tue, 08 Apr 2025 15:21:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea079esm11492531b3a.95.2025.04.08.15.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:21:00 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/14] staging: gpib: tms9914: Fix Improper SPDX comment.
Date: Tue,  8 Apr 2025 22:20:40 +0000
Message-ID: <20250408222040.186881-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct Improper SPDX comment style.

Adhere to Linux kernel coding style.

Reported by checkpatch

WARNING: Improper SPDX comment style .../tms9914.h', please use '/*' instead

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/tms9914.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/staging/gpib/include/tms9914.h
index 6cbaf5a041e0..08a40d84825f 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -1,4 +1,4 @@
-//* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.43.0

