Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E337FF51
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711010; cv=none; b=Pl+Vyk9Dppt8Y2OSJygCV9SooXgawNoCDLw1Oe5ajGBU1lo5IPHGhW1LkSr1RYuG/AsM9/lPfYehOwWfqgRLKzgr13uFvnIcBZ8tJZOifIPEnM7G8DKGgS9O8anFecW1CQbVjI0BWSqQeCvj5AY4hR38CuwIbnoZwGADctQyzQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711010; c=relaxed/simple;
	bh=qzgmZe+LmaBEuMkiqXJNZBNnBvgkNz4aKD0vXg0dju8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BKwCDkiuUbjDC71Wr3SQLNJm+Xis8EAX4rWc9ahZGurEz9xAJX2qn/aMhcO9q3R9yngGESEYZk5/5cMR3djA/M4Ky3spxiejlDj5hx/XMmDkovlfvElBAwvZR6YgD7+l3QfR9B4a+oVocmzslso/cSSAR4v2pD46414XmOaqgFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0wCF0SO; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0wCF0SO"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393a44854d2so84429541fa.3
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779711007; x=1780315807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKAd9dCFZuagB8XRhHR53n8+oImQ4DU+94Ogyi/l3HE=;
        b=K0wCF0SOBr0hvT1/4e+S80aGSQS3zsou8cipXxsY8t/hZHA4mcbYVj3JjBXxaqQDjF
         BL5W64duzHjJC8Vq/xiqKryho6SjFlE93yl3wCFrzctsvFaSUtGSPVT88YfS9TAa2nFN
         D8b7hmKgHoQrs9sxLJr3+gJ/UpZ9Q31ba6giYgCZmbwAZLFm/rvDM3OIblX1/X35iiNV
         ztF7GdxpW/i9X4sb5KRRdWugghoWAYkIapJ1eTWomPFxiDWkmCk4MtNo1xSLQqpFJxrS
         i7W9tmORwpWAOKjIm4/3IX6ApeaQkxU7Ilok4opOPD/aJ7bWSmq8SJHmHbrteEa4ukFy
         EUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711007; x=1780315807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKAd9dCFZuagB8XRhHR53n8+oImQ4DU+94Ogyi/l3HE=;
        b=Y8njgXg/7mdZRRbuoVucPI3SZopYd3TBuWfZzQz6rBdZhgnIODJJzKie0u3EVXmDZ0
         A7l0dftqKrWO/cKjBhrer2YLHjNK+Pgb/uJS2cYfymynD0roppSKyW96N9GPdZSsCub4
         rCFFjFIwhT269MjBONfgAYEWL0sR3/CPFvGdDYMsJ8I7U2bJibeBIiO5pGmg9aohmX69
         b5B1K/EWGqeEdNz3tl9j2KYl/JsMYKHYWyhnBrhGcBvZbuWSKbySdxdENHjboL47kyg1
         +8lAAwzqLBSNqFMdMpdLer78u1qAji8nECSkJzoa72qE6D3kWFb+Oiy5NHJq67fZWy6K
         0Tow==
X-Forwarded-Encrypted: i=1; AFNElJ9HhqaErZF8MwdqR9k5q2IPSnep7nXI+xmEHDc3u3O2QXWhTFFHTrbk3FD1Q5YlPLY8ch7wJKUxx4jsjIqy@lists.linux.dev
X-Gm-Message-State: AOJu0YwdpfxQ0TlaM+CSEoseXPoPrQQfCD5dq8iwbALM5d6a/w1h210A
	i1SUiij/1QM+sr6VGIroK9UzRDGUOmclcEfBAzNej+YOXajQ1aOf3CaZ
X-Gm-Gg: Acq92OEceokAlHaVZfqHnq+WjnGD8T/PFm0JoFyNYAbcksrbbDVzvJO4nnC7QRcrux7
	1XAB8x7VWWKKFIjttX+aHxj4G9gDxQqq4mXU6aIQCbDXb+TlqoQRLIq9V+mPQxewXKSUYa+w9+M
	kEhpt12Y6lIbBsac16wTnBVfd6p04mjWoFTp06CG501xQhpJuniotedkSKho7s9tMYp01B0D88l
	XqG4RQeTWDasD0UWVHbR4WA4HzRy//QMmcZ4TCJM3gUcs9c0Du0Pg+LlmIEO3+r1/E3JWXdQtW7
	TRWae7UPBrsqhy9ySLedwYauOT8owp8sgqZvC5qgbUfjLBZ4Nppmje93+22EdiK8OcHgPDwv/sl
	kL8x+TuJ1MDuC/q8w0YUmtfXrWfve+B+q0UnYhJr8VszbSbs2PEL/cQYMzOIfX72SM99UK95L6K
	xUAf89a7rtyyztNeCgHoSYf5xYeGwmFORPc90AmGFNQXetNs9U49qBiHrZH7ge7CdILAeSBsb1y
	Q==
X-Received: by 2002:a2e:9b09:0:b0:38c:63df:82a2 with SMTP id 38308e7fff4ca-395d8d6eeb6mr29695401fa.27.1779711006758;
        Mon, 25 May 2026 05:10:06 -0700 (PDT)
Received: from g.lan (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc09e45sm23408981fa.24.2026.05.25.05.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:10:06 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove empty loop and stale comment in HalPhyRf.c
Date: Mon, 25 May 2026 15:10:02 +0300
Message-Id: <20260525121004.4989-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ahPw0yB7Ax3lfhKu@stanley.mountain>
References: <ahPw0yB7Ax3lfhKu@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'for' loop in ODM_TXPowerTrackingCallback_ThermalMeter performs no
operations and just iterates over the path count. This is unnecessary code.
Also, remove the associated "Print Swing base & current" comment, as
it no longer refers to any active code.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a..f67b8d70b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -234,10 +234,6 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
 	}
 
-	/* Print Swing base & current */
-	for (p = RF_PATH_A; p < c.RfPathCount; p++) {
-	}
-
 	if (
 		(pDM_Odm->RFCalibrateInfo.PowerIndexOffset[RF_PATH_A] != 0 ||
 		 pDM_Odm->RFCalibrateInfo.PowerIndexOffset[RF_PATH_B] != 0) &&
-- 
2.34.1

