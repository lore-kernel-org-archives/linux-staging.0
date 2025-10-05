Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53852877D4
	for <linux-staging@lists.linux.dev>; Sun,  5 Oct 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759680041; cv=none; b=uF3UCuoMp+TPXfZeCFVW7wWhih0SGqq/rt64MfiG7euyocgMhHA0i5mfciCkIb4gkrdZMo0eRiwNm8BCug2p/FJZGrbzPKNiPYIPwVIR7/LYoaul8y6ze9qyj/Ih7/67n3FOaHjUAhSY53Fx81qu4HTuhl8Fv7y5uQzqKB8SSQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759680041; c=relaxed/simple;
	bh=7BRb6CSK0kHsfrRjcYu7qFOHp/n6tLKeA+N2JV4fpU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=He2zGmTS+6tRhj6DQlLE0I5Q23E4VDXeKL3qp/pdEBWBj7LGkFNi9c6AECj0Lo82ykcje/d+cbHTbq9ZOu125SU2WFAFuZeXFMzKqtdNNDWcXH9MWP8ogq/d0Vl/pxaQFXvGRswD0YokL9mOjt3sQyQPkauBIgCDmMnVlLuHFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0PXVbXz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0PXVbXz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so536399b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Oct 2025 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759680039; x=1760284839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz4lR5kbOnskyYsmRn8uXD2AKGP9XR4BeNV5R+i8u/U=;
        b=k0PXVbXzQXN8mL9cp3D9rD4c7gSmsShv8aVt/kIbGYPlOkTjXG3xV60k1EJVm94CbT
         Z+b/PcvKSbXiu2hx/lGyVIV0zWn3a6ZkJQAPKuVqnVVJmwrjvc9eoU72gkuRpey2uGzY
         mUU8dZogOiFOUlSBdW/vGPPVuFv56LA8oDQs6TSC3zK36DUmchcEzlnHspipEsiIKckG
         QycMsECd5uIRVgx8/9vgJBkbpSAjx6AzdVcodZAfthcWTZufGrfDC64bPu6lqUKdvj1T
         iaH4oVtzlxzWQnxK+rDCc1HPisbFEpmzsK2s6zMXAy5v3XhvnaNz9fAk0U2LUuPRY6Mr
         Ut3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759680039; x=1760284839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz4lR5kbOnskyYsmRn8uXD2AKGP9XR4BeNV5R+i8u/U=;
        b=RWsb1I6WOq9yT5RbGyA2BlcdNJ8+pL+5USX6tbZBmnCvugPnigkGNe7wjEFIFkY/ob
         X/uF43qDJSwWSNTTjF9odMyywC3Ce4mYNhySjNiYQtd3k5Oqyzp1Vh/dMi7OnhZNbmS2
         ogZnyD1WzMcwiIuLL6LndC5/Osrj/7g3Vjz+iteYn0JeccW9ci+mH5kUopxhRcVf/lA7
         kn0CwLrX0BQoOyah1yy6a+kwbYFeylZynadNHc1/hTCJ6LMerrjXoduLvP3SEi4uC7mU
         nRFhIoXI7b2+zTlxhHj70b1Pq1aMcC77l9boksb9ZAYF4H+e+ba018jaGfgNgdXIvbvy
         jjYg==
X-Gm-Message-State: AOJu0YwTp0vIgWnLBxdqHlxMFN2MrGTgu4OAHyt77YLalTjPQoXQH1pW
	von4yvqCqLvv/fKxZ2CHyGm3Zvc0xjmqwhedjL+gwjxejET+VDMZQHrXUZ4qpqWc/Vg=
X-Gm-Gg: ASbGnctfHXB6ug1tZIUQKpu3zBaUXjfPghBTx4CwI3u+bT7m2qmHYg6Np1TeLRml/kl
	yD5ZWqN8E5yKbKdT9ssBa+of2ZhI5U8B38LyNEQDhCZjGgQ3K4GXnQ11p69OmysGWE359UfSz2e
	LTwV2xYUXxLtSNj4JPaRSGzWp/1ArsgMe7eC272QwmyeKiObSYy0r73lRNRcPzCYYj/0/j3KCjD
	nhTGebrrhBuTt0WVlYEM/4Q0G8YKX8NY11klKGqfpKRdglMAOSjrNFoqQOInUlmz1gFgc2OJiF7
	JQGBHDAAKl96I1gjAh5STW2kmMenFxxIigsxttwjipakoCfZwTDi6tqquQrDVU2EKZOnUcwRx1Y
	0LKK7neLYoLcM3QqpRWMcExtcr8J9Qxh10C1llKv2iMb5R8ybVXgjBm46J7N5ihXdzvNlVi85pU
	AzSzOf0A==
X-Google-Smtp-Source: AGHT+IHewuFi17KrFS7X0t8DS6EyPzjrL5dATHWslXjMNmCmJ6tcyhcCvWNdOUfcbZvUZETwG2aRBA==
X-Received: by 2002:a05:6a20:3ca7:b0:318:a8ae:289f with SMTP id adf61e73a8af0-32b6212bf4dmr13538197637.56.1759680038933;
        Sun, 05 Oct 2025 09:00:38 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb3d95sm10145241b3a.32.2025.10.05.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 09:00:38 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fix operator spacing in rtw_ap.c
Date: Sun,  5 Oct 2025 11:59:20 -0400
Message-ID: <20251005155920.381334-5-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251005155920.381334-1-trohan2000@gmail.com>
References: <20251005155920.381334-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adjusts spacing around operators (such as '+', '-', '=')
to follow kernel coding style guidelines and improve readability.

This is a coding style cleanup only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index dddb02c0f683..4d11e7a84abe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1471,7 +1471,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
-		pwps_ie += (wps_ielen+2);
+		pwps_ie += (wps_ielen + 2);
 
 		if (pbackup_remainder_ie)
 			memcpy(pwps_ie, pbackup_remainder_ie, remainder_ielen);
-- 
2.50.1

