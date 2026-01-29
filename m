Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2D21DFDE
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710570; cv=none; b=neB1TuQusDceC34SxDpwN5zh78A81GNbgWzfXz1L/yjEiZgNeyCmW+ixv4HiV5C67vZ7RzPc2aeIysQTa56k2twBRRNVoIsvDYw48VgzWPq3F4vbT7vNSCSSFdEiQTwHqUS5FJNEta5/SJdZVuR4efDGZ1zNh9Pefa4CBNOGVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710570; c=relaxed/simple;
	bh=anusSg+ei2G8pY99kSNGBiFGkxTuVaDv4F/ejqaSEKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjCB4fbFtMdjuGywNrhGJ7aopt5fon+IGfm/dH6YJg8hxpVoGQTsmvSVL4kV+HzacpK1abuf8ywxLBZuDvhlwLTYNSv1KoMrES0g+0jDEVPZKwKfjRw7n+TYv7693vbz5aPyT+fFtBztKMDUVxzlw3NwzP7JSxTx78cfPuRezTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7Tg9chM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Tg9chM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so17310345e9.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 10:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769710567; x=1770315367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkmQJfRqTQzrHHgjjnSwxvqZrCWnUDQPc30Wk1HVPk4=;
        b=E7Tg9chM0CA2UkJa+PVd9VM7gIG4j39QG5Iafh8ITO8wAHpwop2PdPF+GSqfHrPRa4
         YVC+Fg0bG1AWDQHJzcUtshGRZ+7PviTEVlAGoQSanJuOxfPnouYyNEmjT2KyfFqaiGE3
         p+uVI9FKuMKGSYp5l23yCMH0fHu2CP6ZpSpMl7VdHmyG6xoOOD0uA48i7CBUnk3Ay8O4
         2VY2Gu4y6zSR4Kz8LG/cvHC3mOOLSwHdlBdyUtmMEvFKAv8yVSj2DrRx95uEPrXMkAWU
         ij0m1czyZxx3yrLN2I78TFLO0gUjZgaaTT0E6Sr3oJ9nRgvbAjBZW5gsSYCzUvkwAQQy
         VuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710567; x=1770315367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YkmQJfRqTQzrHHgjjnSwxvqZrCWnUDQPc30Wk1HVPk4=;
        b=HweNvZlYkKs+4dCus3DEO+FGRV5TVESE24LlI+lV0GPxKISdO/ciyHttaUgN868h/u
         eXA3frbKlTO5vRZbt9nsje9GEC7q/Wgw/UNIcNA4l5NeOGKIfswTkdUwMiBywaQI6p+x
         BxbKj01A+ke6Gi6Td50QiVQp6wA+3By8N2v4NACQGqPqWTv8TmAZFNRN78jQesge58Ti
         3jAAPXY0W9VV3ux5PBMh5/zAXZWBxyHXb2G9bxJUIgliBc9UO557fEO6DUKo9wL3DJ7i
         OzQEJ0mVlC0FmNrVSvjwoln0obyAmTOAhXfNpHIhKY3jPAoie3t6sGRTYrDmpoOn0bLy
         /I8A==
X-Forwarded-Encrypted: i=1; AJvYcCVautms5SrpzcnOkPPgBn5gd+p2rZ/cF7vjAljX8LaGTcnFEnFfcMTVtyOpG70W4A4imPPRwKYMREaXFsZy@lists.linux.dev
X-Gm-Message-State: AOJu0YyEUz1DKfSzCxUggLQSnRu+9/vGRJLmc8rxIK6OdmZKSdjLNdQW
	L7HP5v69fyxEh8R5gQOResqJrZfMOkjic4jfEu4jBkGvb+CNiwK2oZQ=
X-Gm-Gg: AZuq6aJ473Ev50rO2xdSfShgcc8bC0cNJYdoBDBn+bA25SvmkC5CTudk7ij7wjuXcZW
	FBHbF65SyUJ6m7boJVHXRLtTTws0SUfyG8cThBA3VEwPCP3N8N25bLJfcqTOUOH0ie6WmjhXuCO
	OleznP59wNPub7fyuT8Hc1kwYgq3iOp/MA40so35eH7AU5Kt3xCtVqQqPTlhMVgu62+PXXV9yZG
	2pUbTdWmcZB1qTk5d18S2mcD9+Xl+d+D4mqME/SVRQQ96TiDpiCed8F8vJSRUrXLH2svPV11Vtf
	MDRgBrthSiMzZAe6tropYuaz1E+xcf+OFuNuLQyidLKUWDGZKE/ESlZ1hTXhYDJZd709cRPdkgk
	qxoMQuZjHEk5B0ePVNY7UB1ePm1tR20Uhg3Q3PTDMohVsIXmdbElplzn1ikLpIJCSDchBSjnA7z
	xu
X-Received: by 2002:a05:600c:4443:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-482db4a1030mr491635e9.32.1769710567195;
        Thu, 29 Jan 2026 10:16:07 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm136578725e9.8.2026.01.29.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:16:06 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/5] staging: rtl8723bs: fix potential out-of-bounds read in rtw_restruct_wmm_ie
Date: Thu, 29 Jan 2026 19:15:37 +0100
Message-ID: <20260129181541.72066-2-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129181541.72066-1-lukagejak5@gmail.com>
References: <20260129181541.72066-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code checks 'i + 5 < in_len' at the end of
the if statement.
However, it accesses 'in_ie[i + 5]' before that check,
which can lead to an out-of-bounds read.

Move the length check to the beginning of the conditional
to ensure the index is within bounds before accessing the array.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Cc: stable@vger.kernel.org

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..7dfc2678924e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2000,7 +2000,10 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
+		if (i + 5 < in_len &&
+		    in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 &&
+		    in_ie[i + 3] == 0x50 && in_ie[i + 4] == 0xF2 &&
+		    in_ie[i + 5] == 0x02) {
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
-- 
2.52.0

