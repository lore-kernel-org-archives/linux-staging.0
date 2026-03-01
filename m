Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14596430BB9
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400565; cv=none; b=TOWo6/ZnISc5WInxfBIynD4l8A7hF0PBvBV8Bp6t+m7jRvU6YeHCyM0wAqiN8AelIEAcuUy06XyuqQ00gAx948SbK2hu4Aug+O+nk/mMkFmWHFyvjZvJPDYzlHvmrLt2LM4eGQgD3w4MeYOtLzuvDbLlFm+x4sIxDUNvQNlwzMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400565; c=relaxed/simple;
	bh=k4bR7udKis1FcpGP5Nlezb/ljXmY9NNSsJhGw/Col8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fl2/8gq9hGPyXwvrnki5oO+mPTq87fqjxVgHZNZxKWmG3Cp6Ivn5peXM3ltbscaxLSPSqgh5YBzSNHR/wc942XBoZ/YkWNeSaU+0Oopt9ykD74p5H6Fql1LLQWmydEg/thtiWNzaT0XbANz1QaYxP/zCsgh/td652pjWrvaMufI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HX89rauG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HX89rauG"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870acaf78eso28549671fa.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400562; x=1773005362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dytpY8bvc+1h3L1Nh4NfJFPzaxz2X4N4IhENoUNdFJ0=;
        b=HX89rauGLVP0jflV2S80aqNvyoJdC42SorXbibEYMUz9CPSUMUi8AZ7olUwTmPPST9
         u6ACJsZ/XNyXniKS7+Die+MmzijaEvZih6Sl2GsnjoH5OIHnNA/S7f7GGK8GZPTYjagH
         t2DnWzHGft7dsVq+VdyhBa8M5Z92+GR/yGXB9u3t0kd3B9CVHqEUwvp9y3a7AF2p9Rkj
         kH7YTp0OdvWNuagx3KfYqmSnm/bDl0af4Qr3yCwItlMc3Fh3NNTM5Hlo7ta/DMJ5m/vh
         Lv1zz36QDZyemDIZoeYn9EPARi9yvX9ygUo6J2s+7l4kHuSnY6U5h4q48tXJz+4Co0St
         +fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400562; x=1773005362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dytpY8bvc+1h3L1Nh4NfJFPzaxz2X4N4IhENoUNdFJ0=;
        b=Kn8T2Zf60hrkuZGmSBpNQeW2wOb7c16YPfXF0r7JtN3RhUlBfFNTB5RStEHIPtvl/t
         wkKbRuUA2CQtZugY25VRM8ZnympCtTH68acwdxh/NETk/Bf324Ix+d5WSTw+J4p0jndx
         plxXuwU5F3zHK18jaamDut21DHuahBtPSBDCv/oPQjZ9pO3vVlNSdBshKPWCRnUYfY5e
         pcbLrWU8c0aGzQH9YVKWI3VmBjIUwsTzVz+pNSVa0bOhhV8mhNcJkRhexVR2zUFAxi6x
         EFtZDY0qRCYbG+dQajK4KOav0BZL8WXhITx+2aPO6bwIUDBwSQo33oZl4u4vDVbOcPCF
         yyDQ==
X-Gm-Message-State: AOJu0YzJTl15GJJeVvUiEdndavP9/NeyV4SgWQW7AhRxf1hQLNF2Vmt0
	imIJXMBPx8PymFTEkXaf7K5hs7r8gQjyGBCjEXUNFX9Z17z9vvtriNkd
X-Gm-Gg: ATEYQzw5DfiIOOD3nro46Zoxcv1kgntAcw/+bqCFLcF0mUSimxWks6LQVmvfXtXVb41
	GkNlwLQFQplMhxo5cUcGu3nw2xQVLBlenuN7KZ+fNAVxnct4IIZvs5leg6w5TGv8Clnd+/izs3i
	HTvuZJvtNfaU6WZBgPvcOI48/vy/Hzs6voyc2ehk3nMmu7NjMfX0vmHQw/jEv0AMitUk3uYYTl8
	fMronyD+X+1qloItfYvazOV9XZC0tIgKyOpP30/2OJ582RMB1pqz2b2KzZWCUCyVmDfFEynnP1W
	L3ZZ8ShAVZ83UWpNEWAhV9s3ucOP+FQs9AlcvmcRA/rNhr66/c0tPRnVj0Lvk7QEqBvmYAgm51q
	HCx1Gcjk+2n2P8CR2GGUqzFSRKKoB1DAaD14VNQhhTLWciwPodRsfaQaw/Jrb4shWuZjuMVzUb1
	8LsLdFjnoEEJDbwUcC5MbSFMF7JTcTpHt2HUXl4pJ8sEAfjC3QiaF85Qf2DYAV3fOjJ1SXn+sMW
	A==
X-Received: by 2002:a05:651c:150e:b0:384:9355:6a7e with SMTP id 38308e7fff4ca-389ff144dcdmr75502281fa.17.1772400562143;
        Sun, 01 Mar 2026 13:29:22 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11577588csm1277467e87.67.2026.03.01.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:29:21 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: remove useless return statement in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:29:00 +0100
Message-ID: <20260301212900.3783-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary return statement at the end of void function.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d5c5895e06e2..de0446997154 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1417,7 +1417,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.43.0

