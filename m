Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF54385EDC
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769799456; cv=none; b=mppVCGErCnC6rSczoGRUrlV7GuwbBzDueYpGYHJ7PqSbAqwf4Cb9+Tgk31Owatfy3KrlA6nRbQ7FYiTRggMGyRpy/ZEqg4D9sduOVJ4qRZjrkm1KIzno00JcW2rGZzAcZ0RlB+PTHdu1TkVSeBYesgRANfzdyjTwS10TRTQ37r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769799456; c=relaxed/simple;
	bh=54jF80axLN2UJAh0SY0zu8J2BqHK+0mKcS7a+qODr54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkp3NgcloW8Bbt19dwBdRzC7GYX9CGZx6pQBjA02/xYj6GS3bIj/IvbL7MopKIFgvJmDg22+ivIlfbKzYMoN/Az1aYBQ7HLwXrCWb9nX9aFh6CcRk8Xhl25Lt8Qgd22ckqOO2xviAN1T+pbP2yv8l+RdYAvTQ1ebAUCpxjvZ8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beHu3VxK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beHu3VxK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1369987f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769799453; x=1770404253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2f4MfuhNu/cLjFrGUoAiSMm/1GSuujiaDwedPKXZAI=;
        b=beHu3VxKkCjIprQv5n3tO76d+znSRM5+TMH9pfu5LFI9gq/JMuSJOX23uNdXPpWTqA
         lYoBVt97MvyAHabSdx9FkVxHoUEdwj0Nlk6fZdI0Twt0NbU+aadvnlI021fhtTXdQrWJ
         RcSYdJrnCcR2rvFqMTgihvBYMhlGMFJTf2tjO8272IrhIJLx2yd3whHJfC7986CO02C9
         sVuG1FDHXsUCiw4gCW92zFE3Mxx43E+jcMgURPlLdelj6YmopcZZTAf0tU0cCFaXAwDa
         pnQxxA3xVbZbO08Sh92ThBMD3DCY0hhY0u8knAtG/A13MdfP6ajXQDEmcxZYZ9/PEzrG
         COxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769799453; x=1770404253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2f4MfuhNu/cLjFrGUoAiSMm/1GSuujiaDwedPKXZAI=;
        b=AiJrH01kiu/R+5OOZlgsndtQ+I6zUWmYn2Yd0LiX4AgCEaegq/END68ZwBFxEuG1jU
         iJToZruLERcChYdQX/ffCC0oyX4UUa3njDJPKIdWAGRB1nzo26d76jFaP8V31ZiFP3Pw
         rgpraXTSeAiCL2Ezj1zuHFV0eHGsmEGz0TiXuhvQhXH7TFgJUE0zK/+J5fO38gs+iAmC
         cZ7cEf05ztFeaJKLMXIXgOwm3ER5RStERRnZmrwL3vbe8qhdYRZDOUlC+vCQmCF5k6EG
         tHmapb0nArXpWM1g4n8iTveOFgBSvORaHN91v//uveWxv7DRw8+AtT2vjLncqEY5tNmH
         Symg==
X-Forwarded-Encrypted: i=1; AJvYcCVDyLCq/e5Lh4GSmbGh/KsnvMLkvRqiZRrBlSyoRxBmP5witIfJgDj8xwgaTAMoHlfYBNJVhCiphp0cW+SK@lists.linux.dev
X-Gm-Message-State: AOJu0YwRMMdSvaM0X0iu16WNl0jhwI4uUk5O4QLv03+Lt5JL6EvJJHAQ
	/ZhpFDa/+s+4a/KvkUF6yKUPJ2HZGrKxJL/hFIDPp2JNR0wnXWFPHNY=
X-Gm-Gg: AZuq6aJyrw1+JGgkhiOY2cixP1p2rmGgZMBITcz+ICBFope5dZBeVUzgWq6B4jDBpEk
	Kl1oy9s9A9anj8wVn/RR7PS9rv9jbu26qdyLcdIlWpk8rrUL5SgquLqR0vm6ySLR1ypkeGSf2zG
	G6H0cT5h/t/V53O25iA4iRWBVmHo139kKVPteg5H3GpsUqBfLbzuXpg74eRG+pxnM7ajR5Qpn4R
	3yk06jnjRL09eE9DM8ZegmAS9I8rBqCeKLeHJ3dCXoGnoetL1fjnLLETaLAd75zZcVZMNW5t24f
	Urc68wd/JCZe0+cWX7OxRMCRMRrVDohz1Wm++LKJtfxqH2acYaaWd1I1ZF92UHhsFVwpXa2d7cf
	ur8wh6HcV3TRvAnDVzacJztMQQw+0CkJibIqhumT3zhiWF7coooaCHlzTD1A5wrWQJJbA2/4+Gq
	OW0n2c45dmrIqRbZjSSH5VX86aHvLpf13RPV8IplYs1b1l7+hub/ySQLVabuR4vA==
X-Received: by 2002:a05:6000:420d:b0:435:960c:5286 with SMTP id ffacd0b85a97d-435f3aba816mr6032365f8f.58.1769799452718;
        Fri, 30 Jan 2026 10:57:32 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm26474164f8f.13.2026.01.30.10.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:57:32 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v6 1/5] staging: rtl8723bs: fix potential out-of-bounds read in  rtw_restruct_wmm_ie
Date: Fri, 30 Jan 2026 19:56:54 +0100
Message-ID: <20260130185658.207785-2-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130185658.207785-1-lukagejak5@gmail.com>
References: <20260130185658.207785-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code checks 'i + 5 < in_len' at the end of the if statement.
However, it accesses 'in_ie[i + 5]' before that check, which can lead
to an out-of-bounds read. Move the length check to the beginning of the
conditional to ensure the index is within bounds before accessing the
array.

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

