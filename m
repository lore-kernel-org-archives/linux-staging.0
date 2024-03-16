Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0DD1A702;
	Sat, 16 Mar 2024 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710605342; cv=none; b=m6Um59rDGK5iaQ0W8y1P5S0nXVnXvj0ReZ2H4UteZN8hhMhzdE5P0NyYTjZHe58vGbFqzODl7d5Env5uskzizpHgsqfAyh4Gj+EjJDvmBcTcENBVaewBgev9J0eH9VZAnAVH4nj/pV2/mOw4IAlVkgE7QcqOhDkJZe9zTR2+VC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710605342; c=relaxed/simple;
	bh=/7f0NTuTDbycol0TqEAm80d4B3YCzFevcl1q8Qi2xks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R6F3GnTGIWbNEZ4JWCO3UPFwiVVecvahGUwfSfgv/mBlt/alxryeTYdilXWlfLbo8X3zVmt8wP8DZzU5Ch7NZYrPwaOb85xVneOXYFJM0i76bkagjE8+vuRAczHZt7GhZZc2iR9gbKQOETqDRPYwDImpumOGMBHGy5IZ+9JRnCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkqXJPZN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkqXJPZN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a467d8efe78so263839266b.3;
        Sat, 16 Mar 2024 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710605339; x=1711210139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrXE8EvbAVJt8qFbeWRLuCvMZVHZKs11IeHtQCBARR0=;
        b=DkqXJPZNGodXezO5KbtDauMSzRPofgSRXw52ZXuwzsEuyU8m1271MPuk/VCCnPPjxT
         Kp4hz+E0k3sicslP/BBg79xDDr1JvMkLx9uJW8TjRga1ggAm8YPGWZOCGuNAYkpvGe6x
         yNLBRxied0FAEtsc+bpUjH4+YFPgGq5cVAjNJ0T/o2W1eY0My31zveRSy36+qGJfph7t
         Lrd0y5Pu9OMwYGdvDoqRlCdlxIvwmJADtSzKlRjcmL/fmwhllquUZo5O1BuI1euuZyv4
         pRCD1HbhyxIcp/ZEGLgFjLomZqmYlVqBRt1m7ZgGbOoHS7mOZ3iuobpe3DmY+NosedCq
         2RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710605339; x=1711210139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrXE8EvbAVJt8qFbeWRLuCvMZVHZKs11IeHtQCBARR0=;
        b=KbNihfgzBXOGoaD2gRIcpmT81F96iSylyxzp7OVVqqPVMjQsIkOqRtlTgnFKO9EdAD
         rmjYcic1VKH3/8QJ1COnm6043xSEni6hIF4u4buf00RxXM9xZ6jzinhJKA64fZWJXtZK
         Q5U1eV5nvgGXPvgKXmaUgtx8/4TDgZyOod688MQbGZXY8Ggzxqcw7Hx3Zk2npILjRD4Y
         4+dOT+UCupMovfY6uqkaFsed+POC7QwqVqxMSEMhg9a6UL+amn7mehiqdmigQQk5vJtw
         ljfpu7PY9PG0QJ68WltQVJIKQsjKkXLcPjrsBuCovNkkw+qMNCW5dUyU6tsvoMKiu1fs
         F2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVFARq6lCsL5zNTIINy+XlWFY0dSw8kPCSz11SpIHA6o4Sj1URznbRQkSDLLdxpLYG6LLA/znX8NORwTud1qIDdR40WKUbebbMkMOX5J2+TbuM25Z010mq7NG6ulJJ1iqDNyprncJuzJA==
X-Gm-Message-State: AOJu0Yzjf/Hsz1/s5uw60qedmBhgqVxPeltYo5AVkBnZ8a1wH3n9yvF7
	FSQecbiFCoIH8bXsxPrVQ23TKG1vif+03Tz7rupQSEPwPVRx/HDo
X-Google-Smtp-Source: AGHT+IHUry5SJoQWOqB4tYyBf/agGWsTd39z3sw7UXo+lN00FEisoqi17sEwkfJyR0eoPE9Grd9d7Q==
X-Received: by 2002:a17:906:99d6:b0:a3f:6513:1489 with SMTP id s22-20020a17090699d600b00a3f65131489mr7586559ejn.55.1710605338880;
        Sat, 16 Mar 2024 09:08:58 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id n14-20020a170906378e00b00a46abf2ea60sm436949ejc.131.2024.03.16.09.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 09:08:58 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: forest@forestbond.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	dan.carpenter@linaro.org,
	philipp.g.hortmann@gmail.com,
	julia.lawall@inria.fr
Subject: [PATCH v4] staging: vt6655: Remove unused function
Date: Sat, 16 Mar 2024 16:08:35 +0000
Message-Id: <20240316160835.2312-1-dorine.a.tipo@gmail.com>
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

Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c"
Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:

V2: - Removed the unintended blank line after removing the dead code
    - Removed "in rf.h" from the subject

V3: - Added in the Description Comment about unintended blank line

V4: - Adjusted complete description according to hint from feedback
    - Rebased patch

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

