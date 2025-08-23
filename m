Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6CA258CDA
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953022; cv=none; b=nsOYXlRYxYSUI81KZL60cYIzvyqb/uqprxemCV14t4CxXmZQN0UUK5SERQcOtLxJPKdWVY6FUt5vhTh0arpmi7bBY/MY9Q9XYtauQU5Xi1tBSZ/oVDsNhDRshmTXZPrayRhQr3jUvUz5HpqrlJO+yvOfdgx6FKsHLr1O1enFE9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953022; c=relaxed/simple;
	bh=B5WuxuwbtaSLBjDtJWQ/gsFwN7RDDeo7jZrKiyfSn6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOck6NBpXVQQJtTc+rn4HqsG5bfka0oBF3aQ4YVLnT7pWlQxNBhQlzLnrP6gnt8wnxmawgbhGOQrfMRpbqrwXaLLepIVj0cw4AhaBG1ixQjbUFaclkVgBNTiOIEYmO5a5FdRkdSZJOZhQEJFzSl9qWhO2/NhHn0YoO3bc6c+CR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC9BDRsv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC9BDRsv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb61f6044so555347366b.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953019; x=1756557819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9og3+uRw64r/MDppjSYN2NDzI0VJAzl5jXkEcD/Diyo=;
        b=EC9BDRsvHBCfoTvm56CxnIPtXXkbXAZTAqLWPfZjHU0u/Gh0AMjLL0zuVEXGTN5U7Z
         aB8y9tWhIuuiFzpGF/abr2h/v0c85Mdqz3EZOA343rTmKi8QAkoSgw7jLwF/2URWghYQ
         4q2Rko2spv5Org/gkYcA0ncQM82wtQZsjiHBu/AMGue25Rcs2DS0rCimlA0u8BzINGrX
         5Vc11dEhZ99rLUS1lXr/NExN23KGNdbZEhqt+AVZvnB5maVLQAhnxkEIDP40C86Lnng5
         ozozOjQbi2+m3C+MlOBVF9SBRtT3o/VZvtRO4YsohzyXOXmUKcqK/HFajY4VUVQuBR4+
         A01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953019; x=1756557819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9og3+uRw64r/MDppjSYN2NDzI0VJAzl5jXkEcD/Diyo=;
        b=YjVSi7XwvdAKA1ikln2Co2TkXxt16DuoqHiTpDAjrKRKz7tsyPB6NgnJf3NgWjET9M
         jMjYAvpsI1c2FMUJsaY9kzJHUxlpuJX0sj5jJsxGimQxANyR1MFqWwPUlQFRPUZ3hZga
         wlwYnRsHaTxq9AEOntSNIa9l4xDx+qAJcEnW6lvq/vDZILMDTALjg6w1u+s+ZElkHLJx
         ZfDsHRKD/7735tTVOHXYm9qboUOdp7GnJYKj28CKMO2BDENJ+gT6jTVfZVGzJ8Lt/+h8
         s9EEOGCHMSFmeYi5ukS5FMYSH43GhfZp5Hxeh+7Z+4Ut13L7+sANz/3dtoTQ5uRlQhY2
         M4fw==
X-Forwarded-Encrypted: i=1; AJvYcCXf1E7DQk9SzKX/cxsWKqXW3gCJv2dzIpEzmAifgP93PhjRjwqidcF5gQelT2ahHcinXz6ECHtB85c2TYBs@lists.linux.dev
X-Gm-Message-State: AOJu0YwQAkN5g7IaRBwZ1kAw1mVjpkv7TT68yZP2PvzdpImkaZEPm77f
	8VYmz5OU1seZ4JpBUL7tt+C8VcYghdq8p0AYo4cUzAT8ZVBh0TisHGv7Innumw==
X-Gm-Gg: ASbGncvwEOJXvOs0UGk+5XfDWxqm3mZNivfg3GGMKZphjAz1M3YYFPZmH5IPJurlLoO
	RCzqJdTQJjDBJy9ad+aNAhCIpK608Jk8UgP08tJta0z/4Syn2+BP+Q2q/t8sEEfBamVgJchi52C
	X8UWGHa+JfYBvw138GNFlWrjYLVY4AuV/QukzFihKdmsGBzKA5t2FYGqZpc+reGQMuSzmP2ry1P
	huc4mppqLtg0d9d4y1wwEo81+OQ/5hl+7NixR947YPXb0Yg+vU7E5DF9rM72yaZMzHK1yB5qtWb
	CUYMoaqBC/t66xhCn+XPYmxfX/UK7rlGGHLA1AnnXS9YYCcfjKHQBr+dqdbH/31GJ8dJG4wa7lS
	JpC4ZrGpQiVZzq7AuySvgrc0Pwg==
X-Google-Smtp-Source: AGHT+IEq8dkXUNPFJ4bVxwzfFI0ohs17PD6BvkhvEnlnS4v8bLD4YT9K9JDLzB01tdP1ORVEKWzggw==
X-Received: by 2002:a17:907:868c:b0:afc:a330:3318 with SMTP id a640c23a62f3a-afe0afff566mr876260066b.3.1755953018559;
        Sat, 23 Aug 2025 05:43:38 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/14] staging: rtl8723bs: remove bPseudoTest from Efuse_ReadAllMap
Date: Sat, 23 Aug 2025 14:43:10 +0200
Message-ID: <20250823124321.485910-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function Efuse_ReadAllMap is always called with bPseudoTest set to
false. Remove the pPseudoTest parameter and replace its usage in the
function with false to reduce code complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 2c0dc55fb20e..e865f83c0967 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -303,15 +303,15 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
  * 11/11/2008	MHC		Create Version 0.
  *
  */
-static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bPseudoTest)
+static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 {
 	u16 mapLen = 0;
 
 	Efuse_PowerSwitch(padapter, false, true);
 
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, bPseudoTest);
+	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
 
-	efuse_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse, bPseudoTest);
+	efuse_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse, false);
 
 	Efuse_PowerSwitch(padapter, false, false);
 }
@@ -390,7 +390,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 	if (pEEPROM->bautoload_fail_flag)
 		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
 	else
-		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data, false);
+		Efuse_ReadAllMap(padapter, efuseType, pEEPROM->efuse_eeprom_data);
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
-- 
2.51.0

