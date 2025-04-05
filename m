Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC231DBB19;
	Sat,  5 Apr 2025 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858204; cv=none; b=g4fmenbyyJTwhk3kKqDdCedOCEizDG3TuyTrszxYT4jQkoWAM/FxVdt6yzfXCvRlsqtde/MgOg+fipdy6fjzoiReoquHn+HUAgNDLfOLTjnWjLqssZf+PGgVSFOkNlfxJ1N3BKHZ03VLc77XCW9xSyid6isQRelHx0uy0Qq6v5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858204; c=relaxed/simple;
	bh=QtQievvHKTKHD95vEVdc8kNiFwXouDDzKVexpbsiNz0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BIYFG0pa2iXsou9GthU9l4WM+ExSDP93ALQ635lms6zR/zRPIM1pMEA/QDD74P6rGsWfWUaJORKSAnIWqHq6Fkqapa86EFeuDmIDZjxwXYZeJAXV+JAkZGcLo44AZrnMIaiVZ2LIhcH+2OcykbYZUcBxP9IWCeo9C8lKnjVz5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgRGOhCc; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgRGOhCc"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2625789f8f.3;
        Sat, 05 Apr 2025 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858201; x=1744463001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1M3H/KZ5Fz4RueCHGz59IJwoPyfMrGqEUU3429ZwWuw=;
        b=PgRGOhCcnemBOB8tGCGQiif/36zF/jTGSkY97/zJFJ8zi/Df/flGObI3CKFIZbPo7n
         rYhSuaEiHS8HQLDGZlS51YvODVYqcQlIjCv9jVjNj4YtOmPltQSDevtnzmeD3KX0Lw8S
         M4CUIctED/tQ8/I3d8n92LvYJNkdIl33+tVWdrioN7RluyEV9a8Zzo+om5VVAQr7t3j/
         AUIahxXvMFUP1ZhvLTNw+sZvlYYCEp64OLFypGyrXzj5jcRWe8qqycGYtfrt65Y/a8KF
         iRIiQtc3cX4jZYFTc5ZcY0f+I98beMIvPiTHn5QBb9ybO4Y9aUxwM4gdxwop/KPLjAD5
         DXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858201; x=1744463001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M3H/KZ5Fz4RueCHGz59IJwoPyfMrGqEUU3429ZwWuw=;
        b=q88OVut4VXrTE7EWCu1PasU31/NuebxfW6lXTdUw2ue99n2JlGrBvscBl7mTXaBWiM
         4HvVVoV6RWVH4DRYpR7uJFKjjoMJuiJTawAh4uWZUUH3c4FEeVoHpG4USegnxmm+NFBI
         +N9kSIJ1o1NZQ353IH6vOjdlfdkE67uoz+3UySwaeqa6EaeDBdFaybnRMBMeEXeBTfxN
         ala3TEwlEBRy8BAXS6YX6nJBqrx9m0fYu3A3tHsjIBfGIA624SaQDuWCw1MRAd9AEP5J
         ji8eUs8NktKQmpe9mBq5H/MGf1qoq3k9nDQBdl6C1xRHroT5K02aJd8E0o5aKCR15+Ov
         YxOw==
X-Forwarded-Encrypted: i=1; AJvYcCWd/TISPVdo6ECV5wEEMpZabnM/VSXBADGnbH1ETh7Sbk92vXk3wW8MeqcPbQp6SMEAfVVZTEFCaQj7IADa@lists.linux.dev
X-Gm-Message-State: AOJu0YyZAcZjNgNgyS8vngmr7m41bQu2GndXti5y2DZy3gUs9npG+nsP
	nMlpRohQQponF+jNKpXFjoRb8Pades6FxRE8Crvft96Vk8seU6+g
X-Gm-Gg: ASbGnctR0gpp89mACAKTc8ohuMIJ8vpWKHB/p3LP1yqAGwC2iOtYi/4ZpwOnrbkaRo+
	qUhqbfqWwW+IUUsC39F0OpqEoApsXm+4a0EhA/BM9DQy8lfoZy9yBWbte6wyeoixAP1A2QT0Eec
	uoip7JIpEg0dNnjWqlvDGuhE2aapFhDbYTV3Tlo4kPGMnv2NNrFygBL/ayF67l2piR9Bz0AneWx
	U2cQzkyd3bJF5Bw+cP0NIeYfKrpE8UJ348JuC+gJzMyu6DMdMoTuev0XUPpipwCql6LPpr7/CWo
	0Oy5Ni7+r9YejMuzpN3qdtBeHzXLUL8OxOzg
X-Google-Smtp-Source: AGHT+IF+s3ngLQLjDmaCQZkfAyv8IFOfnhZlhFOgK13MTqNkfKvCDs5Ab8dNtndxDF3lh5Pz44Y+YQ==
X-Received: by 2002:a05:6000:4012:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-39d07ad4ce7mr4960096f8f.6.1743858200356;
        Sat, 05 Apr 2025 06:03:20 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6321sm6733940f8f.44.2025.04.05.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:03:19 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 0/8] staging: sm750fb: change function naming style
Date: Sat,  5 Apr 2025 14:00:51 +0100
Message-Id: <cover.1743857160.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address checkpatch's "Avoid camelCase" for sm750fb module by changing
function name to conform to kernel code style.

The patches are required to be applied in sequence.

Richard Akintola (8):
  staging: sm750fb: change sii164GetDeviceID to snake_case
  staging: sm750fb: change sii164ResetChip to snake_case
  staging: sm750fb: change sii164SetPower to snake_case
  staging: sm750fb: change sii164GetChipString to snake_case
  staging: sm750fb: change sii164EnableHotPlugDetection to snake_case
  staging: sm750fb: change sii164IsConnected to snake_case
  staging: sm750fb: change sii164CheckInterrupt to snake_case
  staging: sm750fb: change sii164ClearInterrupt to snake_case

 drivers/staging/sm750fb/ddk750_dvi.c    | 16 +++++-----
 drivers/staging/sm750fb/ddk750_sii164.c | 42 ++++++++++++-------------
 drivers/staging/sm750fb/ddk750_sii164.h | 16 +++++-----
 3 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.39.5

