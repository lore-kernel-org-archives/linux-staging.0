Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345B1C9EC0
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742632; cv=none; b=mVbXMmhFNx5qg1QtsMdlmqZkhUHA2zizDlVCSKIgHWMg4F9Cwfwa9tdxe2F+VTWXjOwD+CEWzgPRn/gLZrHgVJPmRXqI7i7JiQ+EKLMNQMNsHdeDCks/DcuajX8L0QCrT0krbzuAomfp+qqa9+IcwfBz9Rm9W7ljxvGSmNfhNxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742632; c=relaxed/simple;
	bh=DbDP9y+Z1Z92uli2XTbO36BvaUcaMIE6LpjBRU0RiLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxVcYZOYhrCR/ITkvymMjB1goNBcvCkSJkFYOQoW4kvVO++ZwUe/E5M8iUbOtTRAoCGoj9g8/5FKKlkg34qVJRPdEsAUeNHstwlax/kDCyFpSjivGJ+1GkGUX1niNWMnYJVByIIRrGndpC3kmYrKa1vnxd+34927sUzEhtOaMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQISeNVV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQISeNVV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d462c91a9so2693321f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742629; x=1731347429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajwobQL/OgHCeHlEBCD2gk8z11jb/W4yobyOVkJlzRE=;
        b=HQISeNVV+plfEyqyJZ/0nPVUMZDO7NGk8Lh14N5IF5wH2iXJ99qnD6GHq/0veOMF5X
         5jMTBQUnqM1NbsJHTEqRPv76oBdGRyNztn67oTeYQINjWG2GUkW+xKrDaWvR0xY7JK89
         MH6LMMpvd515+11NF9gM2S+996D93wUGFvUIRMWdZdmOMI9RAW0TCv+nxJsCpSn/aMRQ
         71bSqrRRla90cAIeWh3Emb3Gu4wFfimImKJCmqe2niJxl5ncGlG7FvuS8X0i53r+l94j
         /TKYp8VOnla8cURKnyR2US4lPoWIrpNJv7qsaarkOu//8t1f/trCl7aLQYwPUzDaNT1i
         qXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742629; x=1731347429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajwobQL/OgHCeHlEBCD2gk8z11jb/W4yobyOVkJlzRE=;
        b=eFiTs+f3GFRX6h4Hk0YO4dny8LEH3+viIOWyUa+KhyRylBEIvy6otFz8ojovRX8SIT
         Cz+QVapkzWuwImMs/lJlXNVSPr1or2Il4nLsl+sDweU+eBy9YpZbPQ7uP8AfoTBDXwEL
         cxQS1ZvvypRHJbPLwz3+5B2ENNmT0ejZafsSroDUZy7Ik97yeKNrRXWP3QN1OTlcl5eQ
         a0Lvx8gAJjczP2GJ1UcM40YfkuzIEbyOUe6Ow8Ha8MSP9XTmHHMbYal5GPVa+ACHs/bK
         ustpuLr+cgYW5e/LlkRfXFTtkb1kxAj7gog+1KD0Qi/8mg2enHgjoB1E17Iy3NvXUM+r
         vkzg==
X-Forwarded-Encrypted: i=1; AJvYcCWcY45kCVMDAjRguEy8tqNQhwWN4jE0xAyp+h+GjdA//XXteOKm2tLR4GK3YBBvQ1IDxeJLgQdndhoCZEVV@lists.linux.dev
X-Gm-Message-State: AOJu0YwR1UfXXzrEBcjtDtSgQLwVsWJ+mLBtTPf1XyZEP67x9nMI1LJO
	0fb0d7AT1/nDU3eF9RWnn2w66CVVpEZVpR8Sf9b1kgHmBQOtEXrC
X-Google-Smtp-Source: AGHT+IGfQ7FGigP66UxM4jE7vbTR2gUi72gYyh5y6I0lzwKLSM/mt/Hrbte9btOApFKFU7UAC7a2eg==
X-Received: by 2002:adf:ea89:0:b0:374:b6f3:728d with SMTP id ffacd0b85a97d-381b70f06e5mr13351906f8f.46.1730742628908;
        Mon, 04 Nov 2024 09:50:28 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:28 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 05/12] staging: gpib: Fix MODULES_DESCRIPTION
Date: Mon,  4 Nov 2024 18:50:06 +0100
Message-ID: <20241104175014.12317-6-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use plural for adapters

Fixes: ad59cf382cd5 ("staging: gpib: add module descriptions")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index ca9c938284c9..02c6ec9a42a0 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -15,7 +15,7 @@
 #include "tms9914.h"
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("GPIB driver for Agilent 82357A/B usb adapter");
+MODULE_DESCRIPTION("GPIB driver for Agilent 82357A/B usb adapters");
 
 #define MAX_NUM_82357A_INTERFACES 128
 static struct usb_interface *agilent_82357a_driver_interfaces[MAX_NUM_82357A_INTERFACES];
-- 
2.46.2

