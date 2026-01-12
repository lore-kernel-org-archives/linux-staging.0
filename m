Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833F837F0E7
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239769; cv=none; b=NNwMhXTb8vrp//I+4z9QMOZuPPBVyen4Pnr3aYy/Uaj4zOOzmJegtWz0qfVSfeaoNGFAu+tGK44tD9de63o7o01gJagOulNoHlx0tvCmaMA+uK7CiFUXfI2D4acMM8XKY0LzLhzCl2p++XzR19Zxe2zcXtzGrybX3FCBQcBYjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239769; c=relaxed/simple;
	bh=L8CQ3r+vtYdI+VQwjjYkrftjtLq9oql8wQ+Ivuk7tbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5evGwct6+nfBnf3v1ublVo/j3htS5ChwN5yDWBmcB3N14T+KYFzamjnvO0f/zHQgL24k9UOTbHg7mR007yMb43kONWI9HfePXdajqMwsuIVIbPTQhcLmro98nZKPlEKQTTH9tuM5iEziIF9mZcp5QIgSzQ8sB2w51dEnu72+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSjTHtUT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSjTHtUT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327778df7fso4238736f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239766; x=1768844566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+A7p3tCmb2H+vAvXxvnb89dmspCiYgFkYpzMJghjrnI=;
        b=QSjTHtUTwfzXUV7TjEqfDQXTqJ9NY02JSUQ/gsWhFk5AHN3zdtiOnEB2xp04fIc76N
         ZcTcEtU5C73ngurVi6w5eBuA1BamByhHG1uvE3iFDJezt5vtvXPip6F99Z2BCtwjnDpX
         cfhnZeoXH04baKq/NIawU0npXtwPrTNvSWSLBrDuERolA4Mddk1BJ4JPQSwPgUTAcABX
         WjziqI8k/8B2L31jqU/eVOAJ0YBdLj9g8X/ExZaOyQoGiFGNiEBulqD1mjU2SicaDlh+
         xrXlG/VhoQZ54L6xGdNiBIdMjNxpjEPlm33ld2aCJqP7s1PfIfmRI+BmWL6J/dCznFn5
         oNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239766; x=1768844566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+A7p3tCmb2H+vAvXxvnb89dmspCiYgFkYpzMJghjrnI=;
        b=lMWYdSjNd0Q5R9CfEiGlPcNGYHWzdFQ7m07VmSroVvQGOQORhg/Uv3uZWxDZSlt+me
         J57W/iaFhvbgEnnvPszgvpgxlsfMtZHZe+MFZiEPeOddnKGq295fxtCL+zr+XKqIZXvs
         KQChZTGvYqohUA6ZcTawBqnVggK7fbWLHWpbb3bRKlhLPXbtt8nMtTLUuCfMN8P/jF7s
         tr2y9vRWaaocupLo35NLckIFoO2L7H2ORmGM5HeWti4ld2Ol/DLRQ5KZOZ+8mWq0LJqN
         iUL1Cwb106iFfixxWvkKP/sf668LP1dfpEP4t1Ak9jqqCI8yxu6gt0Y1HADpRcyRNcao
         2sMw==
X-Gm-Message-State: AOJu0YzFRgYJZScrhRqPjooXbhd78Ua8q+B/5t7Q5BCh7NZA7rm73C0m
	1HeVjxnYxyuYUI+2zKzdg692BBDFX9LRJunGTt6MGY48gQJOfT/sbuxmaIh73QC3
X-Gm-Gg: AY/fxX4V7vlvFCjtdNnRyQDhy7GwrHOPc5+YLwmlKXzS867WQ+SMrTIf7VFPHWdB/bR
	+U3vlrWoy9DG1+zlwHdhTgymlUOqTque+LWfRG/K8nDFc2zRwUsZE72X8MNL9TSgfPyG0g9leTC
	7dDxxDyS9rhvvv9W/w4PTLa9D8SFrHNxERofjb0itYGPFT9O5MjRClb6EHfcYWjInPHwReDGUaz
	l4b0chKvYBNbyOEpvZWXhuOEMwcu2xyKaOGRgrThq2JQslIdb39f1YbmGPHS1qlzTAwLK63GlPt
	+zrKAH5bHWPivtLpT/Gv1SD3EbwXvmW5lpJXcSNStMi+JGjeo0GzxIDDxV92HKZNnOsEa03SR9+
	5h8kKOw8WNviFRT9T6+RHJwKw3uFI43MSeogldC4eoUTP6f0O6KZSfpqIfkUCYVpKoW2tuB6hoL
	ZrStB6dVaogfNIcwTfr1zqu1hrZdVOHY+/miy7Kbo=
X-Google-Smtp-Source: AGHT+IEvrEGd6TVeXr4cuawZAkB837TbvPcAjWMSpeOYPCFTd4ALEm8YUpNlGMiaI5Wal+OtdnLLow==
X-Received: by 2002:a05:6000:18a6:b0:430:ff81:2965 with SMTP id ffacd0b85a97d-432c376449emr20269668f8f.49.1768239765734;
        Mon, 12 Jan 2026 09:42:45 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:45 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 03/10] staging: rtl8723bs: Fix style and formatting in HalHWImg8723B_MAC.c
Date: Mon, 12 Jan 2026 22:42:20 +0500
Message-ID: <20260112174227.14922-4-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple checkpatch.pl warnings/checks in HalHWImg8723B_MAC.c.

The checkpatch.pl warnings/checks constituted:
-Lines should not end with a '('
-Please don't use multiple blank lines
-Missing a blank line after declarations
-line length of <Int> exceeds 100 columns

Adhere to kernel coding style by fixing style, alignment and line length
checkpatch.pl checks/warnings.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index 9c07df254eaa..0bf9eaceeb4a 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -8,9 +8,7 @@
 #include <linux/kernel.h>
 #include "odm_precomp.h"
 
-static bool CheckPositive(
-	struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2
-)
+static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
 		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
@@ -33,7 +31,6 @@ static bool CheckPositive(
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA  << 24;
 
-
 	/*  Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
@@ -50,6 +47,7 @@ static bool CheckPositive(
 
 	if ((cond1 & driver1) == cond1) {
 		u32 bitMask = 0;
+
 		if ((cond1 & 0x0F) == 0) /*  BoardType is DONTCARE */
 			return true;
 
@@ -62,7 +60,8 @@ static bool CheckPositive(
 		if ((cond1 & BIT3) != 0) /* APA */
 			bitMask |= 0xFF000000;
 
-		if ((cond2 & bitMask) == (driver2 & bitMask)) /*  BoardType of each RF path is matched */
+		/*  BoardType of each RF path is matched */
+		if ((cond2 & bitMask) == (driver2 & bitMask))
 			return true;
 	}
 	return false;
@@ -212,7 +211,10 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 			}
 
 			if (!bMatched) {
-				/*  Condition isn't matched. Discard the following (offset, data) pairs. */
+				/*
+				 *  Condition isn't matched.
+				 *  Discard the following (offset, data) pairs.
+				 */
 				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
-- 
2.47.3

