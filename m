Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5AE182A7;
	Thu, 19 Oct 2023 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkKkjlVg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4064867903cso81054745e9.2;
        Thu, 19 Oct 2023 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697710501; x=1698315301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzwyhcJNZa6arJQKPZmLNcj0YJDSwAR/dJyY9R0VHn8=;
        b=WkKkjlVgknuRnXXZByES/12uFZNzXwXPQTEm6mj4lzaiQWVy2njFpGfkzu3Fg6kmKT
         oPsmwhY1j4pZRZKL7EHplrKZYbv+6Sj7UoDrOu7dTAJWYueDBWI6IYwgIYG+kPiA8xCB
         QPD0+ZbXrAPn26mkeQmyQeEa75MMZNlif5ppRVoafdsFtv2BT5zp45i2Hmea54GWZ9nU
         RkThb/YWloC9qohjdgdrPnFtAVearoW6h3BkBEY2bKfaWUQ3rd92iKJdMKpVLCBUMOXC
         iGFO9owMSecPxmc8RKYGJjCk1qzVosDCaqtakzgo5SmtywO+buyWFDlCH5lECnPwfiiJ
         a2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697710501; x=1698315301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzwyhcJNZa6arJQKPZmLNcj0YJDSwAR/dJyY9R0VHn8=;
        b=hxqcYfdu0lZFsw2hcGzkhFGUb6kwjYZdMGqiwW+szf7pD3PNDCaI/Om5jmvHIyU7p3
         4IJYq6Odc5/9c9XhMV5zPjsD810imQxtWQaQGfmuFBGQ0QDWyevPU1a3x30XcF0s93rX
         AgVEicC8Lb1Iy1zFkexMBXjj2+vBNMZggz4qLJaZPutGqPVuq+EE9nBbGMTww9QTBbsl
         CyHKfsYm+U3l+Ei4bVL4VZSae5l1pV4Ij8cImRouqUd7PwlDT/nhnEYYujt5rKTF6ZsM
         kZdqqZoIQszKu/2FiiKmYONEdfxH3EaVXZxekgNZORK7DOHd3/EOrQsNlPhr85oKQ2LE
         mpGg==
X-Gm-Message-State: AOJu0YzyQgIMdRsE+4L2NjKfHlBEPHBmLntWMs+zVuimbkGjQ9rXhHxh
	MB6XD3B6TQ5OD6ofzDGngg==
X-Google-Smtp-Source: AGHT+IGY5Xbs39tKxYBmkdFpZ2jA/z2asMgDIq62w/t6lDhh17EFeuuxE3jZ86dk2BbT0yS3/BtY0g==
X-Received: by 2002:a05:600c:1c25:b0:404:4b6f:d70d with SMTP id j37-20020a05600c1c2500b004044b6fd70dmr1509198wms.17.1697710500407;
        Thu, 19 Oct 2023 03:15:00 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.8])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b00402f713c56esm4109300wms.2.2023.10.19.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:15:00 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: sm750fb: Remove unused return value in display_control_adjust_sm750le()
Date: Thu, 19 Oct 2023 13:13:36 +0300
Message-ID: <20231019101348.22076-2-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <20231019101348.22076-1-anonolitunya@gmail.com>
References: <20231019101348.22076-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modifies the return type of display_control_adjust_sm750le()
to void from unsigned long as the return value is being ignored in
all subsequent function calls.

This improves code readability and maintainability.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index bcdd291d25c9..83ace6cc9583 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -13,7 +13,7 @@
  * HW only supports 7 predefined pixel clocks, and clock select is
  * in bit 29:27 of Display Control register.
  */
-static unsigned long
+static void
 display_control_adjust_sm750le(struct mode_parameter *mode_param,
 			       unsigned long disp_control)
 {
@@ -70,8 +70,6 @@ display_control_adjust_sm750le(struct mode_parameter *mode_param,
 	disp_control |= DISPLAY_CTRL_CLOCK_PHASE;
 
 	poke32(CRT_DISPLAY_CTRL, disp_control);
-
-	return disp_control;
 }
 
 /* only timing related registers will be  programed */
-- 
2.42.0.345.gaab89be2eb

