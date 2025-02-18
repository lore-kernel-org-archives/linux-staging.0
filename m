Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29CE1E5213
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905152; cv=none; b=iDQTD50lnWpHA0ughq7HdCf0kgFzuoPsJHakJu4lLJeKPiYtPUtzZXwX6CKkohuGh8CzYE++v7omr/pjeG3swDOZ+hd8yeUW+FKQvfjfDRqUG90mkQl+tN3h3cNN/K7rC1Ta37a7xOP6hohRImkJQpKKf95pJ5Hl9PEVJvelEOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905152; c=relaxed/simple;
	bh=NAVr74VW51YOUG+zso1Op1HBKkPxspaNT6SS3XlwKFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vit0A3mtSAj102PjEaEKlUvTi+ly3Dg/n+lXk7qQDz/HI2/BRcFipmlcj6vx7HydZPvHCZdA94JITycyVB/UskrGGsJxjip/mjIDs/cgcPPsehEOXfwrIVyJvBUH5O3qPHK6Tx7ZrTeglBV/z/UA1HWR7uUGti7AT2COFf3QIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkiI7rNJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkiI7rNJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-221057b6ac4so58182125ad.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739905150; x=1740509950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2kYKvzzn3lnf/7s387qyzmIyaz3OrVD3UKrYZvFboM=;
        b=WkiI7rNJGVNHEipNZ2yTPpQPDbahpdWX4FqBerpzA4gUZPuuuOHuSCrb+r3Ksp3feN
         wDlESngetv1l4W6yCtTYGiKIf2eb0e9OXf2z/KNZ32DIioM1hGZYDelSB+kH7OR882Cn
         YW786ZBruZ2bXAxTCS4fo3bQAMmIeekhpZrCM4N17kTGXnTTu0g+EEk4B53LeTnQItW4
         Z9Te7B95kGyA0OA662T8A2RsOQ9rpNU03QDfjd2uqVhQIGAv/Ny4SUQpR3tIjoORm8vx
         ZZ9QJSel/jQR5bFwbOdMC3a9JDOIv3DDzBIJM34gLhgTVYfNjcZ68gQ2mAid9s23hr89
         dPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905150; x=1740509950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2kYKvzzn3lnf/7s387qyzmIyaz3OrVD3UKrYZvFboM=;
        b=KESxA3zBGC/MyiPzSqJuL8hJpEZXNjZpKt2m5Y8Lwv7/Xiw8Fa93ukh3QQkNUVzBz3
         yXOVgYzGDgdhQQLmyvXjx00besWlr0vF+0BDLY2XaXohoEVMmRotOjpYvN819rhKYcWn
         q8147HK0ZB+dD6MFqBj5yvRgqSlqEWWfgseP9ZFy4LossM1z29HmD1NpZvFxAlkBb2So
         gwET37djTk73L1BalojXlN8uWzssZI6ExzghwZzHgZpHgMf0fWcMjO/s/P3LuNLhyQJ/
         ohFHg9Iqg0WihWXbEYHZRSDl9JtaONn9b54AT4DP24FTBVJNd+3K2LXSb7cO++I1fEqr
         WJTg==
X-Forwarded-Encrypted: i=1; AJvYcCW2//Tpf0eyojKhoiKxoiHcf+V+UDCefIsxZcQRJdwPOnSL/GNMV8S+FdVz80Bh6e1wLmAModZ5kYgNBiNB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0GxJ8Xf9USDBa2sMjeBFgjt9qesVs1zPZtmTELvkGQ08WcpzN
	HaWwBNXEORX6zAwFdBufjIvKK/Ra7SPqIl5uJlH0uf3m/9/j39yels0avswjt8Y=
X-Gm-Gg: ASbGncthr8m83E7buhROhif3x8U2wMD7u5P+p0XBpslGt8GOhwa/AvAXpihzTl50GXn
	ksxuP/8IBzwwLLraQXhb/49LaUUT3bD1QyQgoNlOKEjeBshuMGcRMKwDRQNuGRrQ0h1mJ64HpFF
	kDNMymZ4sibknCSd1KV7sEfG7/TwA5TDtt1BASZQb2Ahv9x1tdAQQADWTQbjml7KJOsGhSw0wnR
	7WLU06KX9Sg3UxWOb6SrW4wYECBuApgRzppINz0bEc6WsLQNZUsyofdCWX8Z+9EhKyxVN2AndES
	r9mdCYhPMX7P8VJ6YUnirevc9h5tlBOM
X-Google-Smtp-Source: AGHT+IH5tb+e+tk+EJnYVSllRelw0h9SjG47BaGOE/to0hwJO41mZiGf7NcDeXif2nGa++9e7YBZ9w==
X-Received: by 2002:a05:6a00:3d55:b0:730:9446:4d8a with SMTP id d2e1a72fcca58-732618b7abemr24682912b3a.16.1739905149918;
        Tue, 18 Feb 2025 10:59:09 -0800 (PST)
Received: from localhost.localdomain ([36.255.84.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73276f20c30sm4903499b3a.21.2025.02.18.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 10:59:09 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: Remove unnecessary volatile qualifiers from the file
Date: Wed, 19 Feb 2025 00:27:48 +0530
Message-ID: <20250218185749.22144-3-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/staging/sm750fb/sm750.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 097d6558b7fc..8eab90f0f33b 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -50,9 +50,9 @@ struct init_status {
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
-	volatile unsigned char __iomem *dpr_base;
+	unsigned char __iomem *dpr_base;
 	/* base virtual address of de data port */
-	volatile unsigned char __iomem *dp_port_base;
+	unsigned char __iomem *dp_port_base;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
@@ -128,7 +128,7 @@ struct lynx_cursor {
 	char __iomem *vstart;
 	int offset;
 	/* mmio addr of hw cursor */
-	volatile char __iomem *mmio;
+	char __iomem *mmio;
 };
 
 struct lynxfb_crtc {
-- 
2.48.1

