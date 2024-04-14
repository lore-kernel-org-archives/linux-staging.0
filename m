Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFFE2421D
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713089612; cv=none; b=NKY2dErSc4AolWlZ1/haNQQKETnqsebThLaTxOsaAgPAy6SJqUguTcCmCYF9OTpx7iI75/ddlqcipu8CDhNcSuXpkPoU1gEJ2lKjwIlNAnUQjjl2knKiPE8c3zuI5DtqMgIA6kWGD0GxYpjbfXJ7HLxWDKC30lltnU78udqsrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713089612; c=relaxed/simple;
	bh=eu3RIPlesOCMNpapPQiLQQGHQ5c0R8gFHURQsuCA0to=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pq1T8itkdyz8YItAqwJvqc7AaZsC6UMgg3AbMV573dqFHJ1P94ddqXhqWqY4p6Jg9ljCSJPo5RRo6OjAGmXczfZ6276nIiKBXcxHCbE55CG6Cbpf2YikB7yvGx39hRlXXIP4gi1Ur0be0qUn0snGPiKDo0ZawqaRmJPu++vTALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eraxfm2+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eraxfm2+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1782869a12.1
        for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713089609; x=1713694409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppS6ek5/XJpbF167CeCFNk04CBvsK3wqfw3EHalGC50=;
        b=Eraxfm2+yeJsUVRHU01koBHq9erI4daUAmzXO9tE3XxM7HsQoD7OJ3Pl9RJuEKD6uQ
         Naq9s/zBnloPwo5bznTfihjdG0sfoYYRXPUw9uQv1bDiXpcsSEQcTEO1bbKhM8201lRp
         NqfzYXr2U0f0hwn9MqQzIhoMiD2nIMJ5plRVEDSSfMk182BJo0QIZ4OT0tl5/9FU5n6l
         zH+D+EPRcPlmRS+EzFrKabra9BaK2gstEksNq+VzNeIZky++PyziACBmMq7COR1XZC0G
         nr11O3YiV7qsY1Ty5E0u4UQqc6WTcpaTFzPuObS761s/Bxu9AqYRsnZ7kU8lrSJYNw90
         TNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713089609; x=1713694409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppS6ek5/XJpbF167CeCFNk04CBvsK3wqfw3EHalGC50=;
        b=geTCa+xM1nr1RCNnULVzqPy1yuJN9xFpj5nfpXpzSHsTwijWOiVB6HzzpDM3v/xbdk
         JVObIA4nG8NeUcCcRsxXJeJ80PZVC9EzjnSX9FnVAKSN24whNdiw79R1q9EixBBFpzbn
         /H11RiAgwbYQnn5WMRf1FMvPH2PWjMqbFEpYvJ5aHisOKEY65WDRuAn1Tg/jLdqvDlma
         Gp3YanIbMQ9aEqZS0dFprM6CC5FTzkfNP0XhS/o24VgQCHdDMi9Swe2Rim0s4jSJocMD
         GvGKvzkppXO4xOjrFpDmEOuTWGizpU81L+WonZu9jPSpD9TA09OXJS+PkPJRbYacdOzG
         4rHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdaf+Fx8nb7yYRSCeEVm+skFFfNU75KjR1p8cKNr/MNqiwjCeLxECglOu1N3+ZnHbLF/DESUNpEqtTNRtGkMiazE1uEFDrYu3vSY0i3Q==
X-Gm-Message-State: AOJu0YzxhJF+Jwf5YWsCxgpYKA72PjE/GHFZUH9izi8bNoOqcFetRFKC
	3o4B8Gv5UoMNm0KzntUm/OWxBypxz2YlF0AKYKefc1qdfXM4vxNS
X-Google-Smtp-Source: AGHT+IFOEUpKQEYzn1hknyRGE+08JrW+3bzlUB4i2iZR8oLtnI9F1LxxbNLsHakD5WowNGpa5ws/9w==
X-Received: by 2002:a17:90a:38c3:b0:2a5:37cc:cc4e with SMTP id x61-20020a17090a38c300b002a537cccc4emr6114571pjb.32.1713089608646;
        Sun, 14 Apr 2024 03:13:28 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb8:5ab4:8eca:a8e7:b24c:7514])
        by smtp.gmail.com with ESMTPSA id az21-20020a17090b029500b002a0187d84f0sm5304830pjb.20.2024.04.14.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 03:13:28 -0700 (PDT)
From: sumadhura kalyan <opensourcecond@gmail.com>
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sumadhura kalyan <opensourcecond@gmail.com>
Subject: [PATCH] staging: vc04_services: Code optimized to use linux BIT macro.
Date: Sun, 14 Apr 2024 15:42:58 +0530
Message-Id: <20240414101258.98358-1-opensourcecond@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue found by checkpatch

Signed-off-by: sumadhura kalyan <opensourcecond@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
index a0cdd28101f2..d811bfd3bb84 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
@@ -27,7 +27,7 @@
 /** Common parameter ID group, used with many types of component. */
 #define MMAL_PARAMETER_GROUP_COMMON		(0 << 16)
 /** Camera-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_CAMERA		(1 << 16)
+#define MMAL_PARAMETER_GROUP_CAMERA		BIT(16)
 /** Video-specific parameter ID group. */
 #define MMAL_PARAMETER_GROUP_VIDEO		(2 << 16)
 /** Audio-specific parameter ID group. */
-- 
2.25.1

