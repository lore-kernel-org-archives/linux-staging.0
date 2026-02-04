Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D63D7D99
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770212692; cv=none; b=DBBd/piZaDtWw+OqhyXaIwyMFd1f3RU5LsnoKYBfgN94hcNTl/j9nmegDbNPn76ui0pJLZDD8Am9yt09tp61o0P2/GuYnIQTiA5Lk22wBlWbMsAtekkebdHpvdR0ROtPEWqQYuCWno5+wA5wqsd6aWDjXtpDQx/3qGYMt5ep2E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770212692; c=relaxed/simple;
	bh=4JehHTCuZAIbT7LWvKuP72oBUui9rsqkEJczgki2JYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OhbvhhO44i6F1iHwHNKifn+3rnT+IH2G+QRVP6yz3LD2utRrtz2/U2jBY9XWKiazSnAgvbyHHsjd+Okjr0jy8JBSgzkrMH/glZ8oF0Yi4qNZxdZRSlBWTyZKtIPR6q/UAY+zflTiLHWoKHUZpLg5hkPvDcfS0vf+Jsvh8GKV2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuhfUMAv; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuhfUMAv"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso1185294a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 05:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770212691; x=1770817491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HhzkWdnHNQffW1PNajNjUCWybjdDyLCNfJVsmBqSb3U=;
        b=AuhfUMAvvDz2i5VDs9fc7Ph6Ul7VZvKudFxdVqlv3SFQGIpD31hGz+qaHv9sKj4aqG
         VS1KLQZVDrM9fm48HRbzV8CuVrPuvIu/0SiqDNXoKGOr8ai86sHS8DKnz/32MpFf3vf8
         3Ofimd6Z6UAuBVoZ/u/fjAe6tEvHkIm05ksA/m7M02i7DVmRyqZmqFgHnKdbyq8MtwFN
         Q6DsBOOgIwm3AiWKNJTWmziDi4bO5JcCcFnc9ARIZBOuwT9FCh9jETvmxiFnUMOOH3Jl
         uxAWSNwN2T9QaYt+Kr6ydNzJv6al9pC6eBMSUpWAsJIgzkJV2xpjm1mxyoIByh60Fafn
         BMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212691; x=1770817491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhzkWdnHNQffW1PNajNjUCWybjdDyLCNfJVsmBqSb3U=;
        b=g6VAZDPIUtvlpIdywZVci6FUSUAUun8KCv5gSo7PpxdAzZDxJTXxU4TPLPbCXpqnXL
         Fhn0gSL3gRIUwe2CwBDB00/nMoF738zW9vyTJd0j2Gt4I8LSPcmRiJefHXii5ZaxDsep
         HSQNx4mdz7qMKFQa/JfWLxyQjdPx/5O2BmxRj049y82ArJgNY88FErZ/vr3cfWuLd07b
         jOPEkZ+PRvAHAZfA7ySNnVhZqPko6uiS7HbtQ1a4LKUginAKHUKE9+IUrVlCjyea2w1f
         AjNhsxjld9+C5ISvryviLzLTMd9hvWpeIYwYtHvAgfccmKJsYoYrWyfV9DShSflmZEFl
         20lg==
X-Gm-Message-State: AOJu0YxETa36QWhZ/YvVvUBgOOPpVb7eRvcqOHubBjfxoQ0zAWiNZlGr
	ZTT6W7PUjdTmLbUH26rtdCEj5yp2wbRW3BB9TP2cewZuESJQvOM+yCi1
X-Gm-Gg: AZuq6aJ5x/8STPOBGVsVmhGxn9SVEwJkjsrXlsQNNdpHrhk0fKrxbOopGkRBqHrzxGl
	BbWQ/k5mVL8nfFKPGc+2X2Mi2DshQCTmOMCO0Xvs9L2KXIBH6gdIgGHRGGloMW5blU4jeWNenSX
	wdLyfTg8x2imEZLdmtN84NEfE+G66NPnlCsrcVm3pIiRAs4sBQWI2OGb51fEJ7Ww4t7JZxLVvtW
	dm5ggXeWNqV/GqvnnxEjKR19sHTdVOqpFWZeR84sPsrw5eUQqmexzJipdNOZtpq+bkjQBotbpwa
	2jAk8Wu6VH0kkmqCAMrpu2UubVZlFb3UG+aCQLfeR5skmgqEkBa9Xi5WTR8a9obU1Z6ELnP5pa1
	8a+hJCleIRQ4a8GZcpeW8daww4yF4tzKeqzCagHuSWaBjNx0frLJZ8xXsvXMo1++mauJJN7prBi
	1GoIzeq68EKgaG8aCved17VFYdkA==
X-Received: by 2002:a05:6402:2688:b0:64b:6330:2fee with SMTP id 4fb4d7f45d1cf-65949cc229cmr1906848a12.11.1770212690392;
        Wed, 04 Feb 2026 05:44:50 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a228ebdsm1276005a12.26.2026.02.04.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:44:49 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_cmd.c
Date: Wed,  4 Feb 2026 14:44:47 +0100
Message-ID: <20260204134447.138362-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl issued a warning about msleep(10) not being at least 20ms.
However, 10ms might not be precise enough.

usleep_range(10000, 11000) is a better choice.
It allows for a little flexibility in scheduling.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b55..97c923015 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.52.0

