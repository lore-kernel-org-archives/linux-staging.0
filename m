Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5283F4851
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795589; cv=none; b=LdbB5gdM8TovfoJWYDxI6XnhUdhMBbgB8scn2rraWWUESzhX8GtngqzSU+++S+aKa61SvTTSEl6yPJ4XC+JSc3Tel1a5hJesNQecEcwSQKcthccie3j00e5aS/H+3vqAkqcASZvCUaLI7DoVpUmUdpkiGTmsz4vPN/kUAATq/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795589; c=relaxed/simple;
	bh=t3LaCYvGa1J0W8y9SDLscTANfvqgNL6GUOc3eE8EHDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VNIWy98wpo4FVVKm3jZycmdkfahwRw748AY1brasluMsdn20w4DmCCnDxMpiEHhwZs2FXY/KPy75LwsPxxzbOSxBsCtcFpM2hqWbpW/BOptljjYcYS6FpjYkcu53p3pPEFRI4MeCx0jVm5ZCKz1o4UcUs24bRVehay/mOIsOaDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3BVyG/z; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3BVyG/z"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-396779b9a7fso10525491fa.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795587; x=1782400387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE63r6EER7alhbSLAaD+Ak+nUquf6xxaUXbDMVJJIMc=;
        b=h3BVyG/zhoHMMZuCBUAk2M58Nn6c8EuXkPGhH0T0t2yb1Iz6oOVZhSDwfD8ltnZZIT
         HttvvcSaBtyLxtr6u5TPvV9ulKwbCcQqEMy/o0uoBb7pzV49lubM4syL1EiRor3Kfw56
         C1cHZ8Z4PrxTfsZxHcZNRWdZNfxVuAz7iQnvjbQwXj+e8CtKbX/lY0IB+lLTMLV2robz
         UlWdJWVr+yV/zfJXC4+Zp/pjfO5nSMR3N3WqbvFBO9Tx8p8swmlR6SlS8Odvxom2NPqz
         IbR3HMLfYWrYtj8a3B19iaVRU+d5KsN/ngE8IIL28jXmJJ0UxWQ5VSe5ut1t9kYsEYu8
         WwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795587; x=1782400387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wE63r6EER7alhbSLAaD+Ak+nUquf6xxaUXbDMVJJIMc=;
        b=spRY/qny6EvbJCs95nkxbltrZFgEpf6OY4llVMMYIeGzo2zUj37ncVFDCY6v3CfC0+
         cus4bvhIyUNaIGL2okXfZufqWeCNDyXy6ulk2SoNqX2bEhj9MJrLPefEzKgUdVqSTD1F
         qybQjanN95CvDdawWvzN411n2PZI9AuINNX2LhDJDrJVewcXtHUetEqbtBSdnYe0mpzw
         FD3BMZtL+/q3bYXvehY9qaCOjzjTP3VNShfAIx+bx4Xe2BN/moToWux+c8SvTxGROKoq
         EQQXz5rnzpZTrZ6z3P54gnk3Aji7Vw23rtXdPFC8VCu8d5HW2fK6r71ajmQ2tlRaUCPA
         jRtw==
X-Forwarded-Encrypted: i=1; AFNElJ+Fi2WxOe/3vf1NyYM7p40U6OEsuDSP+YdeA8H1Tc0tm5sI4LQAtIChdeWMU8kiAffvui1tR5mT7HETn+cF@lists.linux.dev
X-Gm-Message-State: AOJu0YzTbRfrivheL8ra0sjLpNC9TWncInpnzvBdgkZczE0SsBx/TE2e
	8crHe/lOOCEA+WpBaY+XpkEdXcQt4A8FcWgZXHi8Uv7FAXG+dZNrHydh
X-Gm-Gg: AfdE7cn9S7Cz2YJMud5PeZV8GcUntqQ9P/vv7My5qu0WOW4fh+BgMb+eCjYXlaW4F61
	SUohzYYCuuyPhOC+UHwWnhX/NpxKrCrmz5AJT9kwoQ2pGXvISZ4Od/wDugTjL28/tnBVfbdq7hv
	fI5KPCSxuQ9NEyjrSInOzEZW3cHxe6yaoh7YBTTE3MORCvG8Tp9QRJAbO16WHYQ3wKY8xcJ5Wmd
	zZseLE/RfZ6/jEjCFr9CZcQfqdhAVo62VsXr3IY+wwLNjUI0eNLMd5V6HxrlQjqKAos4I8I0rVi
	/df4NjKZuaKe73u7+R4uTYrweLuuSG+zbRinnwwqv2x25GmEmusGODY9aVlOLuJqowl5JG/jhva
	vcst9RLDHIE8R5TZlahE8FSFPWz+tKViU6pbIogojKX/yZaT7Q8GK+hGRFMAjGsw2FLVDtaaB8M
	ICI7Avw4YZEiYBz1p/+F1zrHuHFCuvxc3HSCUVUu+lcUWz8OWbiEe2pn22vCQyekYD3oky4PT4z
	tgXl7CKuPs=
X-Received: by 2002:a2e:be14:0:b0:394:378:b53c with SMTP id 38308e7fff4ca-3997783eb06mr12943281fa.29.1781795586492;
        Thu, 18 Jun 2026 08:13:06 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:13:06 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2 3/3] staging: media: atomisp: remove dead platform_support.h header file
Date: Thu, 18 Jun 2026 18:12:46 +0300
Message-Id: <20260618151246.6678-4-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618151246.6678-1-igorpetindev@gmail.com>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the platform_support.h header file completely as it is no longer
used anywhere in the driver and its contents are obsolete.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../hive_isp_css_include/platform_support.h   | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
deleted file mode 100644
index 473d8d4fb9ba..000000000000
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- */
-
-#ifndef __PLATFORM_SUPPORT_H_INCLUDED__
-#define __PLATFORM_SUPPORT_H_INCLUDED__
-
-/**
-* @file
-* Platform specific includes and functionality.
-*/
-
-#include <linux/delay.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-
-#define UINT16_MAX USHRT_MAX
-#define UINT32_MAX UINT_MAX
-#define UCHAR_MAX  (255)
-
-#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
-
-#endif /* __PLATFORM_SUPPORT_H_INCLUDED__ */
-- 
2.34.1

