Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7E60EDC
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748773; cv=none; b=BW7ajR/LEmhkSr9NzullPxkZFsk8XdQrYik2krmsv/f/ACvbROGaTMeiC2lHJvNhd8C45TiU3tIV0vwnJAW6/lVaG0bE2AVJsCqdiYfhCxwCYxjEgdKco5sjjbvPBwNpl/LQFiCQAa1IpOLhtT7LbIc/L8fc1Pob66IDXklSqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748773; c=relaxed/simple;
	bh=I5J0U/zny6sQs9MsL+pGxgC73NN87CT+gNs9eRbmy08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nUSjc+6k3B4CiC8oYo6j+baEdXjGrxInCaUxyohKSPkCGYfo+UEPIpArUgYdi+bg6FY0kxDxhKJuolohsrNx/1dAlyEyI9dL584EyqvP6wlbWD4PtzB9FJQigXCo7Z2jATf6uNPJcUVLS8aRRDPKi8KXhmSMpXPcXrKO9NKueUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=U1V4q6Q+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="U1V4q6Q+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4603237e0so4475987b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748771; x=1716353571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5JpqU9JVapL1SoY1GYeI+tVbuXEFUb6xhtDU141SUU=;
        b=U1V4q6Q+PHxF+BqBxl+6SBCvYX8tFpa+NX+i3M/Ia7K53v+4xnjHNbvngdQRyH+gAT
         DTKP58DT61jfpJr2SS4m6jxGbBk58nLcBESiLIm4vvdlNz0fC4fLTqGa+TXugrQjyfiJ
         0W5zCGBNbc3tamc3vxN45byfw46C1VzP17zsfN6iDoemTKaYkzhaZXDzeoegLY+g1Vih
         uBBKtT9A8u+lbQHpuvwzDaxm0gmTuOrjtdj/UO64FmWe+D2ZaD1+7vEIMAvXj1wpo/m2
         zrfjx1neFrmWioI8d4aJCm2p1Uz3N7ckqq4gPeyMmMIl5W9kbYm/C6LHqeW3ih23cPot
         Whbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748771; x=1716353571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5JpqU9JVapL1SoY1GYeI+tVbuXEFUb6xhtDU141SUU=;
        b=ZAYuqpo2Rta+WJ8JBDoLB6rZPkQbmoCCWEZGJT/0AxNhBRPY/8gWGHOXI7kOGtGf47
         9YiSyMRySnCe4jntaWx97DPyC2orE9g6lAu829cw87BgcIEENgGgpEPyZCngDJM/W8AR
         qeYRZG280elvylF1oVMIxMXiuTAnzTo73kmm3VWZkA/GDTvZmhzr5zB/mL6B33jIfxCy
         yBM5VuFjYH06G3p8Ofkl5G9b6wCVQeMXIYsvy+Zz0fO5MyjkO9WVBaMEBP4vathYbR/R
         FHd5+tOhDgEk/6YHZKPZ84SAQi76niOOsQ0dgx7ulcmmPRRhY/FFb1TcWTJoiVzbNgcW
         m7YQ==
X-Gm-Message-State: AOJu0Ywu/jzrVCDqPaTHps8sMdj/izxWpu5pPu0hsMDu4aGnxVFJjL2g
	6QjUVjMh2LILWadA2x5inznowh+P3Og5REwXTLjn5eCJTDRwLyNXVktNS4scRJk=
X-Google-Smtp-Source: AGHT+IEVv40Dnq8ip0fudfMSrfpWy6p0OWbYK+tmnZ5++CVu+sEhT0XODfnqgBUAn/G1d4ey/TA7vA==
X-Received: by 2002:a05:6a00:a91:b0:6f3:ee23:3c39 with SMTP id d2e1a72fcca58-6f4df3d81b2mr19842221b3a.7.1715748771129;
        Tue, 14 May 2024 21:52:51 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:50 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 24/31] Staging: rtl8192e: Rename variable bMBssidValid
Date: Tue, 14 May 2024 21:52:21 -0700
Message-Id: <20240515045228.35928-25-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bMBssidValid to mb_ssid_valid
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0914ba37f42f..91164a3b01aa 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -914,7 +914,7 @@ struct rtllib_network {
 	bool	ckip_supported;
 	bool	ccx_rm_enable;
 	u8	CcxRmState[2];
-	bool	bMBssidValid;
+	bool	mb_ssid_valid;
 	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ffb1bbc01bc6..d662a12bf437 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1820,14 +1820,14 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->ccx_rm_enable = false;
 			network->mb_ssid_mask = network->CcxRmState[1] & 0x07;
 			if (network->mb_ssid_mask != 0) {
-				network->bMBssidValid = true;
+				network->mb_ssid_valid = true;
 				network->mb_ssid_mask = 0xff <<
 						      (network->mb_ssid_mask);
 				ether_addr_copy(network->mb_ssid,
 						network->bssid);
 				network->mb_ssid[5] &= network->mb_ssid_mask;
 			} else {
-				network->bMBssidValid = false;
+				network->mb_ssid_valid = false;
 			}
 		} else {
 			network->ccx_rm_enable = false;
@@ -2350,7 +2350,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
 	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->mb_ssid_mask = src->mb_ssid_mask;
-	dst->bMBssidValid = src->bMBssidValid;
+	dst->mb_ssid_valid = src->mb_ssid_valid;
 	memcpy(dst->mb_ssid, src->mb_ssid, 6);
 	dst->bWithCcxVerNum = src->bWithCcxVerNum;
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
-- 
2.30.2

