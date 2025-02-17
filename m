Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930DC237700
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821879; cv=none; b=pXF6vP1FvkRVMhzT1RPtqX/7R5DSdhsKOYEdRZQHzmdZPfjW2qSwhzFoOdcbxb2n20ybsO57ebzuwNcY9Nwx5Yz2Ar6XK2IczdWCr0IECd3vKtzgvTsHPjthEDBX1RW8sn1PFKuf+yEdfvdZ98GbtPpYM17TesHbzjLKP/xHUEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821879; c=relaxed/simple;
	bh=5JCtn3HaQ2Y42IOCz0vVF5B+3fj19u+R4j7L/gr3zkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/+OBffcjKB+giVN8jSI2J60L+23vcQRJo6kyJqntK2FE7Ax1+DieTeLvQHg6Ka+g5ttvAdHll5/Qvw0TYj6CA90W2EcqwTQLmCXBdBLR53gm0LKq32X8joisreG9k3tp8Xo2hRvtFyaXCOy7M7OrvJ8s5Ycla1WT+Y5XXBpbXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmRfHDYS; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmRfHDYS"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2fc3fa00323so4927340a91.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739821877; x=1740426677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+OA47VmynX7pepNmjGGlDQZM/5yLns+ASpEva8XVu8=;
        b=gmRfHDYSGOc1ZrUhNHiVUawKREtHo3FuELJD/mM8CrMsQTMw6B5q8aRfrD2zXg0KwK
         Xe4Y1I/9lcWZZGTMoIVCqXdtgy+58ZC9bWZ4ITPDC7SoHCA6uVPfJOKiE6i5BPOqHKcQ
         mxty3qUs5wsb9FMooOuOaqR/cecW5I6FMMxZdJugIWp/M6p95fG+HlsZ5EJ4t6UGFiVw
         SiNhJKjMsN943bUyLHAlWqDoT8eCK9dQgdyTy6RoRG2bOasUHre02G9gfaEdwvxxv8L2
         xS0Rwccvxrde/f2WIJ0t1OoCjk3/y8dFsxufw+wlgU3t/74zWXSutgxp+DO5MjEKAiHY
         a30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821877; x=1740426677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+OA47VmynX7pepNmjGGlDQZM/5yLns+ASpEva8XVu8=;
        b=pPf86A1A5tLcOuq5zkBa11dhDNa/Gfixalhwj3wv/vZIV8MIvPBmEt4dSlGxN4SMaF
         pNFmcJtDIChxXFSBqPTrGS036Z3DfhFYJvMC37y+L722vYqtGeV1uKog7rq8zQOSEapT
         upSDXV/vRIWnGRjTL9sCL9K88xxPbOeoBNdkTJBM4mfyDSRzWIUKKYmp75quuVKTEEuz
         Vy0ErDZrufo5qZ22RuQZtkAXoQcc/adQ8hPY7ek0YP7UNsFcZ3UUOkWOY+TYjPO6AIom
         RJbvI/at2uJcL1hbgd28aqP4gfQfMPtjktJXLT0oed4oF9wBbuHvq8BhFFRwSCcGH6lR
         cxoA==
X-Forwarded-Encrypted: i=1; AJvYcCX4uZ1HQ73c7Y3LE470ylwd0bmowPN7J7QvJnoWjHJlro4kYilLwzIOnp3szefLydBtAvcZ2mlSQPcPxgpW@lists.linux.dev
X-Gm-Message-State: AOJu0YxnbLk4Hapv2AR3TW9efRSVUNlQFHM3OdCuN+dUuqfhGcvoZ1vS
	UG9Zllf3Xu7kJ6w2P4mc1zwT6XnKHE4r/b564klP4ylDy7jvJ5K3
X-Gm-Gg: ASbGncv0HL9Z3rilLTLqQVBmWXvjfkMdS9EnDZIlDC2JykwFEZ2lfO9WCoyrWgcEqHS
	xsq6XgOdubHtTZkNmTVhyogyGozghYHqByB9oisl75L1ja3ccbTIL3vWbIZOuSivFmi9uoSoQtP
	M8DZ3BJtTcrSq7JejS3bhPq261ee849xtdAHD8nq8UFmAqPpMnoCQRoLH6GwY9ZlkFB3EQqP8CW
	Do6FXJoAdB1Tm0/cB/TMj//n3s+FUhz/jV/PDEaAUWScJf2kbmZv8X1yUjcgsuOh9wYuGRP2+ob
	msJ4hBLpWKZeFCf5PodF
X-Google-Smtp-Source: AGHT+IGX/PqH4IdF45LylRY13MTSCdLLYKcQkYQNdNSp6Anjsr80DZAfOnbZoTKi4sYfhLlThW8VjA==
X-Received: by 2002:a05:6a00:1256:b0:730:91fc:f9c9 with SMTP id d2e1a72fcca58-732618b0b1dmr18138986b3a.16.1739821876633;
        Mon, 17 Feb 2025 11:51:16 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73278d09228sm2811898b3a.117.2025.02.17.11.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:51:16 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v5 3/3] staging:gpib:agilent_82350b.c: removed braces from a single if statement
Date: Tue, 18 Feb 2025 01:20:50 +0530
Message-ID: <20250217195050.117167-4-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217195050.117167-1-kumarkairiravi@gmail.com>
References: <20250217195050.117167-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

removed brances from a single line od 'if' block

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index af1bf6e893..0c07745649 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -205,9 +205,8 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		}
 		writeb(ENABLE_TI_TO_SRAM, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 
-		if (agilent_82350b_fifo_is_halted(a_priv)) {
+		if (agilent_82350b_fifo_is_halted(a_priv))
 			writeb(RESTART_STREAM_BIT, a_priv->gpib_base + STREAM_STATUS_REG);
-		}
 
 		retval = wait_event_interruptible(board->wait,
 						  ((event_status =
-- 
2.48.1

