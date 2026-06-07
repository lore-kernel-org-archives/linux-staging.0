Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A1F1B81CA
	for <linux-staging@lists.linux.dev>; Sun,  7 Jun 2026 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780825303; cv=none; b=jy216uXODokAedjnyWR6jiO57N/uyRXYQB10maDFEZF/uWIGh6jr2yhyza+/S1A6yahjcWXzxuD65phugq8ocPoSCzTuLk7IlOR8qk7QSVTVepnzBQxFtKpyVZ5DqJqEsnGAg+vkjrITJ1HdhV9OWmfco+yfmGEO/IQe2HB+YUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780825303; c=relaxed/simple;
	bh=QywTW40irK8IqwnvBK+h6/f+THk/pRFGPY/scGB2Nhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CZ5Id1NNs02jumZgGtInzh6wi+acgjszoU62RK5MZM1s/tvapqCh4mD7GrkzeV0L5Bph7lYPo5cssuUPl3hWOODrgVFJnVK6DNZgNf2nDAky4ntiqqgvziRMR7ngtA9NKKI5jVALrsKG7FEWbPnLGABkRF1mQt1sTYTF76KeCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=fojuQsBj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b="fojuQsBj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490a76757e5so20622355e9.2
        for <linux-staging@lists.linux.dev>; Sun, 07 Jun 2026 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780825300; x=1781430100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcUO2qlbLSpXDxVlPee2zV+Ws7mQqjUcC9V49A8g0m4=;
        b=fojuQsBjWzIRjFj+SHmp4DCa0LKtFncJN1a8TMpr4h6AW1hUl5fZapqkA+rk5JDmkr
         rB+rnJPFnpfCDxVLGaRkyNPJv4O8xQb3zHjX8zcC9JoSoxuXVG6zrpR1Zy/rK3UdEJ7x
         sqOq5aOkCeghpht0mPf/YzQwx0Gw0UUFBWz8HNWAQjoXx9v+hEHvk2Jgs7w0YdQ9Sovm
         F0UrA/Lib/gj7wiZV312DCV2/c3Oknl+4dIShgidejmJHyUWZwgJ8PWH7rGrMcwhKkcc
         adDTzJakhF7/FmuLFgpJmqQP8pRvBTvJB5DQrc0JGU0pTzahs5L1fc8p+sM8ccGq/Jv0
         WDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780825300; x=1781430100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcUO2qlbLSpXDxVlPee2zV+Ws7mQqjUcC9V49A8g0m4=;
        b=joLwiorcbb2I0OV+tY1oMalCn0zX1QNSRYd8GTpURPxEa7nZyHpq1IgfBAwWKAybmv
         RF1jOKOWmf8CHcrFuTOlVyROoduGrUtmmoOsrJ0Nzkref6+VNHrpdGhYOc9y0PdWkF4E
         Ok3bfJX0wbtwqlqTBtSIunIoaBgcClRlCCcdYhMA0u01MpCEQGwT6/HrFG+IwEQU5CxA
         DkwtEzckJexkoBZgcUWfGUD9gfHollcTEQsJ3ZUhrbWe/o6kWZNMWxQ5HPnixpedZR5X
         1dgeuwi155Y9XJYkruOwHeCedAfIPCtMfdhpn2tircxuOs27ZWR7SKfJolF0KdcLTya8
         Y0rA==
X-Forwarded-Encrypted: i=1; AFNElJ+ltNRVQ6CaRYvaz6W3qGI7r7RXvcVUALmWIgBkKZ09bIHJxn4YorH7dgvCLjrZ/aVbYhPTyLuF8IPR/PbF@lists.linux.dev
X-Gm-Message-State: AOJu0YwX2uxmJS7KyYsJ45S8yaY5l87GDv8+h/fV3W9mOpEF1VwoTW6O
	WpVGAHHP2AqmTnCFL+Sdk/SIEy4RwvmV1UBoTffV5jxnFE8Q/QsjFXTLxChBXoiKn64=
X-Gm-Gg: Acq92OEOWMz4PQ4XlHZgJ4qbiDkMZ/QitNM0IG8RZ9LbcKSMmT1ZbMR6J/sCh2S4r9N
	JrS4K1EubHzR69BYE/bOD6zSrr2CSw6mzfbujr+kLt8PwHTVYNWwmE5ODOnC3s3kCSEMO/UtHID
	gITBsw0hTrUmGkv+pH6o7wyJelETTdaAL3TI9jRBAYmpIWxO6QHS2IgtLKds6SbzH5W/wf/N7ch
	knDv8AqoZTGI3RxFfKzNgrTLLqXADXMKP8eUjuZRi6wxlEH6zYzMWq8XyUT2tKuKI4IPBXxSJn/
	VVShN8/91MVOZzykyqrEZK/nV7L5UbQwwVMKhRzwggO/lRphl7NPOOTnT+FW2IN27dQZOfbYjX6
	yMfJEI5rQB2zG4ewoP0pNjjPtr1rXCPwKEtFCgeUCuATMjgY4uBiaeSx4GC3hTkHm8UnymFZGuz
	9hAk8wgJN82nJNXM95GEGWyp8=
X-Received: by 2002:a05:600c:4ec7:b0:490:bd66:e523 with SMTP id 5b1f17b1804b1-490c25fc134mr178993095e9.20.1780825300369;
        Sun, 07 Jun 2026 02:41:40 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm295839285e9.8.2026.06.07.02.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 02:41:39 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH v2] staging: media: atomisp: remove unused macros
Date: Sun,  7 Jun 2026 10:41:30 +0100
Message-ID: <20260607094130.3208513-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macros across the atomisp driver that are defined
in .c files but never used. This was flagged as an error in a
W=2 build due to -Werror=unused-macros.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
v2: Removed some macros that are used, or should be kept for documentation, with feedback from Dan Carpenter

 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 3 ---
 drivers/staging/media/atomisp/pci/sh_css.c         | 4 ----
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 6 ------
 3 files changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..7c1fdd39d6a3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -40,9 +40,6 @@
 #define SUBDEV_WAIT_TIMEOUT		50 /* ms */
 #define SUBDEV_WAIT_TIMEOUT_MAX_COUNT	40 /* up to 2 seconds */
 
-/* G-Min addition: pull this in from intel_mid_pm.h */
-#define CSTATE_EXIT_LATENCY_C1  1
-
 /* cross component debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..cd1be313c758 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -61,10 +61,6 @@
 #include <gpio_private.h>
 #include "timed_ctrl.h"
 #include "ia_css_inputfifo.h"
-#define WITH_PC_MONITORING  0
-
-#define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
-
 
 #include "ia_css_spctrl.h"
 #include "ia_css_version_data.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..24cdd52283ba 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -12,12 +12,6 @@
 
 #include "sh_css_internal.h"
 
-#define MULTIPLE_PCS 0
-#define SUSPEND      0
-#define NOF_PCS      1
-#define RESUME_MASK  0x8
-#define STOP_MASK    0x0
-
 static bool pc_histogram_enabled;
 static struct sh_css_pc_histogram *isp_histogram;
 static struct sh_css_pc_histogram *sp_histogram;
-- 
2.54.0

