Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E792D7D2E
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681125; cv=none; b=Mzkk7Igl1ZRxlCj7GxI5BqEzo/aOWvE7Ytav+fcehjEiG3HBRUKMfxVi7lrf4n/xLBlSAYa2UyGrxu+AWCQIMebgyS3vGIjJhucoEArUxuj2aJXVfWQ/VBn767uUTbIgLeDnBKstdCBShuazoemOkHKFUzamyeu7QwM7oTt1rt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681125; c=relaxed/simple;
	bh=4UoJ5MJgs4XdWfg9BUnVpWs1h+Iyf+s9MNsN6nWKoSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrN/bnQ8cikiX8EExksWk/akq+AFadBY7dWJNMoXFRqhG+y6IGd4dlmxxk1DzU5tuW84bWNU1TWrIZMll8XQQtGQ74eAOE6WONC+vRh7Ug/r0Fjr8omDO3G/xMyVbWWhRcb1XOf4nhjAlGgphi1QXe0fGi2gCCxghch6bMMXEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWIcoBIx; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWIcoBIx"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81dab89f286so112380b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681124; x=1771285924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN1daQ5iLRlqAIyAsqHkxCQ94Pqe3JMdIMMwyavXDUY=;
        b=mWIcoBIx7xRqW/b7wCqk5+tS1GdCi6co74A0ndx+czrAGT+ZS608jgt+WJHroUcM3F
         LLeTEsqQqXHPZlvbxwpftLQN3aCaca/qNiOJ3yAfNedxfJUrFtaX+QNaIb2jlrPi9PV8
         7gtpddLBsmGNdOj8oU+bDU2msED7KAHUni817XQQtgWVyqeBr0yCL/TVJL9V40dMicsQ
         IFn+pOXaHgGSjy/XX8BmAdahLcKm7r/jCbiwsytZ4edN3sergRZaWcfVwN/lzU0tRO6n
         3bokrTC6YUrnaT8QrSdhLlZTyh2EFSCgTmkL9dnlUotb+oXCYS9PdX8nphaTrddmcLzJ
         JFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681124; x=1771285924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kN1daQ5iLRlqAIyAsqHkxCQ94Pqe3JMdIMMwyavXDUY=;
        b=DoXxNxkO2TyiAnAXPKUALAkrov5aqKjznyuh7fpSZfIZQZpCniQTYxXd5K9kscJz/X
         6GLS/nxbfxXiCfHrJvLBEuEvrXRcPvGzB8mgZirD7AkDrjSLFprcxY7XanmanbL4G6km
         jLYhFfvDbhPlGi78gKR25JR7ovWAHiHioEEiVOPPXdpcbKISK3Y+qaJCPOwT3FcEweVW
         THH5Hj5Jew4y82K5asjbgK/bXwgK7JkO4WU8wM01iTf6BoxzF7lznIqMR4lhWWMdZOFa
         EjmtRjhYx6Iq2Rm4ZH31Hu9taqUx8IuwSmv1Ci1aikPlJw71GUDumQYFpmEDZk/LRLzC
         qPxQ==
X-Gm-Message-State: AOJu0YzMZNCHwsRYEHGnJmoFUIhF5D9cKJFz5+45aSlkXicuQqKSGLQE
	3Du7WauXk4wiCagP29jYSJNCXxSjB+jvM3URY3Xa7pJCI6jKxNBW9nkgjBdz8pciGnI=
X-Gm-Gg: AZuq6aJwpnGonBqHhj42f9vLVFXI8WlwoZrdj4a6mfEVFZ2Go4n5twbj07ECEjGa4D1
	0yn2jm/7w3lFSFqY/XXOKrtRjpjosh0lksHqqMcqMup+7b+jJ8kXKB/6T3eJ/qbrBV6ibviShSr
	e9XBVZ+ev3HCpzxPJ6LxXvaStSxdeU+xohB1DMpoZ0TUZyvLCZjGIx3q+i03lmXSMLezXnqK4Em
	SwWXYflTc2/y27T92/5kFWlkvWv6jbHCc8t3O1YsPg3GAgePQGBrsJLfH93pV1myioOlYA86wMS
	GfuI59gAP9XkRaYiWeeM0Pqj9Y/e3IwyHl+zaVrQffvmkI+zVC5/foSbbIGCMxujzf+evM/el8J
	DucD7PndgM42eeO5bdvHdslQ/RF8Hmqa/k1O9He4rEZrwVQjxzgFH2qkdN12TZ75PPYQIj8rJgq
	5eqiArTnC+aKZBI1e7U1coTA==
X-Received: by 2002:a05:6a21:9186:b0:38c:4371:23f8 with SMTP id adf61e73a8af0-393ad3b87afmr12989020637.67.1770681123936;
        Mon, 09 Feb 2026 15:52:03 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:52:03 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 1/7] staging: rtl8723bs: rtw_ap: remove unnecessary void * casts
Date: Tue, 10 Feb 2026 06:51:27 +0700
Message-ID: <20260209235133.1292161-2-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209235133.1292161-1-horstaufmental@gmail.com>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..7f09f44c7004 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 
 		psta->ieee8021x_blocked = false;
 
-		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
+		memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 		/* prepare for add_RATid */
 		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
@@ -546,7 +546,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 	/* todo: init other variables */
 
-	memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
+	memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 	/* add ratid */
 	/* add_RATid(padapter, psta);//move to ap_sta_info_defer_update() */
-- 
2.52.0

