Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD715421F1E
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972426; cv=none; b=gkFSVmSga5ULSUZllNRXumbg17d9OML4rAe99ABAvrAe1W5prg/YO++5tuduFJYvSWlBswh1+2MABnE66JJaKc/CR0uK1XhFkrDg5SAlp8I5N51PQZpqQhwU+2cDW/sSrTGSacu0FL0+vLn/V3lmuA4378vO8CXRjR2FUm6QjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972426; c=relaxed/simple;
	bh=30xebd7NDl6vphwEKCPfAaIsAF/fKNkFYyH6sUn9060=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwlylY7jN6EvilFkjTDiuq4KeqfC28H7z28UUwrEFAF0sP8tm/Imk/VlnflQ8IfqEXBeXa+OK5Mw4qS3UTXWmE+AMf1c7+8UIKZqVoVYymy62yQ0t+NFBANWvj0IoAh94JU3RXayXXA0W9lx7FUwcMIsmyYsQWIqr+MKuBTQ58c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnwfrDJl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnwfrDJl"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so4574899e87.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972423; x=1775577223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHiwrSqgwC577Ce85ztxx+1Ls+/BKqgIK1FRNBUOyOA=;
        b=jnwfrDJlOtpwpCsvCueU6rXykK8ThLKQ6YKPabS69sMoFuN1+zv1/BfgxMGkZFo4V+
         yzk1Jf2snW7eWWIrel1b5gNqtHoFbB5RG4LNBtwd+jwt5Y9aPhxzVo4QGTwk/pVBFwJe
         0USwaE+5l9PsHIjOpbN4tykQlCLy5zf7KWnJafeMjD9mlOMek8u8YjOeh1XaBuij+XuB
         27i82CNUiWakj+3pQgeOQwq7khJXT2+YvgMLkpIsMEniQ6swNxxqq4GUCNe+I0T35nTa
         EKjZgPrYIBVXqpKE8Fh2YUltSOs6KkhRrzOjnVQcas1v97ttpnpl7SsBk3M0e5kKTGsJ
         ydZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972423; x=1775577223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JHiwrSqgwC577Ce85ztxx+1Ls+/BKqgIK1FRNBUOyOA=;
        b=tO3tenG68VN8uE4B2ZXSm65ypvaqBk2Ut99+mtTH+e7Raf3m+uJZaanGY5heKU7NM6
         wBeOXFcTeM2/TS4rBHn8N1e3xnvJybZQ7i7Oi2P5pet/duFtz46qYvGNBu6bFQNCjFrd
         7zvtb3emmzQXU49HWK4f43C2nbwq5Kx1WX1b3PVWud1OFlMFNz6lXEAM/kQkMCQm8021
         OLBRmz6kCGPLeMPz5KLuB0iC5lXKSbYudu098sjbT/NriUnFoZTlNyN9ar/sogmdX66K
         PmZ0rlgFD4vecns4dYxcnljDsn1ajLRspk76F+eGapXVsv/i75F9eg3bxypFqjH+Uv7V
         sdoQ==
X-Gm-Message-State: AOJu0YzfSephekXZ3ZcUHtvzMc2t0X+1DjXBuDF+aDKP05m1rgZUbuWK
	WbYz236uGhBid9flinmPm28SIn7qrEhOTFv9LSyjzZ0rc6KE22PdQyl8
X-Gm-Gg: ATEYQzyCJq6SOQuCPlWtG6ntfTo/XMPwUGE2eZ0Jr0p+3fBeTYmB/HP4X5PDeTknIo5
	IgxcUHwmayP1dLKgnkHSLORhLuJIcWXK3mtldoYYk2K6bDuYhgEq/YESFDHypcrd87sPsfiTjgw
	mw31L/CDzbHZG66L5J/Q10xn6VqHyCJ2KxL79kbZ7LwOJZSXZZjLsFfnIswxF1cbkpxr9VJAZW/
	Gym1sAqttNq2JKhZRLRKrtjYvpmN+MAi3yEs8NSzaLKIs4fFHu/8HQSJwLU89YksmAB9yZqRz69
	FoQtgDmvNeiCP1LgOTCn/NL8vqHJuINw+0xFudvqdXVmQ/Tt30wQ2RQs6ExUqkbs0j8yrOtoYTk
	sXe6MV+8enDsmiYaCSw/fuZ5LHlg52raJ/Y88T9j4+ujc/Qhg+ovsezwAruyc2mWch+9lcpphWY
	EaDcI3FPzq0hKzQa3ScX0VI1NnWxCXoaXexIN4F1bffGNlf3Kr80n7LrMUaCMEOQ==
X-Received: by 2002:a05:6512:3d1c:b0:5a2:b3fc:b869 with SMTP id 2adb3069b0e04-5a2c1f12a2fmr2529e87.18.1774972422545;
        Tue, 31 Mar 2026 08:53:42 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1460547sm2618911e87.82.2026.03.31.08.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:42 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 7/7] staging: rtl8723bs: remove space before tab
Date: Tue, 31 Mar 2026 17:53:18 +0200
Message-ID: <20260331155318.185117-8-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331155318.185117-1-linus.probert@gmail.com>
References: <20260331155318.185117-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes a space before tab according to kernel code style.
Discovered using the checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 4e8980d86965..808ba94a5998 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -31,7 +31,7 @@ enum {
 #define		EFUSE_REPEAT_THRESHOLD_			3
 
 /*  */
-/* 	The following is for BT Efuse definition */
+/*	The following is for BT Efuse definition */
 /*  */
 #define		EFUSE_BT_MAX_MAP_LEN		1024
 #define		EFUSE_MAX_BANK			4
-- 
2.53.0

