Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863D25F790
	for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779979; cv=none; b=LnSkRatgLG8DTy/Htnt6mPc34dXo9Qj8dPKVGMV1y1auyQl2H6RrfTIW5np2rV4V/jFuBGUlyrqm5HxsYc4kAzU0q78LdvsLE2v3265UZ8h2Xmm0OFGBn2c/rv6XeQthKLssrJQnpTPbdeD6eDqHXy61Wu7IJ+XyByl6E1e0ngc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779979; c=relaxed/simple;
	bh=ke5omyNrzI0l7qV4J5/XFmXomN82GzQHXhmtA+xiAM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX5He10BXf7JL1V7pPLkvpZixXITZheqdYJUDPjlx+NJzCFmnw8z9gq99EbSmt5hCV6NaPvTrC874wy/NRaKmzzcdShKL0dHpeguLIusa2Ol0z7HIo7WSLn2POP/NgV3mOyHTu0OuwA6+H8oQHi/hR/sEjUkxOxNF0abGiRE7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd/X/cj3; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd/X/cj3"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-52dc1eec86bso2888293e0c.0
        for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747779976; x=1748384776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJwLtbLfmU52rPA4RNCTMawSM4Wz8LVYGwdT9a96QYE=;
        b=Vd/X/cj3g67Y6TJdylUauZ9Gwa+GzpZjFCwzQtGGzn/5MXQDwoMqNSHCbMTblw6her
         rH+5cQoA5IsKqgz/UREKjArvcBodRiv3YgCrR0DI+oAbs4O4g/6SAiemDErSLU5Qn4MR
         k4lToJGgH4aBdcoq2VdsaUCxPKwnk3Hef85RZl7h3Zz3zKVHD+Uh495IEPPoMbq3VSN5
         DHhwA+tpSccji4RgzDGbcrecuk4QRKgHcRltmAc9Qe+gm6LC+VRMwhiE2UpznBZNSDLh
         ZmE/2surPHN2GMImg9ky+xJRzfNfSOtJC46jArocl3EFCpWuYH82KCbljcJ9P/5ryhd9
         VZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779976; x=1748384776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJwLtbLfmU52rPA4RNCTMawSM4Wz8LVYGwdT9a96QYE=;
        b=cgmSmek+c4+KRFqdgoD7ZLQDmcyA2v/00SBxOWZVR99t9ilp7rcv3yULc0H4Lg+M9y
         AaWl2Cgmov29KZ4mRK2LOdoT3EJl7omBRn2YECnelxJ2O3C6voX8rljgvEOhUG1FulBJ
         ttmGosDByJzsKHZWtITQ5zqRTV6wkfe8O4Ajntdp9eAYTG7FS6hYTIwzlTimtL3oIH4+
         kREQrKVi2dNyMBOyz3gWfiNqLI+Mnl1Kt/wgO48CxeYvFUY16RV0u3PKqZYJnYsukYX2
         mw077nCYKRcu9dzLRPseNR/HyIwBXBXMCRC72ka36rj8toVmMyaScDqhW/NzRxtymL80
         wpNg==
X-Gm-Message-State: AOJu0Yy1Nu1eShg8PKCbOZ+b4V6Bfi/7gfWlHLRn0KjRfLu+5CtouvKO
	/YaHKJ7C5HugIEOicBr62lQrIb9orVuQ/GSY62HrEe+5Cyp892ai4dRs
X-Gm-Gg: ASbGncuJwIJ2FAoN0idadHPkqBkbxZWVor2j/kZXfqjCD4MMB0vy5zxSc5KmpkNuUxl
	87bYlhacVg/tOEAxd/Vv+4qTSHEu2FZXVQOC7aeaqB0GrVcAxnZLJwxM+F9ZqyhtyiQ8SjzQwuH
	u57mx6OQSAPe+qC6wvK04g/E8QJE1ga4xQEYZI/zbb6+geMqyMiBFL15ZmUNeVuGE/IlL2CqsT4
	OBbxaoetZAyaAo48IIgvtJo5rz8lUlUtPw5esqUWSH4ZlMrEz6q/SLZ2pnqRX9BXBiMoW2aOtQE
	WEjv8MH45aO3RMNvMceLixgjEFWmwsYjlizBp8tyBc/zktzIi/5Bwx/6cyR+I7be3FZWfn2OrXI
	eLns4
X-Google-Smtp-Source: AGHT+IHUtPC7uvSaaRwByMuWYFjZqKO3I9Swn/80Gd9jn3ae6yi6KuFnKttVHj8MuhwmrT4t+PyY8A==
X-Received: by 2002:a05:6122:31a1:b0:526:23d2:6ecd with SMTP id 71dfb90a1353d-52dbb602cbamr16911774e0c.6.1747779975692;
        Tue, 20 May 2025 15:26:15 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.251.100])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e96bsm9231343e0c.29.2025.05.20.15.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:26:15 -0700 (PDT)
From: Donny-Dev <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Tue, 20 May 2025 22:26:10 +0000
Message-ID: <20250520222610.8776-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a checkpatch
warning by renaming the function
_Read_EEPROM to follow the
kernel coding style (snake_case).

Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d..557bfdf09 100644
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
index cb44119ce..e4e7e350d 100644
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
index 208040874..63373d665 100644
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

