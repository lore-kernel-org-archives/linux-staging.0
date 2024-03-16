Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562321BC41;
	Sat, 16 Mar 2024 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710610744; cv=none; b=kirDt9FHnzzC8v2hJZjAerRyHSlcYFO8snPxLzDr5mT4Metj0HqxMzxaOykNcjSGYglQD46fRc38jezw8zXfc4QREqEtGl3/muGb6yqr1AFNK+2SmSI92c3IHjC7QOfv7SEU6JmdaSOo9R5go4R4ZhGFtNa/YI0cA/ZSgm3SaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710610744; c=relaxed/simple;
	bh=sk0TRYDBZ/szOU2d5dyUOfGaO3WMUayEWTGY+bQ0je4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eqO5kdGSLWlMSgeLBrgEZ2oEh5Ny+4e36fGtTckfCTlqEcEV/UUDnJQlWNVYntVUK2ojsjSLKwHL57P+7uVVFlyhxQVmf+ugvmzbf1HfO0Rjh82eJ/y8LlE0JdXnTAazA8y3fmR7Eyt9osUEVAQaPJNSCXSo7F9qScpJeHKXiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Unir2273; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Unir2273"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-568a9c331a3so2485670a12.0;
        Sat, 16 Mar 2024 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710610740; x=1711215540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDmrddL3m8ErP4jI/1vBP4betMtdlAJJBYZ7jF71CRM=;
        b=Unir2273RZC5CMyF3pQkHmOjA0WAnmrmiPdWG/7kbUjCHawK4yv5Dg5rxEYnPlkL8j
         V5P+wGqBM9FisTsOMUxQvdulQWjI/Pv8QR/CYt1i36XnsesFJWk6MogTUMOBI7UezU2h
         bqVfHYuo3ImmzdFTCmmqLrGw32gfKlnxq7Ho+VxT1MhleqoNP1NtnYBYC1cwCR6loZvv
         hsMbH9rml3uraWMnX4y34fzzX82yYqLAuo8FYBq16TSRG5w/slgtVqBr4pBxpRUngBkG
         lOm11Pt/YR3F0az6P0vHntTG85PmLQQ5D0i8iHSdDVRWuh6B4NesXqybNpxfNHxHURf0
         qO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710610740; x=1711215540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDmrddL3m8ErP4jI/1vBP4betMtdlAJJBYZ7jF71CRM=;
        b=l+RKPaMx4oktCj13e8iB7UG/G7eRCf5hRoBT6cDw7/D2oO7olEZQfYEk6V5x9cx/ch
         mOKKZW1bs7CGkZxjkkvuLDqq929B5d0sQNZj413Zr3cvJpoSGQ7uIcJaNC+Yqcd/JY5O
         v3tkSxVhAhwBSFXHVlymuSFthBpZFabXzoXZgQs/klV72puzMrTdcP/JqHmkEKhYnQlW
         edJAkqnbm+Tg5Rw6l3ugqi7jJ6R+LYZdhcFD+I2IJbYshR6KQVP7EAJFvEmz5Oc91UP3
         8BXNmQ31uaOy+kYC04M+AQcZKAX0+7Q3NOlqJDiVXBn+f3BOtFBgUQZiUNGGcRIDG+ON
         Rsbw==
X-Forwarded-Encrypted: i=1; AJvYcCUqWSXVDpRUFTjv/er/L79fyq+mkAm8yYIVZWELmkb0uXMxjvT6M9GHqa0rgnSp1iaDPRIazDRx8si/S2SvRSHJOC32H1zK4Zuv8/itV75muddWMsF2/cpmrOtGkA4z7IU8M2w5NHNGkg==
X-Gm-Message-State: AOJu0YwwEngdljdgXAO1b2pWKQkb2TSBmPGScJdnUFGtbpxJ+SQhVLo9
	8Mp/gsJUkAS4eqi+1506b4UWCsd4q9j7qZjcqZ59nTldcY/FTKyZ
X-Google-Smtp-Source: AGHT+IFpI+0UIgFGdLbAhgubmWiDuSHqg39vRwHQ1YPPYWbpFPfaCtPFqc2D+yOYDgTy/Y2klxfzjg==
X-Received: by 2002:a05:6402:3815:b0:567:1797:426f with SMTP id es21-20020a056402381500b005671797426fmr5024042edb.24.1710610740449;
        Sat, 16 Mar 2024 10:39:00 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id s15-20020a056402014f00b005664afd1185sm2848513edu.17.2024.03.16.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 10:39:00 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@forestbond.com,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v6] staging: vt6655: Remove unused function
Date: Sat, 16 Mar 2024 17:38:35 +0000
Message-Id: <20240316173835.3572-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function RFbAL7230SelectChannelPostProcess declared in
rf.h but has no associated implementation.

Commit dd2837bdea0e removed the RFbAL7230SelectChannelPostProcess() but
accidentally forgot to delete the declaration in the header file.

Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c")
Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:

V2: - Removed the unintended blank line after removing the dead code
    - Removed "in rf.h" from the subject

V3: - Added in the Description Comment about unintended blank line

V4: - Adjusted complete description according to hint from feedback
    - Rebased patch
V5: - Added a missing closing parenthesis in the fixes tag

V6: - Sent the wrong patch for v5. This version includes the fix in v5

 drivers/staging/vt6655/rf.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 6f842ac00526..8eef100c7ef2 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -68,8 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

-/* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
-/* }} RobertYu */
-
 #endif /* __RF_H__ */
--
2.25.1

