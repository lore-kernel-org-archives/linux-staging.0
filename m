Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E13D511
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMVaLx/j"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cc0e78ec92so32328005ad.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730485; x=1699335285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN/MvU9MLPHLAEGw0iR4UGx3aKzLloZYmaIYA+TmX30=;
        b=nMVaLx/jYXnpNP+GWGBKDtXRtGesBiYEI2rEiBvvdlGK3gyOIDewzpDyCtWT+MnK9i
         Czk+33zFp2bW10uZBno6IR6Pysfn3aHBrRF0eHdEB3WjqFBdmPWSofTyxXciwPsE82+U
         LgYV9h0LStyVvgOqsi1UVRAcQCUA87l49GeKM514RC0Q41G8B38jqSuKkbCVlr/qWnEG
         vTTrnqhPJKh4VXuEb7kHkGlbSJoT+bRp/5R2TPd12KN7C8/4iN69/7swbgp3WDaKM8Re
         QcYXCyg4O9/bDXnokLCdP1gjiEjkdmGl6nCJ9AEEOnn89gXvDtIcmjNEtLdvEWfy8sH9
         ry8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730485; x=1699335285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mN/MvU9MLPHLAEGw0iR4UGx3aKzLloZYmaIYA+TmX30=;
        b=SFIOld6V41qW+zbplMMh/L3lynaAUjv9eMR0nDAtzi/gL24iEk5AV2EKE9fyjQdAto
         QLsqQmkY7IEaRQMRjBMMibtbRmvFTMQUwbXip9ACt9syVGxEg0ek+e4zatJM6BV8AhZj
         XT7EP1RlUBHHlqJLk26xMYqk6A+gyCBVnEJKxfG1h3HiHBnWEXUkbKJX2G5OnjTbLmBm
         3IUG/7/2onmxo/yvFT7MFWNm9LJ7bNkMHzEH83EJJjpUxSx4zzHnbpCA2SwvX/rUeOqk
         4ZyT1ZAVFcYSk4Vf8U7tqMgqXmKWweEm9foLHkRSf3Gq5FfZd+AkBEF/kB+NVJ0uGxI4
         spbw==
X-Gm-Message-State: AOJu0YycsbKGNt6vgJmcVYXbVdbGX9KXDJc2YCBpkdEQYhgFdWtQhj0K
	OhY/Fn8LO4Rj1t+lkMDxldk=
X-Google-Smtp-Source: AGHT+IGNYXvbnfinJUxW935i20mLBwO0UkAc3VIb1kvnGtS6KkaPW5o/jjGhhna8rM+wwtwAzFiGqA==
X-Received: by 2002:a17:902:d491:b0:1cc:50f6:7fcc with SMTP id c17-20020a170902d49100b001cc50f67fccmr4334454plg.55.1698730485502;
        Mon, 30 Oct 2023 22:34:45 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:45 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 02/11] staging: vt6655: Type encoding info dropped from variable name "qwTSFOffset"
Date: Tue, 31 Oct 2023 11:04:25 +0530
Message-Id: <035b910c92233a7252a4b312e0cfe5adbcbbae79.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
References: <cover.1698730318.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "qwTSFOffset" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 59a788b7e268..e0af14eb7cd4 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -291,17 +291,17 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 		    u64 bss_timestamp)
 {
 	u64 local_tsf;
-	u64 qwTSFOffset = 0;
+	u64 tsf_offset = 0;
 
 	local_tsf = vt6655_get_current_tsf(priv);
 
 	if (bss_timestamp != local_tsf) {
-		qwTSFOffset = CARDqGetTSFOffset(rx_rate, bss_timestamp,
+		tsf_offset = CARDqGetTSFOffset(rx_rate, bss_timestamp,
 						local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
-		qwTSFOffset =  le64_to_cpu(qwTSFOffset);
-		iowrite32((u32)qwTSFOffset, priv->port_offset + MAC_REG_TSFOFST);
-		iowrite32((u32)(qwTSFOffset >> 32), priv->port_offset + MAC_REG_TSFOFST + 4);
+		tsf_offset =  le64_to_cpu(tsf_offset);
+		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
+		iowrite32((u32)(tsf_offset >> 32), priv->port_offset + MAC_REG_TSFOFST + 4);
 		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_TSFSYNCEN);
 	}
 	return true;
-- 
2.34.1

