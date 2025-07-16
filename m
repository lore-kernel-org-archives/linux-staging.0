Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0CA25F790
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665895; cv=none; b=fkDCqPzdJ417svbfLAjCMv+KkuA49w0esEMKgKK1TzmQ0JC4OpaeKaqgdVRQMA2jsUR5WDKT576O7cYljJMErdfOQC8tRQmda3xd/tpQ4+/BrkSrnCKlaJx1hP05PLG2SCCN6SEOZeW4YrMZrD1VxSCXvRVoiGwne0AdZ58VbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665895; c=relaxed/simple;
	bh=zA41hlBKUpUx+MR/De4ruTKj+BmFNIaLNmZQp714Q8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XoZOaQWTfuzjsDM7sqvn9OwQAVcKNC3BW9Q2EjkwR4X85mcYoAzkHpQr8oKzBlYIVN6lMRALyVxxVxPEdAAZ+KCrToG9nWQ0LVpPf13kl0UTUwk05VDyZV3R1O4FEJ5r7YKcgabVP9KahRK3A49k77K6acnbXWtXGRG5iyzi7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwl0RB9d; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwl0RB9d"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60d666804ebso424088eaf.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665893; x=1753270693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7Xso/U8A8b95oM68ASRlbVRB4QNPdRM8GOc3I1oEzI=;
        b=Wwl0RB9dKJJf0FDxy8hhLEGGsJ8aAsuX8rpFHBZLi26df9FJ8tQprMZ2VccCgFW4gm
         /mMcSti5wzyzgP6ZmkrVpdQCDjrqLxvVwgPX6QG6J1JLimI7VzY8R51pFFW/4T4fIYWM
         MbNkgKV7UspBGuS/6SZb0Cdm2LiMjghCr2RL5IIyElUuMXB6fKQeU6tsplHadZ+6rsu1
         ih2AQKa2ZzZiV4Wn0YRexZdy58FfuTWFeHEHwOXctOAnTyt0jAXwrHJYRm7qcoNDuG/I
         dU5X+ZVXEgVEigCLRDGfPfy3/mMPVITmUMjM1bifAfMqxjdp/BLWW2A8s/YwoOkXpn8B
         0zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665893; x=1753270693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7Xso/U8A8b95oM68ASRlbVRB4QNPdRM8GOc3I1oEzI=;
        b=EimY/GW2hgPJZz+LlIbhub0XV2iq5yTa98Ar2eUEtpRGHtYz8vN/S/uTSDvkH/6qc8
         bPZRUTtFmtBzbfLwyg2uJQvxI5kRkXJn73j63w5HUGNO9msZ7DtJZOzCXubtJPsjNOU+
         gFRVHGzzkEZLcBJ5bvkcPzbxKKKjIQG32eL3co7iQbBb06KMKAUJqP8vfdYqOpYxPMCA
         Mv79a6BaVlsbRDYd5epRRbFPMKkzHLuHCTqZrXcdztEiOJssCR5xKfZrAVysv1gm2OYk
         hQIdedsBMy341oNXVcbOlmGgIvK/5E++HYsWPkJF547mT48st2s7D6flb6GYZlf8me+1
         OILA==
X-Forwarded-Encrypted: i=1; AJvYcCUpSMALIP2IFt6sQETm+J8wgUzBMxswUT8x2hkN/5AJqyv81HWVEdUVY3RBp8ylDY+XTia51Oslc6GzTi+J@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb5Ek8lBQEqHlcAvnpS2AU3lUQHbf5ySUBtNcCxfyyM6RfIkfu
	99fFKV5msV2CCIWxcMuPeyPdBFLbFB4IqnJY1bHUzn7hQGseeIfK8vZO
X-Gm-Gg: ASbGncudpExWzhHrM1N7Hp/y5t/aye2qtAA2LCyRob++FgEsSHkTwY875HrwKP/Vsut
	PU+Ts5zTlyHMit1CZOqlai66Wzd2ISclJvYU6v3KXyDJIntCDnVrYJbm8L761xrcNaexUP5RwCK
	vOYqYGLaq5D85fG6y9yS/6bPE062uOPfh589EjBFhTZZrQbSeovGKYTjI0vqR+StWsCHI8XcLEX
	fM8vokksvOwltF+CR8jhGo8gcc45TXfdSG1MDL0tOMpuPiYVn8Jq3gR1Fq0y1XQKY9ZhI7kPZ+C
	8Nzx2SKwS4QzFeJl5NK/vtCzuZoaEJFBTu417XUbpmXg3wd3YICYX9ovsGQ5dmM/aubSqr9kjrJ
	gy3tw8Usx9gq7kZmOW9W8K6UsZBlaH4rAL6A5ismPHJwQYw2544tl
X-Google-Smtp-Source: AGHT+IGJz89rlkGIA3//2+dO8gRjrIew4cfYHZ99E9hXOHhgkNh0JXz+jgB9LEH0T540CdnltzTbjQ==
X-Received: by 2002:a05:6871:2941:b0:2d8:957a:5166 with SMTP id 586e51a60fabf-2ff8f97432cmr5091094fac.4.1752665892973;
        Wed, 16 Jul 2025 04:38:12 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff1127dd10sm3353730fac.19.2025.07.16.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:38:12 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: remove unnecessary braces in rtl8723b_cmd
Date: Wed, 16 Jul 2025 07:38:06 -0400
Message-Id: <20250716113808.73115-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716113808.73115-1-ignacio.pena87@gmail.com>
References: <20250716113808.73115-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Remove braces that are not necessary for single statement blocks
to fix checkpatch warnings.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index abc123def..def456abc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -24,9 +24,8 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 	do {
 		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (valid == 0) {
+		if (valid == 0)
 			read_down = true;
-		}
 	} while ((!read_down) && (retry_cnts--));
 
 	return read_down;
@@ -57,13 +56,11 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->h2c_fwcmd_mutex)))
 		return ret;
 
-	if (!pCmdBuffer) {
+	if (!pCmdBuffer)
 		goto exit;
-	}
 
-	if (CmdLen > RTL8723B_MAX_CMD_LEN) {
+	if (CmdLen > RTL8723B_MAX_CMD_LEN)
 		goto exit;
-	}
 
 	if (padapter->bSurpriseRemoved)
 		goto exit;
-- 
2.39.5
