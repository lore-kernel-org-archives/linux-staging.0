Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CDE1E481
	for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728742449; cv=none; b=hqBnBou4vJNKa/zbkQEfgCIg+LKMzsnX6/ltLzG5z2WlPrN9j7aI24U8z5yzxUn9zuOgq1gk06sBeWIPSew04GcYj43oiVEg4v87FT2F3WrjNyCrs+PdHP128BBEsEFZjZ5F+8F/qKrh10rmk1zGtTckrTOAMyacQdR5vc7uD7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728742449; c=relaxed/simple;
	bh=QpvuA0tXrIusrPG8LAQQ4pQs4s+4SgLc+0UwE7FI/E4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XjNJ8oG9OWH2XNNtiU38P64aaAtsxYGqVRaZjUvaQsvbUZWBY9UjJiMl+L3p72C6xkX3RYkIMTzJ9fgu7Ry0wGR8fhau+QdoB+h1apOs41D0k3R1TpTQoftnfI/rA8OMDiNz+1lHiOdM7dQ+uiwsY+SnRk03ke5VZjNS4vlI5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN0UJxnG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN0UJxnG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a994cd82a3bso410764666b.2
        for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728742446; x=1729347246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tuv25M7qfPhkVq2rdwgDLlN4egguVJCUL8w07O0WP/s=;
        b=GN0UJxnGAmFC6o6dM2yK9vIZYjxpOEZquolN3qzUVKP+KVdBdSmhvcuyfgY3lBCRYe
         WaJEBBq4q4xKQ1+buX3YUS2THewaAD2gsG8qcxQ6DJICWY2qZvYiQjdocVjWCRRWIKn0
         HQqgRQfuOYUQPYrLBLObPUoGbnswbMmfylLy7F0I8pOeBrNn2c4c5HagJgi38i7Y+nU2
         UHrEz1iSpuIPDQD9pAeErB8205++CsIaf/uaTnXY4TN4EbpHZlLV/ktNPiMpVQl6OmnM
         pUA9xjltgyqaRzNyFhu9cDjvkd2h6qYddGqr6/tgqfmirsdkxkBtMyz6yHqxm3QEsAuA
         Z26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728742446; x=1729347246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tuv25M7qfPhkVq2rdwgDLlN4egguVJCUL8w07O0WP/s=;
        b=dpjU3N0sMfDGZwz/Ju3rb3/dhaBQj8qY0eDR9Kpzl2ZPULzxRx7QGflAFK1zzN5Y3/
         DEiO8Ka7iGQE0GNzILSENmxNEiZFMeJ9Nzr7e61DeA0kSjNlwnyvxuHv01FUsdnORZ+A
         12E0/HWEr0nWfOSY0UzydzM5o7kuiRZ99cyn5mqe5iaGtKSW1bfs59kI9JInV6SIVQOc
         Soc3EeIwBb5TWTQOCH1CPc0bIx0wliyKmkJPPpeP0lU1iNJLdPcUJYngKoC+oqQw7oav
         FUe4rP/0Gecm7uSft8W+ljI46/TngrD3TuNVfia81uzuS5zd07OIbw6RZyUKKOqpX0Dp
         VD5g==
X-Forwarded-Encrypted: i=1; AJvYcCUIYJBKvjRCXMsPxJAyb7fwGByPTxpMEizJeyhAbsuJpyWTlh3aHPmctn3AS9AueJo/K7Yn+AuwoFZJ9eyn@lists.linux.dev
X-Gm-Message-State: AOJu0YyVd3wyCAdQxGUNGF9HYm5lNLSn4MVKLB0bhMuHOKGmNyARKDnl
	mZ24JyKhVK8xH1SqR/SQzE2BPTZlUkL7fc0qDMIFOsLY8EkEPrVlO1b9Jg==
X-Google-Smtp-Source: AGHT+IG0B8W6nRGV5gDheoL2qJhnCrgP/hIARfPGbcFt0uINpwOjZ3efVzmhEbB+wWW7eVXLEVLSMg==
X-Received: by 2002:a17:907:7ea1:b0:a8d:250a:52a8 with SMTP id a640c23a62f3a-a99b93a8506mr426443966b.3.1728742446066;
        Sat, 12 Oct 2024 07:14:06 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99fa0cc7d4sm12707566b.104.2024.10.12.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 07:14:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: remove redundant re-checking of err
Date: Sat, 12 Oct 2024 15:14:03 +0100
Message-Id: <20241012141403.1558513-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The check to see if err is non-zero is always false because err has
been previously checked on whenever err has been assigned in previous
code paths. The check is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ca97ea082cf4..7cee4dc35427 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -6308,9 +6308,6 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 		}
 	}
 
-	if (err)
-		goto ERR;
-
 ERR:
 	if (need_scaler)
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
-- 
2.39.5

