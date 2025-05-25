Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7A8F66
	for <linux-staging@lists.linux.dev>; Sun, 25 May 2025 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748141305; cv=none; b=tdS2QobAfVqfIWhzf8fYqbND8I7uiRERmfZCf5a3yqwhJqSTG7qsezz/qLbw95JI6VN6Q+28ERVQ0S0XGucvKcdQ1k2f+DDJFRbY0rONdE2MrfInqD2ZxXpYmra4GXRR4uVi3r5eXNy3gRuYwvznJ+Q8jQ+Z7LqSYgz4hsq1GXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748141305; c=relaxed/simple;
	bh=pWTqB9al9MLBk/zKau+VF7mb/iqHgOdoI6eDiMU93vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UovkF87qka5/bgnc+Fho51qwHkSgo7dYvm/2TZbi1qOgPWkZShGHUZ2hu+G8Cul0Kef5hRxLQVoyujLMpI/j6wYjJDSoxx0Q2pqV0Bk/y/pu7GoTj6asbguubPJwcskPzLVza5Z9QLy9cP9T//5zCwJYuNGEjAJa614JcSnE1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFT+TyOO; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFT+TyOO"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso776945276.2
        for <linux-staging@lists.linux.dev>; Sat, 24 May 2025 19:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748141303; x=1748746103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5H8miVdrreeo2R5rwgILx0vbH1/jlB+6nndREjSBVQ=;
        b=CFT+TyOObRZ5sT4oRR2J/kx2XJcELCxEe/C7NZDOISwDLWIlxh0uocdDG9i9HixhfQ
         tFKwlKr3pwwOFHMrpycnq/Nhl6d1jMc/FdMSRnZbfe3CSdnkB0cpuHkaI4bEbNvNLVAw
         zTnXxgTBHdrqB0yJlP8x1PapmVwoT2oEsnb6WfmwxMH2Vaej4uD7kVpIA+vV5zKoeKeq
         gvRZpoc/wg49UVSD7T9/DmUtsA/QiO7RWl5AMBtRelt+xwCgDgaaSkBRJu33QeWBoExM
         hvrGNGN6oUcsKaZS4FhPyfTrK5K3hUvxgR7XjnLp5f9cpqrVi8vpiLnInb2gUe1l4fVB
         XYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748141303; x=1748746103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5H8miVdrreeo2R5rwgILx0vbH1/jlB+6nndREjSBVQ=;
        b=v5As0evD7F+ZgK7uIrkNUBYCYQ+Wf+X3d28cblOMK5qxvE6oryRU+cnLywPBxkEL98
         loLapg/Q3kg121w74S2Q6+02PD4DP2i6G+lVZMCNAyyuNEKB5LBN7Hca14LSxOcMxuwe
         xEEbO7++53fPmHpb6zsJJoHWHOqPdLZfAI4fC/zlF3+mh4jeOCPh8GYcBkm+3BG1J5Sk
         vBHl0NHTgtmVnYPs3Rst+psn5kFnciZ1aWPm3d3jMhrJqxnfsmhckP28Vb/fuN+akBJO
         +HcsViG9GjsWrzCzSlPo09EBsOl67WJfYQZsaPr3AByWRm6lr+HJ+qYsZiLPvW7orANS
         H9/Q==
X-Gm-Message-State: AOJu0YweMx+FzuWqY0tLTfNK1xfXhDvc4cuhRzBRayD6HozOOyiiAjju
	EtImDS/lh8z2uSeE5Yg3am4d9zExgApebYF1/nhjbtbgO3eAlqNZEhtu
X-Gm-Gg: ASbGnct9qwSL+AEAtgs1lkaG7kwV45BrSISg2KoG1s0pwx//LcwKnOpot62rX0hiApA
	1hA+Ad8RqUYLAS43E6VZukaYYKVYKJA7CaLuW25TwURQgYMmVNkeQcY5P0S/jH42wU+Rgbo9Eez
	lwSazYysymwFLEno6sOigv0KDveI4f5hpghQmuiVfllu0kOCXdKKpBoqHJhe8fxxsUTxP9QoNV0
	tiuEY35hHapJPeiW7/uDCvG6t5KF26uxhBZ/z4pGbjPTQPLZPeerubeNRVSaCKCdfgDkWulvIgs
	qWuVwUhLlNl1TO6NPi1nrKHz2jIRdJHOuWAd/vPmLKKXmAdFkcYLVIZMyIVCVxUpI4tXxmzLZP0
	/0KA=
X-Google-Smtp-Source: AGHT+IGTYIpzzoB4R49eo/70y47qmccpJpO+y0657G/ZHOyDrLFSgO2Wihs19PpbwoGxGQMTdisH3g==
X-Received: by 2002:a05:6902:330a:b0:e73:2da2:c300 with SMTP id 3f1490d57ef6-e7d91d84308mr3757453276.44.1748141302842;
        Sat, 24 May 2025 19:48:22 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.247.35])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7d696663ddsm2172687276.21.2025.05.24.19.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 19:48:21 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Fix camelCase to snake_case style in core files
Date: Sun, 25 May 2025 02:48:14 +0000
Message-ID: <20250525024814.4362-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the functions _Read_MACREG and _Write_MACREG to
_Read_macreg and _Write_macreg respectively, aligning them with the
Linux kernel's naming convention of using snake_case for identifiers.

These changes improve code readability and maintain consistency with
the kernel coding style, particularly in the rtl8723bs staging driver.

No functional changes introduced.

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
v2: Rebased the patch onto Greg Kroah-Hartman's staging branch for
proper submission base.

v3: Updated the commit message body to provide a clear description of
the changes.
Changed the "From" field to use my real name as author.
Updated the existing Signed-off-by line to reflect my real name.
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 557bfdf092c2..81f795a82711 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -9,8 +9,8 @@
 #include <linux/jiffies.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
-	{GEN_CMD_CODE(_Write_MACREG), NULL},
+	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
+	{GEN_CMD_CODE(_write_macreg), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
-- 
2.43.0

