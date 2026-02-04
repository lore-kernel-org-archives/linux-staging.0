Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1273D7D8E
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200140; cv=none; b=cJShqgVjAqQazFwgpcbCSold065XKc3oYd+Itz1qGFxynwzNXZcUaeTY+V3H0evYvk/wH7nEQv3VhZZfSF+aPcC4YvfnWDdt4gqKOh5x8uu5XR9/tVcqJqa+B0wgTDMjk6Pja7S1wn0XgFQTgisKGanQOM0sKVWibXGt84J0W9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200140; c=relaxed/simple;
	bh=dIsnl0t5FVP9ysSEsc5j1G1gdI61iy67zWOeVDaBYrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHHm/12gyHuPdhYdoSkxHcYiJITzww+8Acu5ArJgnlKyS8l7NM2phwb9jCBQHgDX3k/SAbV0dvRXOSLyG0OPWrAYxypVLyU6b9vJfgNaftEgk4G3tMSKP+weqDIQ+6v1hkfxozcihqK0VdxKLR35h8yDGOyNrAUXaW4GUFCQK8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWB+YkMm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWB+YkMm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-658cc45847cso10111247a12.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 02:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200138; x=1770804938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LV9toMtWaG2CnsQFvTzbMI2fAsoGpmrHbF+Al0cv328=;
        b=aWB+YkMmbNZjStnikgVwAlAnRg3d2RPx2poh9oEWCYtBOIUXhgqOxbf/7FWyVwxpoU
         XEKbhmw5uCFKfmEiOuEwhtkxdlVoBSLxHu29IvSNEJZhPFrLkxNC6tuh6rEE0dYSMORh
         9hmINq79qUEuelZtE5F17Z+4n9o89JbnLAOk8iy78PqJJSC/2vxArtucFmb47vnBwpwM
         nMAcymLkziHOIokCsIpCRNXvqui9soir/RiyM39474i+MF3c1qwEWuTKeAzGSLrONQp1
         s1nwuxP6hogVtPPZ3GfUEAo6G/kW0ogf1nUABCbeLhPnLfkXkspo/dnsJqdM8fx+E+Sc
         2gpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200138; x=1770804938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV9toMtWaG2CnsQFvTzbMI2fAsoGpmrHbF+Al0cv328=;
        b=SxT/cM225ixCfO/1jg/8yC4+kMpW4Db0azY5BskGAPMHt2YN/6nDhWP15yfcpg7SCB
         g8/5FVpoB1vI88KU5vY2uxZVDAvYoGZGbxMZ00p7XTJpf43mWHH3qdW7eEgY/xPxAZaq
         FcKw85/N15gAPOEfAFNdUOd0vJ9AMj7knDhGt8kxiGHb1qqhwqz8SWaAb8gousJHJcx8
         rWHKetLnGcGqHgIQARS04DNEDKLan7HvL36pEYdCCxhtHx0urCiCPpC2cjZPFzF9QAe1
         yZBuLqvqDGJrd9SnlIjeA9Xu2TvJ/UGz5nneIvRCC3bgBn7Y69eSVYNZbjxLSBEPz1fa
         77XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrOy5tH4KRoPm/Dkpw2i0vv2Q3BCBBeUV0S8CZzDjtsWOXKbjs6Obzg6QOD/judIwUdvWTwPD8bbZ1atbC@lists.linux.dev
X-Gm-Message-State: AOJu0YwoT9KqnqU7cznPMOsmrWEhy7HPLiP+2gX49If3aZN82Grx6d9D
	QyQCcYv/YnBLSxHULtYpUArD/TULKeEJFXbH7DhQtwhWE2jtX4oJ0KfV
X-Gm-Gg: AZuq6aIpVzRCYDVmQ4TIBSjyy+8jqUARAKg/owO4rYoKI2Weu+J41DuHEKhoRtqdhgM
	Lff7Bq9jXGp8RxbNAxlH39spp7qD49OcWYln+2JihtDTiQG0akRwZnPSa9IEP4p/hfkbH66Qbqk
	EMbsXENUsce0lwCcCx1GLtJwNcsXW21IrwZ7JQoG3w49NIJ+h8CFTmFf6OoaAZiOPCXXEY55iu+
	MP/lV2+IYB8e+Ov1V2NFreIA3Y23pblPwzDX95rLxEFm2pCk7EWxwxxskeIqErtIUzPxyWaw/lF
	oiWUA27B87rzU31pkZ3DXlKkP6A/wM6QFOxclRo2KiHrl+uJwiPL/hJe/Tgv6Hqqa3YolknKW8Z
	jneCBWb7pyfnG0LbdMS0J+QAXqCbCIScUSu8RWSPDEEUVbw2PSpe/SoHobHU/NZpZahhVVcAAHR
	wNAA8FXfVYX94Xgm4cmSEtos80Ae55N5grUvtWBOLKKaHXn2nX/EHji1j2C1DASwDaeuhsZJ0a3
	2JFKbNxbbfvCquK2WADPzuzC3vKu0BQjuudW4PGci5qpYKsApWd8H6flCfkJQ==
X-Received: by 2002:a17:907:702:b0:b8a:f2de:e329 with SMTP id a640c23a62f3a-b8e9f080fdbmr169876966b.25.1770200137825;
        Wed, 04 Feb 2026 02:15:37 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.od237066db22328bb-tp.internal (181.183.90.34.bc.googleusercontent.com. [34.90.183.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fef0e17sm106440366b.33.2026.02.04.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:15:37 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 1/4] staging: sm750fb: add bounds checking to option parsing in lynxfb_setup()
Date: Wed,  4 Feb 2026 10:15:33 +0000
Message-ID: <20260204101536.3311-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcat() with memcpy() and add explicit bounds checking on the
remaining buffer space before each copy. The original code lacked any
validation that the write position stays within the allocated buffer.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..0eacb522d 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1163,8 +1163,15 @@ static int __init lynxfb_setup(char *options)
 		} else if (!strncmp(opt, "dual", strlen("dual"))) {
 			g_dualview = 1;
 		} else {
-			strcat(tmp, opt);
-			tmp += strlen(opt);
+			size_t opt_len = strlen(opt);
+			size_t remaining = len - (tmp - g_settings);
+
+			if (opt_len + 1 >= remaining) {
+				pr_warn("option string too long\n");
+				break;
+			}
+			memcpy(tmp, opt, opt_len);
+			tmp += opt_len;
 			if (options)
 				*tmp++ = ':';
 			else
-- 
2.43.0

