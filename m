Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AB10944;
	Fri, 13 Oct 2023 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyArlyge"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c871a095ceso14887235ad.2;
        Fri, 13 Oct 2023 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697185605; x=1697790405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkm4IcvDcpDNyn/dmP3dcHytJ9yQBVbR6NWIK3pDrZM=;
        b=UyArlygewfQprY6dioKz7o+wQY2x9iOyDdv74AfXszjio0wPUy9v7sMxNO3ghCoZHa
         NKMo3jNKpowCUmGFSbh4BIunEOn7P08HKVk6pWP24w87PQbHD3HcIF/rRsNvsoni16gl
         HRnrK12w4PsVXHpYd69jm5XGSbAwQAMGYYnCu/RphYFgtlMA929D+qOM/e3/aApuhpaD
         ovsMLiUkr27mEy8whYQllyOzMje4OozP+So4erlw/UUXOFAKzasqZzvbJTql28DFMeCE
         BZxYDtLhquEjHIGsyex/ka2vPhcoscHWUaGvgrmdFgZ2SaRNBFlSzBA4Wi+RreOJioYF
         5haQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697185605; x=1697790405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkm4IcvDcpDNyn/dmP3dcHytJ9yQBVbR6NWIK3pDrZM=;
        b=ogEzE7Ecrb9e3gEU/IE6cEShPRr72vyMTrpaKO8M9HbEDW45SMAUgdOgpCVGTlq8Jq
         8BXWjoUU56YxSG2idcs1hr2O8iDT6wVhohDCUFt/iQEue2Ps7ZFuM1H8J/ZSjKhYziXX
         6ki/9yk186xvE9wHDhGKF+9gGm58vTOaXYw9sMBOvKLTa1b8C/tBcJUIrjS7Q3vNx/Cp
         sUAgep7qsSNG17pKakNvS01KLFuKL7FAMPFjJ/ECas5gMY/zFbPwkkf/O7Xqv9zrDCIH
         UcLlK5SfhNDs/ocoP/htWfmMxLiH2QE60BBSv60aVOxhMmNJhIYsb3vVkLx14Ms9q32I
         zSpA==
X-Gm-Message-State: AOJu0YxRt4UouRLSkEkqSDxWONJX0KSZUk7/LSxfVbAw7x8+H5n5rJbZ
	GMYnBplPcYAEWqIfl20Zu8w=
X-Google-Smtp-Source: AGHT+IEnkD3fJTLnpb3gJCiRJN6IeKkhjz9YeEaS+p77uWERLqbdpt8wkEWytRz9aVoL7c4boqudiw==
X-Received: by 2002:a17:90a:f3cc:b0:27d:3296:b3e with SMTP id ha12-20020a17090af3cc00b0027d32960b3emr1629224pjb.41.1697185605061;
        Fri, 13 Oct 2023 01:26:45 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id c12-20020a170903234c00b001bc59cd718asm3280524plh.278.2023.10.13.01.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:26:44 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH 2/2] tty: gdm724x: Add blank line after declaration
Date: Fri, 13 Oct 2023 01:26:35 -0700
Message-ID: <3b24ca9976cf873dbaadb499e09d7b545e9db89c.1697184167.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697184167.git.soumya.negi97@gmail.com>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix WARNING: Missing a blank line after declarations
Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 4e5cac76db58..0c61eaff6122 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
-- 
2.42.0

