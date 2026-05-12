Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE77436379
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566242; cv=none; b=nUarnbXN2fdDKJNl0Y2TczRd/hAFJS7b8UhPMh0Jb3NrBHqYM/D/G0CyqKhXJ0CITpyHTYoz/7pCmHN7sOR9KvfqgRbqxrJdyGvpg1pZ1uKcWp9GSMlRpBW4cQCF3jZxGSsXw2WC9QvFZPCkqnP4V/27zA+64OJ88y2J5GGCtHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566242; c=relaxed/simple;
	bh=VKAyXQlpHLqNcdXY9pwoEmItmyKJQQ2HVqeu7CYCxPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JSwiw7J/mr92qfbtUcaGHunxm7zR4AVP2nLUItYDsAj7JYTnSvfVkZr6UJ9Ao9D4Ety/emkOSGI51KNdCiU1tLvaUMIvw3zhYTLLuMirYVymaNeiym+rK46S4dSz5Ntq8/kZhIQ+JynqAK0m0ZzwhkHIBRayzKszI8LU0iAUNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnRizkF+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnRizkF+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3667cf0136fso3339993a91.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 23:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778566234; x=1779171034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zj5mcHoGCb5n/eSvfW+GLHRF1PYTpVVH8V9CqFbdRI=;
        b=CnRizkF+XOvpg3F7WUbCE+WsLX72m2EDUe9AvmVpbwsPXJwgoCKrWTJh6QPnzaZWMR
         vCeJdmkfweWtp5PHujqG9A0JU9sz57bRtE/ZpkLYWryY2XuJjaXWlZocDgTTroGnQVOQ
         aM7WAlF3Uhp3zVhzhDQdIURB1r9tGYrathR0+z06VVPdvBCJba9HTkl0a25IHB78054y
         wvpISfb03zpEJkWB0EpbqqonvHvyK0e6h7S4jjhYuoA6MzL9pk350AU/TKSnS8DlB26Q
         NhPtUytcHf9hQ0hb1xaoAVpP4fMumtKMgNDL6hrFO49CRXHHngVijuEdVYYvwIC5GVug
         /Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566234; x=1779171034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zj5mcHoGCb5n/eSvfW+GLHRF1PYTpVVH8V9CqFbdRI=;
        b=dQs3xDTDuwLQCkgbSTjbfhUTBYVKzkVVW9D7E/46eGMxxoMcy+tZ3dqItJBKw7bzLg
         jnY6DM1eIyeBvw1ekqtXtKe5ySh4dUCrETo5sB9+63THWf7Nqwj8Dzljx1ZZBRxPgduX
         6iBMcEjhK6ylp7I//ty0+mPLW0T4cD/gJF4uH/0Pi6lSXVbxzsQNLWHw9CEHg1oPccwi
         IKAAMymYIOL4AH1TCIQwj2chDB8/yT4ml3Dr9+5Mwb/xN59x88t7TMw7wboFlybhGEZs
         dXcaByLmNfVz3HemNhMSa7/8XqF9X8EzokzpTPgoPdbW/HruDM9nPjSgjqaKTDrCjTuR
         9bqA==
X-Forwarded-Encrypted: i=1; AFNElJ8yTtPmho0suclfKWu9advIpaJxWIqm95qA9wt68/r6F38OKS/dZW+Ei/CTehPlap5kBJ+gTcQlhKcKYxGY@lists.linux.dev
X-Gm-Message-State: AOJu0YyqjFiFUk7O83PRUcLo/A7NgkpT6JDcQ9nNFaqCqYMU+S/Useh+
	JrCeWkQJzlgisIZhU+a+Slo8nXyfDvO7H358iSLtsBh7DZlNKxkku0hL
X-Gm-Gg: Acq92OHKavda/Fofcztso7QJzpQBdWBzQ73bCFrgCIIZWm7xoECdS7ZLQe0QWKFypsi
	s9v+pqkpoKI8Sw+1BIkDwfGLExkgTOzpOulc3VQ2s+zNZIN3qvlVd9a71uTxJI05sfX9mYvwHFY
	SztBQXJOwLhkVVBilGBc2fKqJ7PUYgIBhcbYfy2Q0r6YCITniXyKAW+kirrp+uMT6qCLAmpDGP0
	Ek0sirsmTkS5zwrZbGB75ROhXDC6Rw3ZoY84Sdf3qwe6CjZZfvzoI0eiKttE7iqXnX23AhJNYBr
	MS18QFLhf0UgdDicwbs5f0wbENZzqdwGJ5fKrnt/i1FN1rKtAYKFLQmZSdtxvc4NNWqHP+WAJnH
	cxG1ODo4a1q7ZNyIGHqJFu1c/IcwTPEuWNh5FZo11bHPE8mU0pzZXj/lqcyKGAxetwF8S++FLKx
	eYBuvlBFdt7JSHwY8naCCoSTZuXLgRqTpwJ6XtNepFYgpQT799Jx3zCw5TzYpLohTUbbDGLE/VZ
	r9W
X-Received: by 2002:a17:90b:33c2:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-368b17b7935mr1893015a91.0.1778566233926;
        Mon, 11 May 2026 23:10:33 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm9827915a91.8.2026.05.11.23.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:10:33 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v2 1/2] staging: sm750fb: remove unused <asm/mtrr.h> include
Date: Tue, 12 May 2026 11:55:11 +0545
Message-ID: <20260512061012.76252-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_hw.c includes <asm/mtrr.h> under CONFIG_MTRR but calls no
mtrr_add() or mtrr_del() functions. The driver instead uses the
architecture-independent arch_phys_wc_add/arch_phys_wc_del in sm750.c.

Remove the dead include.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..f491d3aca468 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -13,10 +13,6 @@
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <linux/console.h>
-#ifdef CONFIG_MTRR
-#include <asm/mtrr.h>
-#endif
-#include <linux/platform_device.h>
 #include <linux/sizes.h>
 
 #include "sm750.h"
-- 
2.54.0

