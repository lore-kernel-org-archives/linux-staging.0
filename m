Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9C846F
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 01:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875630; cv=none; b=IMEtSCSRKKu2dnfWmQv65y/EO2xwUJlfxy71WAGCaJGK1H49sHhlcyCOsvRude7qJfIs69nZtmTnF+T//plJVy5eWNh2guklOZ2vkAOBu2uPo/3ao3gXVFE1yLtnZvENw/RD+cp09MCjMkJeCmtJow1smFVdmHk4Xity6mbSPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875630; c=relaxed/simple;
	bh=WxIlv9jW4Arh7tSQEZ2nBzbxy3ddO06a/o6KaenAb7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8mKTGylBJVn3Q6Sy7cKQWQPUuWEtL2c/uNqnVmNtGPnnc6u3dF05kF1fGd6u6kRAfB2mqUhaOjz1E4gqT1blRdRMe4pAwCWNB8QJYbmisQFna9aoyzH98nIG1Ak2E5RIJ5YpLLzX50fBY2m5Dj99AQZXubdnllrihFJQlKebLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjANCi/3; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjANCi/3"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7b962a156cso3958467276.0
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 18:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747875626; x=1748480426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93V/Ukr46/zUxI5qbprXiqf9vu9M6wpGQ8h8nKlCUys=;
        b=cjANCi/3dzrygYxt9hveaaVfW4vsw++CnMZDh7s061h4J5JmSsiiH89Ye7YQTstzaa
         k0pjJowDuUuBKjXzjQUskSX6ljhGkS1LIkplxKv8nSN0NB6FiTJ0l+qFsKUFyeQS7CDw
         VWpYQ2hJOZdy8gr8iB0qutLRp7ayJQubayaLggiJ8CtVtu/DkMJLQTkfy7mtaUOjyMzX
         hOaqqoFy0lbbwIqRaRDQwKeCN9a9T7y0d3X9bTV8/WCcxO3s0WewArDn3mnKeiPNUOLD
         GbvclCR/f31aQsPIy4qHgojnQ/i7Mx+6/QqVGZ9ltPKYohrxv+M2rBCH9NVJZx0ZaDX1
         C2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747875626; x=1748480426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93V/Ukr46/zUxI5qbprXiqf9vu9M6wpGQ8h8nKlCUys=;
        b=i4fL2h/WVO1tbgvb0RuGzxiHwANol+1IZtNcHPYTCVdI+F8Kgr9CRiDEKuC8npkZPe
         t7R0VvRhjUl4rMfk1OaNjEW7A/HeihhZ/EomHmdYw6CCcMUJhcV2kHCeodKvVTMFSrea
         c6huwf4tHD2ovk1FWvuxCKVpBytIQ4JspVIjPyuMzZszsTd6hXbclMF8F6dOcmqH3naH
         +1k2JR++B2T9Y/1+odhAFZZVtC0XJef/zwLwFcM6QnOgcQxZKlCJzuxJqGlKXhLy8+/d
         c8mDLGXZ45DQN1FC8/2UbXSv+CCNINnTpLupEdDK68RwXqE/kj1Ov2LonH4QGHuT6rlE
         cSIw==
X-Gm-Message-State: AOJu0YwhS6l397pR9OP5rZYK1Wvs9XWJq8KIZBLdfQz/X0MlpUMOUGuX
	SQB1ryE6Tan3IHC4nWrQnDT0XdPJtyJRvmhwE82DRaEbfxbsYlrGD1vp
X-Gm-Gg: ASbGncuB3Edb0kIxaxsq0I3dTIdti2ePVgDUFzPEkxe/hpiJGCkf/mBcnX7sCIf/b+2
	JPMEzzXDsIiIgBH/qAv2ITGjS61icGyIZ3NnnJpp9D2FwmZ8xYQbfotrIpCkqWdMNdeL2/+zL7/
	VpH25SlvaN4+dN5MLXp2n+FPTNV+p/DY9vPJ2WFSq537HmoBJN6tWrJ8RT5MLOIR9EVdrPlEgnZ
	UhpkKmDyXQmy5hfxOkSJfa/BHEKEMosF6B8nrDBz8xYboSe0bUhd3EMe0tD46NoY98sW4GJBgmw
	yFCWehre0AJG6V9c4piQ1T1FPsotII4ySQVpjSF8qAZLP7PHrDgm6pSlTIhm2KLprtImI2VU989
	S9Rnk+uFFQJMO
X-Google-Smtp-Source: AGHT+IHyhsF7WtWhEVCAXjNJHaUq4eRTzhpMDtt93t8UCBYD1QyzmhPHMkS7ZbzQ7J+cr63omA1A8A==
X-Received: by 2002:a05:6902:2385:b0:e7b:95eb:be93 with SMTP id 3f1490d57ef6-e7b95ebd2efmr23331627276.33.1747875626481;
        Wed, 21 May 2025 18:00:26 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.36.62])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b85b4448bsm3744771276.35.2025.05.21.18.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:00:26 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] [PATCH v3] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 01:00:19 +0000
Message-ID: <20250522010019.24779-1-donnyturizo13@gmail.com>
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

base-commit: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
prerequisite-patch-id: 669780b7fd46182223f192ddc59e8fe8a549c490
prerequisite-patch-id: d6c04e7cdd735e1491a1e60522a1724b7e122af4
-- 
2.43.0

