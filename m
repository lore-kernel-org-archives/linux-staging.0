Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6F7482
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747883748; cv=none; b=ASePbaqgQVp6INRSVs81QxZgAA3jxlJdFyCKfyOuC95UqgrUNskhVzGzIcg30TMf5xavoelff4osT0QmgLXcLcFn855dCMeZ++j1DPoci29hp82HftCgUPFFVfry4+bMcPiLpNC0HK18DIuqWwyMBBoFDA8xEGa6dtqDsfNPKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747883748; c=relaxed/simple;
	bh=SUfjdbOOyVcR4RT6XG8NltP9UmsXqUeVad+9E46ffYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hf+HRAeGOotPGtRv6nyY+pSrdmy/sDOV+3v4rgIo1WFgoa5y0xmfFOU86cCbPdBT41dx10ukBoU0XvQ0dWvVDUpQA0cZX1+2KfAiTlDM4pCcW2kbG9cZNbSv3Dh+JezmcDAO1MONshhEu1SdF+/3Mw8OVl9oS0ekeBiSweuQm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWuwDu+N; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWuwDu+N"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ff4faf858cso53278717b3.2
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747883745; x=1748488545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGZNJiwtsj+St33RUlNLlL6+NdGrdiDgOvYCISmR77M=;
        b=lWuwDu+NKl9lwjZW9F+OZ6X+9i7D2sOIh4yNMLIzeDKWuAOX7Nz3mNA9hjPSZwKeAk
         zYYQgcRthHX6JjKxz/ywNjU7zi5WozGIQHyWgU5pl8mVOFhNhqx6+4tKbrHmCYrP+LlS
         hSCFqSk3fS7wws8xganLLAk2HRGWnphK4tpYNb/jyPeH6ZT/QmPsCZg4Thrvxtav+9w0
         HKtlTAtpF7CKaizPQZlKY5KFiiYEY4oz2hEnQBLieMQ++isrIpAAUZQilNn56g91zcwI
         6hF2bQAwxM7bVClI4ZoMeO1YNE8Q5DEXqdblUfxTHCT3+bfB6JMSxKgGGkJjesapjJEk
         xYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747883745; x=1748488545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGZNJiwtsj+St33RUlNLlL6+NdGrdiDgOvYCISmR77M=;
        b=fEilYhvsLPR2WeqHi/5kESCuCzw5rolgKTcFEUeZ3r3yr2a/3kiP45u6ch//YV9UtL
         ICp3ebF3XgLLfKzjORjTzaHAmnKPhkfw2ZtNKVjuuLv/UdsJ6huYDhD0aEQPMaqfCLsV
         Qd9vg0eO4fRzHg5K0Mz39b6JqNKU6tAJKeSLqxA0uv6DP0oGyVu3CH7tG0acS90qWx7e
         WVHo2+d1qTsKL4Ji51iJg5O0uP8jObsj5eve45wyo3sT9GcxJ45fotvVkFBL/npXuCyV
         KV+tddei+jMJmm75a4QFjZrxNbZx0lPaU7E+/cgZgMyCiHYEIT92EgK18mOa+dUFj7de
         u7Uw==
X-Gm-Message-State: AOJu0YwprR+9t6ozxyZ8cW7CC/oQE+gjNCLNGhHgMn5YdJuuhM2WirxI
	g5nKIxZRRWOohR3DOTnwdCEVIuHidan/xc8FM6H9Z6pexuD4CgBK//J/
X-Gm-Gg: ASbGncuz1rabxCrKT6RCKGiGDKvr9HhggE3OtvUB/9rBxPv78Li0M1HElO9RUJYb8bP
	PT804Xl/AziT0OAhJT6HyRTssAGYeK3MkO/wQKjbYJMMC0l0kmP91Y3rz+xo2Ax0LT1MhxJQPdM
	PxA8KWtV4JGL5w1GeuqN9f38yXr+6s5OutChYxg8KkL1tYnFGzWNw14ZbVo4vd5lrLqV1g/Ar9+
	4ve8BFPLwGqRV1krgPpOgnIC/ozrbBp8GmvmnnNJVlate92iUj1DYfWWqrb2QqD1wRs7m6UALLm
	VvmLHo9l4X8RZHfLDJdTSwGJ7eUeCJhYorNv6/bv/k8uiTzzIyW90PP8QamaBaSg3kpaYfIFYzt
	D52k=
X-Google-Smtp-Source: AGHT+IFVVnwZhpOTSDmkV0m0hG2I0u1vD/KKvPMtol6fatoQIdDOFd8FMRcVIz3FH1QEsqygJRPqjw==
X-Received: by 2002:a05:690c:9a0a:b0:70d:ecdd:9bd3 with SMTP id 00721157ae682-70decdda059mr102568127b3.27.1747883745339;
        Wed, 21 May 2025 20:15:45 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.36.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70e0dc97522sm7227b3.56.2025.05.21.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:15:44 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 03:15:38 +0000
Message-ID: <20250522031538.30635-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Donny-Dev <donnyturizo13@gmail.com>

Fixes a checkpath warning by renaming the function
_Read_EEPROM to follow the kernel coding style (snake_case).

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 49bcefb5e8d2..a0b85beffe5d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -15,7 +15,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
-	{GEN_CMD_CODE(_Read_EEPROM), NULL},
+	{GEN_CMD_CODE(_read_eeprom), NULL},
 	{GEN_CMD_CODE(_Write_EEPROM), NULL},
 	{GEN_CMD_CODE(_Read_EFUSE), NULL},
 	{GEN_CMD_CODE(_Write_EFUSE), NULL},
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index cb44119ce9a9..e4e7e350d0fc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -636,7 +636,7 @@ enum {
 	GEN_CMD_CODE(_Write_BBREG),
 	GEN_CMD_CODE(_Read_RFREG),
 	GEN_CMD_CODE(_Write_RFREG), /*5*/
-	GEN_CMD_CODE(_Read_EEPROM),
+	GEN_CMD_CODE(_read_eeprom),
 	GEN_CMD_CODE(_Write_EEPROM),
 	GEN_CMD_CODE(_Read_EFUSE),
 	GEN_CMD_CODE(_Write_EFUSE),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..63373d665d4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -684,7 +684,7 @@ enum {
 	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
-	GEN_EVT_CODE(_Read_EEPROM),
+	GEN_EVT_CODE(_read_eeprom),
 	GEN_EVT_CODE(_Read_EFUSE),
 	GEN_EVT_CODE(_Read_CAM),			/*5*/
 	GEN_EVT_CODE(_Get_BasicRate),
-- 
2.43.0

