Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57370217723
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775300617; cv=none; b=qpXFfPb5IFhCpmzAVxzpc4UtLo4szEkHXnD5jLjkzxvHvypiaZ0A3IaZCl9r7M2H6Gmlv6jf3KOPyqrGalKtE/9rPKWUseyA+NZLUl5qoM7PfsC7CrNCVuYYhbTIMvgibCm3RIWf/zTXUFMipO/yRrS+ALrhQBMhRyK4AahJGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775300617; c=relaxed/simple;
	bh=lAxLKAF7sQawOFWszIQqP5WUotrV/nUvj4PpXDiilZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FSY+Tbr3epwijg0KXUuKqNzYu2Lpu+TeK40MCntLE4zMvkqT/d63f+HK7T+Z4qL93GVpiG2ucneSM8NOVJ/zTUTACeO2RKFP78eL/RnZQUQPGlUuWOqqLaDuZu1tMatoJ0luThi9F7kq5LIRIP8pAWumLpDNPFAd9R/szFFXV5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmL1lvjy; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmL1lvjy"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-128b9b7e3edso2131563c88.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 04:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775300615; x=1775905415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OQlU+SyAVGEEgwonsiMySQsTaT9Dre0Hz4ZZLCkamM=;
        b=YmL1lvjygiCLMJ7oZ2CXUplxsypxY4B0sHfiPOXG9JbEWbfXfWqK4GZbhQxoXgOpHn
         2aRkTcYIRpfOuP6tguxBNxY+I76za93f6FDLJYsO7VQI2N+M0LQ8Vki2aJUt+I1Ot3S8
         F6qQZWdBPr4WyGNNqD5nfsQ1RhKVygFWJjnfZxYFcZuienin4Sg3tbxjgo2US9l0CApd
         kknVbZyOUhIMPNr3Dr04j+D375NUBsYqFSebFrvB99CMRozZrtVugER9JzJI/Nq+PoXr
         H69f2ge+jMn8vwvaZyowl9brRtl+p7ftWdbU7/UvsUBtC8sDRw4gf2G2t+pqmSWg36Wh
         D56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775300615; x=1775905415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OQlU+SyAVGEEgwonsiMySQsTaT9Dre0Hz4ZZLCkamM=;
        b=A3uFSMLrnRHtJsaLHzls1ddx0ejlHIA+0rp+Ybp8odwJbWk08dbHM74mKMOHmLuQsP
         qvKiBF2avhgX0ZTsgQHKi7TLOQ05KvkVU6Y82tPWI2lIFmthTiK3wxGcx5UFzWEsxeTh
         XfXXbWqGKmPlliJeC6y01XShpIBdZg12sSo5T0oNt5rVkVoeY4czOq9wnJQCv5xBGXZ1
         g1mAPERENK2KhVVZv5J0r2IqKiOp/U0jj7PzCtlCD9aNtIjELUECpgfZPrHqCToA2Mmm
         +Hs4GuzpscexKgGeBs0l6e9Lbhkd/TGORCNqBOLVgEruB6LNfwfuBaNb6sgfApiJ6/VQ
         9UMw==
X-Forwarded-Encrypted: i=1; AJvYcCU5rpIrMD70AyESuuorcY/1fJSGkZDRN1h1gIG3Pg0iCEG88Px1Yl2kC8TLp1eQ0n+V8vnMshV1NrjOGwhG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8L0+RqyhJ2WAd4QpD0wmnP0Xr/lWAjw71TpQ3ZeHA3u8oMJRl
	R7NozqApJqAq+581NPFyG1LJryd1vWWZG+OjI9UhBDTgQfAZm5iQx9JM
X-Gm-Gg: AeBDietNaUDS53beRL0wQALOQ2HRo6rGYTfL8Zk171xwJQ7Z7Wrdv0dKUJH3+rs/uKy
	dqzeqEmzglm2KlbwEQUnL+AJpYPxApmQ6r/kfLNJqDRsCSGYei6hO+mI+a9S7fwr5Sz2EG1eodR
	i1jB0rnjP8x9atiWKlGTLwBm7GQDyXGLMnr16wAgZvUq2dCEjtbXNN9A2EA9iNz7kHWEsCUtesn
	xSYHwH/M5nwUGlwaiyEGhPHuS7YxST9JP81gIhyI0QkalIr73znRpYzJylmWn+DgPzDaUSHna2B
	I64T86Ckc5S21LYm6Usx6iQY0siVC3XHrmdu5AeeFQ2TrMxRFZKzeOxEwnJkWmV8xUBV1Xdyyxu
	0qGrqSS+J3qfg++VviCVoLFOBYjLxvqw5V9ge4/x/GJ0qqLYXbjdANSi4IQOxLV/KAvQ25+I1WR
	47EwyzEPbVIMo2XD+XcJmOggxAaFEHn22ySUmtXXHoersiVBNI2FxkD+E=
X-Received: by 2002:a05:7022:41a3:b0:12b:f881:d8fb with SMTP id a92af1059eb24-12bfb6ec86fmr3045099c88.3.1775300615293;
        Sat, 04 Apr 2026 04:03:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm9601753c88.10.2026.04.04.04.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 04:03:33 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant return in report_join_res()
Date: Sat,  4 Apr 2026 11:03:11 +0000
Message-Id: <20260404110311.10917-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return statement at the end of this void function is redundant
and can be removed.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81efb..dad1d95bc325 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4508,9 +4508,6 @@ void report_join_res(struct adapter *padapter, int res)
 
 
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
-
-	return;
-
 }
 
 void report_wmm_edca_update(struct adapter *padapter)
-- 
2.34.1

