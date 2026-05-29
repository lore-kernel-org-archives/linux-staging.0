Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120EF33B97B
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069452; cv=none; b=aTS8DZ5MqMHubQ49+AFtB+Ds2vLjORAAfFRUNFyZ+eESlr1Eo4deaSfzjfKIGrLEKQlXQfFhHG5X1IAZffQQsGlCFG8Bjg5gF/R82uasl/hYlKhRO2HT8XiiACTZg46JYR15dl5merOo9HQef0p+RXVDB51C6y5gXeBuGnPhfoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069452; c=relaxed/simple;
	bh=hp5BUUTX1mi4ZEb9cz65rJNqx9844qbddMA0vSZFr74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MIKTFIPkW+OpSEFTxYnFRR+uazeDd0sgIUo3xyKzNwa/5wZUq+IzL2ih/UvqEOYIkKob2dTZMxfDqfsSlNmftX21H3gpyPMbODIaHnIRbN7zZZr7OmPIpC4g/3ZDJOJeEKsWpcLytUPD1UvrjgWEXSgTySptgM0a58wMzUytOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk3qLkm1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk3qLkm1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so1063526a91.1
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780069450; x=1780674250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTALgua40eSJxC5QPIzISf5Jcp4xUbj6pCCeQN6u3VU=;
        b=Gk3qLkm1C4ogn6GZ+tF0nXziSMJ6oQMoiuGQ1CUh2Nah7Rr4HppoCWrlobkodrUVzg
         g7+5rZgP0LYFMGVVeUYYP3zQSoou69gHGdkFqUO2a+MPC5rOPZAHnMCgKtqSe79Arbj0
         aXsd2MemL9n/BtkPKi1OM4+xVvShNk/2Ah6JktGeRk29kWG/s1qVJ1+OtJN3JCypASXP
         6M5UAvh3XEMy8Z6ougXSGvlBel2O+8bIU6r980TyWqg7ZwOPjHuTDEfNNe7xmSxDwd//
         JzPHsJapmRL97CjBjochpHEBnQ+rrtG3poSk6hYtmWHJkIfd0ek5Tk9v9EECuIHUIs5n
         xtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780069450; x=1780674250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTALgua40eSJxC5QPIzISf5Jcp4xUbj6pCCeQN6u3VU=;
        b=i7Kszk87wJZsMJBE2DcOa4bU4+YoF+Sh0fiRhc6khNrLKtbVzI92Oiw7DE6IJ319/6
         0ubXwOgTyj8CVpVhzMLPSvTZnP5DIDFionTKdSSA4k9jA+Ny9hW2SBEtdxSh6sp+FuSb
         g2VsXG/yjjMNfL9LqzAdXtqzXpnNXc/71igjnsEZhCpH7Zc8Kffe+XGfOhM9nEYJiyIL
         VXsychN76A7X2b2sHJ/KurVeFf3/Zzg3054EztawpiX7iH8ggikfgXsgmheFkzj/i6Y2
         S4yU1zjeYjFmpJbIGq/f9n8rWalfnc4oBUKqaPML6V7LjNByzO4cOL6Zh63QGPuPD8/I
         o5rQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zxt5FShJHNZARmz9nqFPMwFSxRMZJIlmXLZM/jxnO4DZ52ZFsr5TNnfxSF3N1FPxxwalpGsakU8VkGW1r@lists.linux.dev
X-Gm-Message-State: AOJu0YyOJIW0z2dVXlmt1260l+DwRxzqkyp7bfhTfyQDpKl5+Ukdy4c1
	CN6oLYKExYJYMpHlTdRlKZknAKkYsY9GJpJrjPtbCAA9ZYRJTB0BgnoX
X-Gm-Gg: Acq92OH8HF956DMz6nFd9z9rwwzdjm2HEZ2r5hSgcqtNsr+aV79Pe3nqc/VJPQ+46Bd
	hvE24LAlWWidwclehCLuZbP6XS7hWv1lEYQOEKDH1jB2zndJ9Men9dY5aFcfBzum3Kmq2YzxQQ2
	l+BbcjeOiC2h7eg/uXHVZ+V0mkGT0s7gQn1PNBwXIkfSd1LiXpu+fBCeyLBLPZgDkNVATJXaT+w
	lOkQEaSDZKxXvc2ux70gZi6q4MHVCsJDlyIwKd2rgIMU4xKaZJRIlQXcmebuX4KNXO5SwAbl/wH
	/XvXaxkGrC86YXPvaKqxNGia9Q6yKcVmtOsZzCBiQgfgaV5kjv/A0wQUJUf9cji1UqAhpBJT57a
	WMFtwqZOc9Q2z119+vD0K1EedMoX0hdMP9k61STy7FIrAltdvkErKQmYugqMlFvefFtd00DNH/i
	+g/8fzRKjEbzjIocwvX6dcyHyvta3By5T9gUpCjav3i+H+
X-Received: by 2002:a17:90b:4b4d:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36bbdf7d3e7mr3551853a91.3.1780069448756;
        Fri, 29 May 2026 08:44:08 -0700 (PDT)
Received: from mohan.. ([2402:3a80:183a:585e:7822:745a:cdc5:a9a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe192c34sm1076279a91.11.2026.05.29.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:44:08 -0700 (PDT)
From: Mohan Sudhandhiram M <mohan86108@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohan Sudhandhiram M <mohan86108@gmail.com>
Subject: [PATCH] staging: media: atomisp: align block comments to match kernel style
Date: Fri, 29 May 2026 21:13:57 +0530
Message-ID: <20260529154357.18066-1-mohan86108@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding block comments that did not align
the '*' on each line. Removed the custom banner formatting and replaced
it with standard kernel block comments to improve readability and comply
with kernel coding guidelines.

Signed-off-by: Mohan Sudhandhiram M <mohan86108@gmail.com>
---
 .../atomisp/pci/runtime/frame/src/frame.c     | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28..66161942b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -17,10 +17,9 @@
 
 #define NV12_TILEY_TILE_WIDTH  128
 #define NV12_TILEY_TILE_HEIGHT  32
-
-/**************************************************************************
-**	Static functions declarations
-**************************************************************************/
+/*
+ * Static functions declarations
+ */
 static void frame_init_plane(struct ia_css_frame_plane *plane,
 			     unsigned int width,
 			     unsigned int stride,
@@ -75,11 +74,9 @@ static struct ia_css_frame *frame_create(unsigned int width,
 static unsigned
 ia_css_elems_bytes_from_info(
     const struct ia_css_frame_info *info);
-
-/**************************************************************************
-**	CSS API functions, exposed by ia_css.h
-**************************************************************************/
-
+/*
+ *	CSS API functions, exposed by ia_css.h
+ */
 int ia_css_frame_allocate_from_info(struct ia_css_frame **frame,
 	const struct ia_css_frame_info *info)
 {
@@ -141,9 +138,9 @@ void ia_css_frame_free(struct ia_css_frame *frame)
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-/**************************************************************************
-**	Module public functions
-**************************************************************************/
+/*
+ *	Module public functions
+ */
 
 int ia_css_frame_check_info(const struct ia_css_frame_info *info)
 {
@@ -435,9 +432,9 @@ int ia_css_dma_configure_from_info(struct dma_port_config *config,
 	return 0;
 }
 
-/**************************************************************************
-**	Static functions
-**************************************************************************/
+/*
+ *	Static functions
+ */
 
 static void frame_init_plane(struct ia_css_frame_plane *plane,
 			     unsigned int width,
-- 
2.43.0

