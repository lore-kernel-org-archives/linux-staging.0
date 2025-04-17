Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C442080DC
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849988; cv=none; b=orqm84Nquv3pW+eKxXOGV6/qG/uCbccmXS2wbAkfQwaTmdxTaPyrFE90b+gOtie16Q6BWeZLJ47Q7NNdCG62+vO3G2LVtfSRn4fg+2Tx/VUv82VJxM2siBvTa7/4F98WuLaZ39SVgOA+xhR9UafPh9Dfb42SEm9ObG2JBA4KhPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849988; c=relaxed/simple;
	bh=7oIHWBBjQ7BlH6IvMzYiszexZSDJnBmjz47kdnIC5NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPmMyYpvqJ9s3/psaTmGfXBreo/1Ks7BMxE+O+ozcrGlsKlpuYbB/yok/FHqlcgHG+1VmVA2HlCeVgviQ34cL7iRurPNghBETVNjl47Tjy8/xW/snqk95gCMLL3T/Lb6OtanZElL96rRowxhN1cKCRzcjYRro+DqXE/bcshyQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=e9cXSrfH; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="e9cXSrfH"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so122303a91.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849986; x=1745454786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=e9cXSrfHMKeZlyjzG64dAe6d6QgQL736jhP0gumr3UHHDVFHSdrZazElV7uxtZS0zw
         MuVuNusomWDrF2aclj+Yp6Jm8+M4DyMq9tkw0+MtNqI3XFZekEqxG4mQHyF2s4hs7w8q
         PYXXu1gKgV3Ve5OfYPBiq/PD4C7s4m7iLWUbN/x8lZYV88BvGLFhvUzw2Y2gdphrkDxD
         82hmd4ntXhg66Nq8FGdruNaC+XbP+ifwEeaiTOB5tsBryD2UXJWi+HkvF2T8jx2R8Lid
         qThtBtQCVzzB77ofYn8rw0bu+LCZvw3xwEUijm4wjnf/a250X/3AD3LhwWhZqxPp6xRD
         D9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849986; x=1745454786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=P8o7qR0DPbRXYImJ/WJJtVAGyWYlJWqK/F7/nxAq1vQRoiVauSz+/LoED5KH8OtRcZ
         dOafOfg4qhZLPw9aCsKeVDD0hRluob4S2ugvdrAIe6l3MclbGTaXkRKyDnrFRCCyGv/C
         MlB3yn1FY0JOJEkQivh9Qs4qzUNI+HsqdVyluS9iyHh1u/FCD6oOlYGUkw1Gr6V9jqqP
         6/XiIwpDPB6DJYN3YmcHcumo25nd7sYzHkB0njLEYBXRK9BiYL22AmfqjWsjCw4/mojC
         SJc5ayw3fdJn/O5UB4PA6yfkkucUe6z1QZwnh6p7bMETWo2krlWAcOv2MxzSWu3z4sdK
         wxcg==
X-Gm-Message-State: AOJu0Ywa1rZP7icTg+XM1CfTkihlBI3SJvJVSdgTbqXzS/VKM63Q9ZVa
	jLU6LqFNDLcCzkkd1I03c+te1/c1VPGKreROuYnAuuV8VOjQ7x6+mL8BhzL42A==
X-Gm-Gg: ASbGnctuDy0FHvZvDbs8y0KxPUT/jf2i94/T0pJi9QKAn2dX2yXfeef24WFMyN+NIe9
	bP6khqAgSCXFWM3FcA4Ihb2rfuJsGzgzc02d/N1aypHRKZUFc1TKupnnJCZHfyUYKjqvV6gg+j0
	fPQdtqqWtfeUBpr7UVY4fM7136Ad42iwaG0v8KsZPC7zuem6aXF50QKXGfV/fgli9mkPTDIeOpJ
	Wn6VeeS7lXTRjzKv1QeLZyaJG7lA5k4QcB3/PH0e8cB1eu8Tvovd1wY1mJ6bGaYSk5CslqAb2ZJ
	Kvs7BYGGQpM46y7jdX6GiF2eYOBBhcITmrB2VNoXH8jFsv6izFXoD3B0JpxFogLwxhwYjFzhK1v
	xKfV0Cw==
X-Google-Smtp-Source: AGHT+IHAAu3OCGORh5WH1jCPQPqg3DTc9VvsY9VBR4t/IMQrhq5vUJbG3m2+2QvDaJKMxQk3vqB7lg==
X-Received: by 2002:a17:90b:2b50:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-30863d1de1cmr5619673a91.3.1744849986388;
        Wed, 16 Apr 2025 17:33:06 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcab8dsm20787265ad.190.2025.04.16.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:06 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 15/18] staging: gpib: ni_usb: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:43 +0000
Message-ID: <20250417003246.84445-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 00f788a59dcc..a3d517efca08 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2373,7 +2373,7 @@ static void ni_usb_detach(struct gpib_board *board)
 	mutex_unlock(&ni_usb_hotplug_lock);
 }
 
-static gpib_interface_t ni_usb_gpib_interface = {
+static struct gpib_interface ni_usb_gpib_interface = {
 	.name = "ni_usb_b",
 	.attach = ni_usb_attach,
 	.detach = ni_usb_detach,
-- 
2.43.0

