Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DD28DB7E
	for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234884; cv=none; b=QnI0eK00fYJ4hSNPGtu1KAkhuD8NnxwKLJjhDfwe+vSiFQDekea4aEPyLHgY0IpLXXDmwXJReXzmPwmCSISjaJxiGGwXqh63WgscvfesMyXWdRfAuRjXmgCeOr1lyrToE4gfYVOxQ/1/+3vCzLSmFcmKfSeNndgvOsBKDQ5n8ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234884; c=relaxed/simple;
	bh=AsOB/t+XSLU3D6zXf9I3t7aFO7IF5+2RaXBQR2P1XXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcLUwVWmdImhdRzBnAa56+irm+BZYT+56QR9eFr4Za2AOR+YuEUYXVW7nmtrc4cDx+In0muVcNSdASIU6JhAUyxfXZCJqVCKZbLCWVi2rKJZBrNIb5E2uchqZknecQFdaMba4u2JmmzjzhJldqRZCfBmBDutUWRvQv8/2P9V/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+aNnlDq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+aNnlDq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235f9e87f78so19966125ad.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234882; x=1752839682; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feHMC4gJh/Io1aGG+AgeJkBxKrk860DvPSvkKFMxtDs=;
        b=a+aNnlDq1GbrEv4zDbLh4lQAUxz93stb1S3GAvKD+a7KmTbBZbLa+syJHSI9e//UXB
         owqElEH4eMgiD74J4GabZSWXlqcl5JGi/Ik7cJt+xaAhlac2sSJXc6+nAJ/zaW4MVW41
         EauOisMtwteqISZdehMNElH3tSL7+F4fPvL19U+PChQlU/2sBIMkcHLsZiXedAiwUQj9
         5YBSN0+WiOPzj3+BTu1YD/hxlbn1o2D0kAp6as6ruO4po0U958rZE+XWasp4kJMJmuQl
         90Tt9WuTR1XEecu0nNti3sfqpwYOHAGyD+br0NodvVVx+e1vanPxfuCBj+M8506oHb2I
         Iw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234882; x=1752839682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feHMC4gJh/Io1aGG+AgeJkBxKrk860DvPSvkKFMxtDs=;
        b=Z7Elq4Dba2CEcM2DI80T0G3J19XqqvgUEsVC4OLuw/DFB+ESrDEu+39U1kaUYc37W0
         M9hR2MSmGYmb2aCQ1OTNIWFSPqw9BLLX+ehnIVh1bAgdWv9zKJXfY9sxjQJ5jq+jmm8z
         7h8M0MhcIMjh2qlwqbzjZCKTWtFanb5insDLy0SNqlMXlqFUrD7lXsr6UB234uG6Xvxr
         VqSocj9P0vRSx0dojiZirZL9mnVxuPRX/HesHng3G+Qou9LSJGzW9Ey27O4DgrnbZSfe
         yyEjfkL2n0wCktK7xcVG16BHYm4Axswwlt32wMIp13sQY/IUOLUnwc74CIi3DgBfcn17
         DDMg==
X-Forwarded-Encrypted: i=1; AJvYcCWPZFS8IaveGStAp1P6YkXGj8b1qtnL7TdtmdFG0p2es1gSfrQ96ilaWnhZ16R27D17vNWL0seOPbRQUwYL@lists.linux.dev
X-Gm-Message-State: AOJu0YwcmYCRXL0NPW8kxR9kjDO2VR2gTKJ4SjxRB5WMLlGMx8CMrALx
	c1GlzRsTXIxPmrzfhKTjXwvEd0sdJKrrtYtkYkL07l3RBJpxgg0L5jSk
X-Gm-Gg: ASbGncto/q1N6MXZPZ6etdA9T0aicZw5lYUdHAfrlnlrT1tsRShxfs4zBERCdWollkD
	zq8l7LgTYbKom3ZIfgmLeSne/Vh6gVAs11gMi3Uagy8MqiNBVCTaixTChKdMbvqjQN743E2hQ5M
	mSKZX6pDYHcVXR2dPWoaaYcMgFpcJ1y0pvFps6aYKAIRlI1KdBkHIv9gjmkahLAW7v2ceEUbpsH
	i3gjSDPxD7ug7U8ANfrIFHUtxHnzXtwJUbyadZl72QPIsdAMgZ8yerAsyOpuTDSqY5Bq6oFzfwo
	qCFl4RU61kq7ki+LjU2pYfD5f1ZVTJaYFIPerGG5ZYkeh7fbdSTVmbaDJemfghN3vMR5C/yylAV
	9gE9XOM3XBgFcxRiAHNgYQEZvtK98YzgJf03hX7g4H1TCDQXBW6jvG8oyOHivUYSgPYZwwcAm29
	GbIsmj+2/badOlc0hVE2I/
X-Google-Smtp-Source: AGHT+IF7ICYrDWrxJPgVjVN+KoAK3tZUA7pTI4iybOd/IblO+4C+XKqVROFdlkk2YFX/ccSzZf7Uig==
X-Received: by 2002:a17:903:3df1:b0:235:be0:db53 with SMTP id d9443c01a7336-23dede98446mr35156005ad.51.1752234882208;
        Fri, 11 Jul 2025 04:54:42 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436e8e6sm46042135ad.255.2025.07.11.04.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:54:41 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 11 Jul 2025 19:54:36 +0800
Subject: [PATCH v9 1/3] staging: media: atomisp: fix indentation in aa
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-new_atomisp-v9-1-a9dd62425ef6@gmail.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
In-Reply-To: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752234878; l=1535;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=AsOB/t+XSLU3D6zXf9I3t7aFO7IF5+2RaXBQR2P1XXY=;
 b=hgFoYH7QSeQwMrGtsVENOOY7aQhQUyokhgy3cTany7wTUE3mPnp6nA0lXcZy9215gLBSNF5hA
 oTUv1kDcLFUAl70ZPCMEXALJLBHvgTLg/tiflzEltPknEvSJc8y+7/J
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in aa
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75Vfc7QsENHsaYMKau_4DU3-LmW2XaUxd=oHqTS3F3R85eg@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 2f568a7062da726397f55b1e73dadd27fcd1f2f8..f825f537a5366f6b97170dd44827436fd800d105 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -28,11 +28,13 @@
  *     ISP block: BAA2
  *     ISP1: BAA2 is used.
  *     ISP2: BAA2 is used.
+ *
+ * @strength: Strength of the filter, in u0.13 fixed-point format.
+ *            Valid range: [0, 8191]. A value of 0 means the filter is
+ *            ineffective (default).
  */
 struct ia_css_aa_config {
-	u16 strength;	/** Strength of the filter.
-					u0.13, [0,8191],
-					default/ineffective 0 */
+	u16 strength;
 };
 
 #endif /* __IA_CSS_AA2_TYPES_H */

-- 
2.43.0

