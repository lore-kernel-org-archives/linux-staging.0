Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C918046
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335182; cv=none; b=QvXhg7dvyB/wD0UXrxXQORx/rwF6nyN8GEutxTLruvEh1s7hEZ9QP95YrS4WdDt4f4aG1++/34k+SECKtnnECcDkE7nyDwAIHJGD20XQSSgWNlFqND6ybXeJFZS7J/qRdZDs8WBQhG96HdCw9lOMNwz05fYwpCm6FteicLADtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335182; c=relaxed/simple;
	bh=+OdeM7Q25FxSsSEoW4motBu9ZOsamZSAM/sERqWT5bs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aq6Lho4fOSH/DZNNEqnDB2xjboVhbS2d2Q3wMCjKtLqndyFDryTMTePBm+eNeUtTVztUuuRo/FYr7LlEW1S3lu5rAxrR5Clfbp1/WjwCcRe1AUQ+hun0+2guOrYapIcMmenoR09mC+5wjb9xZhLm6W7R78U1i+yKZyG8s1bDN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7y70x35; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7y70x35"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4265dd11476so1415065e9.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335179; x=1720939979; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6pDyIeoKRhiuoeVnWhq04lCY4A6A3zeGOBt63c/XD6g=;
        b=A7y70x35Omt+kvuB7/HU6iVpKspJZLvpxCYg6KMNm64lOiMNVzOvcd9/t8mxAaIWqj
         rHK/cftFRV9ONAKEHzSyx89YhT8dRu0KaWtomNLZUMhwGxh9gNdp1djBqS4J9vOZD99+
         RLTv2CM271Rf67RqVvW0uqndSKwVsdQnIa4gPyhXZ7mDtTP2Mwt/kSxE7VuuM0bIfMoT
         +W907UEBdWySJXf/nnEz40qVWpaM+CjFsQvArWMaLyp1paiWAItjz4VSZhLe4aPd41Qy
         njJe13eAfPdVvV1RSu78sQ7N939QJe021UxgdeOERUHUnbHl96Gp7dxVUpcJ/VwTgOlp
         9vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335179; x=1720939979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pDyIeoKRhiuoeVnWhq04lCY4A6A3zeGOBt63c/XD6g=;
        b=Eelv6IqivVII6M8VFPDGNXmACqG87khJlQxXbPToMjwau6MgWf7s9ayvCxzzJ5DzOM
         OyERQ0MBvnFld/vQvRMlX+2xXgqjeWwJsTs82ETdIoWF4usr1GvAPX49nahczKBhaniO
         qqpJrcj99q8EOeWuAyTH+AVABzzy6PDdPOZ9DNfwLBGSTZo9QfHfvl9oVVa923aCMayX
         SOvb8mc8HuwzYz64JdGhOvKnzGyjlK9lYrZGFGV3JTMnJF8L8+lMytXEzn4eKIIRWlga
         CQRCwFAkdKDOWLOo/baGZQVOBSmvzFHoAaqIEDu0tfXW5kdbE5e93paRj97BNOydThlB
         0w0g==
X-Forwarded-Encrypted: i=1; AJvYcCViu9k40ecRLCALo6ZC+VSaN4f/1WaGZOb1rzbScomAZ3pGAFMPnIXvvaVypPfXwf/w9JqKhilIIzDl16euFvVsdcuuQy/tcq1xNTvslA==
X-Gm-Message-State: AOJu0Yz95I3Q+E7XV0e/tYdOA/icYmxqd8CVjreNtX5jThWmLUmJGIRL
	x0297ympFVwvQPN0hnh6NouggBXCBiIIdbCTLXoEsCBuRZU3HraHemlrTg==
X-Google-Smtp-Source: AGHT+IHWHB8202JzynzPEhTs+hGiUNfyPqzhtxQkibO3EG+cddHGQdZuHA9BmvdYc/DgzSyYpk3RvA==
X-Received: by 2002:a05:600c:3b17:b0:426:668f:5ed7 with SMTP id 5b1f17b1804b1-426668f622fmr4682225e9.2.1720335179082;
        Sat, 06 Jul 2024 23:52:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42659fc902csm68702045e9.5.2024.07.06.23.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:52:58 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:52:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] staging: rtl8723bs: Delete file hal_phy_reg_8723b.h
Message-ID: <04db91723915fc5e542a49b37d07ac85f1f853f4.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Delete file hal_phy_reg_8723b.h to increase overview.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/include/hal_phy_reg_8723b.h   | 13 -------------
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h    |  2 +-
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h

diff --git a/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h b/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
deleted file mode 100644
index da549b773243..000000000000
--- a/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef __INC_HAL8723BPHYREG_H__
-#define __INC_HAL8723BPHYREG_H__
-
-#include <Hal8192CPhyReg.h>
-
-
-#endif
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index c1d7249e3e9d..f9ecd9047d52 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -17,7 +17,7 @@
 #include "rtl8723b_cmd.h"
 #include "rtw_mp.h"
 #include "hal_pwr_seq.h"
-#include "hal_phy_reg_8723b.h"
+#include "Hal8192CPhyReg.h"
 #include "hal_phy_cfg.h"
 
 /*  */
-- 
2.45.2

