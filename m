Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0A76026
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946656; cv=none; b=Ytb80u3vQFzbO3LfTm60Mq3cgmYKGbDXfRmOlwhfuOsxap+th7B8z+THU0rKT8upYFsAcY2tSR+l8EilhO/oORPtiErqc0ZKXIr2H4zKZ+yd6yUbCmn/R2ezOwufIVLRJphpz0S3DywMFNObECBX5Jl3wjNOkLh/RICWWd9LpNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946656; c=relaxed/simple;
	bh=xAHSBYDP6W/ya7H979vVgrYm6+UeSkQpAh7OsBt7vMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SwWV6YpF5Sww/jCrBIP57z7G8QRtjQigQTWjtGpAChuiPQagxC6bfeNYARq3KqRvq2gzbwpPS3P4ztQ0PmcC2hKDRsePx3Qz5qz1r01PSHVNGUeBuNU1t3ptCXPWv7lnlIhuS8ceIEEqIjwzDGF2CA3L1RTDze1witcpul6yIaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSuW2l1P; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSuW2l1P"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bd2c147abaso5224185ad.3
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 08:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946654; x=1779551454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=VSuW2l1PBJnUAjBKLdHXL0I/seeOsofuh/EGWkvhjpNY53AsEg8WUYX1ER4ZKVdhoO
         BOvVC3yKMYCTSZ5VZXHCu0FdE6Oljm8RMC6FeYIft4PJAOefSJcwbseUAhc5bsLhc4YP
         0dfz8bh8jhGqMFdTOjb04PGzw7ZrmoTgFKRut3vS9izM8ZrswV2h+/Tm7hF1TCA8EHXj
         +yPgEExsSVw64/aXn+asqftpxLshhv3/e7X28LCmF1mr1Qeuveu+OEp6lzjN5JqYiZEO
         g94PoK+JUBRYwfVyfOKJK5+hft1Vn4AK3ImZqeAp1DSN/dvBz9o7tCNcqCUJI6LsRlpA
         78ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946654; x=1779551454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=C/1Vv10/gijdrKCBf8/C1NJLCaCZ80/nUNkquEQMztjhSnQ3NFPhHh7aCm7LIvID6s
         RgfTW610YQl6+K2dxHNa2L5S1ByKSXLAUgynZg70NpDbARh3w2ADB/hq6BbLMveaHI6h
         /shGWfQEgqHVFV6ag27i9bbF16Rv0KF5pIaD7E3BLOOjDQTs0NOeQlZH7yoqgImtV0fc
         s0FfzrpgIoZViSq5hoB0QjlmUAnaFHPBShoe+Fn0s4Fqsl0RY+irRt8Mzux5dBFWs9uI
         3/SW0k77iDTySvl2sOz+NmTNcaUMSXW8bLMRT6bqcm3oup3uZtI0poqMFJ8yGbIkxWQf
         b2cg==
X-Gm-Message-State: AOJu0YwwFkDP9CuL9Mk9h+dbVSWj3ajepe8GnpzeIbC9nBXlzdFDV0NP
	vxytRt2GfVDoRoaWYUzTeL1TaEsaSu2Nq8829myZBsrmUzvUfIAt+YwLMD/rKns6
X-Gm-Gg: Acq92OEM5UZFOHai9Kgza38keDhr+tt5pbqNY2jzP9IslubQ3FX3TA5nmUt7HNfDt01
	MK965buSVVzGbUFXnUhWk3INUIO2jJAwjqSC3VY2Vi1HHidDekPSptm9lkuTqnBfidHKCEkaIVW
	g1bB8H7U6t54zqjTBlRP6B7a/HRfViGDFtAN7kJYI3/AGDV+5kmXSQNUc15j/1Vy81608WrVDX0
	pZtv/2th+Fw4LofOz/5485ujzmSqfbdVx6BDZu7Z4Ewxx+Mh+yUNFT5kAOFUDJGWkeOilJY9/CB
	Ht9WzmAU3us10RhaAViDzcBqJHSNmnMa4gwhDrVkryweOgk0tsOVNgoNqcVjeulYluS5bLOFCpP
	25Vc0bceljbjeNG6X1qEeUbzWVrXB2sGprLBuBHS+MPKZ7KcYPRruJyKdiEJ0fjcfbHvq7H0+UZ
	n/KqPcKWWHLpsdZIFxApD8nf+/dcNje/NwoU9pifbM5d5rTNryF4qTtLdVR880GPC0Ql7puZa1u
	DNkmA==
X-Received: by 2002:a17:903:1b25:b0:2b2:5515:661c with SMTP id d9443c01a7336-2bd7e8ca3d7mr117987185ad.31.1778946653839;
        Sat, 16 May 2026 08:50:53 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:c9d8:7ea6:1f8f:17da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm89346425ad.30.2026.05.16.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:50:53 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: add braces to else clause in rtw_efuse.c
Date: Sat, 16 May 2026 15:50:23 +0000
Message-Id: <20260516155025.230865-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to the else clause to satisfy the coding style
requirement that both arms of an if/else statement use braces.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 987d05816c5c..2be74f2d4ac8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
 
 } /* rtw_efuse_read_1_byte */
-- 
2.34.1

