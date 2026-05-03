Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A06240DFAF
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 00:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777768901; cv=none; b=UdFUGmGxnki5M+fQwogQxwnX8bRgqgJ0Fs9mjj8IwOXaWSPen2MgkvZvu3cKt1wv+OgOSqlER20v3jnVOhFmRDLgXSF16cTAe8G+z1OEa0qc69p3H3eLC1OE1YbBCZynVALxJIKuNPsAq+B+18qWvMW/FUb2J5jxW/e4duF199M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777768901; c=relaxed/simple;
	bh=3dtDkPvXcEobzFH0LktvTQE3OVk24kNitpzpzy7IVNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECqMtFa7pZtoqnDBajoHOCJ8uwlzXqRsWdM+cMKhJwKKg4VdFt3tV523TJu7AVanwAODx0Azs9wYIKKwARmH78lWsXetdvW48nH/yEQs+SMs3iLmkmbOhfpxqLbZkllmuiaYHKUa9OJgMXFrCJHOpBPg6toAFDdKdKJwNUSCPSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=GTJVSZD/; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="GTJVSZD/"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso3067411e0c.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 17:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1777768899; x=1778373699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZ3Ea4r3M7K4WkR4phD4I50DLVzuYSAOvgGlIvX72M0=;
        b=GTJVSZD/lFFjfU+KVRHNmoYDinMr2/3Up61lPflp/Cqr43q6fsE4eBhn0FeKfrbDo3
         FwRA/WU16W5mv+U+I8go5+/zdklOSHRaiGdQ4eFhMLzz4J1cxeSNW0SSyneNHfy/4dHG
         S8Imp7EJ1Xye3/LNmavpzC4kkCjDmD8jPMYTMM3dIu+fGyys9yz4gq1FrNs+aoNVQ6vM
         xasqqikrKI7LkleIsqFSP/41ceY7Ahk5h9hktgXVEqTFfH9RrDSgcG/ZlVfJ1mVLLqwI
         oXpsWF6PS9vZS+++exnzSeNWeDrg6usy9DHauwdOJ/yOSk76rFrOMlRWQtMYbr2uF6om
         BNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777768899; x=1778373699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ3Ea4r3M7K4WkR4phD4I50DLVzuYSAOvgGlIvX72M0=;
        b=cz6b6AUG2ZeqoP+fHzEX/wIUwI3cuK71KdlitA23RM1p5yKEUSulYMP+r+zPsTLrlW
         QTprrv3QQ4iUARCwlEm7OvsvIsZ97qy+stdLSRbLsdrZUj0LXDbEHGqNNe9zXyGzfwCn
         acbJOBpUd0BuqQJwsckXYL7PPEamA+fZmanRdcJC5E7UzLwsGjHSvImbwN1QKxibZWwc
         l0/74LXPmhmKGhArBUAkdOssJw6G+IXpRdlii7u9XSC2unWdl628CZLiUpzgMPILmVpG
         x7PgtSRLwyLyrUB9L/GPxgWcRQ6VyI3hUWVq8VpYS1MkeRQRQSTFrURQ6sqLNnMW6C2t
         HwCw==
X-Forwarded-Encrypted: i=1; AFNElJ8pgBH1qspAw42VvVrXJrttenah+pHUagRiBaPvct4TGWaK6bwvz2apD+zEfVZMt5aCbY5mq/6YsuEwUMiT@lists.linux.dev
X-Gm-Message-State: AOJu0YzKN0ld2M7m/1M8Pv/wY/Gf19ixuIY2C+STkNu1B+EDPj+cZ1Qf
	IVo3DeEpTsbtpPDFVG6fmqJSxK8uLki95x5O4atpvBfyuCgmLqmtfkyxvkj6AMhCipg=
X-Gm-Gg: AeBDiesJ/9+BwRAQgYqY2LHoB/DlYAhFxWtmNynkG/BIVIy12fB06J+WanQWsn4AFcc
	XKIQJ3xBPqnG1civvZUunlk5Lnw7XYQp2kcxFCRiS+JfSH3o5rzxDKKDnmvrmcPKClSqHGvBxaK
	c7+V9934ODLW6SSOi+ncldECdbyGGLXWUyEB6Rop8QAiSYEB+Fz17csnxG02QKHl3etYaI/mo7j
	lT8AzfbJXyRF+b1mB+ewXv/VsPRL6BipuY9uTTx0X9oBoh40x1Gj1U2ZCwezBxfjTELeHkeP7Jc
	N7tG2KcZJKy203c0dZkdzAWVRg4Cay4LD+ApUO45HxlnK+5tnQLNpwlhj+Kky63EDf7xYCgbNHM
	MGmadGlB94BPXSVLBrBuLbZZ7oYYhAhgL9dX1ixhXU87nTlQPxKRM+cMIxUe4eX3Tpn/CkZUYaV
	qv8AbcT8Ku8NTgz8/ChOMEiOOms2MjrhIJLwFPfJvchxXwVWC1jGJEVvUv9JteO50x/X3v2VJyO
	v5DrFeQw/B19p+CkxiU4UxzZ6vqIvWEZC5G2A==
X-Received: by 2002:a05:6122:1307:b0:56d:31e1:2c9c with SMTP id 71dfb90a1353d-5750c466fe8mr2089860e0c.3.1777768899150;
        Sat, 02 May 2026 17:41:39 -0700 (PDT)
Received: from localhost.localdomain ([95.214.114.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6ef15e0sm3815389e0c.17.2026.05.02.17.41.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 02 May 2026 17:41:38 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH 1/3] staging: sm750fb: add const qualifier to string pointer arrays
Date: Sat,  2 May 2026 19:41:34 -0500
Message-ID: <20260503004134.66693-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 'const' qualifier to 'g_fbmode' and 'g_def_fbmode' pointer
declarations to make them 'static const char * const', as the
pointers themselves are not modified after initialization.

This fixes the following checkpatch.pl warning:
  WARNING: static const char * array should probably be
  static const char * const

Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 62f6e0cdff4d..dc9653ed2108 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,8 +33,8 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
-static const char *g_def_fbmode = "1024x768-32@60";
+static const char * const g_fbmode[] = {NULL, NULL};
+static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
 static char *g_option;
-- 
2.50.1 (Apple Git-155)

