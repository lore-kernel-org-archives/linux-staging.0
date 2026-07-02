Received: from mail-lr2-f3.google.com (mail-lr2-f3.google.com [74.125.230.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B285496919
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000583; cv=none; b=TVnmDZwZSi6Y4Ucs+m0nDnoHaNN/6N2N6BcldX5PE2GPA63Go/Q3xu4ojkfx9Dnjg88SbkDTnd2mFu9wIyRY8Aw0AlI5JCJYK8FeHydH1iJEBIXo15ovzcCoPoDqIZU4oJTmTlMmZsrjxziLGCOAAPN3RedOADJP1+5LRuod98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000583; c=relaxed/simple;
	bh=ofcp95WVS9ojPLv+paM1E5y4nSDSK7HQFokrbJcbD/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDxL+VVNxHQ2PYtFI3tFZ2OftJzhTj4z6H/mWJ5QdxRpn5zQ13jFBT0++Xf1kngYyvzy/MO+HBu/IwfiilBR3Mb2u9RpmKWKUgznn76Noc6qeGv9bvSn6xeiqxR6+eBXhGcRKx4C/rH3b6yPFZhIIauZClFGAuVnE/UthZ95V+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSxteyQC; arc=none smtp.client-ip=74.125.230.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSxteyQC"
Received: by mail-lr2-f3.google.com with SMTP id 38308e7fff4ca-39b2973e915so8842491fa.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000578; x=1783605378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpnLgxv1t8Wgzo0tLn1v2lEaoPNDH6auvhtbcMoSR8E=;
        b=OSxteyQCRgZqTWvDruJ1r2fw1hJCUtRgmCWe+zvKJw36E7RJfnEMPsrxDGyEzaPMZL
         Vv6YuMmKiwk/JYlPJLenN4+tdwh5UGQYPG4C2TmhEsVtZ89LxqhMoNhYHMd46paSnbqF
         CcvwLVbqaPBF4Qjug417woM1ToI3INfoHnBpU+VU6Sg0i4TNBr7sDNRZAQ4K09fpNb9f
         SIMY5rJnOREaJUW/od/F4X/dgg5k7vayxa71g0H5KY3DY6IRHp9t6QBZUBYNk5JmeROX
         +TiztrxXJOuIVxO5OwtjFlRLBe50PcBhuGW874oHG8bDkPjVMJRgQxQb/ovwN5cyTPta
         4Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000578; x=1783605378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpnLgxv1t8Wgzo0tLn1v2lEaoPNDH6auvhtbcMoSR8E=;
        b=SqT1bEQ34msHjz/h/iRjQDL0QNTeGY5sSkBQ7pIZjtAjZaSIwr41afpz5/JnAuE4Bk
         T0RG9bE3uoX3++OSKDYcKvhHptfZpBpwAHko/rSM+lfYgCFEh+MEytcIJ4ABQGcjO2Hh
         0YxV71RIXcKM33DcMKXQO7jyX5l6awZG82SzUHb003bUsOsMjwE6ndy1hr01p9+63ctN
         t7Y5PLZWNlEMH2p4CTvceKAEWaaSzzOlVoyJBtKcdEbbKq6fSwXT3N3TDChaVSgS5ilh
         lVsi9VbLco45wnWx2wBTP705TIwNL2LcpRyt4HUqqjspAO4A8CiX6BSv8oq77wdnADEs
         SEjg==
X-Forwarded-Encrypted: i=1; AHgh+RpbvzPMA5ruO+aPA6e7XJyc19zVUrJNAY4bJR8RSHO2pjo6Er7IU2ybsZTlaZySWKqHTW5GSi3QpWWHtVVw@lists.linux.dev
X-Gm-Message-State: AOJu0YwN7dWYd7v9eV3/0lrdB2I13eey2bLRTrU/vmlQ/JgdDbhA0MPg
	IsVE6XsnpiW21n6CV8u3+Lj6jHPQyiAuRevwbkTQsfuVSXuP/jQ+KCUL
X-Gm-Gg: AfdE7cnLAAFCFs7N9kv5XRwQcHI1tQo4K/cm92+kBdGtTDhYpevis0jjJ5ViL1E/nzB
	j48EOlKkY2FkUQNVDyQVUNoGmNu91USK+RjuMn6hFuWDe85pcoo+nRBaa+JPS54XBII+1xFciqn
	CZYjUw8aOjw8OQ8MkXXKkqRve/WKm29fahQ1j/e4Eca+7Y/F0avFjVQKcO6TUS/dRtHp7yaAiHJ
	EBJGAkOWI0iQOYOajE/VcH2zOEPmGpzJeOzlZjUlUTb/xcsXs9PZ0hPSn6SloEHHUfqmgp4/69r
	Q0l7viDa3497bgvp4SRigisPiOjK+ikUl7puBmeL8a6o8isnfGpWmo1Z01dTOOz5yVrI0Sxf5XL
	ESgHFHm+ZTs5vtjG8KhbI0EsI5VyU3I1VS9YWt2p5fPmsxiG8c8RsC7Eh7Zm+Fhz/uzOxBEEj1R
	idHjFTkL7UMqezEPv/aBA=
X-Received: by 2002:a05:6512:1316:b0:5ae:b918:af30 with SMTP id 2adb3069b0e04-5aec67977cemr1595141e87.4.1783000578127;
        Thu, 02 Jul 2026 06:56:18 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:17 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 2/3] media: atomisp: fix block comment formatting in ia_css_mipi.h
Date: Thu,  2 Jul 2026 16:52:29 +0300
Message-ID: <20260702135230.19030-3-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting issues reported by checkpatch.pl
in ia_css_mipi.h by moving the opening '/*' to a separate line
to conform to the Linux kernel coding style guidelines.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_mipi.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index 9fb178c8f3a5..e79b4de8584c 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -7,7 +7,8 @@
 #ifndef __IA_CSS_MIPI_H
 #define __IA_CSS_MIPI_H
 
-/* @file
+/*
+ * @file
  * This file contains MIPI support functionality
  */
 
@@ -16,7 +17,8 @@
 #include "ia_css_stream_format.h"
 #include "ia_css_input_port.h"
 
-/* @brief Calculate the size of a mipi frame.
+/*
+ * @brief Calculate the size of a mipi frame.
  *
  * @param[in]	width		The width (in pixels) of the frame.
  * @param[in]	height		The height (in lines) of the frame.
-- 
2.55.0

