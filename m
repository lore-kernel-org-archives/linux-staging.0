Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5E346A06
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364505; cv=none; b=E19IE1Oqzlb8axdCRCFaptkOmINmzY3m0dPBR840NWdhLcyUOBqMJowUfzrfL/IoAOmVVSV3mb9nKkwj5bmdATlnB1BrkgMIvvHuKRdWjdyIH+vcLR5tqVXfP9wq0AU8OAYPc7VaPl2kFD788G8vTq4Et7kxOw7yAoAC51MwnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364505; c=relaxed/simple;
	bh=XBKxTljzGZFtx2YywTEFt4lMu8OncG+MBi/NJbdEeCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4pQBD7wS9C36yGIsiqRYG2eoV8K/DO3AygVYFbyxX2rkwpe4JSWswdiF+Xjg7R02sv73OwPUsiZlNdj5oiPIMps990scLBUTosSX6VfDQJNSWZqe8cn9gxidJl7uQMoZYBl/FrEKgw+tUUGW3bYxVC2CPDzDriLdrk61c6WWnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkXYP4Q0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkXYP4Q0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4358fb60802so1172146f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364504; x=1770969304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEoSfs7upTKBg0KHe9lDqaj2XqomfLhTgvismBeskG4=;
        b=mkXYP4Q0DadJ2n66qBm+I91PmZCrg5zMd3grKzd7RbJtokDNX6rSZSdQHaqP+FEkQH
         Mtkvu9mF50qDedCkHKT0BHMB8feUw8S/sZ1lcA6yv77yty9jzW0j3PHmeN/4nkUMNNsm
         d+1ypm2ifyUuA5rohm5tyKMgxOYFbnJJCC+FMYfHx8o0WGTu4A5MleDwXak4mvqHOP3+
         9QFRiGii9w7Guz7foT/IKbxzsVEJBm4LMOL3+ySEYhOEoTL25NYIdCPk7A1JFgSpmtHX
         5HG9YsP6xFXyYhOItn7nYz0bMFGwXq3fstKQtEWnXcHC+6BEzOWFLt3ovVNtcbWl2Dfj
         8Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364504; x=1770969304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEoSfs7upTKBg0KHe9lDqaj2XqomfLhTgvismBeskG4=;
        b=VelMm62OiR7kY3AQa8vGJG94yyAhMyQ6q2EsnGMvXBdWNABLcXXRqnGTUjZgT8qH8i
         sEvAr4Yl5+idiXQQUpNHMYESrB+CYPOU7cuCmtgHtbEcTH22Fz6rolRtGhdrmRWN0X7O
         idIA7vbAHuFTaKfJ5Ipws4LQhfzV4BLZ/Ne5XyDhzFJFADaWquRIxL52SxpmcjrqxNr3
         DvgzD1M5z5e0U3FNw2yyGqevEAeL9FiMhpXtdxGa10FmwQmKLXmhb6rnw+0x8OMK3S00
         tn3r3jASTiJ86OUDry5HgvOkKX/38JaVztHri/ij9/MNUfQJJXQXrEu7d95N8YDf7vK7
         6dyA==
X-Forwarded-Encrypted: i=1; AJvYcCVDFWP8Smr+gy0vtjCu1PwNPiQEHJp4Uy/tXFBG3Av+jlUdCv1MML2gXp2NF0whz1j7D72RGAzrmIwGRtsl@lists.linux.dev
X-Gm-Message-State: AOJu0YzVTZ0+sM58KOEdq1O0PnhkqCHaZlm1N/ArmYV77Rd9sFfzFM7P
	nn1j+V9StskMzDRI9O36R9HjcQMm/a6VWm2E2y9UKVAQZF0ANsC9H1k=
X-Gm-Gg: AZuq6aKnd60zVV6I7d0OVSh6A+hOlAecXD/x82YwgFGH8BzlBI7X7UpWoDSQMesGUFF
	XaeW45qEAIQCNtYY53Ydw+4DSQSWSwfNqqWmxcirodHwJqKhzpOf2d0DLF05Zmc7tyDBqJDg5ni
	batmvZQWunUhOKn6UxRS6Reox2b6DQ3mlTj/47E4oHOdJioLavaylMAmlBQ0lOTon6/CJaIe8MU
	3EZmyt0wFmR+ga6OLld0U2tBXWEuZC+CCzKqKkTM+IcoLd3iJVJR4qwBMnO//hY4R0Ujqcdwyxe
	B1MV7YSMRH+ZJvVcL1Keh7FQKYpI2iPYENIVW9ayer+XD2CC29+Ox/EnNwwXM3ojVufOdFhUDGc
	3Vdnq7IvNZ0VgUMla/eyGas4eZow1HJ+WgrBO9Nwfbq08Izi0kBlLXNzhZPGpb5Fyw+Uao3NX/x
	Squ9FSYd3ceqHChj5z9I5zI/uOdDC0nGEVsQS+6fjdTPINWHFR2qJwwt4Jzcm7uZwWSavBu6h6p
	A==
X-Received: by 2002:a05:6000:26cb:b0:430:fdc8:8bd6 with SMTP id ffacd0b85a97d-4362934ac2bmr2859031f8f.31.1770364503648;
        Thu, 05 Feb 2026 23:55:03 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:03 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 04/26] staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
Date: Fri,  6 Feb 2026 08:54:17 +0100
Message-ID: <20260206075439.103287-5-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Replace the manual hex-printing loop with the standard kernel '%*ph'
format string. This simplifies the code and uses modern logging
practices.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0b82b1f2f1ec..d46f5025a0a5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2071,7 +2071,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
 	uint	len;
-	u8 *buff, *p, i;
+	u8 *buff, *p;
 	union iwreq_data wrqu;
 
 	buff = NULL;
@@ -2087,8 +2087,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		len = sec_ie[1] + 2;
 		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
 
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
 
 		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
 
-- 
2.52.0

