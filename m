Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126E382373
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776006421; cv=none; b=nwq4KqkEqkVG9UyRhK09oalJev37KHGYb85YzcxtTwNI9DE2iTqGVoQ+KD8BFEUeCfJHVwP3mgbyN0ruzDEDsfOop5muG2El9E5wObT/5XrqcPYXU3ODaWiDzKiNfJieGrnzBey/k/fykAqlYT3/F+qKi4+YPTn8N22n3Ts6BWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776006421; c=relaxed/simple;
	bh=m7xWSxb9TyiYOvigyaVN7HrPkQL13ia6i1hMvKs6mLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHoBAaZd+E6NxbC/x0G3m4Qft68r5sfE3TD88LexKdPV2IkeB6GZkzr0QsS+BTlr3HMJL/I7MUQIAXkW1MoUWRKqElQi3/rvDWuUSfYdq+PLBVRzzJkrzHygnrP5KVasmGHbspL3Jf8iBxh0W5aoiVmiN6TzOb1ZzcrnVMSHTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8Ph4nm2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8Ph4nm2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so2534682f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776006419; x=1776611219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4fBwbwXG7US67w+58dVfuhNqdsLmf5NrveVGQWD/3A=;
        b=G8Ph4nm2WCzRpDZO/M8VsO+Md9WYqSC4sHnatsok6rWWGc02HM/VZogDaj9n6WOdUh
         KZPpt6sAjJeTIbL4M07UdwdhnBtFp2AGAFcX5i3kVmhvxNKSG5LIWyMZ0tUkaxZk7dnK
         1AQ3sINpnAUkGswtdWYUkuT7qjf4qwfU0UssYSffs+uehRBkOEghNoEizWXSBS7lmbh2
         y8E0XGYNp5CH+07wpGHHATyvApW22S6oUFRCttJhj0ZF7gQFBzqWdrOUDvXnl6kfp/KM
         wlowNPjGCQ15HVp4r/ZRJOHsx0AkVxf6r1u7np6uZnip/42pkx3jj4SED84wHrBWUZYB
         RYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776006419; x=1776611219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4fBwbwXG7US67w+58dVfuhNqdsLmf5NrveVGQWD/3A=;
        b=LCTg8nsLJeiUrMrADXV4F/Yz/9mQN6VIqXVm2EHz7WoO4qcsOj7ah/bGqnTVxMAscl
         n8YNJ3Vx72U/HoEMKkDzUldcz18/0LwUZwZ/8zYlkpjfyDpwj8wmMFGOKWXI1JsQyglA
         Zi9IKS808Np9gOsN//p4IWp3DIk3cFpafa3HZgNdnoKmA9915cEtEEmZJvg+6/X8uw7B
         mIHOBQVb/qqfOL8YhsCa7gx3+YLB8urUFarJcLADeasU/HVRvxa9DMq2L0Zl8Pj2U0fE
         ubwkcN/Tag68qRYbYSnBCskWMcyGdRxcY81UiaQiyy+rWFwrRm8/tKuTrzBQ3I/zQCjc
         eWQg==
X-Forwarded-Encrypted: i=1; AFNElJ87A/w7wB1cWRmI7UC9Z2A24Xm3KHhj1npp+ejg9qp68fW2T9ZcNscM1iiw0Jx/c3F3Tzu6fs5nkxICs5yB@lists.linux.dev
X-Gm-Message-State: AOJu0YwkKqSmIsra+wIZj6WyzD9Z4TOZBmwQqclki7dD84byyApA8T3e
	gHVhzc8cHi72tuHLZ7TdNQNWjBpvUi+sWDhkJO6UjQ/wBzlEH5ULSH8+ZDrpC0nc6Os=
X-Gm-Gg: AeBDieuS9vFlyZwc8m/uqUUgR6pzKCAEFYCfae+Pdh7D6EWI2DtzzuGIK7VMYDzc1e/
	Ul31uRUpEgvfwGyS/G4DY9Nf5/uINu97EbCvs5iD8iappG6hGZIE8jNku0pR7JbPdrDHwi1VDwM
	QkYfQW06ziXRpmUmXuQrKvC19nRrUY7R/v8/u96BFL2PObI+DJh29XtCF9GewzAswbq9JFqgG8a
	UNxfTkPtIcwPjU60FTrwIVDR5ap9A5ujcT4QXSG3NXUKJmxTUMbsS+TSzCHhAA+d/WtLcERhN0D
	XyChBcWYF/MSKhWyogDYS/9kscV9C/SZ3VdJg1lb+mErWqULmJ+vmTSzzEnNdmKcRNKziRscmyR
	YAuVYUeJ9JsCxeP9yzwhafvKg//s3F3GmmWO5tmODOVZ1aqf3J5QGeY+P5U1PT3przGxWZtW/hj
	Svf1H5aQyaFMJWTyis2cUj58KzUU6DTjNbKBMTC5DqOBOe7yCpdNGB9rMhY2PvQqrcHJ1ld+g89
	CaNZ+ABFHp9
X-Received: by 2002:a05:6000:2c07:b0:439:abcd:b314 with SMTP id ffacd0b85a97d-43d6424cbccmr14385438f8f.18.1776006418635;
        Sun, 12 Apr 2026 08:06:58 -0700 (PDT)
Received: from fedora ([2a00:23c5:4a5d:3701:b24c:c1d6:5c61:a2ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm26760351f8f.34.2026.04.12.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 08:06:58 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Luka Gejak <lukagejak5@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: remove unnecessary else after return in sdio_halinit.c
Date: Sun, 12 Apr 2026 16:06:33 +0100
Message-ID: <20260412150633.12071-3-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412150633.12071-1-josh.hesketh@gmail.com>
References: <20260412150633.12071-1-josh.hesketh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove else branch following a conditional return statement

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
---
v2:
 - Rebased on staging-next
 - Split from original patch 1/2
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 4a4f6b03253a..ed82860ae9b6 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -641,11 +641,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		padapter->bFWReady = false;
 		pHalData->fw_ractrl = false;
 		return ret;
-	} else {
-		padapter->bFWReady = true;
-		pHalData->fw_ractrl = true;
 	}
 
+	padapter->bFWReady = true;
+	pHalData->fw_ractrl = true;
+
 	rtl8723b_InitializeFirmwareVars(padapter);
 
 	if (pwrctrlpriv->reg_rfoff)
-- 
2.53.0

