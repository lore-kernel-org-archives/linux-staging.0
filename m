Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C08F253B78
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904323; cv=none; b=D5qKZe7Ed4588VU4hHtj3LZpqhjDFA/rU5Za5+gRQt/EWxvtIiLNFxGXCKQEY6236LCjyN6vybB9i56SqEc5OgeyGrCLpa2/Bu+mKpKlXNaWcfUkFezmJb7FnTyUbLIcdl8iZjGAmBIXAmxWQRj23s+C6jh5hwk0NOwI5aN+yZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904323; c=relaxed/simple;
	bh=4CmxrQz1pG2CKAvpdKstkQyARIpmzfZ1LOKGQOkWcYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePwVY4EgZw5hdFXubi2zFBoZubkMGhOzDSrnWHFAAOTYlwAcmYV3QuF6B39+qV3xmF7PIAdvE+V8ongd8PhQHeP+OREEHFzIy6kDs8Qp+uY1JkYM1I4uHQCu1ybubCUCrDcygs+hNEYaG+fLFXSq5jjwFPVZfZnZG0h3AgvcjXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=h873AYaW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="h873AYaW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2254e0b4b79so14553345ad.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744904320; x=1745509120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=h873AYaWMoEPoV0jerXg1Z2BxTqIysoTmSoUzX/dXgBKwcr1JByGciST0EslBTvQJ2
         Jy4shgx5nbEE3JqNCCe6J9qmzb8CnobGsdcheTuMt9KCupC16vonuocGTstwrlggZh3d
         Hgyfru9s1/DJXuDw0+PQDfDPTNFCIU2T0rFDFdeTGCVaXhhfBKV8oqGz3R8t1Hc3i6Hx
         PN923/BTL+fipWDTdrCDYGFNKCLGKvtZiSB7KD0ybGa1izv+QHMP4xr7RvaYFiIXOU4G
         eQZWBjhy5wR+ll49Y0O1lxYY33Dlp/Nb/a29k8c5dnLgqdIX2veE97KPavWmLV0r6cGy
         +m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904320; x=1745509120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCFGfuy6JO8coiSlMwlp4uAr22QSVYGIY2uQAoexHHg=;
        b=dEf8KVndpy+IFBpQscqNWBcVB0bZ9rpC+xdtVwm6dYy30UqTZKWAkls/Htm5VSHErr
         tVpFsUM66ks+PeDn57BKvB2AK5PPtyt257j+HJF/XHbvecA95l5Ei5WThDYS6rl8yBBl
         kKQiE4fZx0s6PfnTx03pWunr1Nso0av0Eltq22+Eo9+4bLMYuX02gOKrTH6eWJ1fFUxX
         pOtSGfwVaJwQQPR3tnK2KSWyBiKmzcTwuNlUVxQavdxbBZ5OH945BZVLkyaCn6tlf0oZ
         AEMilOYY6ufyb/hTq41WTBG3uxWnvyM7xd9SzexRWfaBNa9M1eIiBJWRodRVSYkM3nuP
         aU1g==
X-Gm-Message-State: AOJu0YwfLF05VOFi82jXrjWbpTsdrJkaxR3dT/lp1Crsn9RDQcvAtTzI
	mc6rR45cVMqCWeYZa2FbzwDajNIMT988J/UFioBPUGFR8BYqm6Q/Cz04Y9Nh8A==
X-Gm-Gg: ASbGnctpbXkLtfe5y5NceeniXBdyapfU9ma5lgZ5J5j6nGUPciX4G1zEkAhWyqYDJT3
	iGrZV8SGhL/Jk4MTMRiYDxmnR7fle+rh8CW+4hb28tkkSrfRsjxeTIP15mGrm++wdbDg/iCJVSK
	Hvzg3P60M3qEzCUU5AqMV+/lK1nTVMMEe8hurSXKpd7+p5NREnBlDCg3qk3Em4jIUavDDfbc2rE
	5wiN1Jp2j4UdHjQLWyEOrC/RXsjBwsIN+HTN7Ts5ikQmwHb2N9IAR+PCtBfYtUZQCjTvUJlmVuy
	FfxfaCgJzyVZxmyM0r9pTYCjb52NOvnsZFNcgsq9GbpkiUfVyySmtDgnbBQlHN2Es83LUzX3twY
	NGl5Vjg==
X-Google-Smtp-Source: AGHT+IGPzUqcsg1OrfnfmQdTkvSJAN4C6ee3MKAjTkoPY/+xGNmmw/TfpRhBh3QH4n6tKKGOXDQcIQ==
X-Received: by 2002:a17:902:db03:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22c358e2060mr94206135ad.12.1744904320238;
        Thu, 17 Apr 2025 08:38:40 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd233787asm12880375b3a.173.2025.04.17.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:38:39 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2] staging: gpib: Removing unused function CFGn
Date: Thu, 17 Apr 2025 15:38:37 +0000
Message-ID: <20250417153837.92690-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing CFGn since it is not called by kernel code nor any of the gpib
drivers.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index eaf7399a164a..1cb6b6219e67 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -192,11 +192,6 @@ static inline __u8 PPE_byte(unsigned int dio_line, int sense)
 	return cmd;
 }
 
-static inline __u8 CFGn(unsigned int meters)
-{
-	return 0x6 | (meters & 0xf);
-}
-
 /* mask of bits that actually matter in a command byte */
 enum {
 	gpib_command_mask = 0x7f,
-- 
2.43.0

