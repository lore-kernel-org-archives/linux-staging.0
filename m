Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41AC26FDB5
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220121; cv=none; b=NQqwrANpfxj7aFlnieyz0kQtqR4wx2kSK0J14MlmyBxYOlnw5EJ9xUqzYm5SCD9upTkRw5dd0FPDPQj8Fh+adcYTA7yOOBf/4+cidOp+Fb7HsPZ/ydsHkaR8gFZ6sJqteMynhx3j9plY5jnMJwcitSkiDX3jE/LEFuhq3c9nYhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220121; c=relaxed/simple;
	bh=U+ehWLSaRSK6X6F/UDLucuBn9urzPkl9KrBmPNVyMwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=huqSXId82IVzFJ9v7kYO5mqscmKjnsviVeBCpGDKYUwUILtq/K1RDMWHSNFn0kyy5GYa41F3/eoidUtRqyd/+Ag9WyONcVc0OS2QcETUk1ZHoDudvFaeuhALqhTe3g4V2cSTw87VIPSXkgOhdMVLNmLoKm5HqyEyDmdH2TV+8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=UFxuksPc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="UFxuksPc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227b828de00so71760955ad.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Apr 2025 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744220119; x=1744824919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLfeIRA8tBnw8zdIQ4nzT54/RyV8f9HMbjY3r3rNPLQ=;
        b=UFxuksPcuVpamKZP4UvXNK+9LoYxh9OOLEJ6GjUmnj/5kw3ZcKoeNZjZhAybHwdmpd
         xd5uyMuBy0gLEoTWvh5rAJtZ9pXulHgtHooCr65BSjOx9OXcEWmcKLDux1qEx2tymo5/
         5dTbcHv6eV31Nnz8xJoYD9ShS7vB07tcsnJtxSXy9eMp0W8TAlfzmsW/xYKVvkgUMu83
         /W9r2Gt/GouZsSOkO71hoOHps8fAnuIxuGDtzzdjlwCfPv0xtu6UA0eabf8ayLWItE5M
         7IhlpsxEFXqOIRuLPRKmzhFRIIEZtcP3BHxyc0rLVrAWCoe49rI72puUmb2gBTK7DTHO
         RjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220119; x=1744824919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLfeIRA8tBnw8zdIQ4nzT54/RyV8f9HMbjY3r3rNPLQ=;
        b=o/8L3+HWaxU8V+XxicsSnmTadGIsYvKuZC/pi+ZE1Uve9ItFOdjggnpn1S/7dqWiJP
         R6+L6EGvNgPQK5J36mFJN6vjbgn7zYfBCrbHUBCjTSmPxW2OzgQIuywianYqeTRJM9Rt
         TimxUSbEOVKavkbznjgidON8k0JCBn6dUE9UP/Vb4ayWJHdRkYfCuFHIoR6pOvSsEXig
         POT1zX3Z1BcUhZuivJnjhhwjPLbtbFl3BsQaAB0qfvb00e+v6bJfpE1rxJeI5ch7s4j3
         7uP77lgKdRtM7shlw5NmC+a0se3ObRgPUM5vYgd834pKCdU+o92TQOJPSv0YhutnBMm+
         8P5Q==
X-Gm-Message-State: AOJu0YyU+zynWzsMf7596as5FyI/xP0fvcD1pvsRYjyoO8xALbgEr03r
	/SPW19DPBFPUJ5eUflMt8rn6bF0gHRnjS9GXwgQfYZvkw7tx1KQCcL6AGrXMsA==
X-Gm-Gg: ASbGncsCmR/u3O9R7/ozefTdtPRF5I2BF3EWvIqMi+wr0BrDDqdgbvcjFeEcOItM2br
	3EvHz0tEfOxGSW5nfI+FxStSsLlx/DPHHZTtEXZUkrn1Fe63x+drOM9BmMLgQhaYS/Z3tH91Li9
	ghIfM6CJ078woeAMCw8288W8qnx8+m71hmOwOCMVRtIUZ0zw3YPlihuiRpMIAtqx+AYWdx9O+oo
	UfA+6tqajYqFuWH/osCIut/ttQxYlNv/fjLq+Fudh6lzf5RbjuAI/0PS008caZB5nILfAO5JHGg
	uZENYmekCMEWGSyHswrst1ATCaOTnx+tE6MhCj+KEzAAMn19nRFzxLErpRfKqyFT7MuWZH+6+vV
	AxEsWkA==
X-Google-Smtp-Source: AGHT+IFcgdkrxNVEeEhkEg7JnH0hPXgiQiSK7a4tnmQYQuz7yC29z/6DzMpXot7Z959OjLMQDlC+LQ==
X-Received: by 2002:a17:903:1c7:b0:223:5ada:88ff with SMTP id d9443c01a7336-22ac29be057mr66409385ad.24.1744220118923;
        Wed, 09 Apr 2025 10:35:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62895sm14927945ad.5.2025.04.09.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:35:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 01/18] staging: gpib: struct typing for gpib_interface
Date: Wed,  9 Apr 2025 17:35:15 +0000
Message-ID: <20250409173515.386725-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Having the word "_struct" in the name of the struct doesn't add any
information so rename "struct gpib_interface_struct" to
"struct gpib_interface".

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d9b9be683f8..10d8776ef425 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ typedef struct {
 	char *serial_number;
 } gpib_board_config_t;
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

