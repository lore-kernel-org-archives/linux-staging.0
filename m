Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F33F1DA109;
	Sat,  5 Apr 2025 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852394; cv=none; b=Y6dg+p0PEP7xuaP36aPubo4UYghsCCUdRPY3MPo94SEUMy2/lyEJkrg3vo3DNw2gQJjvb3FJGgKRthQ7Mee+imWxgrNMXMnSwMhE6TYnwB4c4RxM13UFvDgnrBEKcDocfju38jLFwt8QGgT9Un81F5oXrSWGd+wrf6Ggut9SPXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852394; c=relaxed/simple;
	bh=vkROW2u2D0f4zc8RaZipeWN/JClwzcnOUuYkuWoJr78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhfxzzyfwixMH9puRuk8RBp1qYEL6M89YXlVgHH8vax/WtNi4+4c7guM8N5naZ00JqVoVInBiSV6l2r/NyrpAbtRZb6ycsb9c3fzrbf7JorB5o05gaGwcgHWbqD5Er56PxrGTJ00hEcg3KlXHA6c8/TzPQHr78QExIOTmqx8uDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjMIwslr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjMIwslr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso25756935e9.2;
        Sat, 05 Apr 2025 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852391; x=1744457191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGVLW6VD3LfApVXQnt2cnSlmWF36fozhM+r3buwa35M=;
        b=UjMIwslrz4bSCPmSRFLTC3DV6bjBQd+B4xlV269BV9FVPuiNkgxRWIiwZjhDaJvtYW
         gAZGIA8DHwH6kbMk2jJo1su2OQZ1EIogaV2w66HuiCaTNT/A8UrNLfSuej5lBuMYTfsf
         VZpM0EzOHUbFiMwrCy9IBXrf464BZpHwxx6WJHzs4pjWG/JUq12tuhYdQVNpl+rQd7xF
         Lgxpm6CiFyLc/H9kX2D6oRuPG4fE3ZGVaqshU9B8B3PdFdH5RIvwr1czpjxlnXjtP1/i
         nxfH1DJzb5s8lNUVUFYP7C+ykBeCqDIriZrjrZJc7HlFoRezkJp5txgYGS571i/yOTwa
         J/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852391; x=1744457191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGVLW6VD3LfApVXQnt2cnSlmWF36fozhM+r3buwa35M=;
        b=AwrTCE3QfcwE6i/DHIxRlBLClhdnuk60TSpwFd4lVPiJ+XGxBwYta1uiW1ZtSrynGY
         mWHBy9XY+XPzEtPs3AEVVHtHk8K+U+z7LBWANYJNvgwRmXiz5nQzJdR44FDV5pw0Gq8y
         pT87IrmOPqLlmH7+fCvVp6udjQyIN96q+psLtmJTe52izxIPXx/or0bS0OsoaVFH32xt
         FAlLZR68Te2sU5GUwo9A9gXueCbDIfCL0afexC/Gw4WXOvZ6Dhx+9GyRpWuKBvzLhPja
         eummDrlkv9Z81LzaWZEz2yPiaF1QkmHBx87YgdlvLpOk1nFO5NOOHME0ADP5Vu4NEksV
         086A==
X-Forwarded-Encrypted: i=1; AJvYcCVJXufedjs1fnipo+uY+08Dgtx50TWrmljsvfuLTjc0eiw4/0Ok2X/w5TqCvhoArpgtV8LYSIfl8lmM@lists.linux.dev, AJvYcCW2fhbBMXsLx3uRTyonOykdhSQ/Vq2pirVM5k3uen93ePc2yT3xlUImJ31UiLL3ixgpflRZTGd/efJHXmmF@lists.linux.dev
X-Gm-Message-State: AOJu0YwVfKnP8Xk0PX6nALcpg9g1Jw+6VzWSwWB7EAWF5ef2QYQybtGy
	RuANc2O3PXv7LdhaSxcRW0wQ/4J9dwAjKCm/EZ7bg6BcKXkWMtxA
X-Gm-Gg: ASbGncuyF/ENoA2i/4tCoL8wGwFCSdkcncWND/xSfHin+/QxYSTan8rBmXxNkSBvNc9
	a2T2Ms5VqJoUGbKjbkxHf7XJZ6Mbc6fYotc5kTImplugs2+k9hAs1SCIvQttS/KBuue/34px2Mb
	df40KMf2r7HkRHx9qo8IbxukiXw9s3QnPO5AqIXnH/VGMj+HhkK9sbY0Qiu3p7U3Cp6JSa4Smjy
	2g89vvQL+cKw3fUmpJQMe1HMXtwR7cVh9JEl50Xej8bL5LK1szaGDyq5c9X4aokcyiaddqOrael
	4WSiWLf49yjubV3it28u9uInPYHrnvEcqoBryr0kSw==
X-Google-Smtp-Source: AGHT+IEdbBL3MRIWntQwweT8vuXDk5H23cW+640Zv/021eL9H0iJqHIjtoIY883q8yma3rqIe4a0iA==
X-Received: by 2002:a05:600c:1f87:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-43ecf9c788amr39833175e9.23.1743852390464;
        Sat, 05 Apr 2025 04:26:30 -0700 (PDT)
Received: from pc.. ([197.232.62.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0d06sm74361705e9.35.2025.04.05.04.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:26:29 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: add spaces between ternary and binary operators
Date: Sat,  5 Apr 2025 14:26:04 +0300
Message-ID: <ff993a669699e902909063aed03bb6183122c9a7.1743851473.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743851473.git.karanja99erick@gmail.com>
References: <cover.1743851473.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spacing around binary arithmetic (`+`, `-`) and shift (`>>`) operators
to improve readability and adhere to the Linux kernel coding style.

Reported by checkpatch:

	CHECK: spaces needed around 'operator'

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 928c58be6c9b..666a9f44012d 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -155,9 +155,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		/* 4 1.6 Big jump */
 		if (pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
-				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_ave - CFO_TH_XTAL_LOW) >> 2);
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
-				Adjust_Xtal = Adjust_Xtal+((CFO_TH_XTAL_LOW-CFO_ave)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_TH_XTAL_LOW - CFO_ave) >> 2);
 		}
 
 		/* 4 1.7 Adjust Crystal Cap. */
-- 
2.43.0

