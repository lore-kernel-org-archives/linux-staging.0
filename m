Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E63D9031
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445087; cv=none; b=rnOdPfJAxaJvH6HrLfaim8z4tYyzqzX6Hmm3xHqOYpPW74eLfhOPxf5SZa4FUkRaAH/NHmnHS6ceHeYrHRNuI+wH3q+0TTHusPYlrLE8ZAf2OLGgkmHNH/9kL+OehxtAlS53YXNENy8H8NMQwCUsLxZx4d0VO2DXhaf59gTeaoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445087; c=relaxed/simple;
	bh=YU6O3kng7/BNGDBoIbt7jkzWS/bQ7BgWCpHm2cOJ6P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J//JXpib5uETGhNMXWFZnM4xD6eZjgK0MrAAZhyGFgSP958HzdiCHID6TEnsIKNSC77YSsWC/QLJTZioK/7R2rnKMNA/fjvD+5Rx7SakHBQ0uXAAlFMhpuZN++NgjO8W2rgDzooE1O6U3E3i30kvJZDJOJhWD1AIPVsFySFtYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsCdyb3K; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsCdyb3K"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso11958305ad.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774445085; x=1775049885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogGgcTCPsfVgHz2kUeNqvCykR2TWzJ60B9N6IFrUyk0=;
        b=PsCdyb3KLWxTD0eaIy22MGl8kC6DALntQPXbULMDG1KKT7f1f7DkZDMQ7kYfEZ8L4u
         Xm1SCTfUOUJdBKZPIegYYjx+q4hebAo7fqfAcL6jyA3V09NAnyX+cnCdrEn0Oxy2/2ld
         92E9aDWBV9/kGozMJ3eAAr/xxKi0GUT7DjW9AoKnDUlg/8XDnJOuIVwfwPD47NisGC5G
         Rzs4+HM4H1cu5AwzReLFUGnrWU/jrgTz202NsDueP+Bs0YTQM+MzzyWUTLBdy3eBSPVB
         Ud1o44H/PR/OiQkKI9wIawSEY2LX79k7JA4Gus0gYGWbvnGI3I1ihIlwW22UK8WpIhse
         7cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445085; x=1775049885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ogGgcTCPsfVgHz2kUeNqvCykR2TWzJ60B9N6IFrUyk0=;
        b=aTO2GaR1DTLQgu6tK4MfmfHm4pB/+im4Eq/tXt5flXaDvTwzY0bpYJrNwSXjiMdMo4
         PKqWQDw4AP2Xx9Kdci80avpH7ui/Dip624g2AA1pvAHf1WxIBJwuErl56jl5kLRFGl9x
         RAzWTusl48OCu+8CZCJsrlXPDR6QaHQMDydBHGs5rYhLORsj7EstWbNiTIt17xbwQKXC
         kCVFFze63ackcfvbe04aVCSlOUv9uQn00thPZVGFwWtLl3l85DKyyibSWKl3du06fNf5
         +A3CKxIrj3hbMGeH42Y8hfOiQghhJ+LA7fceqksyHM3awcbbwbQW/gFEOMEMmwHwlZom
         rxrA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ30I/OiVjQsRrVOskZ36j809fsJDvMOy+RRqS6W1DGp/dem0eepMOwIAJt72A6OPEd1MXdNrsyO2NW+th@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7Cb3/79kvKdPiksg2uihAbI+fcvbhMbg8iJymHe2ImZ6iqtQB
	8/TZA9DkbUbnJWg6yFWHM4P8Jrxp4C/9oKqpR1iGpBkcIsn7/upVQudk
X-Gm-Gg: ATEYQzz6/QM1ET45esv89CKQc7IoBLZoFdCday3DGDox1MYhWWmUrqepj5wmZHNE38A
	gtSCB6sm16U1qfw/dfC+grA6eZtsmZ5e+g+G1TLUBKzkZVQ3JgyQxFJXU+N+X2V2ARc2ezW5y0R
	ntR0tVO6vWrwtLP1Vt8BTuckA97b4czQIjDnLvEWoXACD0RjSyDaoWTqYw6T3j03qNt2NJRzDr2
	KIkvn1N0sDHJJXiFAqTO43qvTVRbTyuusmvo1zQS9UuLJZAWen3ejvJfKoAOPgLjwLSOolOf1Gq
	fKT7S8FpGD/2wvEv/d55XSKUoFAoP7aVqlbFfxOQ5KoFHbzGUJ0YExeBRi3hTeJcUUX4k0ODs9P
	pwtTc1G21c5GVmv799prCJZawYff1yQzbZABeSvZCELyHcwmz2NvkftqMFqXe70q9IfPWxfZe/U
	pCVzg1YuFwLGgO+hrNhdS7wkM=
X-Received: by 2002:a17:903:3807:b0:2ae:3d7d:d905 with SMTP id d9443c01a7336-2b0b09f73ddmr43803375ad.23.1774445085188;
        Wed, 25 Mar 2026 06:24:45 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm40943945ad.16.2026.03.25.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:24:44 -0700 (PDT)
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
Subject: [PATCH v4] staging: media: atomisp: pci: fix split GP_TIMER_BASE declaration
Date: Wed, 25 Mar 2026 18:54:34 +0530
Message-ID: <20260325132434.55775-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acPQOplQWD_-saf9@ashevche-desk.local>
References: <acPQOplQWD_-saf9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge declaration of const GP_TIMER_BASE split across 2 lines to improve
readability.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Thank you so much for your review and guidance.

Changes in v4:
- Remove unrelated block comment style fixes

Changes in v3:
- Add commit description
- Fix subject prefix to staging: media: atomisp:

Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Note:
* This patch is part of the GSoC2026 application process for device tree 
binding
s conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 drivers/staging/media/atomisp/pci/system_local.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..69bcd557a821 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -86,8 +86,7 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
 /*GP TIMER , all timer registers are inter-twined,
  * so, having multiple base addresses for
  * different timers does not help*/
-const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
-- 
2.43.0

