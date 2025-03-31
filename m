Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0941121CC51;
	Mon, 31 Mar 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435531; cv=none; b=XJGgrOGzCjxhFSezZ41q6PM6EfwWPA02OHF7zP0tivToDkMC+VLJX8eLCCCvoZnT1EQktjaaRfLj5+OQUARB2ppufu01TmMBWXkeRoisy1odr5D22pONGEz3LuN4Rk8tF0kiKGMTHQtrVlcEWOkvhrayMeZeF5oPl9zOzow2lTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435531; c=relaxed/simple;
	bh=8Z/Q1Yqqxhozl8RrcKexRki6sw2jFiBNt//dnoasYvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcKA1iQjuL4eVECPhRZ3tkQLN8wFIUFm401w5k3/1ILORvDxgPjwjS4wGpl6OevBfeztcauPkeyyGbEmLe8eqtK1tmx7urij7bSsxNJb4rtb8wNnVKOzF6jUPAhdZ4KZ5A/ys62G/FhYWp7Vvf9HjZeX4k4QGI0BOBkz6M1kct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVdpRqFy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVdpRqFy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso31185265e9.0;
        Mon, 31 Mar 2025 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435528; x=1744040328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=NVdpRqFyp7krQIfkUTKiEOcrCusnfmVH1/WNEQWOnmr6OTsRLTpSp29y1AXAUbEmu+
         sgAbjWCApdO/XGHVVSiIRSE/uzqAR/m0JSYC0T3fDCwhKMyRIraHjENXK8Z14d1LsqGa
         wu0YYbLJWajzZsKYb6j7aOAM67Ey5eymXMXq33C8RoWSJl/Swyc0ck7PwTUrlyHOMGap
         oehAxf2cVkxd1olowsKTM4XbIsn6IpL4rjB8JquohTFi4HJoq37zv0omD3xVyBpAB8Wv
         0cRbcLFZgpw1AHK7Wl67+3m3dLFO/GGCoO6fagSyl82myJ1IDT5GsdoM/Hnfypif/Gw0
         EMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435528; x=1744040328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gIv3lfUsZudSX+4KjXfNYnF9gzZiOWchSCAyXPUHRA=;
        b=FsOqlNjP3wd5yA7hyG2txz6tn4qeE6/Emk7qI5GPN/xCudnVvxxh77nTHKilPV/IJz
         +Nj70wWxBokuP0XCfsxBK7vviLom5YzLEO2SFYojm2/GIFMLx3wmv0yawOdXN1XtzTn5
         vIMZnRZKOJnRJ1A1UmBSAgFM236wYPOfAF/b7Y2s62zLN8TFcCBpzbHsK1CdmTa4IWrx
         znJdMTjF7xmVgIcSFVyeeYy/fY4Mz0/azP3L1d6Wl0/jhIwpJJlh1bsSZLOqif8r9+qk
         pWubWm12047U5IRVi1p3KzYTWRJGfenh8zF83+scHAQhGGDNk+clAucO2gZFIlKxDlZc
         Vd6A==
X-Forwarded-Encrypted: i=1; AJvYcCVtNoYzW4BtjQESyBYuyWn2vbfgAaZcgdL1rK8U3A2lSAwhI9X7Nd97WTyBYKxSKgXSjtiJjV+WpGE2@lists.linux.dev, AJvYcCXQi6GTGPzu2XrhlP1P2j++bAqnqb66lWl02GRg8C9/evgWIbsMT3QbI+4155peYcX6ZeMU6iuHgV3w80TE@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2E8pyTN1UwH6i+hZYneT9HzD/vZ8oMHJxEFXPU31Kz2gbZodT
	ME7IcJe8NoTYJGBlPdywwsq5luDAwf55UIVV0OQ6tOOxTiPWbxBb
X-Gm-Gg: ASbGncti8MZ0aL3gQspUvyR8ungzJbJ2iweh8nSdee2QbEF1qzwpuu7NdnwbPdSTThP
	CyBoQrb4P+nS47Fx/65uSWbBQ9A4IWcs2RAkaD+Fqml6McvLPxkoTT3KuzxXUGwLxp3qLM+DvPt
	5kfoOehWvD/Yct9Ss6LJSwrkS//XArK4xwHsKxVOg20gLFX0EkH1Rrjg4NWhBGkI8mXag5klKSl
	DFjS1imaB4cOmuJJM+vRw47hs2LV5R+hn6E0V8q8UP/MQnliC1kmQrl4gee6slFn23hB6Mcyjmb
	xzMOq+FPndVLo1QKi2qKvrS9KfW4+J+8DITmv4k=
X-Google-Smtp-Source: AGHT+IFdato1T3vrZMd1epyk3zNNbsohtGqaDLeyTFEjiVWS1VpusMu2h3hzcFrdgYDV0ky7Ie0dww==
X-Received: by 2002:a7b:c85a:0:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-43dfa59cd30mr61311035e9.33.1743435528129;
        Mon, 31 Mar 2025 08:38:48 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:47 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: add spaces between ternary and binary operators
Date: Mon, 31 Mar 2025 18:37:56 +0300
Message-ID: <84e4e73f3224ee37d5d203c9b7adbcb43f4fc144.1743434232.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743434232.git.karanja99erick@gmail.com>
References: <cover.1743434232.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spacing around binary arithmetic (`+`) and shift (`>>`) operators
to improve readability and adhere to the Linux kernel coding style.

Reported by checkpatch:

	CHECK: spaces needed around 'operator'

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 928c58be6c9b..3b43f8cfd6f4 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -155,9 +155,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		/* 4 1.6 Big jump */
 		if (pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
-				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_ave-CFO_TH_XTAL_LOW) >> 2);
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
-				Adjust_Xtal = Adjust_Xtal+((CFO_TH_XTAL_LOW-CFO_ave)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_TH_XTAL_LOW-CFO_ave) >> 2);
 		}
 
 		/* 4 1.7 Adjust Crystal Cap. */
-- 
2.43.0

