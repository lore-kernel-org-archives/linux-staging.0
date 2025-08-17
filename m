Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB3486348
	for <linux-staging@lists.linux.dev>; Sun, 17 Aug 2025 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755458703; cv=none; b=Y43gqnrfvIMebd7FxnR+ZoGfRQrxWX+QionRJjMtfzyRZ7vQueMb4uhnokmb+n13PXOA8ig8cTs9ZFQtzxy/+YV/V/piGJxcFZvZHmMROCmdQRWO72ASAPZy2TGw5+W/Qn+RlB5eIDgBDNnrG0B8rDpsoublDPWfN1VI+YVX984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755458703; c=relaxed/simple;
	bh=xL6R8m/nXCFkJx9BMX3ZnWeIl1yLQn9APl1EfADjcYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvQsEnmLKhocU5SA4wN+SK2Nh3gjGnIrts3d96o5yde+o/YSB/vYbo+6Y9z/8IV3Z/spyjhLgTp1W46O6jbJX4PvnWc/AH6is9lgtVTlgzNbL4+LAYFyxkK3K4BE0vjWsMiOBUjnkAag3CLA6+DWulqcpaUz6BjtVGJ4x0p2qJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip5Pk7XI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip5Pk7XI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so2754155f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Aug 2025 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755458700; x=1756063500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FE5LvxHI/u/9rY7Jgwh0AsRJ/tZlVUrx+gbhVYMLy5Y=;
        b=ip5Pk7XIyb0aLM4XuUcPp1mRFdkh/NdGIeHUO/2pEZXmILJUW81mVJi/KqG6pLA0wQ
         WNuE/7UenKTJbZO4+T5b4kBgn24rS0CQuDQn3d3D3kVkKnNXAWhjdHz8AY8KIp6uTsSz
         0RdWNd3fyx75WCMYfP4Zvax8znTnE7THFWuM1e3TaWR+zep+EO9FA9uCuHr9/j1smyzC
         IianTMsv9YYvnjDAsRnVt8sm0jxqWzKwNEyvr9e59QOEMP3L5Q3zvwxS3pHOp33edmvC
         o6juEQbwWjqN4cWIp+iHoSeRUclp0XXDVFP31ZXP5sOSuQmJskCHY9rGsGxmx/rUq6vH
         wZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755458700; x=1756063500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE5LvxHI/u/9rY7Jgwh0AsRJ/tZlVUrx+gbhVYMLy5Y=;
        b=Ix66MM6q6li9esTuFB7KeY4+5y6r3cg6/xBOR/8MR5f4DoVE65oPK7ORFocDlk/1ki
         GTsM9U+tbkoF2N7oNZ/4OVbBhFLisWgW7lfBHSjfl1KHWJLcB3sHQUO3G6DFKEDktUgl
         v1srXogyxMkSgclXhWI9RgyfHwcBxNAEjWt1nCSwaHa9RgjC6DJS5uRSNDyV+H00Nz5H
         aNE7L++juuOYIB2Rz4oxns/cuWH0XDPKXkcI3cuzIZjvED/dsyDKGujcy1hbrBqCx14c
         Dke0OIB0U6dXRe3Nb34mo7w/vZabBQt/uC5hcuNVQI+gMNJg4ha541AFxMyUifjs2dD9
         VyUw==
X-Forwarded-Encrypted: i=1; AJvYcCWeul2Y+WDX1AIlVuld2JcbLDNlxCeIgt6qiHTsFmj7v5AgxnD+GOK1/gs4m5LqrRfpNY9KLkiMsetG2sDB@lists.linux.dev
X-Gm-Message-State: AOJu0Ywoj/yetrbAHtNOkNLvFud4WPcaN8Smse/FbS0e9GjpU59t5LqA
	/0V0PIW+f3nzVRCLAdMlxX46dnOz9T2rsqnGKcHqLvYQzF9bpIflSqEz
X-Gm-Gg: ASbGncuu4m9yUSBBaX+PiZw1ULIzHz9ai1KGRKl/6gLdKwmNU6vheT/9vjei/JG8Ste
	9506+jwx2DgRmsgeghyR5LX7zm3PzngUYVLZOHwTILoDNkSm1i/ux4+erFb2FxA31XHA3dHnI3w
	Rrl3n4fSqTSn6Q0NXElCpqpsBFNc/f9mgoZ9UzvY9xREu7t4Nj7csHS5tlAgRZKXMERsJObItq+
	J4B5H64NhNfPxJVRznlT3NgK8zdMURBGI6q3p42uc9db+kSQqIWYpyU8O51mdSOYPHdk7YXBxsP
	pr1We+F5sK+QY4VUUGup7bxGR9nmUDZUPTekYkPzLnSbiv0PyfwExcxbhvFFeOZ5QpCG8KFatsN
	cyErp6n7GAvT4W+zQbu674qaYV+/kd6CkVsm7ZcNa6FF7iU+fWKvaEcTeQZKqdlS+dnWFYYbPGD
	NKJIIcq94U3IQq
X-Google-Smtp-Source: AGHT+IHbLevYiqVnCty4Q8SzEZcXz+rOpZ/2YyoJYFaBeEoB2NwGJh23htNkZ/5c7jJgxTuiXI+kqQ==
X-Received: by 2002:a5d:5d0a:0:b0:3b9:8224:d3cf with SMTP id ffacd0b85a97d-3bc6a83c6b0mr4325502f8f.54.1755458700279;
        Sun, 17 Aug 2025 12:25:00 -0700 (PDT)
Received: from simo-20nx006jmx (adsl196-126-73-217-196.adsl196-11.iam.net.ma. [196.217.73.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cf151sm141569315e9.8.2025.08.17.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 12:24:59 -0700 (PDT)
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Guermoud <mohammed.guermoud@gmail.com>
Subject: [PATCH] staging: nvec: Silence unused argument warning in NVEC_PHD macro
Date: Sun, 17 Aug 2025 20:24:25 +0100
Message-ID: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVEC_PHD macro was defined with three arguments (str, buf, len)
that were not used in its empty body, causing a compiler warning.

This patch silences the warning by explicitly casting the unused
arguments to (void), making the intent clear without changing
functionality.

Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..7accdcafeeac 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -28,7 +28,7 @@
 	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
 			16, 1, buf, len, false)
 #else
-#define NVEC_PHD(str, buf, len) do { } while (0)
+#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; } while (0)
 #endif
 
 enum ps2_subcmds {
-- 
2.50.1

