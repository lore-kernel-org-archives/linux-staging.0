Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BE1531DE
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790296; cv=none; b=Wz3XAOJBpmV7FgOls+zP75MT9193va1rpF8eJy+98zg6wPWjju3rXQMehy3d7jiBEFvLUxkVhmNfQvPoyz8uwy87okBgJSJhDYJ8QtEcWyZ8vqGjbSTXjasC1Mq0D9JVQ6RTpXTJ8Z0eTMDO0WCMxAYyzhaeIxqa2ZQ6rufnq3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790296; c=relaxed/simple;
	bh=Ojsy58E5fZr2thySvAU8vWmKYpsMIAgUbMJ2FxqEVWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c2W3VBYUt5AfLur9r6hAylNBmG3JbCwCeklUVVuQ3n6XEjbeEgCEqXadmYi4QGBQozE+OHeVkbnLUcBi+Ielqv3B8nuVesds4EYDyrA1OU0QqY9CeJeBrlUp8fSHIg4yzQKtB2A8q6017laFOQ/Djwrbe30kdkqP2XDY+b+qodE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6e/5JG8; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6e/5JG8"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-82ce1cd202cso7233839f.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725790294; x=1726395094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZlR+a0vRki2ZB0QGJlI4VIejetRrtr4o4ItkGEyQbI=;
        b=H6e/5JG8QvjELOVE+Sc2iapYH041NKToysbYF7pEHBb+Tm+09Fr4zqdBJQL6Or9Gm1
         bpBcBQmimJJuqPr0IfHhj4dI4J4QFJ9iDxZPem2ljiFoLM5l6jlAT0H9z2I9CFALgMoH
         lSmk0q1cVsde+D84j4advktHfC4QWLzqhwTtVOOJCzVXfL1pSfbkSSvvxGPYf0HPKzo7
         fmtXfDCA0abcn/LF7LzW3z3ridXeIb3827cDXodzouFJLCRxNustTCtsITlV80pYl6yt
         Pd1HYyWqa/3+Ub2DqV6ufmznXt1eHRCtems7zT7yqirVBP3haKeCsCQdUtR/dcfqiCVj
         sjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725790294; x=1726395094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZlR+a0vRki2ZB0QGJlI4VIejetRrtr4o4ItkGEyQbI=;
        b=CX4Kh4A9EqE7z82L8Yk8qmflmVc/2gJ1vGCaDhy7P8N0WsaWWbHvGbTatZyl5+oO2w
         UZ9rHVsXAqTiQIV2KP+CeUaMOdusZWVLY/QqyOMdlSssodnwpD9Ep26gzKY8HUwmeeL5
         BOdpB0c9JLXNT2WFlevDKdvtX8gD8CMmKQe2TTIV10CaL+1H/gTjBpGiFaKkYtU++PbB
         OpSsFZwwcuH7YLKYZFgc7RYuKrr7TCLqUpUmsw8hGvVVdiBf+HiY0toWPxR82J5W3ehc
         p3yXzyZyBzm4jeQSsFfxTL/ikpANgL+dFU7gd6w/iHxDYwsM+rtrnLrZL6xf/iOxUEuW
         5oRQ==
X-Gm-Message-State: AOJu0YyiDQL89irgLG/B5cVOXmGyuGLxiqGR5V+fX0kadySErFUYZxo4
	4z2DG4eOGhcUErpXc5jcWjGTYx3d/z/KsZQzKlHAOpl3OWxam0I5l+LKKqdhZ50=
X-Google-Smtp-Source: AGHT+IEF2yw5m6vzZXA4ZGXbip4ZR6JD+S5d0ZE5PIVtwmi5X8QP+tUW0z7i6VgBnIVIWTcB7HecqA==
X-Received: by 2002:a05:6602:3c6:b0:82c:bdec:1c0e with SMTP id ca18e2360f4ac-82cbdec1d2bmr373927739f.2.1725790294090;
        Sun, 08 Sep 2024 03:11:34 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0782dfsm4589379a91.34.2024.09.08.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 03:11:33 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 5/6] staging: rtl8723bs: fix switch and case to be at same indent
Date: Sun,  8 Sep 2024 15:41:09 +0530
Message-Id: <20240908101110.1028931-6-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the indentation for the switch case statements. Aligns
them with right indentation.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

---
 .../staging/rtl8723bs/include/rtw_security.h  | 70 +++++++++----------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 1e5e7f52f8da..740c8504cba7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -171,47 +171,47 @@ struct security_priv {
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
 	switch (psecuritypriv->dot11AuthAlgrthm) {\
-		case dot11AuthAlgrthm_Open:\
-		case dot11AuthAlgrthm_Shared:\
-		case dot11AuthAlgrthm_Auto:\
-			encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
-			break;\
-		case dot11AuthAlgrthm_8021X:\
-			if (bmcst)\
-				encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
-			else\
-				encry_algo = (u8)psta->dot118021XPrivacy;\
-			break;\
-	     case dot11AuthAlgrthm_WAPI:\
-		     encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
-		     break;\
+	case dot11AuthAlgrthm_Open:\
+	case dot11AuthAlgrthm_Shared:\
+	case dot11AuthAlgrthm_Auto:\
+		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+		break;\
+	case dot11AuthAlgrthm_8021X:\
+		if (bmcst)\
+			encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
+		else\
+			encry_algo = (u8)psta->dot118021XPrivacy;\
+		break;\
+	case dot11AuthAlgrthm_WAPI:\
+		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+		break;\
 	} \
 } while (0)
 
 #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
 do {\
 	switch (encrypt) {\
-		case _WEP40_:\
-		case _WEP104_:\
-			iv_len = 4;\
-			icv_len = 4;\
-			break;\
-		case _TKIP_:\
-			iv_len = 8;\
-			icv_len = 4;\
-			break;\
-		case _AES_:\
-			iv_len = 8;\
-			icv_len = 8;\
-			break;\
-		case _SMS4_:\
-			iv_len = 18;\
-			icv_len = 16;\
-			break;\
-		default:\
-			iv_len = 0;\
-			icv_len = 0;\
-			break;\
+	case _WEP40_:\
+	case _WEP104_:\
+		iv_len = 4;\
+		icv_len = 4;\
+		break;\
+	case _TKIP_:\
+		iv_len = 8;\
+		icv_len = 4;\
+		break;\
+	case _AES_:\
+		iv_len = 8;\
+		icv_len = 8;\
+		break;\
+	case _SMS4_:\
+		iv_len = 18;\
+		icv_len = 16;\
+		break;\
+	default:\
+		iv_len = 0;\
+		icv_len = 0;\
+		break;\
 	} \
 } while (0)
 
-- 
2.39.2

