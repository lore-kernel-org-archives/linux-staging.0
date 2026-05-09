Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DED1DB13A
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 05:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303568; cv=none; b=tdVZfYDOp1ZT2jz6XHMSnevWGleM76fS0q6uevVBz0BWKs+vL4zFBFEeY1GD4a9jIWV786c3NakMSBy+8+thmxrMEK+g+J1ELNtLKi56A9yW9gbMceJETpH/NvDSI+RmPA7rlk+J0d1BnQ9vPASgYu5c9OGGyPYtHZLIMFlsE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303568; c=relaxed/simple;
	bh=w4ATt3P3lrlthTiBVk1sogm4Y7nfMAxy1BwfCAB8SC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dXBKBDR2Fp32zMdm+NLMkeZ63gxsvlcWSaJ/E/1ZjWN/qlQu6nEsIcORop8DVlM2RpbIzvqCbJUtnZY4N3jme6M/xEPTn6lXJzVYB6Fmwbbj8KRV3EYlIhQw/SQ15Veq/lYYvAVjFSmlu/s2C+6kdgUcozo/dtGrdVOFCLcJrUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOvAAY31; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOvAAY31"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so6932334eec.0
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 22:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303565; x=1778908365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9vLmaed1NKlqpycQGKmJTiTIqndTowhpZapHL6YmV4=;
        b=qOvAAY31lcx9tWkfsJlWEOg+8lk7DBcVLPEAEWqjR+PLkM0LK2L37WgJ1Zn2G9IR50
         hKxWh9+8VulD4R0ld72HzcXhqcXS14OzU6VSgPfon5S3euMYspyKMgDSzQucm0bL8wqA
         DUdxzQUJ4vWBwLEqMzIanTMspAGgrVF49quGJuh2ZY+Ld5B7qxY6XzmLL2jsG7OyojRT
         zLkXV21lUdLeMlipUZhg0N7PYlZKk/mLDj1jW4+WdDdvh32SW1P+kdEuqrT8E75clyg+
         aD+ArZ0pRVC7QKrzA6aB1FR43ShNGhR5OLONZV5RC1s6IR4GBLL7PvgYBWD0EVIslMwU
         tjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303565; x=1778908365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9vLmaed1NKlqpycQGKmJTiTIqndTowhpZapHL6YmV4=;
        b=nqE1jQPXO6aLdOYRVnPtxQe3KH2lgi8xovk5og4N63lkU7iy1DrxUDRdZPedB0eehu
         +zkuYCCMbgJjbuGZcG0Rb4FudjZNkZSXg5GvqhJ/278xGhskfD3MCaTdtmSdL+B3H0kE
         S1u6r4upaCm4/t1oaV6JX7IEh+baP4I2uXTZSbqcL85zxDKjMKtj7ZCrxvcUxduDb1Jq
         nRsnGFNZrSrmCgJPi4yNKWrokTk3lamG6+Gl213ns1anQPwdLWy3buK2kynVvQOWMbrm
         FGD3yZZouEnG+My5RyYoj5lwyzq1jnzJObWYslXyXAhAQlH/MplnFD+9YiQdFWOhrb5E
         mSng==
X-Gm-Message-State: AOJu0YzxFQcGwEp18EPzRj/inIm8l2yklxrlkGavu87NaqRBWe0knxiS
	AGrO4B/7o1iXZFLel4U0qpuIYn+PL1XaQveH/UCFEp7uc7OBYKwh84L+rBgg6Q==
X-Gm-Gg: Acq92OE0VgE9wN/+hQ1UMfBTckDbgv3+4Xol/0Eq8Cp7i+0ZbBsuTNZm00qjovWLYhm
	scDjJ0Kkv6HzBiK+x4tOyoaZ8r5ajxh9nOsLnAh2NNXMgSI7AST0wzQxyj36ynD9PY05KVjHItp
	tBQKHmsma7DwC6m1UB/tLo8ZRmRsr77PN3u+TY0N58gVYZ0GPwMzk8ROcKdAw6HZCBMqQDREbEA
	gKkOnHkvFjAxX+Zbq4Cgtsh4avwcL2GXJeK12RdL2HIF2e/3+x9Pqw1/29pI5PA8F3Hrrz/Vglb
	9QXyh/KUP1rE4LzA1xReptB5CmgRbL2DAHxtXT4iRUVWzkNJXG8uBEGfple9x474CJhYH2aWeXi
	McMwGkxMjoCqGvhG9PhWTUhQueJHr8B9O7rA3tXRQfy5c4c84Qan9W8thIKjqzmFUHXmrW2rJTJ
	US34Beo3ZM2XAo8CYlXwV6AanyZ4lq2FazjA0zoPYAcm0=
X-Received: by 2002:a05:7300:818d:b0:2e5:8ec2:82c9 with SMTP id 5a478bee46e88-2f54b57e91amr8319187eec.26.1778303565524;
        Fri, 08 May 2026 22:12:45 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8893441absm6691534eec.31.2026.05.08.22.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:12:45 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove commented out code from odm.c
Date: Fri,  8 May 2026 22:12:40 -0700
Message-Id: <20260509051240.5807-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented out case statements for better readability.

This also fixes the checkpatch.pl warning:
WARNING: Block comments use * on subsequent lines.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index b4f872f4d6c9..92ea6d0f772a 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -952,31 +952,6 @@ void ODM_CmnInfoUpdate(struct dm_odm_t *pDM_Odm, u32 CmnInfo, u64 Value)
 		pDM_Odm->bBtDisableEdcaTurbo = (bool)Value;
 		break;
 
-/*
-	case	ODM_CMNINFO_OP_MODE:
-		pDM_Odm->OPMode = (u8)Value;
-		break;
-
-	case	ODM_CMNINFO_WM_MODE:
-		pDM_Odm->WirelessMode = (u8)Value;
-		break;
-
-	case	ODM_CMNINFO_SEC_CHNL_OFFSET:
-		pDM_Odm->SecChOffset = (u8)Value;
-		break;
-
-	case	ODM_CMNINFO_SEC_MODE:
-		pDM_Odm->Security = (u8)Value;
-		break;
-
-	case	ODM_CMNINFO_BW:
-		pDM_Odm->BandWidth = (u8)Value;
-		break;
-
-	case	ODM_CMNINFO_CHNL:
-		pDM_Odm->Channel = (u8)Value;
-		break;
-*/
 	default:
 		/* do nothing */
 		break;
-- 
2.34.1

