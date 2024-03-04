Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C043A20
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571622; cv=none; b=ZFAA1HHUxxtncmJfGtlI90FwyjXKY5ArPd8LHZ/42KnWfKofVPVGNl+KKb4gS/OavNgsgdg9UWMvyxdQaHeFPOmqfmx6xx2Cm6GA3l8JF6AqgwnrE4xhz0u7osTnl36Ll+8J1JuWYAgzbvpWMokOUI71skXz+xhQwaYpHWnkW3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571622; c=relaxed/simple;
	bh=uB8M5ZFqU823RPwkCme41wqgW8S1MAohoBHD2f/FRBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G2VbiZeOi81HMU9CAa6Rt6wWatiTtufaISy0D4o4yO/x11ksIU/AybLsm9/jTfyY9ajb/2jxfe1lzB9aTyt4xN05Df8r165FyYHWUUi84WdLu1arvSc+0yHXKHV1SGPI6dvKzJr3oUNg53utG8ax/hlzWeULHgsTSNypRJvevH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJHW2gX5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJHW2gX5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a36126ee41eso718860566b.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 09:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709571619; x=1710176419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5trdsWXQ1l+BmpkQ2xBDJEcjKE6ifeu1ZxitnKw1Sr0=;
        b=PJHW2gX5hdz+riko7luUfFP4Cof9MfJJ1EmYwSEnYhWv4PENrXBCXq7vKabO8gHp/b
         yDn5qPdCvLBH8TKe1oTJFqVBI3oaLzs3Oy7VyCPIhofwajHb/inwFEn8KUeammFk1rs6
         dtEUdokIlbB/5sVaVatpYaXng+ZasejAHpZcsKgbvlbJonqHw5mr0/NHwr2jIa4vD/xf
         odS3saGwwKMke/m53P+adCYHl8Z+icg5re5nRoeHpb6JPIEBebDmDPhlP1XLrTct0c4B
         PQ5C8y/hkEV27pItp+oqzQ4gVdlRWMN8fNl/f9KSywfAyU9LYfMQZoH5pD/GI/VNmFH5
         nQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571619; x=1710176419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5trdsWXQ1l+BmpkQ2xBDJEcjKE6ifeu1ZxitnKw1Sr0=;
        b=MqyZM9NaK0bUX82vF/Z+DT0mgXP52nN+WdoL3RSist0SGPOQF/ma8FRtu7sZ4L9FwB
         kZLes0viaRNHk47LhLENbCu6zGis5vIYyrwjWpRd/rU0r7XcQv5woa5UU6VgGJXCVCzb
         mYU9YuPRvi+PgAaa8IUpCy9vW5kQ0Ean7auTODB/LVRJynql0/BUl618GdaeFwqsNbxT
         HhIxnACQ++PA7HGnz43JXDxpYkfjyyCvXBPC18noInThH7BMySmZLAtcvu8u1ed1wLnJ
         aetEll1Ue6GekTtgGcl5/fGwsTe45ae9yjTECeIvbkvr3MtDfKoBi9/K1lEiT6JC4Ws0
         Th1A==
X-Forwarded-Encrypted: i=1; AJvYcCUrLcmD3W3r70qlPKSTfViv4QWYp9wA4e/pQAij56ujkXk5CIHITWUYH2rI5GBvjWz+cfgBGsua1NNvT+dA5l3XbZo8h7HN7++iYvCCkw==
X-Gm-Message-State: AOJu0YxO0YZ5qjsMKVbmKOzHi05QmRwG5ePgfJpe0UOLaG2UQDVwG+Pg
	tAtY6a+R87UDOorWjdhAFeUDxVf5p0CqN9cPIAIwz5yuTaye8QRS
X-Google-Smtp-Source: AGHT+IFFhslZ7MbUdAQw1yM0erCq4TlxiOJjQ1YvO0Z5gpFpyYfvMvyiEfmDnK6w8x3Dgk6cAOvoXg==
X-Received: by 2002:a17:906:6d14:b0:a45:27bd:e1ff with SMTP id m20-20020a1709066d1400b00a4527bde1ffmr2673618ejr.6.1709571618497;
        Mon, 04 Mar 2024 09:00:18 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id bx16-20020a170906a1d000b00a4588098c5esm372133ejb.132.2024.03.04.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:00:17 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH V3] Staging: octeon: match parentheses alignment
Date: Mon,  4 Mar 2024 14:49:37 +0000
Message-Id: <20240304144937.34283-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
References: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in cvmx_spi_restart_interface().

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..44cced319c11 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+					     cvmx_spi_mode_t mode, int timeout)
 {
 	return 0;
 }
-- 
2.25.1

