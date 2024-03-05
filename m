Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A41BF27;
	Thu,  7 Mar 2024 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709792977; cv=none; b=VMTf2+pKDhPbXK8RwEpu5M67JWBDNXTR7ous7NVoWKlXSbnRcRdWxGQa8hqAjoBDuTIeNQlJw77tYRaf3zRZ2lZ4ZfU4GkjpsTQcHLTC5W74gYkVmwjXacSO/n2OUz7SN+1mxPvpS0eHmCjZyCe5clDCyXBx6mfuusWj/KmeZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709792977; c=relaxed/simple;
	bh=65riQ5yoK75E/jqQs8hAHeeXyseA85BNMRqsOSqrf9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mwCqEQE7/P7h7VwjWL27rImty0+y60W8nDeUD6/nsLpSvB1yqlKL3nIjcegvuve7ZifT2khHXtGRhpcovGY6R2BxeaPSxT7KDmCNF3C0a4EE1dvnR+0rIiZGFMNZ+YTczhuvy0r3pTqHEtTIOrf1YMrtcvwyA047MBy8iTQocIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G49T2C6k; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G49T2C6k"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-567fe9d7741so585151a12.1;
        Wed, 06 Mar 2024 22:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709792974; x=1710397774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vC0R6TGCp9KdFCfpd0PJsngfTuJhgGyt2hrKR2ZFlPQ=;
        b=G49T2C6kHC+5zpWmwJGser/P4nWkcct/no51EAuOzGTGN4NVzrAtv1ZC62KOCGlXow
         g2Wrdq5E+QH9bwERKyg+8gUW+cHUs3VXNG+b2ZXyqYU2amnUr1WwWJ1TY0wltu3skE4A
         SFIYHOrzdTrMVSxNp8xEe2lVSNWjtWa6RGvbcnNac4Co2xovBJdxLo7RZqfy63iNuUhA
         y6i04HK/upv10E0eVpDUgiCXcsITrEdu9jAkKOKWrfRr1+n1jf3fSzm84EKTaJM27v/K
         utdEi7EcFEr821vZ8+ewdQdc3fwzuFhtpS7+nY2Db5eTgOrFZhuaxDbmEjcGgiLnwEji
         3qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709792974; x=1710397774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vC0R6TGCp9KdFCfpd0PJsngfTuJhgGyt2hrKR2ZFlPQ=;
        b=t9ggHJlUlMuqharL8GfMe5anOnSniXRDXmW2uuhFXIQ6B5owUut8Ft9d5YamjbMaxC
         uAlJ0XG/aagfT72iXfGtjRyuJJ2diRgt9YA4u3edOg3wkqBf8ateLNzBNyeEUzhyz9a9
         NapMbkfM5zqDAi0K2IV6YjFUQW7zJXnM5VvyB45sKiqE0t9+Z2jkQq3mHUtzkFLzM8kL
         rz+LFVF6y4Sx8f2rZ03mN1GvZIBuayhIHjITG+07b5qEZkhI4vZXeTbeXx5HdgZ1oZF1
         lf7i1r2xwnkW6INlC89zTQTxg4G4wex9zro7eA46Dh9pbnOlUpm17YtLJ7AYvRvsS0ci
         hLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxfSxfWpbsM9zIT09S5tVIKO6BRRAx1p4M0OP0fCPy/SMQnLEZ8gHzXzgEbEMsy8xwIn51oYdG4vJ43liaTPfXYPmVQCBcSyqRR6A3fpD39ljMRy/LtcLPmOI4eQhuB7ZvbGPr7DxPgQ==
X-Gm-Message-State: AOJu0Yyvr8DeJwrc0Ic6XHHgakVhCat8+j0VLsMomq9+ZOmYJ2qi+qkl
	k3AhZtaFGAOpXjhCiYs+qgd2Fs7TeQwuaQcv2p4nTADJIyEgxu0A
X-Google-Smtp-Source: AGHT+IFZ+0OqLGYcw7Z5gbhDWIG9ljzG4TjuFF5c960Kzixq2sLvp8+CfHhS2R4WzXJmnfiQwuHcBA==
X-Received: by 2002:a50:bb22:0:b0:563:e047:cb9f with SMTP id y31-20020a50bb22000000b00563e047cb9fmr11011903ede.19.1709792973805;
        Wed, 06 Mar 2024 22:29:33 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id s9-20020a508dc9000000b005651ae4ac91sm7582887edh.41.2024.03.06.22.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 22:29:33 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] Staging: sm750fb: Rename variable sii164EnableHotPlugDetection
Date: Tue,  5 Mar 2024 22:45:18 +0000
Message-Id: <20240305224518.39357-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164EnableHotPlugDetection to
sii164_enable_hot_plug_detection to silence checkpatch warning Avoid
CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index c12df1f9fb00..1ce44c50617a 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -21,7 +21,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
-		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
+		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
--
2.25.1

