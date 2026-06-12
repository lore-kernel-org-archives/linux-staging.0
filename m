Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208A279DAF
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 22:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302012; cv=none; b=uY7lT+28X2qWXkTctbnHtQkRjc71jaWf/1o2HExzmmQztLPwnJPHqXt2XAbJxcS4aoup1dsbT/+6bNVdM75EBjuCyE4qS0LbPWHf57J6e8YWEEPLmdpVKF8hl+VUmKX99WexzPcR8z+R+l4Bi8c/oRog4cuRC1u3OlKA/t/Zkys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302012; c=relaxed/simple;
	bh=nUZ5Dy/C6YW0aNXrQ9AwkXLylyrntzx3ImVgYrWE9Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XOixfUZ8dWgqefHEHcMoDCPT/5phh6MvgzU+wpvHmlyay29s2mlpZbUMKb/PbhmbZ/rz+dn3pyvYR69WQQhqnmuGjZa9quTV1QV5kadVg/Wsi1QOvQKvz3WilO+N6n0yJHAuOtVbQuxyuZU/piTGzyj6x9jU2yKshQE5eFpqOeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkQCQ6So; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkQCQ6So"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36da151a152so1175129a91.1
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 15:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781302011; x=1781906811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZjhBdOQiqk5Y/TB4HTh3RZS+UoX6hlqSIr7w511LvE=;
        b=SkQCQ6SoLfYyN/YkUQetd6SSN1KLBagCJFMB5YQ+gMUTqlTkZN1X9zzLYMvE4v55fX
         AiHb9VZjOVGgdcCawRZlRriq1LHv8U1GfRTtJaQD+RPIz/4omw+81bWg6ZTI/5VyaAaT
         /EgFx1hTcUPZWlTfJA797BpUXd2GGNKzn1JKuC88Az3Z5NW3aeztO8V3eXVXbc3eSQaO
         fHVypOPqZV8tHV0gYdEfmQWnWD/icYsgh7+lDbuzBsWkjWkAPsHKGEZN6D6cNMCXUSSk
         HnZfa1Ion4UDK6BN9fjnvXdsLGVg4QkdA0lrpahdpPFy0XeVF5YckQletQIyCwsJ0KMy
         PCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781302011; x=1781906811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZjhBdOQiqk5Y/TB4HTh3RZS+UoX6hlqSIr7w511LvE=;
        b=o7YeAzdMGKZl1AluueMVph7qxXBxDKvQqKGNRK9YUsmRyLJjfdO7WBweeuR9Q86gbq
         9nLiVdey+/myWFCG1N+gvYuHHXmLoxAVaQy8IKY9tDcxmKAxZeNws+OL/Y3mM+eQfDI2
         o+GF20KZgU662q0ldhpFVn4zuPxQ/1rEnna/O7Df3hTctzNPY5jY8e7vFE0qH06mG6V9
         AYWULmxOwKjLE3swWUBLc80zT+/JFI3HdbAnFZSNiVADGeuE54WXyzADl4wRihbQCNE1
         d+WLxzDRhBgCgu9b7o9OkSzGzhwU3h3FvbCiG1VDCpx+oH5SjkESzgzCAns1AB9TZB29
         yvPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/88hPApPE0OIU1umV51VextIeNw0TcscBer0zdGjTgsxcHmo1fCiHBbtoKBGv1CoUfOOHeUNbdmbbrxmY7@lists.linux.dev
X-Gm-Message-State: AOJu0YwAlaCXYjM0sAzi4dBlS1xP6NrSvagi1O39pMJJO8RF5OuPVawn
	D7F71qgUVifm+wAubzeSn/1QqwreqEZsjofyFn95KGayQZpilBYPhBgA
X-Gm-Gg: Acq92OFJCXIK0g0S1M8KpDY8OFqXsT5ezi7f9UXPRXlUM0P5sTRI6KnVcbuRYugaxvL
	Ld9h8La6muU0ehJlqerH5TmQlRy1gxKxguDFMmYoyBCMptDvf0DDYmFqXYPrMEAy573cgClJCJP
	G85xbsg/5p9PghdoxwW84JeopwG6uXWDPo6qsWQqNhbVgU/9Yglm0/imz2Twq5ZJvzmF4SPHQOI
	hiJBoIQWpHFm/d1xMXisX6FXWe67OXDXL4PtDxzdObLsOKmD57R7FAYHrv35LNgHSZM3GK+JKPq
	KiKqWPDQaXCjSwFtBpCqMz5+rZcfJDi5i4DtBCnLPi+t/Os/PVQjYsyN7c7yBbmBGphWQDvlp2E
	bs0tv2KCMsMsKWPKS7fyXiy3LwVE8qy6PUqbY5TAUS4MKOTjOad5++10Fyw218sc/Y1beZzBHVh
	7s1uJToHyM8zwPbXOgEiaoMCr7HTcrjfwW3tdPlxGNoji1B4PwaO7hXo69XuWa59u8nuhSiUWPy
	vYbgWl5H+g=
X-Received: by 2002:a17:90b:2dca:b0:36a:6ac2:8bc8 with SMTP id 98e67ed59e1d1-37c2bcef7dfmr1071667a91.14.1781302010945;
        Fri, 12 Jun 2026 15:06:50 -0700 (PDT)
Received: from bloom (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2678375fsm3797237a91.17.2026.06.12.15.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 15:06:50 -0700 (PDT)
From: Jack Lee <skunkolee@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jack Lee <skunkolee@gmail.com>
Subject: [PATCH] staging: sm750fb: fix const pointer array declaration
Date: Fri, 12 Jun 2026 16:06:46 -0600
Message-ID: <20260612220646.61461-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

g_fbmode should be declared as static const char * const to prevent
modification of the array pointer itself.

Signed-off-by: Jack Lee <skunkolee@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e82a..19c3da654a43 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.54.0

