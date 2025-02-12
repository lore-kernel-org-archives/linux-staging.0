Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0EF1D514C
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 02:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739328189; cv=none; b=CkTKTJtYFxQgB4GC+ChqDlZxH2l9BG15prf6QMuCt5WqCRBzxniTV262hCakYQ9Ju1jc1Lja7P7ZlhLxRzlATwBNg27br1+OVHIFjvhh6RfJmzt3TyMw+tWmlWZnNFL77ZBTpQl0CpZPfmTo4CpGRD2odkw6SUAS1QOBvji7mps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739328189; c=relaxed/simple;
	bh=5W56coMFqyhabdD4o8RwjtrjKsxQHFIT7wKdhuxDydo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVAe2yd03uByOI9qb0/jyy8mAsYXsqqybLzXT6PyecPpIje8utuKX65OZ+uZbvyF2Gjhd8GDufqOxZT3P76zeenTRx+OUv6pimSz0CkTRb4bEFHBtyJkd8QHU2rv9GYyOPZx4T44MmlxYAb7b9Fg+zl18yYq5cYfCV531R6dUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXTarwBY; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXTarwBY"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5fc13355a5bso3158598eaf.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 18:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739328187; x=1739932987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS9LDdhgAvzOHDmQFDhJhefIgBVpMq9sZGoE2hBV7Ms=;
        b=GXTarwBY6jBCRx3amafp8bt15sl58SuhiUGDcOv/CouSmlDSRZ+U/dzuI711P+tB4t
         1OdPVECsclmZQIr9M2qYP3LJnV4bkzgp7KRL2MfASJkUB25BVRIXJsf+3MDV9eN5q1NP
         ysbzmgWxPYMlehiUmXbhXqwyxGjeD9aWt+i2Nptr7TdEG/lGqnrGOhQOV40WYPglH+r6
         BIcZKRj2p6gXsAssSyNaGn3D3kW9ojIsXoj5zsb3ZSYSHxtEfimYWlP5QohbDOVCoVGU
         4i4cfvjCewMaxp27iM1QHD1liWAvTCasSyHGLNuqZe83lr5aknrEV7ajjTSyVIDHwy7W
         iJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739328187; x=1739932987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KS9LDdhgAvzOHDmQFDhJhefIgBVpMq9sZGoE2hBV7Ms=;
        b=g1AqQb+TnvZVd20S4c/42/ualWJ3Sedzi6zthiXBBiYJMHIPheMAdofV2EOUK9sPxc
         +RZ8xRHO5uJIsATmQPa98VJVz+O8lSV4DY49E+Pi6nPlWtgCT/gErBA3Wc8RYmSnQArx
         dT2hkds4ExGrHwxX89L9/kD6RhfoyOp48wSYZ+1xVnLaMhN8mjA+BGO4eJCxYdItdQWn
         SJaO6kzOWpeXrtYKi5M+xAFMo6djeqVl5YuxbB7nR5/66y7J56U134dCd0j0eTNWgPQr
         FjEcn830k26dVeRX0/5ur5R0ryVHkX/iLIzgK1/o/Uazi2Rpx6hg2bJ8+TeI7M9fXi1E
         YG3A==
X-Forwarded-Encrypted: i=1; AJvYcCWSROUG6zM5EQdQNn/PzSJ3kB+mhAjFXQUzfzJ3FqhNWlsgATkngfilkYumpXSwfi1ud1JXRpuxv3zILbA6@lists.linux.dev
X-Gm-Message-State: AOJu0YzOfCshKz1GxHp7dEtmKhyCRl6LglsipZhckOF0H5N+tXXQBGmr
	P5n7RgHoy8LK0aRE8G68ZHS9++e3F8yzHTql0GNnaJ/JfnQDER0I
X-Gm-Gg: ASbGncuFLIOKgw95ok/fgHc4V4M1Zsz5UHdwxduio2j6+IVSdz/HeVt8WLV5sCxMQoY
	8GqmYE+2eba57+2aDxSoWpLCnjGnLIMK6H0fM0AXL9CspFXrkQNR4oxHENc/8yvp1wO+uM5wtKL
	Y1MJ3rmnpSmBYxJawPU7mpMcmtpTuhlNDODOKF9ioWr68V+VlX99Qu5GXiM6INLtTABihHXU4Md
	ZNr9vbJTOxBNNnpKQoKp8YYG2KFDigY+1pCjxlZqKcRGgBdpKkc0SoDICHRHWY0G+ZzkDqxPGWx
	GyHvC1UICF/+d1HrldkOx31P5qmzRJt6lQySORw=
X-Google-Smtp-Source: AGHT+IHGJ408gS6gy7lau2YKyNZH1aNO6SxynzYMGbOUWsj8s8T7k4ECJGcC8Ajquvmd/Sr57hVA0w==
X-Received: by 2002:a05:6820:c88:b0:5fc:90d7:a702 with SMTP id 006d021491bc7-5fca183c13emr1225735eaf.4.1739328187103;
        Tue, 11 Feb 2025 18:43:07 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726afa4efb8sm4059667a34.66.2025.02.11.18.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 18:43:06 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	dpenkler@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: gpib: fix style at nec7210_t1_delay definition
Date: Tue, 11 Feb 2025 23:35:37 -0300
Message-ID: <20250212024247.176572-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250212024247.176572-1-rodrigo.gobbi.7@gmail.com>
References: <20250212024247.176572-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

due a change of the return type of t1_delay function, checkpatch
was triggering a style error.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/gpib/include/nec7210.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index aa03c234aa60..604085e3fe4f 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -109,7 +109,7 @@ void nec7210_parallel_poll_response(gpib_board_t *board,
 uint8_t nec7210_serial_poll_status(gpib_board_t *board,
 				   struct nec7210_priv *priv);
 int nec7210_t1_delay(gpib_board_t *board,
-			      struct nec7210_priv *priv, unsigned int nano_sec);
+				    struct nec7210_priv *priv, unsigned int nano_sec);
 void nec7210_return_to_local(const gpib_board_t *board, struct nec7210_priv *priv);
 
 // utility functions
-- 
2.47.0

