Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA7207DF7
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 00:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777335897; cv=none; b=QiqFAAgDrL9ck/2bb1XSvQnAqqoRUno+rbbyeDqxfUA2Yr5f9Tq9RcJBwYqUpYenGz6NKtJBbAS8Ha58gfvgwDT1AJihg10aBz1DXf2qrCeav0Q3E/7Z/k7g7f7FxoLewuVk3xAyqmcKeDCIPWpfs2ZdORe+y3X5yRGKlnRPx9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777335897; c=relaxed/simple;
	bh=QlOU4yMSA3vEdjEGG2XOqqhn6eykq2ybPRLx0f8waMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7fjQ7cj6LRdef7eAT2Zae3coGgDhcjvS46gCOnesczUS9rhiTOFajmP1ONQPk71dpC3sN66JUYstyJNtsrvnU1pcdugGdb1/kfMFvRQIvmaCpm3ytPrfQjBIrj3yGmSRG3gxNwN0RGT95O+RSgOiPnx/hVnQ5k9Ag8QcF0a9fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3IyxTyw; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3IyxTyw"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-79885f4a8ffso114989267b3.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777335895; x=1777940695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z2jdUVTqGyX+jdjyIaM/RF3bFaCvwm69KDjVlb7MZEM=;
        b=D3IyxTyw8lcmOi0vHXYb2bPQrpYYBsNic1SNclLHTmIn55kgTzXh94JmHtdMBPvpqi
         SvaTFkYDyMrDzCMmu9OKobTFRHgaZWPbjRJbVMk4PehMq3yrjDgjNaklAchldeJa3vyc
         eiVRS7ByOuTsR2ecR+yg4UD7GEuaGQtZzYWZhyfiX3MlDL8mybufJs6InRLMOoJziNbq
         Q12OFnF8r4sWmxJ+Ljn3wVdkM/PUkPEMpw+xfkullz4LY/Yz+aZL7Yfxdpoc4fd/Knav
         nd48/yGjc/VkUVEJz8LVbziabi7/ppFb5bsMvx24cgf1d2ltmjk0rEdhB5t6DS4mJ7f3
         vr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777335895; x=1777940695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2jdUVTqGyX+jdjyIaM/RF3bFaCvwm69KDjVlb7MZEM=;
        b=YUc3qA/LFG+wRN1cT5UFcCgo97uouXUFnAJIYu8gCkX1y5wqWhs6QXfA7pi5iBL8TK
         l7IcFp6Lh5hTmvQzbC20Vrw2Scb7s8ir5C2L+Njo1jodRSLmrOU0sl+VCXkCfQo4/+0F
         wTAIR1D7to69jf3r7m4iY5Kibphzb1yvFVwCResrO9jzWaCGmfdKr2Wem6RZ/E1pzVzD
         YXtVezj7+PIoMBMT2kEok4e8kMcOneBjMyG3b31XKQoPWXIYVjoAObpuEV+f3betdc4b
         Lvq/we52ZxA/3H9r3KsexlKQU59b9nlHFRITGrjwpXFWUh+opEfxoE4/fKDLoMuJLbLD
         IFIg==
X-Forwarded-Encrypted: i=1; AFNElJ/rnlIhIm53qnsc3Xfq93vKKeR3USEHI6Y6uXoTkMo8zCBHSRiiDpgn5YVBolL2rZi2gTQz2lQ8jtfFMQtI@lists.linux.dev
X-Gm-Message-State: AOJu0YxF9DmMGnuALsh5sSp72j+kRFlbwK0V+xPIJmSXAWZBr4lfAV0O
	c8eyZ4r32Qzu4Z0his/78BledpdjCTrTOq6IafOQzY5EzH6jsI7uUbRb
X-Gm-Gg: AeBDievVb+2Q6v1T2Jnzm+1hY6FGL/5GjI3/ItBdqqjUQensPcMhSkYtZUQHhKPIsx+
	kiZeVIkkO4uMkx5gLKC2L42JKrLE+PbcCBH9AiOyRJpdhkPhpxluFGpLG783DU5wDrYOWwjN6Zb
	IIHegqgEWJz9B6aRlu+ffIZmyl81rnpvNVIojeyWCr+8w7XrcJk2NmoopuarjyCPRaWrLsjRMon
	RMFErs0MuwOBL4DhNpQu8M9fY9hcJiMNMzyAJOm4E1OcVvel4BwbYyqdEvDcOdBU4NoFDnw+ebl
	5PIKnZ33tRG9X3edkAnwMCabbV/lz6LnwisyN9glE5FrdOcrSdYXNHZcBs9901ar1BkKYMy1w5D
	+hmEVsdD/74NIs90rlLkIOkQ1QVRg4xhgVPB56E8v9jUWpx08n9U4rv1j43yrfMjQcR0wRWZe3t
	yDo3oOqH/mrrIFy5MmPct+3p9wQmpCudZ+k6rS6b6/FQOMH117JMHM0D0mlE+Ire4yV0Vy9ae8C
	3c=
X-Received: by 2002:a05:690c:113:b0:7ba:ef98:970a with SMTP id 00721157ae682-7bcf4fbe2cemr7689187b3.9.1777335894831;
        Mon, 27 Apr 2026 17:24:54 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::45])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e6118sm5892467b3.16.2026.04.27.17.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:24:54 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
Date: Mon, 27 Apr 2026 20:24:48 -0400
Message-ID: <20260428002448.4829-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..757460c8b 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -168,12 +168,9 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
-		 firmware_name);
+
+    dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	    firmware_name);
 
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
-- 
2.54.0

