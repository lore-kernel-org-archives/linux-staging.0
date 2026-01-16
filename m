Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C4346E4E
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565164; cv=none; b=exYiYNIa3vyZesYcg/Z5UphtBg9Jk0uQqa1TdlTzYv9hoxLwjezM+0KyqwtIkIzAi5O5IA47ILzAYnipT8ATr4bT29bmrGCL7dxzv3djw+JyqDJYWdwZMp1RsbsuRh45oupqjemqCI8Ytpscp9mEpF9A+KdQQhFeU2idWM6M8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565164; c=relaxed/simple;
	bh=I1zPu3rVs8+haO75MJS3Fb610ZW4SW0AitolOaW+/R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEPR+lqZ450n9ioNlf0ZgMes1s7QT7qbE+JbdHPFhbgBlEbBydTOISqcVtjIxL/VJ8r2VZYZC+n6Rc/ORrPgExPgvRzNxduXZe4MwgdQUsVkV89LkQHifxtnUddmEZ3g8Nla7kqc24OfygvHjDSsF0F1k2LHh3pQXzBbE53e9M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8IgC84C; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8IgC84C"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c30f0f12eso1087043a91.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 04:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565163; x=1769169963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inaMsWL/zZjNaDGQPctz9fWTAXl04v9uFp5IJxAS718=;
        b=V8IgC84CNkyuEX8VIe1FdVaOzp1O6CU0CbQvnMwAJCMdj8mUZDorh3vbd1YFC8xAoo
         isYAD7/g2NwnVv+p2bhJZeUyzvXHkYDdCzqpw0+e1OOBNOVqcYw0/IjZKp6MLGV2sSjM
         1X8s4ChhYtdXDQds0Zoo2vCx7K+WB+cfOmuTUdMoDcLXA/YEPEU2QZPgoEsQ1F7yeLLK
         /3p1hfQtFHyu9dfwW0yuHB6AxMaAZkp+48P5g6k0wCBhQRMb3oGXPPvsY0TzFD3JTEIU
         bs80L8PEhexSb7laPQ+6m9ZSSv573ViHKaHeKbL6ksKzV7ODXUcI08haNThhvxXALTOg
         V6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565163; x=1769169963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=inaMsWL/zZjNaDGQPctz9fWTAXl04v9uFp5IJxAS718=;
        b=U99Yetf+7IEYlJwGjPZkshWtMKRxCSeFSNjUYru6hd221SA5uUIy81Ey2cUjmdnMq5
         twsHph3gefB+QiOsUfa2AR5caKgJya9Ypxs5gDAXHHSAViyQ/UagGaF7X+Z8XC51Lp9x
         Q9h4M2WDiBLayq1R6aWQ7PhXV1AEiHeBLFzjbHUB0rdfTCrJD1XMtE4EUtdX5S8HkK64
         yBdztVxLqIhZg/NjtXnU7kdNy5E88e+5jrGwVYmJeCZq0GHe4XLnc5tCQCe3WSLzmwc+
         dhx+r5KArH1yZqwV1AhCXNaJWvipAC2uxUAktvE/4N9Os9Pj/t4dZDNYXsKQalI6niLW
         Xypw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ28DfM5+iYXE5GrD9Y5mrqEoROjnOXNbfDE+OwiXfItkqVZoiKqavgCzSB9f58bqtF0FdtdSkCZysCVNZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7kLigRjJ0gBZlTTUiJXqtpXUNO6uq2IwLaxXxxGo6nDdG7Y0r
	MxozjA3+C8BdrCRl3ILGcWpkOnhcKUjBmk27RRb9UOVVHYAcO/8+JXsU
X-Gm-Gg: AY/fxX7GAwuWaKmR3Hz1kc7buBhtW0K451uqCOgYl9s9PUR+dobEJ9jJ8FZ82vIH6jq
	o03ZiosuJJ/xRZVZC7YYSOBf8mh+3zwQMLyi+XLOMm/S96vFNs13YL2khaNpyqLUTHT6+1uAILT
	bRMvIxcO4hqAVrdjQtqJOJQw//uKvlotCFnP8/655TG97pOpUWMgz3tIZmkqL/1VuOQVZMx9Xg3
	w0U3+IvdCwwJb883KzqGLAhvhszuA1K+TzFY8nH+8A41LXLQk72OB2ctZDLzlhoZFxPvJi77L+t
	zP9aCi02bI0SvD0CS2iUCm4ybLnbOmBrS/gNzPNmhnyrWQ8gvIE3+MKCb0eluxDq5WCHZesdv6v
	M5rSDqsFis+mlc9DxMmJUOLpZyXq/O9bTppNOqq/r8YPxCzwVuQlGK0xJkki0AW8D+2jAhvvpxW
	D3TaWoswkucGNnyzbQlily
X-Received: by 2002:a17:90a:da88:b0:340:be4d:a718 with SMTP id 98e67ed59e1d1-35272ec4a83mr2328527a91.7.1768565162565;
        Fri, 16 Jan 2026 04:06:02 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527310202dsm1992539a91.12.2026.01.16.04.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:06:02 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v5 1/4] staging: rtl8723bs: fix block comment style
Date: Fri, 16 Jan 2026 12:05:08 +0000
Message-ID: <20260116120511.48272-2-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116120511.48272-1-nayana.mariyappa@gmail.com>
References: <20260116120511.48272-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed multi-line block comments in osdep_service.c to follow kernel
coding style. Fixing the non-kernel-doc comment has been merged into this
patch.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..f2d9c2240c9b 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -6,10 +6,7 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-/*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+/* Translate the OS dependent error_code to RTW_STATUS_CODE */
 inline int RTW_STATUS_CODE(int error_code)
 {
 	if (error_code >= 0)
-- 
2.43.0

