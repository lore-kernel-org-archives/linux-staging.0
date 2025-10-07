Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD42D7D47
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828415; cv=none; b=cWJXML1FH4b/W3JlKAAxm1o33z57OQfIM0ryO4lxAPacg+DtJSrpOSJyk9hBTwMNxTEr1AjhKex6Uo27/y2PqAoLPB/f7+FJIefAmCOlIuNuKretJTBcoQilJCluLNP2mcWKqvsAHeg52llb4sNTaiUFfF0aqm+8R+Sde92y2b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828415; c=relaxed/simple;
	bh=jkbLiLfCNgRMGiwrFTu8kZjFsk0J7OXvqhTO3tO5NXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tF/q8sv3/lco9tuzcQ/OuiplCc+0hba/2y6t6P4t4JQtdC64ZemCkK9zSZUHfNMhhWgElEyzcAefAf1+R5DcnE+ivQBcJebkMvlCSg8cqiNhHo5iGvbnQeqOlCrFtZ+gUsP04TBR78Ka5tNfX3pSj+wyZF+mgswtT1nko/wXMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTMnlmRL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTMnlmRL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781010ff051so4202939b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 02:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828413; x=1760433213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN9CCg/2ynTipVBwKKdllYQe5GOyUI4/kg2R9VILyuQ=;
        b=ZTMnlmRLOP07kJ0EKHm9ATvWNA0MiVGvI50MdYbUa3I4K+6NZJrxZxDSJFA1GY6PZp
         poZD0Ta0eq5Ub0WCxLSLqPKUZqW6npVLn0v1UkjAF86kYYEtuuYFdFRaLPiEtl2gMn9t
         he7AzlQRB4BVZTl4CfTwhC7Qrw/k9eMxllbQpwaA33M9dDAnyrnARHgUKq/gt1HfrZz8
         cLEMxwFqd+M70w5qsjv9DCqsOMpsPGpWHcis23KKd56D9BuXMRCF7aQtYo3ctIHqdo7R
         78UJhp0DdXAzRJJcByrvNYo4zkyJLkiltgZitxWEk4wW7VJ6Mye0gxqIWRSh2aTROuC/
         Zjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828413; x=1760433213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN9CCg/2ynTipVBwKKdllYQe5GOyUI4/kg2R9VILyuQ=;
        b=hRkjnwfYwBoQx4RoxiqlApsgiyDUVYtF+RyCUl1mev8sameAp/MAxc9l4Fixg/vgfF
         zU8/6JaGbLSx9rTy5npex7rWJX8hbpuUd0MFlqyZZfKLR0YityaULZFBIBpYMWZ8aUH6
         fCBox+eK3z5vDJZfZHjaMNjTTJPOV3FIA1kKc3M05cU5MWOeACJpVnAnKcVRxMK9xe1g
         n+KIgOCJ2laXL7zO74BRpwZAnDrg76LUdEML7Mpa3j5qp/HocTHGHZIjuJsht7MqmPpn
         7QuJMCCY+c0DY4S4kZI6ufAQ7q8HOSFqNdwm4yDfentLyHOD8oJj8BHKtvZNfdfob+3Q
         zaPw==
X-Gm-Message-State: AOJu0YwRx0ge86ZSyQfVrAE3uc3WjOly/7YUVpUdQa2amB0jM10Uyf0x
	5bVmGuPUUDqz9/MdMjz7CTMaegjChP3gLam5XKzab+BcaaBeD+mfPBWORA/xPHDw4N0=
X-Gm-Gg: ASbGncuISiZpiXtXD2CSNRzX8LwigHEfgiJpf+u9I9ndAHj39yFMCbVrs6SvO51I08D
	eD8315HebD41llczhiunMXJgUsmmGydHM6w6843RMc++5WyDrCq7THosXDSUHV9PhQOnU/KnnWe
	6t1dixz3ZUPzDzYJaXLUJAtmWZWxLFK7kmvGK16te7ry2eNNugm0dpf+lByVGf3tuIpRNpEIJ07
	PnVzmuSsTXEWsu2cnGg25FWcVKkEhB6x1EstOmxi94QyQSadZCa+YfdThNWBW7+GVakTSr4UW+G
	vcy+M6Eh66VYZkRcyECSLdzgDAT+EV+ygqE/Mps1CrIsDg5NKCWXUZqbNPjrVua/FPvMlmYA2N0
	xPjWGR8o4PaKK9xojj23q3Aqn3oIdDcfrEEaCcVOVOkR7Bz+n9BzKp6kRnUaL
X-Google-Smtp-Source: AGHT+IEHlg7XaEwUGl2bAIFdJghjQoeR94dkaA/3M66hMtX76UtmSW2eUuCc7yY318TwiP+ey2zt6g==
X-Received: by 2002:a05:6a00:2d12:b0:781:f0a9:a38 with SMTP id d2e1a72fcca58-78c98cc2757mr19962809b3a.24.1759828413431;
        Tue, 07 Oct 2025 02:13:33 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cda9sm14941784b3a.13.2025.10.07.02.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:13:33 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH v3 3/6] staging: rtl8723bs: remove dead code in rtw_ap.c
Date: Tue,  7 Oct 2025 05:13:00 -0400
Message-ID: <20251007091303.491115-3-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251007091303.491115-1-trohan2000@gmail.com>
References: <20251007091303.491115-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes a commented-out assignment to
psta->dot118021XPrivacy in rtw_ap.c. The comment indicates
that the statement is no longer needed, so keeping it adds
no value.

Removing this line (and the superfluous blank line that
remained with it) improves code readability and matches
kernel coding style.

This is a cleanup only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
v3: move dead code removal into a separate patch
v2: previously only realigned the commented-out line
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4bfae77a5fa4..2faa1e14a039 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -391,8 +391,6 @@ void update_bmc_sta(struct adapter *padapter)
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
-
 		/* prepare for add_RATid */
 		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-- 
2.50.1

