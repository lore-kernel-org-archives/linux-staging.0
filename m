Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216359B4D
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308311; cv=none; b=Pq3kjpQE4/ABaXtka5PdNS0YbCt84PuJktYypunpaT7nozh8f+XKEJuVYgxYKQ8/7StFAEByFlS7rAvLz8IzUB1sfWbHqCCf6Jmd+XR7cgmYHsvHgTJdCfBzGtcQ+tmySJ4ynQiDuHyJEPgeTiRLHjasemvM7RLaZcAFAz63d4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308311; c=relaxed/simple;
	bh=c/Sh9PRJ8GX+JkwZWgUrdLEBHDSPigEF73skZkz9+Wo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eyjOBnR3Q/PZkvUUYqIiWBeX4X4DPbgPX7OB80INjpkgsKLDsNI/j2RVJArF6YZQBBaAkTSLt75CcJvyH6DTvUtPPzVNCveLL+2WvaWT3jXinvdzsvU4sks5FAkHqMklJnpBnJjqO5Rw8hnLz1/4bkQmVQ1Xmorx/Aj7kI+2FQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=RutbVkxW; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="RutbVkxW"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29080973530so928751a91.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308309; x=1706913109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJnSm+DEHNecy1tYaBiXclaJ5sFH22g6A+EL7JgZ6iI=;
        b=RutbVkxWRaj9/kbUbS02XwQlVqlcu7040yTq0/LlCRdrEn7g4klQ1KF1UO4foPjI/c
         rwD7ety9PlSfY+ZHBU0DpiMXmbDWIm4q+Ike1wloAZ7YEdUfLMWaNgaH2WvYCQRXtxND
         Bcw+1ioXjIVTnp6xrEKJjyzTzW32lE+2huNUlCT1pKvlBlDxFoyqxwc+vPQ1HZctjbtT
         HU/SDzg49KlISX/GP2ZhL/jvcv++tx5r4L6s3Cv9kCaPOXQdAtaylENcBtK8kbEffbmN
         DwEDejxUGEJGsmLJ1hgIteT3hQcswPHEknAXCEb72ZfP3kNfAEKLXn9ZQ7vU+e2/ZDqI
         geVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308309; x=1706913109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJnSm+DEHNecy1tYaBiXclaJ5sFH22g6A+EL7JgZ6iI=;
        b=rSqVjZ55sSN4d1XQFOw2jXCwJ32D4DVe7z4WfLADPW5msglnAn5jt/c0fPvPYxMQvy
         ucoJ/X69rYCMA3aPYX1Y4vF2Zt3Bnm9IQ/VwwcyJ8Huy1+R3ahTgBzlBpFHtb6tUAXJh
         bnIU6vISRCrHefoFuvf8wMKXN/xxSzEHRJebg6GoraLrsy3N6sYyUsyMdLhtaTxuP9CA
         aVMIYpkgfwKiRWEXzRbjsvCMQpGNc583Q6cCDyR8hOmBx+M5SjJ5jJCzySfd3p9yH/Ue
         4RNStZTgDYWndHWzKBJswNw8hpO6CpfgMS6E45nTX7ca0p1MT5Bnk5EZLnhtgj6aFHqL
         gmpg==
X-Gm-Message-State: AOJu0YxBUSNCDdiyQF11Om2vaqEdsfA7vRRRyMiR27xOlBtGoCX2grtK
	07OmBa9FmYN0LFIAmp87I6WIgshxXOb9asx+cLlR0m8NVIQgKCp0fud96bo4ZqM=
X-Google-Smtp-Source: AGHT+IEYYS8Wepck+t6Q7uC2+EO7+QJsHE6KYqDSu6lWOjJuwRCpezjdFDWTL2euMnocAbGygCeBjw==
X-Received: by 2002:a17:90a:6e45:b0:28d:dd91:fdf5 with SMTP id s5-20020a17090a6e4500b0028ddd91fdf5mr593246pjm.23.1706308309099;
        Fri, 26 Jan 2024 14:31:49 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:48 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 14/18] Staging: rtl8192e: Fix if statement alignment with open parenthesis
Date: Fri, 26 Jan 2024 14:31:02 -0800
Message-Id: <20240126223106.986093-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a space in front of statement to fix checkpatch warning:
Alignment should match open parenthesis

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index dc91e59f1bc2..5281138ad468 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1207,7 +1207,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				    ieee->current_network.flags);
 
 			if ((rtllib_act_scanning(ieee, false)) &&
-			   !(ieee->softmac_features & IEEE_SOFTMAC_SCAN))
+			    !(ieee->softmac_features & IEEE_SOFTMAC_SCAN))
 				rtllib_stop_scan_syncro(ieee);
 
 			ht_reset_iot_setting(ieee->ht_info);
-- 
2.39.2

