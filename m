Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB5170A37
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725098925; cv=none; b=Oy/wNkusHplyAKpnyOmqjB/A7IezDNZJ4RgsIN6hyXbGZRgNqUdP0Ix77WwvqVXDtctjJuAIyoYyDEyu7BrZ+RMJHSL6Sj1HSSIYu9Neuc/NuM7j3MahgtVGjhuXL84u9U0r1o8bSqJHcZ8B+4nz8CyqQFstk+QKdf1G6oprqNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725098925; c=relaxed/simple;
	bh=Rr1J/pn1Hf8bKQKYa0+8wlzWON+yhy52CoDcyw3J4sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prsYpYKCu3cO9EShl0vu3bKIBl8fBowWYF9MvtFEikukumlB7UKrFWZsIs7y567LggEujxdFG70kugQWNPZM4t4vzTUcUuyzCNQjOjoAUDqOkYMlbhSlrKMq9gs0iByGMFd/bBmswb0N49eYufSaVwRYop+TzSoPEyHcx1Khp3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ4RXDNg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ4RXDNg"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so34877781fa.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725098921; x=1725703721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faEhqntifmkFgb+Deyix1zyRhrqBZG7g3qlwMKhNF/4=;
        b=nQ4RXDNgTFnEUzDVkgxX+/4kpoblrxa99+9h143wKsVrArUlCuaGKwnizBnnlPvPhE
         0K9YSIgGv7VRNrc4EDod8Ov20lIUPd5HTyWAPyI9aJoOtXmjG8MAQ1HfYpIHMC7DxvT1
         nveHG22vX3QXeCPDCNd696rtfq2LrfiJZaOmRBgL6ALNIFc8ZQjECcpYbZuAHCtGzzw2
         ubD63Mw9Llt7L38/WdACjDe0sjQb+e+Ja5YQflCyiN5nAWQ/wQDLwaZrE8pLcPF7XWcC
         Fc/K3Hu+E8j6v1k//vpi/F/4vFfJJUUAJ6nlCW3P2GE36HeavWa8oqrzU9oaRK07H0nx
         NI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725098921; x=1725703721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faEhqntifmkFgb+Deyix1zyRhrqBZG7g3qlwMKhNF/4=;
        b=q4LAA+rejpx/VEYLr5fWM+iOExaWQUSbLc1gWgKM38feUMAmH8Wg+OgIQwvXjHron+
         Ubfu8hx25vPRKc2v/axe+WYU20bjeANuP7UjrVvff/EoKW8BO3ekGVR7GFXjiCAUW6oJ
         3xC6qPIYERhgXlTH8+HgT259AksFJj5Aib1Ao2qUHRkbEcmLgdOHZA2NmRiARaWjxNj+
         nUH8kWVitj7cCeosMf907/nmV19E5otJNkVRMiyzJhWUwHRboi4BibtaLQCxPeeYDRmA
         S6Z3pk6E0OCQPbYyHMqBJ5ymNndfFShifUHM3PqIBG+QZ93SaGm9rarSnFUNPjbneT7V
         7O8g==
X-Forwarded-Encrypted: i=1; AJvYcCU1xb5qKEaQ++K4jPOpfdq6b2l9rNwpFMeJ7gkTly069YdVUEXsddTgaWUEHelLcAtT77/w87ehxwdZnFJC@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr3OPwbGfEa3/8jxWOq2OCzApNyuQ2P6qOtmRZ70AgGRgtE1IW
	IDgDb/ApY4XX+a+XVzesloO0SOw1i1vsUvxO+R77SMWl0m1mR26c
X-Google-Smtp-Source: AGHT+IE8e9rNBsAUXRHl6M2ebOrMtLp87eBh45Xf+H+oxYJ9nbGcVyKBCxXSDJ7466hpbgp8LkRuUg==
X-Received: by 2002:a05:651c:551:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2f6105d7954mr81215511fa.17.1725098920668;
        Sat, 31 Aug 2024 03:08:40 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aba11.dynamic.kabel-deutschland.de. [95.90.186.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989021973sm307444966b.82.2024.08.31.03.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:08:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: rtl8192e: remove RF90_PATH_{C,D} from enum rf90_radio_path
Date: Sat, 31 Aug 2024 12:08:05 +0200
Message-ID: <20240831100809.29173-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831100809.29173-1-straube.linux@gmail.com>
References: <20240831100809.29173-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RF90_PATH_C and RF90_PATH_D are unused in this driver. Remove them
from enum rf90_radio_path.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index ff4b4004b0d0..c928bc2b218b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -20,8 +20,6 @@ enum hw90_block {
 enum rf90_radio_path {
 	RF90_PATH_A = 0,
 	RF90_PATH_B = 1,
-	RF90_PATH_C = 2,
-	RF90_PATH_D = 3,
 	RF90_PATH_MAX
 };
 
-- 
2.46.0

