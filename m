Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A418FC97
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 04:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200277; cv=none; b=gOSpr+Tdua4u8mglZJLIt+QzsmYghT58Bg7iPHu1C6EqeYr0q1cCwhq3IATu3ErXcX0OK4zpXb7lzpfXwEnufv5NFay68yiEZuhhqSymCKF/AdZ2s7lsG7mvkM/UCGB2V2ejr5sjist/7JU5rRS9ZVut/FWmuoNtJXvlF0uORj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200277; c=relaxed/simple;
	bh=YU9uFpWzCpjrDe7V0quLbFZCjnJQZxntOm+1H5B3wY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2usV3oAzMXaBT0ZegTC0rJFPq+QA6d9QHVqz4ca98NmM0/nFZI+njOiLNHp2ySDfvQpKyFdbpymMGNbXY/HUcvUhGQ82OBPky5QqucfRNo0yAz4u7mtXz//4Ch/AcUzeOREzhyzDvChL99dMuCqF0TTqJMQpWjL+DvsDt9fDdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+LdC0Xf; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+LdC0Xf"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85a2ca7bf7so70820a12.3
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 21:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780200275; x=1780805075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qHHrpPfSaXbyHQ0iiqqvO4EBAyNPqi7WxrN7W4wSaU=;
        b=N+LdC0XfLkFtO2Rb8Ex0ZtaloP/q/3dA/c5DynnGYnID5+4YiKRpUt8nnh/s2ghaQr
         PVqBqVyJrzRqtVnO0XexoOL4jdM0OA595tYPvsYHqsDQxg/UNEswUHUnz82L9KB0fjGZ
         7xHfavLRMwNimWS+GePgzOqeGqaVM6nfu02E/BcPXItxstWMI24GbKsZLMoJL7koFRIf
         PeYKyQSAYU0EdOl/9iHOFa7ncoSCjenD0dlLJx/IIEcLHxkIvti10RJ2Xi7NYdCGKx4I
         dapq8hU/Q9LN7+sUgsSDfzxykp35ENb0J5EE+W6MwE0hKrqptDgJQF2p0L7BgqrCt1bL
         izIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780200275; x=1780805075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qHHrpPfSaXbyHQ0iiqqvO4EBAyNPqi7WxrN7W4wSaU=;
        b=g9yO1hQjLEPT7aJdXuPJs0Zt3Jgn1HzRge5FJ2wnxCYvvJ12LnZemVs3ABE8vha5eD
         E9sNlhUpcIvnWzZPjjFalZ1jEbDY/gG/IBC/KnPKBZVN+LjktGX8REWtYsXoyni+ETSl
         a8c9yOCylLNWXciODo/r7BMFfzHNlZhDDtoMWYmHK9MPm70/VnXP1mgS33iMuudZiBns
         4b/Bx+JmEtRjXrbl0N8YzObvOD+08Wx9hBGwLWl7ZDbyqOx0iQMwF1ZRPSuFwbAVs/69
         /Sb5FcV+gRP/jY/K+vPLZw5jwEqsB4ProuJMxgwsIJzkEhsGL3y2Dkq/WCY+3klswZwB
         E+2w==
X-Gm-Message-State: AOJu0YyZj55LKwj80Fo6BV0iez5na8neDs1p66M2TDqoHCMYjC1enJao
	JLAP7bh1uMm0v8FwdE2U3QKQNGXJU9Fla8Dnm4EtBhrFG+OQxhRCYrnZ
X-Gm-Gg: Acq92OEsVT2C1pAIKXrBohkqexmpVqG6N6alkHCRinCIqgemnXzyleWqw61Yw/D55fJ
	shRJd8kFXxGLU8jzfjNK3MeXBKb1X9GG9w0/K6oS+3knD068IIEgHk8KLr2EncanmjJlsuwsHSL
	IDnwAqb9sArvrRFgmio/GEnsdTDYFkxcr6IS2OBA60R6Y83uVPNtnhboP957+7oJGY3MnbtCa4Z
	sqDrvQ4FQ1bBljvbDzL//XSJPsPrAJXHAyqEqlmbriqUEiI+hY2bcrSi/4lq05Nm8a+SqtY3bEA
	Szl7wrOvpTX1dOzLFdybe0Dh4s55QBGOfcLcnXidtjZEN8XSkdLZ1PakTmhIjWKWI9m1NcGacEc
	PRddbbrsEk6S2Ektq7MwLHyQQX/z4n6ZEmtLhfDb/uFZZrcqs9Ah+Ajhf+P+s6JwUCJDp0CH708
	oupgg56B1vC17dOPW3YKlMuaOl5MpIpOBJ0XM0mNH8LSB+joB3U/HF0hfL
X-Received: by 2002:a05:6a00:2343:b0:82c:dd31:b844 with SMTP id d2e1a72fcca58-8422579bef2mr5340207b3a.40.1780200275321;
        Sat, 30 May 2026 21:04:35 -0700 (PDT)
Received: from fedora ([157.50.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cc3575sm6393012b3a.47.2026.05.30.21.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 21:04:34 -0700 (PDT)
From: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Fix indentation in odm_EdcaTurboCheck.c
Date: Sun, 31 May 2026 09:34:20 +0530
Message-ID: <20260531040420.5426-1-praveen.pattar2022@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix incorrect indentation of an if statement inside an else block.
The statement had a space before it instead of proper tab alignment,
causing checkpatch.pl to report 'suspect code indent' and 'statements
should start on a tabstop' warnings.

Detected by checkpatch.pl with --strict flag.

Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
index 578d5712645c..9baca2aea80e 100644
--- a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
+++ b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
@@ -150,7 +150,7 @@ void odm_EdcaTurboCheckCE(void *pDM_VOID)
 	} else {
 		/*  Turn Off EDCA turbo here. */
 		/*  Restore original EDCA according to the declaration of AP. */
-		 if (pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA) {
+		if (pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA) {
 			rtw_write32(Adapter, REG_EDCA_BE_PARAM, pHalData->AcParam_BE);
 			pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = false;
 		}
-- 
2.54.0

