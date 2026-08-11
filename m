Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B936EA98
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453700; cv=none; b=R57n7u3QNRr5qLBSj+srpIbwBI2mmcxXz/vBdcRtAb2FWMZCKUqTblzOfPoWZ4t+LALueRMqGm8HKsoVtllsNcwu4ppU3EK5e/uSLYvl6YTgAmGnqs7AOFDno/l1x/gvgEgFHDakzSBnPgsu06uKKYMWjT09QOH3uvf2KHQ4Zd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453700; c=relaxed/simple;
	bh=a9KO7Tse9tk2O/Wp+mdffCUvJ0UirYVIu1DkVWGwiJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WuglrE1fjTtWJLy0wkfknhi9Q8YJEHPui7JXNUVGd6iNTalZq1HhBbgjW1d6J3Weq9fJxYFAR/pWQH7YtjUn1Z0cmbsscTmoWNRYldv9pXKCZXoFJC4EV6Ru+srfghjDxoR7ITyxDxLi9ARWGmxyx5XEaK1BZA6hk/lLQZzumJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GypbFCio; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GypbFCio"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so3213748e87.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786453697; x=1787058497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYnmqd9o2ccxCSK1AbFiMyB7/O/f7wvcG/IcJOVpKHQ=;
        b=GypbFCionKU4tz+3vnS3W2lKnqlqU0L5djJkmmtl9rC3MH/quu/6KjUbtqyl8fkyKW
         jJomHsIZoD50aSUsYuyMo3qjsn3qlf1TnCKDGlk4xzbll2IkYGmsnbc1lsSSJbwlCjio
         iZIXByWmI0pGZgzs02IQZOOgAlmdfQYEXgJ2HnfcBj0DfDttaDOnNUew3rPPPBgIkdvj
         WWtd4id9LionwV4FEbeYNTGjfDVWDweC0p4/GsN7Yj6Sx2Eyhh1MK60Vyko1JkjpFHh8
         +6JpoAIg+WG7XIj4dQ4/PqLzfqVbrfQi0jXlwx7rsYfXxDOus/278AMx2+GkWNEQNxao
         FYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453697; x=1787058497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYnmqd9o2ccxCSK1AbFiMyB7/O/f7wvcG/IcJOVpKHQ=;
        b=KyNCyOrIoQmnQS8JOU0ILLt05h2yR3dpKHndV5Len2h+Q3L8LN1ruRcK4c9AqAs+/2
         2keAKbpKaHnzCk1haQbULgZSbZFpj8htAv7ckWjq5pS5yEHOy9sHGR4tN7+5MbY5Q+vT
         upAcQ6qPzAbmMPxrabCi8LSuWmmQ9TxGwOya/6FWA+K7fYx/PMeC8rot/UjBGxZTCdmT
         v/pRCbnP2LGPzcG5CuYnZk/eMXt0j7t89PA1D0ln+2nzmHfOpXijlGHFNUPoevODDwNZ
         4Z0P0u2WxvgV0NO4M1kl3W1x1UAb2ed5S5fdobPEmCXAWvZG/CRu09ueOS/raUbhyJP9
         BSvg==
X-Forwarded-Encrypted: i=1; AHgh+RqTuWNGL98Ek5pY1ceTZxoST2UMsoxJBprXVENYA92tqKuuHDEOu3QqU9F0kjQehsif4XSyVeGz1RiC9J2M@lists.linux.dev
X-Gm-Message-State: AOJu0YwCkaTHZoVI1WLZoB2KTMUu43YuOzbYGzXS4g3Kwi7VXEupK2h/
	BP3ufPq5g4wj4BEeUGWhDAYBJszFfzPfy0gWxBS53Mxibfymtcd+FpUT
X-Gm-Gg: AR+sD12A9A7rsjq0DAg0IaZOIzjpLJoBX4YYZMCLSZoGH4myDREfGhNCV41CW5BwADq
	WgS4rGLYDJDq7Pr1mVZmn0gCfZZncyWt9XV9Qe3gGkpYdN2zlHMQTAYP6+3Sqhr9VXiYJTLrO+d
	+lSy20LpEKy6DmF2K9OoGEMr+GzYMsMSfVyFy6KTqClCjnK8cwCTBqWAPXQlIBE1Pw+XfoVhQMi
	Yg82+Do8VnBAgtrDYx8YSVPU8nq4SVKBQo6PRRjMhMm3Del3Eqtkrtj+f0DU/8jr7CXEg7gde7y
	z1tpwDaFRLnHAQ+/LE9OVaMfSBSBOWHaAKjhyeWxBHncRMXyr+ZB5V1rhgskphK4ba9uW4VFwEJ
	z7DSLVFyZW8EpjgXuW+SX7Dx+2GbsBLBeJmAYaNX1TlCDf+ly1RYj8Cpnd6lutxb1f4aKBcjsNt
	cTms4YYJQrvw5uM1QVLtQW4v4xo+Dbwq7ot0RTW4OHaEXEVTSbJC8r/EquZpL7x9dKz/iz
X-Received: by 2002:a05:6512:1110:b0:5b3:f8e:396b with SMTP id 2adb3069b0e04-5b448658754mr424250e87.55.1786453696586;
        Tue, 11 Aug 2026 06:08:16 -0700 (PDT)
Received: from gentoo.home ([2001:2042:2a39:500:8a2b:6241:6d4c:773f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b448724b46sm273541e87.38.2026.08.11.06.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:08:15 -0700 (PDT)
From: Maxim Codita <maxkoditsa7c@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maxim Codita <maxkoditsa7c@gmail.com>
Subject: [PATCH] staging: sm750fb/sm750.c: mark g_def_fbmode as const pointer
Date: Tue, 11 Aug 2026 15:08:13 +0200
Message-ID: <20260811130813.434660-1-maxkoditsa7c@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch.pl warning for g_def_fbmode by marking the pointer
as const. Ensures it is stored as read-only.

Note: g_fbmode[] is left as non-const as its elements are modified at
runtime by lynxfb_set_fbinfo() and sm750fb_setup().

Signed-off-by: Maxim Codita <maxkoditsa7c@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..cc38dac88a73 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -22,7 +22,7 @@ static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
 static const char *g_fbmode[] = {NULL, NULL};
-static const char *g_def_fbmode = "1024x768-32@60";
+static const char  * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
 static char *g_option;
-- 
2.53.0

