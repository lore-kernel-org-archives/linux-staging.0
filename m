Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA13194ADF
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 08:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328198; cv=none; b=kuNOoEDA2WO1AbAxwpsG5teUsCe20ZV5FmIs+51+3pXiSKuczX5vXKaW9wIRdOIp7X1DDzmdHGzO8sZ7cInNoW0wsvQEQfbewnIzmOgkhNnglYz+oEmtu10JPCNVmnTInTtIF+tiuoe5DKYUKBMvV+xb8szdxnLZdyrKqE1JMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328198; c=relaxed/simple;
	bh=Al7tsybQ8Ctv+Z5ysbndis3b5/TMJcWb/PrQJk3aAbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dOMjXRt51886EsNTamTVJ2ECbPrj9T0KMo19piNB9Oe9+yXwJi1E9Zv2CL77d5RKkM06Xtbdr8x4UDKLN0fbKGunpFVNtbYPsq4QQ5W3qk6ndnve7rPVoarZVdV3nf9sZ973Za9Ji+nEfMfCz9iUlmJ9dMMzB/g+gu2r6qNP4oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5clcyRu; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5clcyRu"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a94478a4eso889475966b.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722328195; x=1722932995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSLp9jYDDTtURILO5YsFnWIzYyPB4gqC+JAko4lkDHw=;
        b=S5clcyRux5XEcbuf6bD4itsq6P1CEfyxFJ2z4jzP234RgC/S9Jkh2OdMJI78/tkpum
         FWddos2wthB+SDE5DbqszLOIIrQ+N9hBSA3YosDi+JHBWtVqtaEGd61qzu28x9rBc3fL
         +Zo+zKgWzUeTwKyu/HLKoHw7WoRnKlcOBq/TjSKoiP0mDwoVPUkfWBtx7M9arvdc5yHh
         ah6epGNt2x9v7lg9KIoMge+wUugeW7evY47kXTiqmYkb5GSQvjKc0/nDWT+vXbK4NI5o
         tkfFbpV8oVOZD/IX88LEZ9qM6LNESAKjKsl1Uxa7ZgdhTEqagUcwyus5qM3orM49GP1S
         cXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722328195; x=1722932995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSLp9jYDDTtURILO5YsFnWIzYyPB4gqC+JAko4lkDHw=;
        b=lxEd0JCbs0B4/7NAwk+EtTzIOT8tdwbBw3pZy3qLiExBu/9BXhqvkZxaDtY1qAdToe
         xHDinOCkTeHRU+JGHeCAxHg4+hEH7/LJ+bQinvJIGRmNjKvGcWP+oPW6g/eQ7j83e6EV
         EeEa+/orLXMe04F0DOdGiEIcOqWMnlO8ufoljZVRfTzFtTXo6YKiZGaf84QfJbRryY9g
         LmBzq5t57//+ZR/xAazJwRZLLwS5IxDw0CFyMJ9MBTLy8e8pKwo1Sac3iDmoRbAHTRKT
         U7GI+rd+jcjm9mURZFgSluR1kkTeqfHlBU1T6JGciEYCXh5Q3HycMP1+eioffzqGg6r2
         UkrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM4Fl5tnBgHjS/Zy6xJGK3tW9J6ssUNhTA2bhM7x2MvYFyys26Fw43UqPaNxF5LEEuyf3kpiehyj3OCnzGZVMnUtIb4ARfdS5IORnEzg==
X-Gm-Message-State: AOJu0YwmulfXkbRzxZ9/B/v2GW3DLwnttDkDlR7RZ9FgOReEarodkFxe
	twhhWBYsf3CA79l7vjUXAsgs+aJ7GWZzNph3OXcbXUwda79FLRsZ
X-Google-Smtp-Source: AGHT+IFYJFEV69ICKm3oEDcJ7wsBCqMqDn9jck+E/Er1ckAxB+rEFJtnkwVItn5U3MoSYij7MOs6Cg==
X-Received: by 2002:a17:907:a809:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a7d859eadecmr116807866b.22.1722328194887;
        Tue, 30 Jul 2024 01:29:54 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aba2e.dynamic.kabel-deutschland.de. [95.90.186.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab4de06sm611231666b.71.2024.07.30.01.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:29:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8192e: remove duplicate macros from rtllib.h
Date: Tue, 30 Jul 2024 10:29:28 +0200
Message-ID: <20240730082928.62284-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros just duplicate macros from include/linux/ieee80211.h.
We can safely remove them from rtllib.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
compile-tested only

 drivers/staging/rtl8192e/rtllib.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 022851b7f1a9..e87313a30741 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -414,17 +414,6 @@ enum _REG_PREAMBLE_MODE {
 #define WLAN_GET_SEQ_FRAG(seq) ((seq) & RTLLIB_SCTL_FRAG)
 #define WLAN_GET_SEQ_SEQ(seq)  (((seq) & RTLLIB_SCTL_SEQ) >> 4)
 
-/* Authentication algorithms */
-#define WLAN_AUTH_OPEN 0
-#define WLAN_AUTH_SHARED_KEY 1
-#define WLAN_AUTH_LEAP 128
-
-#define WLAN_CAPABILITY_ESS (1<<0)
-#define WLAN_CAPABILITY_IBSS (1<<1)
-#define WLAN_CAPABILITY_PRIVACY (1<<4)
-#define WLAN_CAPABILITY_SHORT_PREAMBLE (1<<5)
-#define WLAN_CAPABILITY_SHORT_SLOT_TIME (1<<10)
-
 #define RTLLIB_STATMASK_SIGNAL (1<<0)
 #define RTLLIB_STATMASK_RSSI (1<<1)
 #define RTLLIB_STATMASK_NOISE (1<<2)
-- 
2.45.2

