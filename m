Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6751F5820
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022894; cv=none; b=cJvFRk6KTsa8BaZuisln9EQHsQSG8kxhSSazwDn2BKvBHWi4hGTy719IgiJVpzp+vyR6C4W+Z7TpsSyUqBhV+9ccAEgd3+3fykEImlJKKaXx8JlqaX8V0xb5g2VehhzEEUL2gYXMYwvEUMvLrNanvxBf0dYaDVFt15i8ylJ5oUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022894; c=relaxed/simple;
	bh=lcjxFfK9x7TEO3MuO7OThKx6V5XEevvEBNkBmc5yX3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPLXZeLfTf2V+FDgW0/KYCJWbreAQKoomkSW25oOZp9xqexfM4S31tDxHoyxAyx2TzUoj5hzp2Fo70a5FKsa2TEtlIcr7fynoXdABNxzDLTFwow1wKvkitOH1NHMOKv+1wUm58CAbXFjoGZFtZ2dY5GPBQbAL5IyfUxybWaNLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=cYii8JvY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="cYii8JvY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c8c50fdd9so1566745ad.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729022892; x=1729627692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4OYafRWJBDNDlerw9Bp0TVpkeaRmGTgXMU5o+kqNXA4=;
        b=cYii8JvYYtu09OpMHNiKIw9dOWFtt1T0Pb/jxz3eiH7Jl/c6Kuh1X+N9ENb8+vbTRg
         MfJ+ogTby05RQswh5bnRFcZ7yfEXRuc6JfXVr3YRcF7+l21/vZRaaMF0+KJ9W97qDHUk
         3Y7S4gJQeADZcLMRDQfzevRKbsvKTygZ/hqCc5kwUxCmAj+3vweUWm7vHDKTKV2ddgZ5
         gDLgs9tQx7e+1dNoYh5ckqKCQa2UJntwUONG6PpP7Dr81G5zn9/f4vzcWcZq31oaCNOZ
         IJurXGeWBdl+DXy+TKISuTmkkalYoMugtWRk6MYGRUqWP0+Y5Qh6ur5RB1RtKXjowxuj
         Co2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022892; x=1729627692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OYafRWJBDNDlerw9Bp0TVpkeaRmGTgXMU5o+kqNXA4=;
        b=hRF8J7zleJmNvgNnn/Hogw5Cs0GR3C5npwhCI3LMOLI1uLP7svhPu4stoS/05NulTW
         wiuOYLRu9Jnmeg0TDJwl3aQsfFr2QECE2+faYiRigD60wNT7A5urdJFAMSWiTBJH8V1P
         SYv2r4sWIDzjqZBx64Y2F8ypAK84aO77acEQxFYiqg6mMadSgzj57h7FHwNlkgkQ++Je
         vAfsnV244GEZZKg2szDX8MlGFz009/nb5sR1Ku+YyxADFzkyHAOKF8rI8gKoR1jDvItK
         jQiO9WE7f61XYomzXX+Sq36AH9bsyg4TE1hsh+FrGRhBtUdaR9OSGlrSexHwpDizPPG9
         iKig==
X-Forwarded-Encrypted: i=1; AJvYcCUtAWmt7Usx9OMnM/OA/843NT53RzleIGAEwWtXW1Ek9qft+Y3pTmJdInALA3UxDvEUuDQnOBCkfI3iHII+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb5/iVPdMNBbu+3TtJb8CbafPOCXD/W6+XI0PntsoFYm9Vtx6p
	NuK4nxlv+2ujgBIXwFQJve3I7c9+oE9GqL4aYukEm8KDwHqEOSgSZ8MSti5jcBU=
X-Google-Smtp-Source: AGHT+IGPwub86v3SfluDcfN06wwLN9PL4+BcDBaaARe4qa8pfg7TiFdoeIbN6d9voDA/VPRC2aJJMA==
X-Received: by 2002:a17:902:e1c3:b0:207:1845:bc48 with SMTP id d9443c01a7336-20ca0426cb0mr178146065ad.30.1729022892036;
        Tue, 15 Oct 2024 13:08:12 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20d1806c72asm15852375ad.305.2024.10.15.13.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:08:11 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Remove a dead condition in if statement
Date: Tue, 15 Oct 2024 14:06:47 -0600
Message-ID: <20241015200655.17444-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `residue` is an unsigned int, also the function
`fluke_get_dma_residue` returns an unsigned int. The value of
an unsigned int can only be 0 at minimum.
The less-than-zero comparision can never be true.
Fix it by removing the dead condition in the if statement.

This issue was reported by Coverity Scan.
Report:
CID 1600782: (#1 of 1): Macro compares unsigned to 0 (NO_EFFECT)
unsigned_compare: This less-than-zero comparison of an unsigned value
is never true. residue < 0U.

Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f9f149db222d..51b4f9891a34 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -644,7 +644,7 @@ static int fluke_dma_read(gpib_board_t *board, uint8_t *buffer,
 	 */
 	usleep_range(10, 15);
 	residue = fluke_get_dma_residue(e_priv->dma_channel, dma_cookie);
-	if (WARN_ON_ONCE(residue > length || residue < 0))
+	if (WARN_ON_ONCE(residue > length))
 		return -EFAULT;
 	*bytes_read += length - residue;
 	dmaengine_terminate_all(e_priv->dma_channel);
-- 
2.43.0

