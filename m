Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82F1A5B80
	for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189766; cv=none; b=PtXVCywsECztJYkWjqa5vEiusb/2kxDfpP071JzZ0iIwC/4I/PPabpDU55g244Ugi9+g3edjMxY+HQSip4q/dg0x3DT8FgDwC5lpKPyCZOi8EVqyglmnOzrqDVKgjC6wg2cPD76d/mWtPgo2428Q+jwUn/pL0Hjtvy+rvRnmaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189766; c=relaxed/simple;
	bh=F/7W3Ji5wIGnVHt8kCsM4GPtFrsjZvbfdVUG9QY1Gfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8yshyiCg97uzxsrY43l7AxKmMgq1+7MXk0nwviPVK3h+gkfna8E8YRDkfwoZSAVffFSPn6PhI9Y3sCJc3MhJBW/qxKKfikPTdVC6dY39KZ2GmLYIUg71C3sHAzT8Y574Y/p09DZMA4E6eWctlXn7pUAEio4H4y2xyrgYQrVqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAsO4hHE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAsO4hHE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393f6a2c1bso6278805e9.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739189761; x=1739794561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAXwPLt1kFbd7E0TfRGbt8eT4WvsRFZwEWl1hPo7ppA=;
        b=gAsO4hHEySvjAv7yQbV3DEsRQFfvgv6+s30etjLA/4b+8phfncfOctR1HYRQBSYEod
         C0I60hO0xrYJs0RFTDhc3wbpVwQqSqOn/YLhzmlkvC0MPl32Z7U8YkigUksGRGeFZtZI
         jo1X2vfdMWPsVs1Y+8FY4bt56C2DawImOlPiJwH12qD1cgfRP828mcB5UiWhL3ZSq4Bq
         cl/d4rUYUGjnoDcNS1y8lNNTYNJh2KtNy+FBsIeZOoGj+Ogj3qfV7DXlRebhF3RjAf47
         zXu7WKwtg8dvUT7Ez9E+p5uf2xtAKCyB50brBV8jR5pOxq+CVcGB8E3MZDQaoVaw/S3c
         f9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739189761; x=1739794561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAXwPLt1kFbd7E0TfRGbt8eT4WvsRFZwEWl1hPo7ppA=;
        b=dLqeV2pVPI2jIfo6kIAzmvhuVraLEI3nrH5EFixcEU8XciPiUxT8wi6dt2+v/lEN3u
         qMpLV/62/IkX/dg/Ic8Xba3fzaIgxEovRMjowPHsIhEkwVIrNLZEDWJf+oPXWmJPVLSY
         FBIiivgqrS0Dm7U04sOBF384PtHMQ80ii3fCZPvEvNhTNe52FhAGM4UaC1H9LlcnY2tO
         sYnJ/bwKegKnQ8i3VvYQKkuV0VikNOrdcO6OnV/Jea4ZLItClaFlL/ZUtW7YZSKIRvTv
         Ap49oRKds2ScpzFwnJTFdKArUp6o1lhcj4Yn+tyDECO7r8clU53MKGtw7/Z03543o3iP
         /1Og==
X-Gm-Message-State: AOJu0Yw5fP4Uv1Ial04xAt1RddodcAncghR0vg6DdJtVjyLBGTIcnfLJ
	nRxYsz44BPDzsIjLwUh+1ePZWjXF8urOXqJqiUOpfNOj08tx5/b5
X-Gm-Gg: ASbGncuux+07jcq9jAeSDsp+XWqr8AdXp+UEBY0EKeF9ZIu+CpfMP/KbtOWTwljpKyz
	vYDwGBR5A8RnAAPEhtk/drmI736dWYx8A5sXjYAQoqLl7c4LXYt/LktfEJIfi5HXXt89LxQgsbC
	wXBRXxrn/DKgzwXgQTlisTSVFbf/Lw9RHYzaL8zbnre9KJkoR3QxG/TzZjHG23do+OgbUd/hbQU
	B2ex5+jP1T09IQEggRw3x0dLM+PyHEkNyUpnju4+Vqv+DQNSCAAWhj3tvOvkQboygOmdfO5XOdH
	iMyLookopbHy
X-Google-Smtp-Source: AGHT+IFFqjKPOWeR4uzaI/d56rTMNFQwNADYI+92fGS4ndChhBWmVDyZmS3pP6P5O2p8dpiIIPHwVA==
X-Received: by 2002:a05:600c:5351:b0:439:3159:c33d with SMTP id 5b1f17b1804b1-4393159c5abmr65837825e9.13.1739189760962;
        Mon, 10 Feb 2025 04:16:00 -0800 (PST)
Received: from void.void ([141.226.169.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439377ba9c6sm68599335e9.36.2025.02.10.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:16:00 -0800 (PST)
From: Andrew Kreimer <algonell@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] staging: gpib: Fix typo in TTY_LOG message
Date: Mon, 10 Feb 2025 14:15:33 +0200
Message-ID: <20250210121552.33455-1-algonell@gmail.com>
X-Mailer: git-send-email 2.48.1.268.g9520f7d998
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a typo in TTY_LOG message:
 - sucesfully -> successfully

Fix it via codespell.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 85322af62c23..1c3e5dfcc9ec 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -542,7 +542,7 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 		return -EIO;
 
 	SHOW_STATUS(board);
-	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
+	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
 	return 0;
 }
 
-- 
2.48.1.268.g9520f7d998

