Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6066188925
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113873; cv=none; b=mfmPUgNDxYz6Jkj8D98mIg5YjzShe4l9iq70nBMA99z0lE3AwD9X2oL6KeL5/oGbGZ6gn0IrUZdwdt0gnwrVnrs6wAnSnQkUd13kDBIlrJJulNQhxB42YYpNT9CaWRAScMktaauMEmrgBdBTWoVMYyNJwrpW8/ff95TUoHV6HF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113873; c=relaxed/simple;
	bh=DC9yr3m4EEGFR6WO9pMKucALZ4AVOWvk4PmIwuJCAYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=axlAdRCvKKs1aBjrZJblCkO5C1GRrk6zt8ytL4XBkLDrd1PPVCJcocdehR69vAKx7fI07LAiJt5JSXkH1VQtQTOf4/X04aBfA5U6mBFJPgO1U0WesamUzE/ClRPx4eQJ0zx36Lxw/XZUN1IZZExMiKcrDAtpSpkeihJyygnitT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW+8ww2/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW+8ww2/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718e11e4186so438759b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113870; x=1726718670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yI7jF4cpO/8etoNk/Ze3jPcBLq+JHndlopVNbhxhuk=;
        b=XW+8ww2/hwDdkVs7dHL7o5kFO98L6rX1T+IZUFD4Z7mOKy66/seYsxNUWHIXAJorsW
         8kGZoQiKvie4fswQ2Y3hYtsJQVV3KHWBLJmXvSlACmlVNL3lag+y04jfBL0F7LtwoIdA
         Xy5Gmm9DueAGOguIZ4QRy1oXQLDBEDmBiZnXgM7kTXo3X7srYJarSEzyPZyxD2uTgimk
         HTxGPEEWw1ImQfwmInGbwoQrEpYMjWl0m+PAztm/MnoJbYYtd6BUtGbSYUNxLA24fMwz
         ypUwtU529Cz3wwi9XHpUSOTLHk65pVqYamMQ/X2sOFpSS3KOUF5WoMlSo6cUFXmZtlgK
         nE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113870; x=1726718670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yI7jF4cpO/8etoNk/Ze3jPcBLq+JHndlopVNbhxhuk=;
        b=toGAFCVnZKdC6AwIeGu1K7glkOHxEktB4g9aY+SiJ8YLXWv6eI4zF7CzrqW6wVcHdD
         o9D3/B5dUtVfHvXEIcQsquX7XepUjq1EM5RQKULRZEJzCmLdb1EiK9aX5w1a4CtSqfbu
         uBWJ2rosb8K7mkwFgNRs3DI6/1jkSsbKga35LINEtThTi5pyb6m7ZDHCNwfxDxnCQFB6
         tIZD8pF+tRrE7uTwyLnn1Mx9zyHVuSbCpShbvBqepciw5GRyT4+Uy30iSyhsAdiowkeg
         YFUCkyXeSFWHjIs9TUEwyMjjCa5Frr6dgjY0ENggwzZ/RHSWcE0938MnweWHIiuiwC7F
         rOyg==
X-Gm-Message-State: AOJu0Yz/E692NlsTGzbI51UDczmbNZ2ZJmC9i2aTuCIxkibTXpni3+Xx
	WLabTQwaH8EpiswiS6TeTBptTSj3cmEBFCGLh6GCGte4MrFYGCeJ2CFixkX5rbA=
X-Google-Smtp-Source: AGHT+IFydLn89r0f6WJgz3Uj1DG+bkZKzjE52wn9tyRBLoumr08TCAvGgM4lS/6zabbgp9OcFTaJ6Q==
X-Received: by 2002:a05:6a20:72a7:b0:1cf:e5e4:a24f with SMTP id adf61e73a8af0-1cfe5e4a32dmr282376637.8.1726113869805;
        Wed, 11 Sep 2024 21:04:29 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:29 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 3/8] staging: rtl8723bs: include: Fix indent for switch block in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:04 +0530
Message-Id: <20240912040409.3315067-4-sayyad.abid16@gmail.com>
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

This improves code readability by ensuring consistent formatting.

Reported by `checkpatch.pl`:
WARNING: switch blocks should be indented with a single tab.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 .../staging/rtl8723bs/include/rtw_security.h  | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 74613ad9a371..ee4b5c5804fb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -171,20 +171,20 @@ struct security_priv {
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

--
2.39.2

