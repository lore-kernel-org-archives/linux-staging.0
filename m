Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346CC153BEB
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071929; cv=none; b=MVpB2I3cFSH1VPV/aaElV2YIoD2l4ZADvJKkiGjYBlnJ+cS4Fe6mGd1B7tx9/q01mvxE2DyuwytSky7uoR/HloKCe5bgCdwT8v135ErWRNOkKtmobKE1RxZpmWsFU5/BxdJsXv/GuwxXDN8xBa0M+S8SITkL809CO3ARM6ZBxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071929; c=relaxed/simple;
	bh=IdCiQBJhitT9Oq1nzunZ0J4RNw5mODISj+FFI6ItdDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VtlYYwwGAntZj6h1Nznalx0jWUEFNj1p/j+7D+KNmE/kuESyh34Khmk8uwkvWVHxSN0CLkIun5mxQdU3DayGti6eigXL4KYA6ey2jTOhtVEAgaua+qAl9OWa39+1UnEvq7MnO6QDuuDsjskEXzOrKlKErd9UyFP0D8hfACBvTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzT8KoHl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzT8KoHl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412b206f9b6so3085895e9.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071926; x=1709676726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgkeChhdzdsl3VVE43LHMpQmdoDgIDk5tOvZY9oXyW8=;
        b=kzT8KoHltwA4cZJa9c9UiyPuOk87fOdV+tfWjw/TgExSNh3ZW3wocu/8dYpzTlVzVw
         ySL1jnBpyv1fKLdiQ8hqcDd4QUtscICrrxfX7PvZSMdK9yQ+Hbbz4rqx0DKvgJZDrQ95
         YR0sHBuqepO0MomWs6HKg8REYsTYyhOHkqURrYmra5EuGnGQGBvrxygTpCKnQ5QSyaPS
         ZxvFGcdGa1LpIs/VQjdJMN1VHm5LLMzryRLWqXxFu0hyQwkx+Ljc+U3jgAT15/GbbnnH
         IBSMIAOuOMhCOfTeuha0MaW/dDc9eMY6Jjk5rHXcUOCDdmVl63+D8Ikr/Ccn2060L/ju
         VjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071926; x=1709676726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgkeChhdzdsl3VVE43LHMpQmdoDgIDk5tOvZY9oXyW8=;
        b=hDOdjU+AQPEsk2Mji2qKkHFKDnvzBwFrRYn8oSiAgO6mZj/cmPX8Ypkep7bVzkFdP3
         oyqNA4TdTVjNdIbmDibZ+BpSNKzou5ZQH8klTSFqb6iboCfiCVsdehCE7eAFToMEWOus
         Sm3zXJadJmeLnpd/cBzcmKWttr/AEJlKlABEFGdmFJF3q1o509p1/4LyTGf0wFXKylHC
         bzI5DNMsPrlZTJRWekkCV5ps1BMUNSYGz7OJu/PCikqCxsHdfAGcI48zIr0Ch/u0EFFs
         Tx28fY/Got1Bffqe4bap0dAaPl1m4OieHTYXFgxil0LkOgYTq0UFSUcylk4fg87ILdGB
         /jjw==
X-Gm-Message-State: AOJu0YxZClec61ZazfOrRA2BqT4I58ietNd23jNhdRXZ2CSvxpCoZQ2U
	rdNZkd+gTB4H4p2wcR9B97b/Z+g2V2wrFKVeY2h5/P9goDnrQY+9dUqClRLF
X-Google-Smtp-Source: AGHT+IF+iWOAeHEtZ90X3s7ON6KoAn08gmOo67Z5rUI3PPzKbcrSF+ppTCZjKmC/a4cSiU1GZvDP3A==
X-Received: by 2002:adf:e689:0:b0:33d:afbc:6c85 with SMTP id r9-20020adfe689000000b0033dafbc6c85mr8817081wrm.8.1709071926584;
        Tue, 27 Feb 2024 14:12:06 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a056000010800b0033d202abf01sm12415560wrx.28.2024.02.27.14.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:12:06 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Fix defines in rf69.h
Date: Wed, 28 Feb 2024 00:11:59 +0200
Message-Id: <20240227221204.534131-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes several misuses of the define statement in rf69.h.
Duplicted defines.
Define in header instead of source file.
Unused define.
Using units.h macro to define frequency.

v2->v1:
- Fix grammer in commit messages.
- Use units.h macro to define frequency.
- Reorder patches to ensure no conflicts.

Shahar Avidar (5):
  staging: pi433: Remove a duplicated FIFO_SIZE define
  staging: pi433: Remove a duplicated F_OSC define
  staging: pi433: Redefine F_OSC using units.h macro
  staging: pi433: Remove the unused FREQUENCY define
  staging: pi433: Move FIFO_THRESHOLD define to source file

 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.c     | 4 ++--
 drivers/staging/pi433/rf69.h     | 4 ----
 3 files changed, 3 insertions(+), 6 deletions(-)


base-commit: 455c5e12a3b7d08c2ab47b7dd54944901c69cdcd
-- 
2.34.1

