Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A66E246BCD
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476908; cv=none; b=jkfDYSeL+OrUQw9SL5o/rLs1jMIFIolRmVBBh90GYeofd5P5oVZqQUgW9tOQtcCsnU2oczUyXB+fOCJDsT1Y4rLxoL6HEMG+xbZiHDtzsAHh3J3eVFeaB7JoPrOwV37M5nOJTujgh+NFXtsUmyNynIHz3C1fiCKxS27ntT3NPl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476908; c=relaxed/simple;
	bh=iNhp70QVLeN2CU8FSe1fhxRzlw3yzlgZ7VIpBSCc55Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRwpTzrFqgkj9bmDUsQJXEFOUDY8WlFRwNP7wNTIi+r/2Hg77AwTaQzOkGiFEiUn1MjFEA4zF7ExX6tZNO3mDsxD5ABa4YSagw9pB3vO9q/wM8/PoD1dzfjiuD1rjpgHgvRqEkL85fahnMwFq+axj1my3Md+M1F7uaaXyityYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtEiiaZZ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtEiiaZZ"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79405b3485eso45234127b3.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476906; x=1770081706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBOBEvNcFzDBoSP/z1izj924i11bgg/3MAKJ/n0N4a0=;
        b=TtEiiaZZSpSbcxEwQab5UuG8UBgq2UDYnGIxEBb+JFl9BK7Z6yg3TqWUA0sYvQ2PBx
         Ji3aA3tR2R/d4fybrMoEip5AAfWjhwDd1BwyGN7+EdwwDhdox3Bx8M3W4+sFN9knd2kj
         B5rLqRcHPLpM0to/I63mhJvGtgY5Awlmk55+UL2ijDRennNuiqMh+v2Rqc8v8TlVu92f
         ZTk7zeCCIQA5lKoHaDJTtHcFPVqLe2qC/0qoJAM7mu2N+A8RFu0Wq6ruF/wudISzxscs
         5gqAYVqFnrOce1d8tkCGD2s73HO129BVOsuxI15uvxVfJiNr0fziNTYr0RXVWYLYMhj3
         6M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476906; x=1770081706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZBOBEvNcFzDBoSP/z1izj924i11bgg/3MAKJ/n0N4a0=;
        b=Si24CW23C1MaYYSG1jhDGgBcgpJJHAxPN7+2ujEIqNp5IojYXA2P9UllvRWRJVPvcl
         wZT8bbfun3L+Udk0hF/7jZ1YQtlB5k78IFd+FXZ8A8cdPqarNAb31Z0VA1bUdOWFhZrw
         h88Akj5pLA8toxGRQGq7eu99m0e3A9aJaaEaCFs9asU492NQZdv5obsomedh8twA3TGh
         O5kPHGT9NDkvum1PshT3J9YMDPKGSDmPUueGu+d6mFcQsPinwqYqnCngEruxCxIuP7p+
         QpOOKBE5gAXHHdXjjisc4Q4xzk9SCxWKi1LWN72U6Ylyfz7FBxiPcmZXoHmfZjr9ocLY
         xFpw==
X-Forwarded-Encrypted: i=1; AJvYcCU1p9Z9oJO00QcRLCds7CkHQsOxvCkO4tQOQBfUldikw+KdTHFRg1OWiqtFUP3/hhLI2BZbDZ4HAhn2U2l6@lists.linux.dev
X-Gm-Message-State: AOJu0YyMW7B8LdV2hmhFneomhbWsF96yfk4jewlMOe5B905C9jdt3sV9
	iGBI02/HGx08yykXUL7fW+NR9Q/pa5KC3v/Q/vKcYs4bltWl0XFNTlZc
X-Gm-Gg: AZuq6aJZDCTT/57wxuHc3PppetPaQtDSY68QCmzkIx0gA5W+F5svaNuHP2mfv3j3rLv
	hrh+GZTVPperdHvvj6vcS5UgOkHgJwvdXOKI/mDey0SyzmXG79G9qZ7mkSe9geexvbZyV221bnD
	NNpb+zdut2C9nmOCz+pd34oVq/0mLDPJu69SsEteMb6Rim73pP5ZrbOIO3ca6Oz5pluV8sjZ1nS
	CbxZ91Isr9IfwJYS/S1mhus4P74YeIoZ/MJqUqpCyVSKqrLctkS4n/cwftFaUnF9oCmw4sfVoiA
	Jlq0953tEazgSYjLjz1hU8nLjdlKF/w3sYDBSp9uHv9fVP2pK2qcjfI+Ho+H/pTBI0dndLMCK1F
	7Ldnu+QEM+qP+Dw9f3XpPGI+vaD8UwycU85YFzN+gDKWdkfIR+V/tyXhDhmkDKD6S510=
X-Received: by 2002:a05:690c:680f:b0:794:7072:b31d with SMTP id 00721157ae682-7947072d3f7mr21238417b3.46.1769476906388;
        Mon, 26 Jan 2026 17:21:46 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:46 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 7/8] staging: rtl8723bs: remove unused variable bEn_RFE
Date: Mon, 26 Jan 2026 19:21:17 -0600
Message-ID: <20260127012118.43037-8-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127012118.43037-1-ethantidmore06@gmail.com>
References: <20260127012118.43037-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable bEn_RFE is initialized but never read or used anywhere in the 
driver. Remove it to clean up dead code and fix a CamelCase warning.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 64a2ffd45563..00da21774c4d 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -160,7 +160,6 @@ struct registry_priv {
 	u8 reg_enable_tx_power_by_rate;
 	u8 reg_power_base;
 	u8 reg_pwr_tbl_sel;
-	u8 bEn_RFE;
 	u8 RFE_Type;
 	u8  check_fw_ps;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f4b2be4296c9..c163e2eeea26 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -263,7 +263,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->reg_enable_tx_power_by_rate = (u8)rtw_tx_pwr_by_rate;
 
 	registry_par->reg_power_base = 14;
-	registry_par->bEn_RFE = 1;
 	registry_par->RFE_Type = 64;
 
 	registry_par->qos_opt_enable = (u8)rtw_qos_opt_enable;
-- 
2.52.0

