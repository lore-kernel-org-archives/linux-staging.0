Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20C2D94B2
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 20:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064028; cv=none; b=oyXXsPGU1rj0KvsQq/nK2lD8LLNfvP+Ik4YlLB0h7EdyQfhSlMswBo7VIfhuxZA9QovO6yP4dDceFDcSyEGvhwR/QmuP8XunEkxBw0/sZ/CNM6H+DYdkttk8u16u1AJK5hmLgVladcWGx1jaxVIQ00wXlnJkZUy0sZB2xO4iXEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064028; c=relaxed/simple;
	bh=eAi4cjqa28IGQ19pie5WPZ5SfdDCVeYj3jWAmyiQHW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqE1oOTO70mzwm1J1dknD+kX/SeO1TG6N55ql4YPytFRdRiDFOwQILepJdcYp6dSzZ1EyDwR1enZwOWsS4iI4Vpz24fjFhRGfOnmWzkhe7/8hMCidKnZFvNJfRE54D3M4oHbApWAMD82y7xUU7Ja1rgiMvUsxsr74p2eqI48Fo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ephEQ1FX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ephEQ1FX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso2638769b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 12:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770064026; x=1770668826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz0TDZdUzcJlhZ8RZ1PExQUtggUtglLmHcBQE1HSFT4=;
        b=ephEQ1FXglIuJky2xPCCvevIPZDyPSDv/RcRyQj5l2tpOj3/WXpyR05B92hmSsMbKa
         cz079D1ndCeX1HL8fpLYG97MpWFq4QvQVFF9IODhIcZWLXp5rZC9aXyv8l/j2IgNUv04
         g1OlPPOzgFj6MoKuyFAMGNp4HcbN87H8mbiKuPOQu2NUOLqykeLJvyz/V7AETI/31c74
         15LBA8rx5SF431U3OdESi85gmdltmajSdYqqA1pg9Gv8v3tXnKTQRXm8fREd6OifIaiG
         IA6kZyeInbtcQw5EIoM4r7iXn6Kx4pMLjFNqLlyz58auugbWSdfUi04XCWX2Svv/Bcht
         UVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064026; x=1770668826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz0TDZdUzcJlhZ8RZ1PExQUtggUtglLmHcBQE1HSFT4=;
        b=iNzEn6FF6MAZlW+rUTBYVy1W1MCgCTTNYP3u+ZATDF2OZxRxaXsD6vies8imxjIMxO
         Nje4vsjHAgBK6iCcTlvbMhxNf7hAsDxbCWaCt4w+evCc4/Gj1XLucYrRDO9wKYrpQ/47
         hnAiWxVSWcTurKifvPmUm2RogjzsTvtPdVzJRKCFH3H5YKGxu7vEWAINbs/+BgijoqKu
         nOUlnlTR/rvYp9vbVX/Az88qdd+eN/8zpoK9Gkt0goMDWdHBn+8wps6VJjlYogFIGRuI
         e/nGtVavMC4pALhWFUOqTi7772y4Qj/j+KRySs3+UwxOvpDeYMa4UY+4O7bGNWke1Umv
         HfLA==
X-Forwarded-Encrypted: i=1; AJvYcCVfCuLvcRaWDJf+GJ87x/BqFmC7bfJyNdnDfQcYlpA8ixANjdmO/14087nIRRFTORGzbrug3VtM2kOu0xrC@lists.linux.dev
X-Gm-Message-State: AOJu0YwmYWiIaFLtTkR0RJyJsrnQxrz+IYZalLPETQD3qveEeFwxGCHC
	NiKLTyOVVrFam/BGFb0lOCtedbcJ3zaAm5urqI019Duh2j3Dp7aSK6IqaeWrIOfX
X-Gm-Gg: AZuq6aKiClABTxyjgiw8oyTICEU9OVpUrvCizrdWNQSCt6mAiNT3bgjwyoZnnFnjHAY
	6c0/ncO5HN7FZGQOtztSbI3WlItn+6SgsiA5I/OkgZR5xjHYZNmyCRHdv8vCto1M+eZmZShIFml
	GvUXl4/iYRaL+s/hGEUOJLD9lCyvoL9NYCiePBLBG6VgxtDhjox5Mr81sGFKYisZ5wM43tgD0bH
	Xg7DMG226kTFe6yfcri7Qt6w5ZRakXSDYdiaeJUgOEAEyK2sdC270UrXmYlKz+RMH3XbtoYcpdh
	tEikbmRhylEUwAH561yKUc4GBz8GInqykGzi7Mh61fVQH6SZf+RAQZhSLe/+leOdRvS+MnmPmGE
	lqi0+S2qQ+aK7vaFl3IIS3s1SGkdoRjz5yC75UetJcBq3xwSNKpEoIpc/zbLCnbQTdsC+lbf+pT
	5MtvPk8dgKtG0g9o1coYYV7fCLrHLzv75hQIGeG/M=
X-Received: by 2002:a05:6a00:94db:b0:81f:99a4:190 with SMTP id d2e1a72fcca58-823ab643c11mr11764574b3a.7.1770064026328;
        Mon, 02 Feb 2026 12:27:06 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.86.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcab8sm15147604b3a.36.2026.02.02.12.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:27:05 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH 1/3] staging: greybus: resolved checkpatch checks for fw-management.c
Date: Mon,  2 Feb 2026 20:26:43 +0000
Message-ID: <20260202202643.160199-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolved two checks highlighted by checkpatch.pl:
- added comment to mutex declaration
- fixed styling issue

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 152949c23d65..cf917ddb79c4 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -28,7 +28,7 @@ struct fw_mgmt {
 
 	/* Common id-map for interface and backend firmware requests */
 	struct ida		id_map;
-	struct mutex		mutex;
+	struct mutex		mutex; /* protects fw_mgmt->disabled, and serializes ioctl */
 	struct completion	completion;
 	struct cdev		cdev;
 	struct device		*class_device;
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

