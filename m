Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C061494B5
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 06:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722322123; cv=none; b=AJTntkDD5DmXYie3emtWBMxn2voxSX3GrdD0ygNxReL6cZhfGeztL4LG+nPsMtNmHS1Xv+v/n+cf/UC5GlGLUGljxfIs9uFn4XDV6ekVQTuBwtTKgDGtRie2ZA10gKwKdunVOFPVzKCHMPpk0TD2sU6ENXoxht+j9jtmnhS4Qs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722322123; c=relaxed/simple;
	bh=U43chPMgp9SPOW5AMAOve+T6qqvBSKJGkcenemPpM2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QiyIfguN7tweQVDCqR1fsFuSxxoTf/oQdcRbMAFHI3tNrOaOkf2UyAhd9QIPnnAD2btAtNVfwwmnp8yETselusiKXiKO7DuE8l6i8/VpGdzS1/tlK7OXirGq2tdzP0P6gR4sMft8TIg5wAQAviNv2HW8laCEUn2nV8ekt/ykh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFd9rLCR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFd9rLCR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd640a6454so29304665ad.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Jul 2024 23:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722322122; x=1722926922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vVHat7cOV4uaQtdGpP2gIwZz5RzJ9bcH8BvyKEYBFNs=;
        b=JFd9rLCR0INZEamtfJQU48FGrUjjE2VDr4cxhJPVbZsbLqTYFhUzM2q9Qk2/r4OFU5
         gvjGvRQC+oawKPrgpDF9elBMUtLH+K5hkUOuMGvxK1dOoseDWJAepdyQS3ZPcEAwp1KD
         SEESyK6+O1DUphiAuwBV8KNwFcYDPxeRXOYA/okUBMGtY7TAzEJ46BUIeLyO6W6z6OGJ
         EB2dgBEO1r7R1rCBUfuLnyzZwWyy7mWoHBiHVROyOHXh/TvRSdEyL1OOEz3vdIdCcsxC
         aeHhoK/PspZCc6gZmaIw36KvgltmvGp7pdNXr3s0XuTbAp2G7pZps8sbOLBh7ES27eb+
         JoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722322122; x=1722926922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVHat7cOV4uaQtdGpP2gIwZz5RzJ9bcH8BvyKEYBFNs=;
        b=jNNoUI7WtxWRlQfO95SUC6FEFJDepqpcS6sQTyuleVYspJBeBdunK9RfvZSRwKhomx
         ejAN7ndUwDOs5CyMOHdW9tz9jAfbNRIPwS8El9FA4e/DZTbsPi+AAMeGebvfbJPq4xz6
         XGBNrK+NiQFWPfKqQ97tnTo01tn8JtpLBEt0ACHRxWIUBI57FCNIfH6upBHYr9cbuJiI
         cwYpo3U4oyFnOUXR+kgnILQm1lTqsQf9mXevqTePHs80+Vmkzo+VB7mq0+eCjT3EyEz/
         FRWOVKtqD9TEDKKpbeqErBhccZ9kP8Ej856Zk+UeU0ukEhv0e24zVYsshIh+AORhV8q+
         GCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4GGxLPpOLXEhB3cddBxIIyZg3RHJ8Lir3YQouqbiy4J9t/8QWfR79SDr9wRX0PjaOZhoPTDFY6Nth4Ijx3Tyt2sPbHfOZCwVXi0SIzw==
X-Gm-Message-State: AOJu0YwLASqZPq+84kqiQjgMkSI3gw4Kfdv+M4/dE6tPXsChy6k6etQu
	v9lDH2NO55+zZPO05CNKX74Q+jqMQa3ohSDOCn+vOgQxehnx+yyWCPS8psTyU3Q=
X-Google-Smtp-Source: AGHT+IEbj8ZgOJdNufAEPBPKNp+D6yGHdBJWGuaoRj/JUAHVx38iWWJcMjVaBVAsDEA4d6n1dCPF3w==
X-Received: by 2002:a17:902:d4c9:b0:1fd:a264:9433 with SMTP id d9443c01a7336-1ff04842238mr84949035ad.29.1722322121534;
        Mon, 29 Jul 2024 23:48:41 -0700 (PDT)
Received: from 3a25d514abef.debconf24.debconf.org ([116.89.172.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c88a67sm94162715ad.11.2024.07.29.23.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 23:48:41 -0700 (PDT)
From: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH v2] staging: rtl8723bs: style fix open brace on new line
Date: Tue, 30 Jul 2024 06:48:28 +0000
Message-Id: <20240730064828.35207-1-sskartheekadivi@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It fixes the following checkpatch.pl error
"ERROR: that open brace { should be on the previous line" and avoids the
warning "WARNING: braces {} are not necessary for single statement blocks".

Signed-off-by: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
---
This is my first contribution. Hope I did everything right!

 drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf96b5f7a..5629123cd 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -81,9 +81,7 @@ static inline void thread_enter(char *name)
 static inline void flush_signals_thread(void)
 {
 	if (signal_pending(current))
-	{
 		flush_signals(current);
-	}
 }
 
 #define rtw_warn_on(condition) WARN_ON(condition)
-- 
2.20.1

