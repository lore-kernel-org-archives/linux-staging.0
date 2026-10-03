Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EBF306B3D
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028738; cv=none; b=KbhjToxHjO19dSnrrBoQrfeQeInLdkvx4MrI+DIQeU7F/VIBKQZ1XuqkQa98l6yRG9l/aso830YChM2VjI5/cv+AO/TQK048E1WmZ7ClCW4YZzAUVJ1zdkxaSpTC4OGdxWNDEd/qLzSemUqA8peP7fXBOojhsmEtOSnRlMLvKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028738; c=relaxed/simple;
	bh=9rVKBQBHGdpfq7/KgP3XdBCZD2rk4vWzXnkmJAb+Qx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L7u3FLCP9bsT+8MRGEUK1OItihIx5wS737heStVbkD1ytdGuU7pAFK1La4l7qdiXxIDz0V8T13IHyTengEbnkHlu442/4cB+/soWCbN51JMpqoPEuAmyTfcw1m87wsLiQt11hL2SQQQs/9m5Cyc2nxt/VWLtCy1tp8vqREF7I4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdwz9wps; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdwz9wps"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16629a040so6817855e9.1
        for <linux-staging@lists.linux.dev>; Sat, 03 Oct 2026 04:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791028735; x=1791633535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wuaQxNO2bsG5Cwu+Ywp9sCD70bxKNcLjKLKw/G0APqQ=;
        b=fdwz9wpsYkZftARp+PZxmFwvNWDjidHDJyffevn9JryJib9yZf68VtE/B1h7rcDC01
         FkuiIv/hRB96cjz4YjrfnqLopq1QTCjH8lBgJocHtP9s/Mqbacz22AO+ah+DVgkLzLUg
         9i3+2wDX8aTiI3noZ0RZ46Reey3OQ0X6iojhb3SvuJwZmsUou294TpIeZ/w5q99Fgak4
         hunq6VTDDwgl6LLGvGLp/3UQyFUPSoR/9r2JMkDHYSkO5fVePVfOJyw/d01re1m84fBp
         SWJyj1Etr3Hpqk1t7eHy2gGZ/mf8ihKMlkw48GLPKdmMdMJTkgMgPXhRKpcBqjhGY0zN
         cMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791028735; x=1791633535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuaQxNO2bsG5Cwu+Ywp9sCD70bxKNcLjKLKw/G0APqQ=;
        b=Z7BNqcIq8Qzwj7HtJjfxYDC/mfagM+xxM292Ft3GYklEyPQqxTiD5HSZYPqhigzxGS
         2uLPPKp/L5zK/FFGGBDcsltOuT1BR86yBXsnDSK6HcVSZN73MGhQwfZaNQRkIi2wFFiL
         D9fqJPWGmjkZD4cHcV1iGtBzDdxn0LetM6yuhq4yGGO1iGcr3G28yZ0UaiKJZtAIajqd
         7nxgXUbNNue1E1tYpIU5XrNjBssf1BYrxzkj2rrVoPzgqdlPTXJ5iYMqbz0CgBozw6IG
         a6Eq835VRPQx6lOArzyEhYXORPcKfjHSF8CC1TL3Uc3GpwtWgU4Ibl89zm5TZ2WjTKPZ
         HgBQ==
X-Gm-Message-State: AFuF++kn2Trx+ELq2T86pZR/aF+PyrK/P7R11tQ/60Feo5bA9oWdSVHG
	K/eocMHnZwZ3R2mgiqrFgTDRodLUGrdaNDSy5M8iGFg4pEvuYAvxaigp
X-Gm-Gg: AYBFou2x3GVW8jzU5+qc6/2DZ5/Ezl9GZd61FbAIHWsui71QB2sybH2xju+aFfUSG+2
	hyr3NgDYLemJnl+4/4g2AcPU7le2zz8CZIENvg1gZQuZ05HwgeVvf7GL19caekaTjOm7uzn4zW/
	INOVRb19lwRlDFyzNYnLl/MaKWS2IgNp5uiCFCKxtvXGBjxQeaCx+iA199KvcSXgYe4C2V33YU2
	zJ06KQec3jpLV0t7dSFp1ydy+Mz2c9ZRstbgQe8tuf00uQz6dQwpS/TZRZuENUsWCoGtXsyDpTh
	7Sv5e3dcFUBxX4bfcI5t/RQNwtaIDWEa8qsuMSMEuG/AnNzCYf5HTtCV31CsXWNM1vWDuYhuMdn
	YtLWoCOk5OHKzMDA1zyN6l7VFWaMfG6OkeQ8uhFUKK1GGXVx5gVmydU6cES9e4tiFkjkUZEApuZ
	Q4S6T0UaBFGP6WAJ+hmy7wlOAT0sMG7nuBE0FsaxWw8l1aJyotGZ10qmUq5rKk9y8yApdlVzKrf
	dIZLbQP8YV7tCYDbawFeB2wlTO9Hx7hV3rVPVfRWBw=
X-Received: by 2002:a05:600c:6098:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a1680ed16emr32103395e9.23.1791028735351;
        Sat, 03 Oct 2026 04:58:55 -0700 (PDT)
Received: from fedora.netbird.cloud ([2a06:5904:28f:7600:961a:ef3c:e30a:fb0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm161877315e9.1.2026.10.03.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 04:58:54 -0700 (PDT)
From: Luca Hernandez <lucay202@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Luca Hernandez <lucay202@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove CamelCase variable pbDriverStopped
Date: Sat,  3 Oct 2026 12:58:19 +0100
Message-ID: <20261003115819.23641-1-lucay202@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the pointer variable pbDriverStopped to driver_stopped to eliminate
the use of CamelCase and Hungarian notation prefixes. This aligns the
driver's HAL code with standard Linux kernel coding style guidelines and
resolves checkpatch.pl audit warnings.

Signed-off-by: Luca Hernandez <lucay202@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 2 +-
 drivers/staging/rtl8723bs/hal/odm.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index f3989fa33d9f..505c21bd1847 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -773,7 +773,7 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 		break;
 
 	case ODM_CMNINFO_DRV_STOP:
-		pDM_Odm->pbDriverStopped =  pValue;
+		pDM_Odm->driver_stopped =  pValue;
 		break;
 
 	case ODM_CMNINFO_PNP_IN:
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 3532f0d79363..47034ca1af26 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -848,7 +848,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 
 	/* common */
 
-	bool *pbDriverStopped;
+	bool *driver_stopped;
 	bool *pbDriverIsGoingToPnpSetPowerSleep;
 	bool *pinit_adpt_in_progress;
 
-- 
2.55.0

