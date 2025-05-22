Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7301F18DB14
	for <linux-staging@lists.linux.dev>; Thu, 22 May 2025 03:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747885814; cv=none; b=ICJ7VYgc5wpJye4mYFk0RZh3KwzySlM9DIhy71xFLatNiOGWri8Yb365KA5zeqHOWWr356UOs6c79VovLANRanHP+3J9/iSM42Y/KmGx1CznWczYLLO+Lers+1HPVn3X6CD2wNV2Jxk6f1ptR1sDPaVcsjh/JsrFDICFcrNhXUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747885814; c=relaxed/simple;
	bh=EhCHW5q0cCFKGYwmnE5zrblG2aU/eCsuzx+ii1jY4aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehPdtJjhP9CTJFc5QvdhiIVwc5T0g/HD1jpZRBUttaYKJ6lpVXg7OKWZHno4yr+003CptYt8sYBE8k3wtoHF0fpx7Dwr8oL46WzLt1RaqLK3DtyZcNepQVgfO9/Jf9bWPw7cfTHKQbG7Ymz6fsz4J7tCS55uyQtNcJ/gSAsw/6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8U/+Btf; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8U/+Btf"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70b4e497d96so70921197b3.2
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 20:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747885811; x=1748490611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arxJV0GpiWBI5/UzljfX3wVd+ClYz7zCQj750146rLk=;
        b=e8U/+BtfREHYprtBylPgr/iPFrdMOSZeHJt8NmAjC26mPyRLkNivcojhtEQI4dUEfs
         ZCblJYxhjRgauIyWI46qZYTaSFj1hzloaFliww78IOI1eUefwEoREuOfLaoADbKD7Ofd
         ceyTKLSiKACYoj2drQDbJHmKpllEdG8mKl7UV5QMqHGbtGRPPJHCKd8R1SjfvLJ4vjGi
         gBji1AbqQ1nCupuU18YpP7RPv2OeosmbCOsOvOKhjNLXtt9vCmWbIZ2PjUWlptqOA2sQ
         DqLzZEXTMewivHMZ3igVUMWQCycAJsw6QeetyaWp194/m+n9GYcbU14XplTPUctmg34g
         Novw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747885811; x=1748490611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arxJV0GpiWBI5/UzljfX3wVd+ClYz7zCQj750146rLk=;
        b=OnwJJ01ZaU59xj081q3CmlgsSstoYp4Dkn4TzHv6p4kBRPGEKB1E282cugV18s229d
         r8JxlKRKvMlpvtkg54bxBA94lmhjjdKPNCr6X2cmj9/dhytwf1QSuDiBSYrzhTHsv9s4
         2+7bQESwPiCcES0wWC3vUqAvPt5sygYDL1zQWqVySl4PwNeg2CGq02/NICQQwn4I7gIA
         MTY5k9gZ8+E5RP63qJO9EIc8n7fCn7zfpIK2zbj82v6EojiJ3EEf4B2T+4itiizdX4hV
         sOZln3eElTi27bXkbYUtjfCvrxFj0u0QFBU2BhhzOcQm4K1YCnMGO+LTunjnGAkEZM80
         PStQ==
X-Gm-Message-State: AOJu0YyQ9aGMg71DTLEWKNWLgeQ67J5ym9SFqBrSjYABG4EZgIr/Vmc4
	EMISPZwhTGI591cTQpmWcx4QUjZBkLf2ZtlBMUL2ESamd4cTP5qy44z4
X-Gm-Gg: ASbGnctSneugmN8Ht6CwwKkSbNtbYJ7X8cN4cqIvqsDGtjSRYHJkLzrV0ic3mhkSkmv
	w5XRSeEF8e8bIEbdZA8RksGg+xngJWCOMVKTMXqaiixDCtOmST9hErd2S2REuS8yGwXt19DbZck
	IOl0viS4Vg4xhWSjf243FSFRwomuZ0zEvp/9NP05gMV1wJGH5B75rZNPHCjXNqE0iM9dEAarlZ/
	uWRhQj77HFMRhEwRJYRN44tC5cyl8EaNIvBYgkdJX/lrj8tL4qCEXqaZ+Eg9Tdp/rBb9zjBfano
	f4S42LY2FaSv5e9oWr0UrIZNTAxmla5vKF/v8gaE1t/FlgqwDfG0pjD3ooch+VHy2zXhOsIQ8YM
	vD08=
X-Google-Smtp-Source: AGHT+IHoo/G7hIzty2H/6gOon8Xz+U/wkelfdv6DK4y23vQrHuGLtdPz4NySnwPueu2pM+YzjFbhYw==
X-Received: by 2002:a05:690c:3390:b0:70c:9364:2c61 with SMTP id 00721157ae682-70ca79bf741mr308111097b3.9.1747885811328;
        Wed, 21 May 2025 20:50:11 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.43.125])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca8362faasm28876127b3.62.2025.05.21.20.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:50:10 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 03:50:03 +0000
Message-ID: <20250522035003.32314-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

