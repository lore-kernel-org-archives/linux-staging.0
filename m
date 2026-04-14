Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA8B394476
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160738; cv=none; b=UYMUtJ2xEwf1+uLrIfe1BQD43Sp7Deda9IUK/TM1LuXsFnBgyg9S5++qaiKRmNSZ2FaXOUBraH8Zdw+dxOfdFFdLHiMl49vBoshOEci3lPxSgKymXNhj1Z51WOVoXpmhuvvPZXOHfIlpAkC44Ok7CrEa0ARy0zWmXZrkfaX9wKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160738; c=relaxed/simple;
	bh=hcaz3A9RHlDsjenZt0zbaVKRizleVxwBHTORYZTOt9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGWuiIva8kgFpEjILe42inMp0uRxuuMiC32OkrVZP1Ce2ViLGeIR5Xf+eWk+RpSVjnrQQ4ULWesQpqm+7qjRjGBZ/7dCifePR/nwj+p/t0mDdIBSwJaXcp7jyi56bRZZSBtOn7lznDQzWkKmfxANZgad0B79q68VbIL5kCqPiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHPuvKhu; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHPuvKhu"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40502e63bso485510e87.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160735; x=1776765535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5/UB9Y4Wl8LhWvikIPz2mCrzIXaU2jp7kDUouEUEmw=;
        b=KHPuvKhuce/BK3ukrLhO5AmBc8xXmNXm+exeSkT6m5VVOnOvT5M3ASWqS6YU+n9Nh/
         iwM8xbXBy1d3tHsacVOcLQ6KZkN8vWJ2noca+rW8vBO3z/k2L7lLjAc3XQVcXpRPauz5
         mX5GGW4c+ElfZhVFODTEPW34NmSF7WKbnqDkWerkI/o1B66x4UjS5rI98u+JcPuHPpzF
         QeBpuzuMEGNdPSEvz5NwHMZOPO15jLLiYQaKBg6+5NVAEdO24ksQ7fZzeOFSqhrwH4Ir
         DmDYuIPTTHn+/ZpOqNiWpmxxnu2vnbA572nZNymtZyPxZCGijydSEZ0M6BDhl//tI1LA
         ovbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160735; x=1776765535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5/UB9Y4Wl8LhWvikIPz2mCrzIXaU2jp7kDUouEUEmw=;
        b=RE2yHDT9CdOFWpWsWLrA/fdaT6yiE75JK7u6YesttcBiv20I/Qb6dmEeNwuGXa9Tp2
         lGQ4bl/qBRq6vrvpHbyPLikqp/EovxjvTnQ2C8wfvDE4nMqk2EMl3T34oALamOSIIQpz
         6JYxbS930weR7r+c1D/8W8h0eKzvKv5FKAzfxsRyL8NyR1ku9m5keQVNS3bxlJl3S+Gb
         kA1digPcCt3bl5LeJuA1NOHKd44+yxv6y87iSixDYmV+KNQ9n+4FHGlUjgYO4ZBEvXPP
         bJlkG23k+ydIBC6NxIYX8q8SJZgXLHSZayoBMpmjbJ9tvlpOwpJry8r9zbdnxWaG7IT1
         TzMw==
X-Forwarded-Encrypted: i=1; AFNElJ827PXuRV3yqqjKTrHmsLDeqvi+AE5r+r5Ul2YcQ8NwYfWXdZlOGW3eQukufEKGGtHAcmD9GwVxQZiIaCHk@lists.linux.dev
X-Gm-Message-State: AOJu0YxRi/7IDWEgAhuTgAYBpFKpBj2daO0PBdZgRhHRhWbmFufc4r80
	BxusBZeDVc66NKe/xVSlYNHfLLP6lYMHCLoOsR+x3Ca0OOXmPXXmVoL1
X-Gm-Gg: AeBDiesXKhfiyudYzXBDDZnZoQJlm4NgAsB8VBFYVMHRMmaAxhI9x7ftmAutsywnp4K
	BGzS5UHtq/+58nyNNNqfZ13xLdPd0Q2XD/n5DiC/dHCZxk3ci03/Xqz5NtFILqwumuz5pff4l6r
	27OILQHm5v1C1q00iACBpANgInZOMU3AcpMWXfaS7Wx5OnQzjiT0PeHWGDIgcrMXG07hJxruo2X
	i86CdIpPvCPL3FLsQyikb4pavY61o58cX2vUEPvSpAt1ZA756zaoNtW2/8vsccXLx8Sm8DUHSOu
	wkuagJIWED/bP9nnLUJJUuBec57x4Z+S3ZvYxu2zVbcF43zkmgmwxlEFcjEr02il7oFJfDBeMty
	kdzPhGH7ul4yP5FkfDmnUz3jMZDjxQmdsUFVZq0YOJjg/UASPNHUK6ZJnXGfNUSRUp+r0jRVHtL
	sqFzfiQX9PNraTubeS7R2QpR0p
X-Received: by 2002:a05:6512:63c6:20b0:5a3:fe3c:65b7 with SMTP id 2adb3069b0e04-5a3fe3c670fmr1609972e87.44.1776160734970;
        Tue, 14 Apr 2026 02:58:54 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:54 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 1/9] staging: rtl8723bs: remove extra blank lines
Date: Tue, 14 Apr 2026 12:58:25 +0300
Message-ID: <20260414095833.76480-2-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove double blank lines between function definitions and between a
function end and the following macro definition. Also remove spurious
blank lines at the start of an if/else body and trailing blank lines
before a closing brace in _TwoOutPipeMapping, _ThreeOutPipeMapping,
Hal_MappingOutPipe, and the HalSetBrateCfg rate loop.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880ae6a..0c3e983a1b2c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -30,7 +30,6 @@ void rtw_hal_data_deinit(struct adapter *padapter)
 	}
 }
 
-
 void dump_chip_info(struct hal_version	ChipVersion)
 {
 	char buf[128];
@@ -71,7 +70,6 @@ void dump_chip_info(struct hal_version	ChipVersion)
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", ChipVersion.ROMVer);
 }
 
-
 #define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
 
 /*
@@ -294,7 +292,6 @@ void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
 	u8 i, is_brate, brate;
 
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-
 		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;
 		brate = mBratesOS[i] & 0x7f;
 
@@ -361,7 +358,6 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
 	if (bWIFICfg) { /* WMM */
-
 		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
@@ -377,8 +373,6 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 
 	} else { /* typical setting */
-
-
 		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
@@ -394,7 +388,6 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 
 	}
-
 }
 
 static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
@@ -402,7 +395,6 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
 	if (bWIFICfg) { /* for WMM */
-
 		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
@@ -418,8 +410,6 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 
 	} else { /* typical setting */
-
-
 		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
@@ -434,7 +424,6 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 		pdvobjpriv->Queue2Pipe[6] = pdvobjpriv->RtOutPipe[0];/* HIGH */
 		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */
 	}
-
 }
 
 bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
@@ -462,7 +451,6 @@ bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
 	}
 
 	return result;
-
 }
 
 void hal_init_macaddr(struct adapter *adapter)
@@ -749,7 +737,6 @@ void SetHalODMVar(
 	}
 }
 
-
 bool eqNByte(u8 *str1, u8 *str2, u32 num)
 {
 	if (num == 0)
-- 
2.53.0

