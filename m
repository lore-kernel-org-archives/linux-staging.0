Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA32E0B6C
	for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 16:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753116286; cv=none; b=cXp6oS/BmFqaEq3XT7Ya6rUDWkOEluY67K5TCzbFE4o5MzraS9dQymOlhxBjizGHqSO24NEns4YQ8GWYLsFOvoE2fJVyyw3Bi2F7flOHrjszXY6PoVAbzcEOPVq0yNeEhyNL0lpi4JTlBPPRrhcL7F80TdKyL9m5YWaJQS6CnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753116286; c=relaxed/simple;
	bh=ozpD8mIJx3HAYQyJIXz1aK5rJHg9R626L5Xl/hIiu6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMCy9P1AOwPELZNMgRgACluWKUL7L9qcU+3Rab5naEytZ6L57AptJjdE/beqVGk5lV1go9TAatXmqI0uPpcacguQuAEsJRx8+1UnhC6Lgt+ZCLmyfGm0shuIwxgO9gFTV+BADshFJcfjWIejdPwl9IEGwt/jME7nY/Jhn2G52Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJpDjX41; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJpDjX41"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c01b983b6so9337831a12.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753116283; x=1753721083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzHkl7xJ687bImnwe/db425jqWJdwTAxnpiPvFCOYTE=;
        b=fJpDjX41cr+d75/SpaCdCuSCLsa+cWaQhGbWzovIuxhnRLY1c7HueTxZBoRyLnb4kc
         jX1a5pyzIyOt3HhlXK70NVRdiBj26Tn2kSdghgFtXKChCZ7daQ35tSYaSLl+8gYKrG5d
         4LR0szMB7xw2MrG+yN+upgJMt3XBhStuhstPGox04Hu1cinVrmYO8KYcaWzVfh5Pt+rV
         MCvaM0PwarmYJmpwlz6iqu5sRALsbclH8HoffdRYOjYzTZ1GgzyMCyqO0RQSxBvuS+qU
         jy5ytNH4TTDNaWc0y5GWhpTT013JDGPnLRe50roft8GQo78dWbhTxc7IltG6rAsITugv
         KkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753116283; x=1753721083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzHkl7xJ687bImnwe/db425jqWJdwTAxnpiPvFCOYTE=;
        b=Pcf7Gm1oV1MKtwkaUEWNSw6f5jRR+Pcdz9FDCOlOx7TQ8NzxjOWgBJStU/T4SPvA2z
         yrjMwPUrhUW++JUkdTkad+jTUCjpzHX+MVwlxa1gFGPonAT7ta6VI/5Jt7NAtDLdVJjq
         yQ4x15WoP2mJoLj8BKMyh3Km9/nOp/Pe+fiGWuaUhSamdKOqUBf6CqvnSMbMCToVma6I
         ohCN8XWKEqYOMq68DQfmwA7/9tM5zBMjWilIyBda4UFkpCOf9SVqF0YClExKEwVqO6vz
         vCvJBsCNRGfbkP0mZS1AW9ALfCF1QE3NhREUNIGY07qq8mnHKaZBMk9ZMA/ethoZpgqs
         +fXg==
X-Forwarded-Encrypted: i=1; AJvYcCV6+ElcXXQ3pR06z8hvpBptJ+zhRJo0FAsNeoSzWVHHk2HZe1uT8IdABuG/GKBbAPLH03t87V0fi8+B3sJ6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2mNi/IcsCdu8gUTaUVp615Ie2BuQDL0aYeUnKcEjB2KeS/vJA
	E6Cnd7NG896GjjF6MzF57Xqg0YQjR09uhEEG9iKawbgmWEsJsV/xxyP0fAIbT1Ch
X-Gm-Gg: ASbGncv/dM7vaHQYTbm9sINnPmPFSsdhNBJTDiCO4y0BnuIolbBEIasorAx46j8G48j
	oMzau0CRRhFeMfi2dzOcS5LYs0G8EDv2U9fgkkbhJtTrbAoKZC+ZzGFzTIAix2GknGJBUB+DC/0
	QOoB5ArTiZ9M2FkUdMVPgnWxiV7p5juvrH71gHagghm2o44qd22x6E1D65qlZUZ2OPZ5jN6Lwh9
	mtna6vW7q6Q3ZdvS2qZW9R/vwLKaSypJ689z8sSo5QCqxd28/b5zuO8ipgxW1dJysER4mE6jFuK
	95Y8g/kDIN1RDuFqLKm48gN3qz9y9bcADFrJjBePoIKQVusu2L3F4RsHEJY6KH+63dESmFBXwm2
	VLO2sFaPZWrmWhX/zttk=
X-Google-Smtp-Source: AGHT+IHGb+bQ1SgEFJbjuN/De+PLXEUVViPTQFolyGaaNV1SuyKKtaBoSqru8wqxg1KKqb6+D436AA==
X-Received: by 2002:a05:6402:321c:b0:602:a0:1f2c with SMTP id 4fb4d7f45d1cf-61346cc2119mr168386a12.9.1753116282378;
        Mon, 21 Jul 2025 09:44:42 -0700 (PDT)
Received: from zephyr ([77.237.184.54])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-612c907a5b1sm5662655a12.53.2025.07.21.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:44:42 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: fix comment formatting in basic_types.h
Date: Mon, 21 Jul 2025 20:13:42 +0330
Message-ID: <20250721164343.8395-2-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721164343.8395-1-A.Nasrolahi01@gmail.com>
References: <20250721164343.8395-1-A.Nasrolahi01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 57bb717327c..e2f203910be 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -26,7 +26,7 @@
  *	1. Read/write packet content.
  *	2. Before write integer to IO.
  *	3. After read integer from IO.
-*/
+ */
 
 /*  */
 /*  Byte Swapping routine. */
@@ -94,7 +94,7 @@
 #define BIT_OFFSET_LEN_MASK_8(__bitoffset, __bitlen) \
 	(BIT_LEN_MASK_8(__bitlen) << (__bitoffset))
 
-/*Description:
+/* Description:
  * Return 4-byte value in host byte ordering from
  * 4-byte pointer in little-endian system.
  */
@@ -105,11 +105,10 @@
 #define LE_P1BYTE_TO_HOST_1BYTE(__pstart) \
 	(EF1BYTE(*((u8 *)(__pstart))))
 
-/*  */
-/* 	Description: */
-/* 		Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to */
-/* 		4-byte value in host byte ordering. */
-/*  */
+/* Description:
+ *	Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to
+ *	4-byte value in host byte ordering.
+ */
 #define LE_BITS_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
 	(\
 		(LE_P4BYTE_TO_HOST_4BYTE(__pstart) >> (__bitoffset))  & \
-- 
2.50.1

