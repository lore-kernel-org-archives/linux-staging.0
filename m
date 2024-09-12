Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776227DA79
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113868; cv=none; b=Z68QYcwKz8kDxqQtybLT/OhIH/xHmXJ4VosFdc/6ZZlXAVfCgHrtpD9BAg7mkb6bNgdw/LiRWztF6HKbHlSzHk53iihruJ/gR/YtqfD+z5ShXXcJVrDNBj1TAkWMXK9QdQ0clVSEpXUZRHCMzaopn6U4UccO8GT/9haMXEpGnI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113868; c=relaxed/simple;
	bh=M/w6m9DICbb9fXeBmwD3TpLOWGHWyG5+dW06Vu7C2OA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JqNSu7/JQ1MmXvmC/JD1xrmmydZG5FAHqUk8n3xELxKmgc87Bm7dYBHqDnrhgU8VOWS0Fue4SKB4JeYujKS1C+7i4VcSDLNHINxfPVCoTadcN3BhqRYDU+g9VMEeiuaShovEyvSffhZ8CN3rn2VqWjd7vXnfh8z9ohWzc+a/EGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKFL9kx4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKFL9kx4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20551e2f1f8so5345905ad.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113866; x=1726718666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXAZo/WXx7kQtnIHCo6QHKKFh7guoGvOfoFWj/T8o7Q=;
        b=BKFL9kx4oEnJNFKhiqxLPDUYo9G90Bply6cae4ntArrLkekvqnBc3jbXEo4NYnFSF/
         at20lHSymc7IE4OVNWtZE2r/Lp4HuotuVD6y9bHZjMu78URLo5nEyvMDdylu8zYzg/rc
         CmDXBPWUZDjACkSXb4oXNcdX8VUWO8/9NqRC/U1EFX4jhUhKuWcqvd7biuYKPglntaRj
         oT3pIhPj98NfEiV4F4+yuoB69eOA3dOMe0HxlrTdFwiOTk9hZfRgZxm1pFRKo/jvq7G8
         W1vW8KnWdyp24dIIZ3M5+n/EO3Bkf1/K5vQVEt1N7hjNzmM1gTf42By6cfjNKPEy5yu+
         U/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113866; x=1726718666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXAZo/WXx7kQtnIHCo6QHKKFh7guoGvOfoFWj/T8o7Q=;
        b=n+j2oUGhB9npi6Jth9RqW8Oc15uNSVr6cFAF3jjEZmpk1Dny1GL+S5kqB0oLc5Rm2p
         /2nWCxRqj05baSCaMh7HBr6myGSXbJt0Cw0Q7MnkEJMKAEVnN1UzwEfWvWMfQOBcepM6
         a50rHCNqarA5ne+K6cY7bWgduZAPdHfz2VmIVp64v8cY2N7poOK8OTsFOwK0/iuzsTGw
         bm3SpRHYYedR+DLuXtHrU52gj+kFQNHNXtL3ZEZj72bOHyfQ1Ljt8sBcdPo2CTgtpbMA
         aLpG/Uo2RurJOlbaPwyudnn/1srxt4GX6EXjzGe43jAyHnVOmg4Z1FWn0+L03L2j+2+j
         cFig==
X-Gm-Message-State: AOJu0Yw24Y+vwmO2w5RpxZmqz0Hv1LL3Nww9pVRxuAMTbrmt68MDUJa0
	rwukzyj14aPbPzaz/qw2Bj3QDspMdutWTO3472E69iuAD9vmovat2gxv3F6AsPo=
X-Google-Smtp-Source: AGHT+IEwOwRcbvDGeBmGe2+PqEHYraSrG3E+xfqMBWjwAWDIkNbu50hVm1cxU45xYhJ5lvlVG/oiHA==
X-Received: by 2002:a17:902:f684:b0:207:5ca3:8d23 with SMTP id d9443c01a7336-2076e4767c5mr18339695ad.59.1726113866410;
        Wed, 11 Sep 2024 21:04:26 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:26 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 2/8] staging: rtl8723bs: include: Fix indent for switch case in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:03 +0530
Message-Id: <20240912040409.3315067-3-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
References: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change ensures proper formatting for better readability and
maintainability.

Reported by `checkpatch.pl`:
WARNING: switch and case statements should be indented with tabs.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 .../staging/rtl8723bs/include/rtw_security.h  | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 953076667b4d..74613ad9a371 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -191,27 +191,27 @@ do {\
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

