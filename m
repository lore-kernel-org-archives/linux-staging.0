Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2910E3806DE
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743683; cv=none; b=VJdB87jngg7dkLThJ/KscKjYD7X/+WBcCAbOry3I8jhkwjtch7Ls6pjZhArxqXe4rMwemB3mW/sP/Re1B0FOJBab46LsTSMlorKgCha/sHoOAw69o+C//w3M00ngUx0j5KeUn02HnHY2dIQqutXFRKeWhfkrmlHH0Kdb/FxAMMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743683; c=relaxed/simple;
	bh=esp88rovEuCgXuKMWcpaWMlWyfuR6Zh/0OnqMkSE5BE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZ4JH9t/JyqOeHOrwVPX57liSsMk6lXcNzKZXLmYA+3LtOsPtACXzc0UzlBpHLg+WFpItAElXRf0diu0DBNIawO3moBwehSjTH9fIz6Ogrh8c78uXQDxCkJV3WJ31OQG3zj2N5oCnXyjC58UX5OtuQvw8t45LSlKrtA7SFXnQxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWi+7ZyQ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWi+7ZyQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8838339fc6so8214966b.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 09:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770743681; x=1771348481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WpZ16+HqV0d8sOYLEdSVRJehZ0Z4en7JYoD3xbuuW3U=;
        b=GWi+7ZyQsmwegwayj+mYAWvlNg54grEq3FEa3XcI6exTEhMD50IO5Kaa/uSRnR/50e
         BiRrhmShWam2SgiBcPaBsg8hpwRu2VRu60S8MPRpQ6jRcQ/EiN0Xk5jOYlmWxgFPFP18
         Zq7uGsnXEtonz516YPW3pQoiPN5xV3or+dBHZQ5jtpu7JR+cHuGpwh4SfpUu9WOFOOL/
         S1JB1B2lQQHJ+70TMeB0Lar2X/3eX3QC+R2YXnDcRicZbMu5cjCoUezEDQBpjN9JqqnY
         NrS3isucL21b75ihVcz6krzjwb/+ch5RE93meDB/C5+OewPu+a3ig9jFLwBjb6p7qD8p
         D9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770743681; x=1771348481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpZ16+HqV0d8sOYLEdSVRJehZ0Z4en7JYoD3xbuuW3U=;
        b=XirmG0KNKwWqvWEr51kfW2MKk//ZpSn441/c1igJ8ftuP9nkTxvUbXW783tQFV+Nw9
         oXttTaChxHQZE1lfJfopp6/vXOFdcHS8pyF04yjjuMKSS9oyS8Qm0U90f8w0SAH4HAU+
         fcR2OGnY/G0kQPBdrHRu3gdDNgy2ECz9TwV2arpYCgerU2WI3TdHyPgXVlQbk6l8lfYt
         F9pTs7SIheu6fHaxF7wjovXnZCTrR5J0CiHMKo/SyRpHW9inLeFo8JAp0Eb1nDHisWww
         LTZqV+rejn0szuZ4RAVd8B8Ml60V3u4qfWmuQGVHWxqBiIU42LGgGYj4iv1iRTO99JZx
         Wd4w==
X-Gm-Message-State: AOJu0Yzele2tcVSUECioIRcMaC4uPaRPf/6/PEMNrHFLqjG1CEsOIHqw
	NzGMRkKyHZqTcf7VyhE1lgzAUXjUNQ0AfhjGN+KnBCq26UrPaFFzC9GWAuBYWOEZh1w=
X-Gm-Gg: AZuq6aK0gqbdPIVNFDx7HK6vPTQ0RXTwIduQ64erncWWh5WpzlFpDBnBdmqXzuLnK5E
	pBOHjzM6Cm6A900udZxn3Wi5AJTWVlujzKuSPX+J/G+0w+260DG/gM8NdTEkFRUBrgpDSozD9sd
	Pl/mrIwZDyK1P2fEivLnmmfEGUdIzTEoyNy+4YQAEVBNMOslk8YuSD5mlB1osaDA8DCbEYsLsSc
	evVwmstyX2Ohb9mqQHFiKaD0XoG9f1dokawOk6+8Xg1Mgi02uN6Ek1mN38Vit5p9eXkfXKBg+3Z
	00L3/Yz0Q24aMkTL1X0p5gmVDoKo5TfxGUfG3BSY46L4N00JsgxS9BKD2qH8yDd3UG/sGS4u43d
	72bkW6G4mS4/8gDFSaLjr4UHlWcmwq0F2v3YwaQN2PhCdYz7yybfmuWzC2I4Fz701VeFZSWEOic
	h2gfAkHJArnfuWz3Pf1eTixhLjIUFyi/TLvKfVBpI/t7Z+2s1W
X-Received: by 2002:a17:906:dc91:b0:b87:7430:d5d7 with SMTP id a640c23a62f3a-b8f50a4962bmr172331166b.9.1770743680292;
        Tue, 10 Feb 2026 09:14:40 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf10b8sm537457066b.50.2026.02.10.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:14:39 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove redundant 'Adapter' variable in HalPhyRf_8723B
Date: Tue, 10 Feb 2026 18:14:33 +0100
Message-ID: <20260210171433.52164-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable Adapter was declared and initialized locally in
an if-statement, but it shadowed a variable of the same name and
value declared in the function scope (line 169).

Removing the inner declaration allows the code to use the existing
outer variable, resolving a -Wshadow warning.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
Changes in v2: 
Removed the white space in line 211, which caused a coding style warning
(reported by Greg K-H).
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index f712d0345b99..0f915589b518 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -208,7 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
 	}
 
 	if (Method == TXAGC) {
-
 		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
 
 		pDM_Odm->Modify_TxAGC_Flag_PathA = true;
-- 
2.53.0

