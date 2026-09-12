Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47CD2ECD1D
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175466; cv=none; b=ApiiI5WNtNj3g3rTdShQJnW9jnwF8gu0Jz7GmbVhhJA+nI/3tzTxQdM1vYj8ne008PbhtNAHEfIJFg4fAQNrdY3v71OnIOcJ+u25MLlVvKF3vBFDfHB72l0ELFOfZVrZdieBSddRg1rLrR0S8o8TQDJukZ+UENEzDLO1V6ELfx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175466; c=relaxed/simple;
	bh=3swsNw31lSkMLciZcYqtrvV/YSRJx0HnmGQgeLeCvZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRy12WQ5dU3Oj96stMjSAx8n3Uu8toZ+SsNYMCIBaBvwflPNHB8pIdZgIvrVh6qpKPe58pqPycEJ6DEjLOPk1J3cXqpRO41sEP3bskbomN8EOML9SCa5ubCEuRt696eGqPzb2WlSRUS+YJiS6/llTOhmSMJ8HQCRx2pmcCmqV7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCSLuN30; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCSLuN30"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-791b0163eb3so1085176137.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 18:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175462; x=1789780262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/LDGqOYLFoK6KgWIPFbEeA32vwB4mka4PD8SBisxBU=;
        b=WCSLuN30YXNKBvwfvKAdj/76gfyIsUAZpXo3D+iurvF8k++sRoxnoVY18xFMuTQQzE
         FhMPaE6PeL4zad4/dMJtS2VfaBUes3M0wYCa0ecxo99MJ/WyuwOUbTGNtUhYtnMlH/+z
         +FheOBWQtx9sJTmoEUS/oN0IGf3TTMUejpeHsn8CoeuNazYRvthJiYj2uLEoppVHNfxy
         70mNJHhNBvCz+BbL4nTYGbr9dwuXvw8whWyBc0Exnacl3+JyNQIcV2QjzKn+IIsqw4Ho
         QxJr9en1UxDgShWudVVsRkSTT0icjv2cSLC9ZDQI7Ssh5u6j4tSjFMClVdmlGmj3xtMr
         JBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175462; x=1789780262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/LDGqOYLFoK6KgWIPFbEeA32vwB4mka4PD8SBisxBU=;
        b=lTOOPx0T649//mlQxfuzCV0r2jkVhK2ohVdM+g7HmsYuMUW4PZyMr3o3TboXG27SjH
         JzTY3vxAcwrOuM1E5uX+KRWDjXI+Fbx9OvzoiG8ozYKn1ZpnKpkB1a8kmJkIp6kjHIE1
         mNtx9fPYwNG2r6nIBqG/kzaOzzlnD4KmLyAA7NgCIhG8E2T0al4G2IrPsUAgV5+9Q3xJ
         UAM1J0ULzi0h2lDcqPANAgi2i81Vjw9AOZNhpCMcp6I/7eLc6zG91w/K9u1G3B4ujvWv
         W1aw3KIypYB+13xXy2+fzKyp/cYyCvWDDXS6CehNw7oTI0k31Cq7misqlY5aJ9S94kzC
         racQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRwyaDu64BRJHLDq5I4R2+c++Ci4L6UjB0LNOIvEqVEu71IyXMi1uQjGNFltpz37JZIS8s9mV57WkkIstY@lists.linux.dev
X-Gm-Message-State: AFuF++nP9mMfBS/lwhh8tPN5ZHSu/fRO+QPkysEtdKo0vr1GYklzlsfR
	CUjv9m+dboKPib1wyRnXOYxTY7Qzr8QVZocqKST61jAopzEtW03vJQ45
X-Gm-Gg: AYBFou11fHHXKUrZIQ97tnGQ5ww4eX1d7ZNkRh3yXnfcZxrWxJiDj2P1xdYeBfActRd
	3lT9pd0aA+WLRyCO4DTree2MzpckTeSoVZgg8WC2lTENzD1Ydq8fqei5f65tTZyU39TFB+/2clw
	/DERz0DLSrNETU1TjOyMHlCoxEjihkMWVjARaGApX8/zrqMUKlFG7zF03N45a64fVzCWu9ku9+P
	NEObYSZEmdcZevJElYqopCvG7a77ztgb3w7BtpyluKjhsrIjgvLyzVtpteGkM5pj5vELh14dMyM
	mCzP0D7OQVZxCagEVFIC7Ril/VdGBATSoMXPoojdX8sWNsEjdgyPZ4yhH5RSR9+tXpmIPBjxSEr
	mH55aiYcBh3BM5U0e+SzxB81ygpjfiPX65tZElnVu8HRWdbeOT3BVj9ZnKVI6nuDnWKWNKbRSnA
	qCJ430vZ6SeGugVEvQHsrmDph6jKyP3ylSxSSE/6XyE/m6BONZ5hUoETJCw6B9VuZ+5pVPp2y7e
	M6q0q+b+Jyx8NE81hJBb1pOJXZ7R7tuDNYH4Ng=
X-Received: by 2002:a05:6102:32c6:b0:790:9e43:1236 with SMTP id ada2fe7eead31-792aad5521cmr8814389137.9.1789175462127;
        Fri, 11 Sep 2026 18:11:02 -0700 (PDT)
Received: from kernel-dev.servicos.capsula.corp ([177.105.242.194])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982ba1105f6sm4625862241.11.2026.09.11.18.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:11:01 -0700 (PDT)
From: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove duplicate blank line
Date: Sat, 12 Sep 2026 01:09:36 +0000
Message-ID: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary extra blank line to clean up code style
and fix checkpatch CHECK warning.

Signed-off-by: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 8e8433f5b07a..370cd8cac43b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -10,7 +10,6 @@
 
 #include "system_global.h"
 
-
 #include "ia_css_isys.h"
 #include "ia_css_debug.h"
 #include "virtual_isys.h"
-- 
2.43.0

