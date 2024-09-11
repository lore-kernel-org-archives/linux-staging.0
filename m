Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FED0199948
	for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061778; cv=none; b=f9sjUNWfyBbSh8OiX+9KDWd58YEDooWlwGPsZLRCU0f0hNoYm443eyy104yQLsRp7WjztXZUHaCrbnlOgLNwBHViOylzqNi+5ehI86h8Inf+J9hyb2dg5UGirxYTLCFt2IIWBfKcgCyGwbiBOc1ZxamdngG/yqYRqys+4zpS7fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061778; c=relaxed/simple;
	bh=PStcQrlv8JfPnizprRfybH51i7asfOXO53n0nTRArS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zn0h+akpPAOvDwyz1XdhTd3CD1Gx+2ZYaFfQPMsoT+u7c5iQQ4OXYzVzIiy6p8V7CsPNEepOvn7SdUUJDCyTL9NaZU5ycLvaSQMuNEqmuOYdwGSZeoYBnQQVVsTbzqHxtz8a1NKEWk8Xgo3TGR1HqOcRIWu6iHJocVDmfB9z0f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kas3ioTD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kas3ioTD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2053525bd90so58348225ad.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726061776; x=1726666576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpicHg1/zCLLbxQoUHGVhbruccC5DYxv+chpuNuxfaM=;
        b=kas3ioTDA3T/wDmrEuo48P1pAd43tqOOkOfKsoKq0lxhriJ43imMe08nMBz7buLphD
         BbqszXYSiGULeXpbhqyb7cbr0wyRcWL4Q/qulrtU56NNspvMhoE9OZBh9J0/9zS49bR5
         qxWx8sUf6kjBmxPfrhlZ4N6Nb8lMQ+M5A+JGY3UQpAgGZRl80sAWN9cdfI0mTVrZPTvu
         mFtA3xGgK6vWgSs8IDwIFz8uyKGroGqLTxCPQ+5epJTRig4fKYq/EgykN1ohWrMLGR4+
         0lLbQ07HfsR+1jOhIT8+Gb6xnHjE/PJx/dgctz4tc65UnIC64pK+A4xJRTtwYEfzRQET
         R0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726061776; x=1726666576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpicHg1/zCLLbxQoUHGVhbruccC5DYxv+chpuNuxfaM=;
        b=kK16lj46zj2dp8RYMlnrDc+xzr85cRQIrhsaBX6GvY4OEAoOUkV/7PdJ8u1WVh+HDR
         XfWn3jYq4Bcl1uUd2qWAAu026CF14Pe9YqXFIUTh43rEryFvghShNTEY3XmYF0dYsSSf
         ieg/qyRjZe8U1VNwswdt89gWKnV9Icp7aat1kgxvYhH6TQ9P8Qmj1eLtsCgMqTaSS8L8
         HQ6XkSp41AmgS11Y3PnyK6LphPQpklXO+LSPBXhWssi0VP2ee9DsannRn8oDOKDl47HV
         Jv3/a+44LOqxihEaIs9onsRq3h0YVaiycipyPxGaTlgxTQDUkF5sDAWHjyuuY/CYaOB/
         RBuA==
X-Gm-Message-State: AOJu0YxUCJ6W6NVfqX5EE8MaukCFvYXzxK6sBCz4gEtHPlG3a4CUd70X
	gDTigSo+/6T2W3f6SJ7OH+8pliedzRW0/xSmuqLNEZgJvc3pvGMWN0FYq3Jnuzc=
X-Google-Smtp-Source: AGHT+IEo6QjHJ9h8E5tqRMAucgzRiTnaFZ7WtK6IlMAAUNx5y+Xr8J251ZD16i+BOG9QbOJxje2X1w==
X-Received: by 2002:a17:903:190:b0:207:625:cf04 with SMTP id d9443c01a7336-2074c761a5amr64555445ad.52.1726061775890;
        Wed, 11 Sep 2024 06:36:15 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:2f:2714:6f11:a421:14f1:4006])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f20e28sm63246105ad.231.2024.09.11.06.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 06:36:15 -0700 (PDT)
From: abid-sayyad <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	guilherme@puida.xyz,
	sayyad.abid16@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs:  Fix indenation and coding style issues in rtw_securtiy.h
Date: Wed, 11 Sep 2024 19:05:50 +0530
Message-Id: <20240911133549.2664372-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch improves the code readability and improves the presentation
makes it look less scattered.

Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
---
 .../staging/rtl8723bs/include/rtw_security.h  | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index c3e47d52687f..ae65d684a26d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -171,27 +171,26 @@ struct security_priv {
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
+	     encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+	     break;\
 	} \
 } while (0)

 #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
 do {\
-	switch (encrypt)\
-	{\
+	switch (encrypt) {\
 		case _WEP40_:\
 		case _WEP104_:\
 			iv_len = 4;\
--
2.39.2

