Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3823812D3
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711013; cv=none; b=dQAxa7cbs9oDzXPSNeh18ryxRI4y1n8zYYuQQS/I6QeUCkAOiJM4wfQ03kS6jKu1DJAucwdMtCZ3PbaZ2sOiQZTw4ga4GhJvYR+yEWsam4j+sa437IjeDvK075E2zP3VmIO5QbnM2njiM9upg5Bf5v4/L0BikkMhe6Qo5quuN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711013; c=relaxed/simple;
	bh=t9IKVxCheMKFK6oXwhkLHG2BuUeOlVWyhXBepszW6c8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pxlAfi8MoOs3ldewCrkYX2Od6bz/8/mRwn+TyQYUgBcFHHv1XY2pTZguvXXcoqQQudktLoXamqTre1GeDj4qEsIE8Q7nKPwICMBHWVWx9LrkqDe6gMmG31Djb1hYw/fc1rMF6Yu/m+GpHh/TMuCRQVUeh0xhd6uOoh8HDXUKX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzaKzF3z; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzaKzF3z"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e8292423fso64515311fa.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 05:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779711011; x=1780315811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5il3K3nJWUIVKcbEYy2cd/NmIAlc3phF0lY4mAeKiZ8=;
        b=qzaKzF3zL3zHRvI6GFkTQ2D1yG5EJzC/sIrhGEEOFLz2MjX7HyO34XgqtWlpkvi8wJ
         AHfi2/HBaiR3m96Bmks8I+BTUZWnsQaDAK8ui0busULlForKNPRMFE2RCxSM4U3w1D0J
         Kh6LHUX5IFODAix2HwkWKBe7uIYf1knhxmpcgODr+f7eNfxAQ9jnI1swi3N5/WHUAx+G
         cXUMT5ynyqcT5F5v9cC9KfXjw+0ocFZRBHvUej1AzxPhdLNOLIMfiHAarcGLkHwTmjgZ
         weFcNWJWBRh2OwfnnFiHOY+Aj1EepEAhvPQ5Muuc5Crsg6W7hrJxP9d2dTXbkb1bqq8b
         8Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711011; x=1780315811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5il3K3nJWUIVKcbEYy2cd/NmIAlc3phF0lY4mAeKiZ8=;
        b=e+HMOaJuIyd5itqzBsjex+WL7IhtU9anqPc2DbMMo2LzlmZ+FmrdpKoXtXcfAQcAGw
         6K6cEGbQutb5Vox7Z6uQyVLOf9TF1fRvNL8HlKsHa50ulX7yEUAQCVpQp3tz/O4KkFvZ
         JC0K641AU8IMaMt4TRXabAjKQ1a2MPt7haHka8o+piWqhCv6NeIpTIBh+tmXrfDN35TY
         MQGl9PIZa5M3Ax1/YtX2IltIsH35pKyAfaC7CTF4NqOCHkaMnsddEsOURndifB740fLk
         MKBelAqEAU7p+o8zUOtf1ZUkfTb78B7b+SgJ54bg6FMMeQg9e9PNmmGshEWIxWIVkNxg
         ryGg==
X-Forwarded-Encrypted: i=1; AFNElJ9oTk+6Hw4gTKIIWVFhGrh9mF0xCemhL5nw2IW5BDA1UPL5qSIaHnpUDwB9t61C+qm30GCoXVbLN29B5jWr@lists.linux.dev
X-Gm-Message-State: AOJu0YzOzcDioPVsHItHztqtiXnnACBen4T1L3ucVuRf7C0E7egwuIBU
	I33pzcjsR+FU4+0V79wUbqO6LhvaYlVEddFe4Fj3I8A2ljUyEt6wF330
X-Gm-Gg: Acq92OEsijyiDngscx0jqaH/B1hedQpEtERIEocZw+ts4jGPUBwC72rYNY/+ERUG9Rg
	jcfTvyLUWwXST5eZP6/J01F+gscxobO8By7VobqzwmK/ZQixOFwYYHSxRhQMGv+S7y0qYhmy/y2
	WU9sdVbLvwYQ1PO3ok25b9NYqQW2pTM9i8ps7mwNGvMv+UICRdgv8oqmuhgcj/hyzQ+fy3Hqbjv
	E6L2Ycpg405tG9PB3a5HgSiYKz/vZcX2pWwH6M0HjpoxenQ5rEnkzp7AVBCvMNUgP0HU5WAnlkE
	LEg0ow1dhqeGz2wl/fb6kKY0mNDw7LmlVsCQPPZxmDxD243ULEncVAy8R7MnRKDFQGURyB0dl5U
	1sUy4L/p5/I6gjXrkV+NbxH10gzHp0rVN1cICK7/fQ7wbSwxc8uEulAhgA5VpUqgGe+RFIvE5WH
	wBU+vzEjFPUlv4KhLxSfAiQzFFLh94LDqyZDfxhOGB9/0VU0f4zwjb
X-Received: by 2002:a05:651c:1ca:b0:38c:6b42:3d77 with SMTP id 38308e7fff4ca-395d8bd343bmr43270541fa.2.1779711010527;
        Mon, 25 May 2026 05:10:10 -0700 (PDT)
Received: from g.lan (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc09e45sm23408981fa.24.2026.05.25.05.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:10:10 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: fix coding style for TxPwrTrackSetPwr calls
Date: Mon, 25 May 2026 15:10:04 +0300
Message-Id: <20260525121004.4989-3-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525121004.4989-1-igorpetindev@gmail.com>
References: <ahPw0yB7Ax3lfhKu@stanley.mountain>
 <20260525121004.4989-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces and fix incorrect indentation for the loop 
calling ODM_TxPwrTrackSetPwr in ODM_TXPowerTrackingCallback_ThermalMeter.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 3d45e5e44..c7f3ad38f 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -250,7 +250,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 
 		if (ThermalValue > pHalData->EEPROMThermalMeter) {
 			for (p = RF_PATH_A; p < c.RfPathCount; p++)
-					(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);
+				(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, 0);
 		} else {
 			for (p = RF_PATH_A; p < c.RfPathCount; p++)
 				(*c.ODM_TxPwrTrackSetPwr)(pDM_Odm, MIX_MODE, p, Indexforchannel);
-- 
2.34.1

