Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056343815CB
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711012; cv=none; b=SvU4OfCt937TAOh4jd63WUs+FEC/5zMWoCfE2puZz+IQ04+N7hUhU8X4esFBw1mie+dp6mfnk1bQiTxQ2D8yZaqlbWTItGFbWhDQKexUkM7E22Gt+CHyBRLfs4B1jXvuK3SWcE7yAcI1wFohtNZg8WuCQAjs38NYYlyqgGDVQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711012; c=relaxed/simple;
	bh=oyOUsQBz1eoO/xPKinoKxfV6r36KLpnOShlIEalijEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAb5dxlxD/qNf/KUH4W1rST24O9pmmKRb00yJXXWvQSm8Gd+SdeiGHZaTDPVKkTkcgks32GJ0mjhI5Zb8vlHJILmJ+KqnTXhDSfaZ7aVPnFq3UpLk5vG2bzrFxHWfb63YPOMl50SYqY1Ll3CuJEsmfMfD7Qmzj9U9r8HULYDqV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPLUDuge; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPLUDuge"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39378db197aso98339371fa.3
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 05:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779711009; x=1780315809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t4/1E6y9rzg9L43g6t305UAl+QiCiv9HJR64YEc08Y=;
        b=sPLUDugegUIXBidkYG26uXFGKscR5M7u36EFqKF7WZxkbCCbn/VMEKie2asplMol0u
         i54SmlMzv40cnqvLOhMkCR55jUaf89ako8n9b1jNfatWhIwDgEicjEWZuE+AGuBmqSua
         3WAA52qC8hL05VMxHLcZKGTDkiI1at5ka4VrHWU57mx3AXJ4xJVW39ypfoLuhl7DWKCe
         gAQRyi5HK4RI2wTpgsfCN4Jm1MeEUmVc9Am5FH5VAicCnU2yG1HMyF/COak7hAie90j4
         rdKDxP0fCCwBSqUo14WdLI6P+/IXGWLG8B7G5QTillxpTBAdbR6k2HCW68zyphWlQG2R
         N3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711009; x=1780315809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4t4/1E6y9rzg9L43g6t305UAl+QiCiv9HJR64YEc08Y=;
        b=TXv4sLn53k/YbWV6424NI7QSvH63aJf8P8iC/nsX0jhl77fecHld2vf0QzBsXS4lD6
         Qhu7ta26AL6CWFdJu3eNnpHStgPp5Qk5aaA1KURKF2X9F+YUw/pH2GVB5I/BR9IMkYVx
         xqG3eC94g3GVMkYiBNkvQscPmVqJY5hbhGjxfvhRNojy3CVK139xxH+ZorM74hDgy9Dh
         Ll/zqTIPWrKZIDMhqZa+1xX0nc2q5cQdlNO+/BAwFE4BkXXHunXePodMI/ancQ0Qar1Y
         Cqx2TevxwAFe9KXVqMRkCEUpVGB+YhGHRepfnrgV4Ukjzi3Q5h5QN0K6Eh4sVe9d5gg2
         r88g==
X-Forwarded-Encrypted: i=1; AFNElJ/nT6/U2VaWtphv52O0EDPY1DhhZY9ozdPsxaQ8Ucq1qE+4j3WoTUOe2E9zcjD/snijnjq7N/6ZqKHGOJ+D@lists.linux.dev
X-Gm-Message-State: AOJu0YzZpYytUD7nlogqTpr/shpvpdZZXaFF1kGniPCrRJu9oDJCuOSD
	KAkxoMs4KqXNprSHHC5YVzkMWE02mTDHlpuPXP4Je8bDoFW+ITlh0XsQ
X-Gm-Gg: Acq92OGJfdEp2+AY0ODCPUQfyiNWCH0ZlxCHlRnpiM7ND7f7XgGIBjxJvhmvSlPHS9P
	zoYzKeZSESawnFqaGc/uFkGFpKpbBWgARCYvxKrlfRkFrct0qO8ybSZu/+uHKxRHt4ics2TkWSw
	SchPdbh5JuNeFyjIPM4cpEjbumWiMZEmhmg06Leki4tH44GAzDrOpGVoVRn/dsWM7z+kLomfQsq
	1yCPBRiPYdcijc5IbdB7vEzYCSjaLtkBM/oHHUirfw8mjwK/2peHWDITk3CMliMiLtVdSaNvvMN
	ZahL8ilHjB/RCmdPDWb+uaxNDMBVzBDk4A8I5Muy2gXo87OISzPouyAFG1VG/T/nzgYh7FpVvZn
	QOLBj/oxK1jEQKydy51J23lwSx3tI4VwcnY80PolAIeUFqO5uFT76+lBW/StPhej9SUfQTFsV2c
	CutIuzHxYNTxUulsfVIc+mc9UyOGlUj4VQuhYyYxEuky8H0rpcBIEK
X-Received: by 2002:a05:651c:1510:b0:38b:f0f0:e3a8 with SMTP id 38308e7fff4ca-395d8ba6d0dmr49996601fa.3.1779711008953;
        Mon, 25 May 2026 05:10:08 -0700 (PDT)
Received: from g.lan (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc09e45sm23408981fa.24.2026.05.25.05.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:10:08 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: fix coding style for PowerIndexOffset initialization
Date: Mon, 25 May 2026 15:10:03 +0300
Message-Id: <20260525121004.4989-2-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525121004.4989-1-igorpetindev@gmail.com>
References: <ahPw0yB7Ax3lfhKu@stanley.mountain>
 <20260525121004.4989-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around the single statement 'for' loop and
fix indentation in ODM_TXPowerTrackingCallback_ThermalMeter to follow
the Linux kernel coding style.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index f67b8d70b..3d45e5e44 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -230,8 +230,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
 			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
 	} else {
-			for (p = RF_PATH_A; p < c.RfPathCount; p++)
-				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
+		for (p = RF_PATH_A; p < c.RfPathCount; p++)
+			pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
 	}
 
 	if (
-- 
2.34.1

