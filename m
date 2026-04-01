Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835D0384240
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070509; cv=none; b=epvhrVTc8mvFhOftWsuyrxiLuOnvKE3rHW/vE1+X8vbvmYYkIKbV8IfW14ITWVUSH0a69SnH4niZsSLOY7gZXslKz9UVFtFf6nswrRs21P2LgbW1BP4+CI66Vi9+HFSuWJEvlSUfr/ZqPeYnL33yLzZDc73xpj9Ix6R6/hxlopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070509; c=relaxed/simple;
	bh=C5JUjSYfcyz1i4H7R/CuGk309AlH4dPDHHv7upzwf6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFldH5sA6uBEnQBUxnGB++QtA/G/rAXZvhGt8+wnhyCizNfL+V5usTJ9Su3ucZZbTi2Dz4GuXjbhyR1d1xaE6Vd5rndeEEdgvej2tUOAZp9U/rexLlewmkLMJnUeTtgQm1moObmmCJPQLgxCVfe7p7TxAGlYNoF45Thgl/ruGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIK4ivz4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIK4ivz4"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2b383cefaso156506e87.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070507; x=1775675307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hpuLWGLuRdiGCzprTCMKz2oRZivQ4+UeqqEXwd49cQ=;
        b=lIK4ivz4mvEvM/D3gUK7tt9Pt4kGKut9tQD2oCCbt7xDbFmtXlAiY6LrkdbgEoRyqP
         XkgtgF/Hy82g7hWUeO48CsI0agXkOoZl0CU/zBHMDmKhVi95h0ayt3CSmEJBMZwMiIlk
         9CluIQmEP8Ay+qAMN/vgn5EOKms7hh25hBQcSO6p/vzB6M11SAWfaSqhNjcOZUEhFKtL
         pAksSaByUNP/d2wRWS8/s4BMoDUDlR8xCaoenQuNVoDAKLFhTDV60v2Y/cUjEguHridc
         IRm21NDcp+R3ts0qXGanlWq29i6VAY0YPihQoYhFXs5UmgvjglLZB9/YapavsSoeOr0h
         5VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070507; x=1775675307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hpuLWGLuRdiGCzprTCMKz2oRZivQ4+UeqqEXwd49cQ=;
        b=VAjG8wvXIb4iBeKrK9reOJ6CLWwRyusl4lHNHIA5FY1KQoSFi587rgKAEsUcsysHoe
         JCDu5AOvlBtuEs2n5R9y54ITbs72wtNs+HAznNPhtP+YhmPGVyME+mbqwHqbtzrPmXTv
         PeVBg2zpEtga5VwuQPuazkLf2rb9Gx2kqai7kJ2wGPNrNf9+s11mgyhgLYmkV0RmaHtJ
         aTZ42Fhqtz2gy81wmLuW+dlmT2FSh/JrU/X5UFOA6mnNTtrWUQxPoyPTcx3/GIiO4cHS
         ka0f60oozZeCY8wTFfBibs9+r5PXjyHaUOd3eJ7TAnRcLI8YfJCDHhUvhmqLbqvjXrtd
         rzXw==
X-Gm-Message-State: AOJu0Yxs647FQypGAuQZb7GTsN0SmFeo+5DO/KA6XrZ6jy+ZlKupnG8D
	1sTvtplkxU9ZuBgLH6yI4imOhajipwuu4nAhXqZXyQKExGF0je4lkLjWeH2nnA==
X-Gm-Gg: ATEYQzyywpPnWnhluxmzfkavDGqCUkMIY5Ain90zTox/4YtfVIU6jmC8600IRbGURN3
	Fi4HsjzC9U2OBmqE+JdcqpuZTIImxG2y5ahL+AYKtgyU4wORf+SHdCaO2xOvbI6/R1Igzq5uVFX
	Lc2mFEhsJiPpk4e7hmGfdVf0RV+aAQuw9O8NgjfreK5QQiuGrM8gx2T+RXUEvqbIpuO3VpHpa/1
	ltrRStJOt7Uj+JQBys15ELivvL7X/2YkQPN0RVM5R1VhzD5hw0XA/rCizSpGdUY8q5r5GzfObjg
	fRpM75Wf1PgceivuKIVWI9ktitgDQs0proDmA37S313uPuEo0FVg5UzIF3KoD8ZskKfHF2UR222
	rQ5U2Lx/d8uaQYCgSXQm0UFQD03/HJxpkTDRnhAtOBl/fQ+bb8ZPBPL6yOlJIJSIayJ5EMwBp7Z
	5pzSMNPTCHE9PnjuGlBM3vPHKyxCAX
X-Received: by 2002:a05:6512:3f0b:b0:5a2:8568:826a with SMTP id 2adb3069b0e04-5a2c1f344d8mr1504143e87.34.1775070506537;
        Wed, 01 Apr 2026 12:08:26 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd3cfa5e9sm637211fa.11.2026.04.01.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:26 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 6/7] staging: rtl8723bs: remove unused global functions
Date: Wed,  1 Apr 2026 21:08:13 +0200
Message-ID: <20260401190814.216333-7-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401190814.216333-1-linus.probert@gmail.com>
References: <20260401190814.216333-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes two unused functions Rtw_Hal_ReadMACAddrFromFile and
Rtw_Hal_readPGDataFromConfigFile from rtw_efuse.h.
The functions only existed in this header. No implementation or calls
were present in the code.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v4: No change

 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 1012831c7eb5..4e8980d86965 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -74,7 +74,5 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
 void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
-void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
 #endif
-- 
2.53.0

