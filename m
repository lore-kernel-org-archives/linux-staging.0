Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83513FBEB5
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359089; cv=none; b=C6Ne2t2tHsyQC9vbg7EtMVAzaTfM/T2wTiJiDZ3qTVGW3z0IjzGPn9rM1Sx0vptIV7ZIkKNgPGM/u2nh7RiiRDnnH491q+sGrHXrjLNNfMmKL7q0682VG+mtfIqcmEIlPKKuaTHUVD/ZxZR+VT4l49NY2CEptbjwGRK9gmiXfSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359089; c=relaxed/simple;
	bh=VpA0Lm0bczea6FRsBIGDvkafOuG/U/FpiWkPPN6FWpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiLwcPPCRNiDNxKFH+swsQyyp1/yAibAl+wMhL1KCrZEVTg9zRoSJ7Fuamfx8bW2f2yhrVXuhBhW/Jkx7ryfIhf/xyw96yxgdJg+0BQWNTcba7xUUd7REfGyz/HGApJaQWEuleZ73ChI/93hApO8Ak/bUvQwahEpMhyWKmOhNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRedR4Hb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRedR4Hb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aecf52fa69so9562955ad.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359087; x=1774963887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2C38FvlSENtkNKq2L3F/r8WGfZ41URF2nGbiaVlU9w=;
        b=CRedR4Hb3fKg9BEleCDr6gfBpbWX4m9bBciSs2m6JulpftBatX9/kHqbMacTL+bqVe
         A4OjR2IEGTgaLbYEkCxzVPXoPy/oS4MHL+r7u0jyJj02Z+Mivx47nKMmReQ5sISZsQgI
         LEne8RPrx5SnV8viCrZwQQxzH9Ko3X4d6fwvsTOOjJTr0miq2A9MVnMvdkauzZeFNBMb
         S4X+YY3Y6rPoruW6ESYRuaQVMx4CKRTJkLY8PBdizN5XRB3+WMDX/lKfHbUqSVJ+E+Ry
         I0NPttOW5F9CbPo0waFFMXyOd6t6uK+u+yxG/KMwSa1fQvEbjIymoVBxpjten6dhb4Gu
         U1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359087; x=1774963887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2C38FvlSENtkNKq2L3F/r8WGfZ41URF2nGbiaVlU9w=;
        b=kAhqN+b9enGl6YcqOSf0DSR1RvaWHQljM5NxwfOOA5tb0qYN22q2aFf0kwwqoxEWjf
         1MeEOATMQWkOajwhjA2AkLGhEXHqsbAX5Y7KThne8IzJcN7QIxY3xUIvb/N9sk4fWVuX
         cDwDm6K2DlTtcS7nMVMsLgOtJ+N3jN2QZLh6ga4FBbU+nCz+ADyKk0JhQjPP7kiKo8xL
         xWuaTBkclqtxujUkquQTCeIqeaU0ttseCLo0/EsFd/UF16f8xcVVA4iEQAQn8c6nYO2S
         HmDXPN71hwIfTwfxSOUhfekirRwKFhTdsd8wE7yl7qgQ7SSF6NYozil9JJiPJ/JyzxRR
         1ufA==
X-Gm-Message-State: AOJu0Yx2I0BoMM43hEyZgukNE2OWNMv/tWI9ixoeEq2m7ixATNRFEs8B
	kEwJvEOMB3uKohECRHCJH283KxDZG7T89FcK3pI9dGMIA2kRTxIcHeYM
X-Gm-Gg: ATEYQzxHIJe6HMoRqMS+tN3N7zO0jupPXws97t+zomQr7l6AHLke++5BYKfGfwCB4At
	G4DudPZdY/uH9Sun1xBo+KazVrZQkUg4ldcIJESga7kx2zzBVsdwxgzmSmGC2lTr4AaUiZFuUba
	vDPaM1EhvqFUj0gpyjJCGL7jjCnWSd8rb8Yw6qGI+Sl8OsfGTjviHvhNq75Ydp5bEKu3dxOMD6t
	hj12ehX1nOjMbNsHAyT0WGyaiP2ZbN/vPMyczNkcyE7eoCyW11MTPsKByHRj2TVQA5wKz13sa03
	8x6jz7b+tyM31/Qw533ZnBDfUwY6yVXq5KyGv+Pp681p5tVA6Zu/yBGMe8YuaLSAIEFC8OucDpH
	8R6hr6orwPOsRkwSk7n0zv0laPuuMVysVkbudCGPMtj+STsx4XWv3gJ1svidkok1SrmwJM8h/N0
	AWfP1xkzmqBa0ELzWWu2Gq4ng5WNP+
X-Received: by 2002:a17:902:d4d0:b0:2b0:6f21:8270 with SMTP id d9443c01a7336-2b082774324mr104578695ad.5.1774359087072;
        Tue, 24 Mar 2026 06:31:27 -0700 (PDT)
Received: from fedora ([2401:4900:bdeb:4823:b168:4102:56c7:c7d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354bb76sm147526535ad.34.2026.03.24.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:31:26 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 2/3] staging: octeon: ethernet-spi: add pr_fmt macro
Date: Tue, 24 Mar 2026 19:00:28 +0530
Message-ID: <20260324133029.82764-3-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pr_fmt macro to prefix log messages with the module
name for easier debugging.

Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
index 699c98c5ec13..f6cd34e933da 100644
--- a/drivers/staging/octeon/ethernet-spi.c
+++ b/drivers/staging/octeon/ethernet-spi.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
 #include <linux/interrupt.h>
-- 
2.53.0

