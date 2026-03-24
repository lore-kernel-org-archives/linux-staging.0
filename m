Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577537BE6F
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 18:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375734; cv=none; b=LAWoZQsXGQKNmUY4UGRogb/OGlfy8+zmbHCEKU78sTUmSC55He+5rn7xhE5JOKCXgJjr/xgmBqe5o/JPVCCopnx6w5vOgXrKS2HUyFxVM+1R/6Tmr65/tyYP2yOrkN7K4IliYcKR3cIQX8cVuOwh1mx3ICwM1PCyJsZDUeOMFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375734; c=relaxed/simple;
	bh=sDOm3ILNrUo/i+Whe0kO6hbAvPjjolJ0LB0vVGmLZVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjshOs7HD8fcVqzkCv3Qi21qi4rZ4ktjhLZFUVPWoIK1O1BqlEF3vg4wjaLWy7qSHa3PfBD/aCSES+Rb3jlDMfOCXDW/TxRWbGB40IbwguZUfRCn7EJ9d6T8NbU1KlYwVFJranuHmK2mm1yRQxEyeEMBZG9NyyodrzZMNcgtWDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daNZKoTo; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daNZKoTo"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b04d051664so47984385ad.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774375732; x=1774980532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwm/RWezWuWLRKLrKQqL0phbl67VjldslJGOJUeSIj4=;
        b=daNZKoTo5tjuRYLJT5JuVHjjIQTFY48BoUYP6tM0cb8bccAgiV37d8VDga/4AfvySe
         WW6eIzi9KxkA1IRgJvfYzp7SNZ8fWHUWCFsCNQs/2PTBHvSpnQY2E29AvconhxtBxvfK
         fi6WO1SBJyRWCkDfOou5WbHtshkY9vXCQliFFK9Kj5njnDjgfluPRnTfV9njSlj6TS15
         vEJWWCfkKolK2MimxWNL1/FIH0x2QM1K/hYOuOrrns8dPlvVJVDonAl14VHC6OW570AA
         B9Q2w5QAg4wesf+cYMdxGBqT7U6mmZ1ZXe1mVoT0j1WGNpAcI3UHtPyoYESXFF3Yb2ya
         JNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375732; x=1774980532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fwm/RWezWuWLRKLrKQqL0phbl67VjldslJGOJUeSIj4=;
        b=FLRd1f2JIZ1nkIWP/XhncRsacdpKOvURjo/VqCvaVwJ/9Y4EbdbK76gXTx2iXcmP2Q
         263osFoIjVn7VB7F2BUF4px66aZuSh9UsJEKXodgIFFw306rsPqRmVGCFMzZnSNldikP
         Gnl4aedl2geYD/xhx4t+ZiA2eJjsKfePs6NKCelsJafr2jEbvbbsJJup9R5EvhelUBBb
         InpCjH980hmrLRhVqM8WHIWgBVIJYlMvJvnOj+6eCiB+7gx0Pyyrojj69ZIcpbMAH0CL
         7Qs7ilo4uyBjlJaXkMu4VJUi5phqVGdQE3cJV3O/yQLC1YISVOzCbTO23JmmMn8GC5pP
         eKow==
X-Forwarded-Encrypted: i=1; AJvYcCWNN1R+n8cmBfH/xrjqVdJQ+i7BNK9dbXPpUvHHlGws2pMA2cS1Bk6ggG/HqfyvnfYh0nL6mujhJwd7fFwb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw502wkRnyDbhL5VB+TcGjmoabhrQBR1JWFnHiM/O6VEFd9RthC
	poKwGtX1L7u4WCgz1CiFZ7S3qfA8gILU7Px6QW7Fplb0e+Ex6D0L5cFv
X-Gm-Gg: ATEYQzwhUcqlLttJeE+cG9VWaKzuOY/jQSYH0IBBRQsBsmtiinks4hwhOq7qXaFzNBf
	l9WXyJqLOOls7Frn6Zo1V+seciPP+M2hlA33KX2UjTOtRVXYcuCtCRu0/pPDKAf/JyATmgVVU+p
	G+hU6w63tTCZrj4P5sD73uq8bn8CXRSIrVv3+SM5ijyBeOFtY56kUxWZrICKOldu0D0+PNM+uFV
	hE3KWACwtJQpvR0GBlOoH0jQZ/H17iQJHbWr5ntWQwr6yEbeGhpDAuTT9elDjyl2fYIZNRe7Kip
	Jt0J0D8kIu2yfumON0D8R2JfrLlR+Ln49ncKg9LEDsSChRDIdoTFeZzHBWjkEJ1zMW+oL4GUnoa
	740iT3VvQABfRjeerCYHaxkHaQ6zEF2lWK+QcmH9+yuftXhFXH8VrdE3FphOzjFY/TtrhWgVZRW
	gr1ctYlr3MZJLbtuaiujgV3i0=
X-Received: by 2002:a17:902:e784:b0:2ae:c529:a13f with SMTP id d9443c01a7336-2b0b0a29cc4mr5838925ad.14.1774375732461;
        Tue, 24 Mar 2026 11:08:52 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b5dsm190071645ad.52.2026.03.24.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:08:52 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	anushkabadhe@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2] staging: atomisp: pci: fix block comment style and merge split declaration
Date: Tue, 24 Mar 2026 23:38:21 +0530
Message-ID: <20260324180821.42084-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acJ6sH4yUyity0gu@ashevche-desk.local>
References: <acJ6sH4yUyity0gu@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Checked the rest of the file for similar issues; no others found.

Thank you so much for your guidance on improving the patch.

 drivers/staging/media/atomisp/pci/system_local.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..1c513ead5300 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -85,9 +85,9 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
 
 /*GP TIMER , all timer registers are inter-twined,
  * so, having multiple base addresses for
- * different timers does not help*/
-const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+ * different timers does not help
+ */
+const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
-- 
2.43.0

