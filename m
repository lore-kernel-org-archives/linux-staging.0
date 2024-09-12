Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3205318891D
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113888; cv=none; b=NdRbfyEz7Z2U5bEKE12MvN6YUgUrUETFg7dKcZixDFLauwXkQmdYGyO142IU7sUHkNA7Rlg912evQFbWdJRT+tO+aac5kYdHlcr44IcgRfoigujL/7saq+5Bj2p+WMpeEGRm4WhMs4rknAtnxxiEgIrv0PAkf/3Q0ZobYJoB0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113888; c=relaxed/simple;
	bh=1xoHqAHfyWBPaCqgVEeynTfGrsLp/kPMfAmcN2bELyQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IGcfGyjjW9J4XOQmyJT+a4jJ+Jh2spfDMSNB/QtBnpLmb5znUFOV8GU87WiG5RZ9EEdl1LzEjP7TmLhQlOookUVZKc3HiCj9aBUxPp3hyBhzbtnPY1okHpibjCnvpmH9jYj5yHXPLueAGr8UJ4tzt7J8IU/OK2WRFKiwvI3io0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUDKU5D2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUDKU5D2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-207115e3056so5359125ad.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113886; x=1726718686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThvSFW7vmATU3IrvCKmeBsRE8HH7xmkKY2e+o0JIjds=;
        b=UUDKU5D2DMfReVwbe9/WXOpUvDZg5hum1UFzrUkWKmqPGm1D5FpzYjXVXJDdjk14bb
         9UKNvF1jOake6+gjYKU3OxXdTRfVaqvQ5Uz7T/wG3JVYZg3wDSeNh4fo06M40l/byMlL
         6HXxq6IxN6kOcXrKxaFfdQBczyRWrN6aXjy0HlxlE/PkcY3z7caCmXsXQbAsZGtNmNNg
         mu9SSw/S7rcYjnzpzhsy3DsD8pNWhbI8WQ8c/RMzyTFq4lplx+gUE1mQlRM1KN+mrAeZ
         ToqQbUFVrl932VRIgKNq4fzmtm7ymTc5VA1R50g2z4T2i2V03cIoPOloq9hcPcL0v6YZ
         5ETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113886; x=1726718686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThvSFW7vmATU3IrvCKmeBsRE8HH7xmkKY2e+o0JIjds=;
        b=AZFvo4jmwz8M5tiXbABYlhiQqrW8t34l0FtG+mORqss0HxGbni1o9ujh5802IKw1FE
         AM7bH+Y72DqC9cyLv5D1vOmrbEEXaYEzeZupQkPbiS3D6an+3jHJiG8VADwQsSyrb1rM
         11ggpMC55Dp3OZQd2eZjDPtgmXzHFGKIetZn8XMrp0kEcrEu0LyOrzLfWqQkQV2uNHtp
         XLNs54dHHtf2JzS9MPRtgGniBLfjfrKBlB3MD04hdJjaQs89ZJ72i2u2VoqPXWkltLSe
         kdb98dKiIspEe+DpzRmYSpFgY1irNhzJ+HApGqLs9FshyyWUp7CEMgxRtT0Q8Ipw40ON
         KGFA==
X-Gm-Message-State: AOJu0YzcvgD/ipkQ/7TxAnIRMDv6U8dHjPgMMp08BdNzYf6rsWHNoyHg
	P8HQeBrVEux3cYKppdIemlCfdCyed0/Y4QK2+bv6TbZW/EDs5fKCbWDjGKY4a3Q=
X-Google-Smtp-Source: AGHT+IFNFRu7l+HraQU6DJHAWwbySTGcg/HyrUZN0ku3fYnYj4nLDdazVhQ77+wjjm0IOsfYtwyAsA==
X-Received: by 2002:a17:902:e74f:b0:202:2e81:27c7 with SMTP id d9443c01a7336-2076e3f77f9mr23236475ad.35.1726113886161;
        Wed, 11 Sep 2024 21:04:46 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:45 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 8/8] staging: rtl8723bs: include: Remove spaces before tabs in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:09 +0530
Message-Id: <20240912040409.3315067-9-sayyad.abid16@gmail.com>
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

This change improves code readability and ensures consistent indentation.

Reported by `checkpatch.pl`:
WARNING: spaces should not be used before a tab for indentation.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 09ed298782a6..32f6d3a5e309 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -81,12 +81,12 @@ union Keytype {


 struct rt_pmkid_list {
-	u8 				bUsed;
-	u8 				Bssid[6];
-	u8 				PMKID[16];
-	u8 				SsidBuf[33];
+	u8				bUsed;
+	u8				Bssid[6];
+	u8				PMKID[16];
+	u8				SsidBuf[33];
 	u8 *ssid_octet;
-	u16 					ssid_length;
+	u16					ssid_length;
 };


@@ -162,7 +162,7 @@ struct security_priv {

 	/*  For WPA2 Pre-Authentication. */
 	struct rt_pmkid_list		PMKIDList[NUM_PMKID_CACHE];	/*  Renamed from PreAuthKey[NUM_PRE_AUTH_KEY]. Annie, 2006-10-13. */
-	u8 		PMKIDIndex;
+	u8		PMKIDIndex;

 	u8 bWepDefaultKeyIdxSet;

--
2.39.2

