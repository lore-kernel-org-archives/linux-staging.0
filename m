Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF8393DCA
	for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117294; cv=none; b=RFWI7bo7fdurPXBgu2LYLEK/JOHxXtDhROjD3X6yDb/orgOiAi0ukMIk/Bdpzt4HtOmvPaDcnRwIcI7VRczEPsOXRi4iq1e+Itb8lE4ORqBvo8c7PO2LdcOuWBhzYt+kdrDsjA4qN+3dvBg//4ZHOeN/9Y7W54sD/zWMXQ9pT7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117294; c=relaxed/simple;
	bh=oRGPP8A9kD2Ism/GRGLQU6yCPnxuitum1Ux/QV9XLQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsGfte5RNr3esdA4calpfqsSDckxQByD1GBNybNqo9dkPYX57gAQSLJqaa5aqYFUT6AZTt9HVo2w4/AE7AcrFdA9kphYG1L02sGDDRgrf8p+l0u8Z0wr3n11Mlm6FIawv4C7WC2sF9q6CbHVBd6seCGwb5gO4ATrL8hYomX02Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZDpyFAu; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZDpyFAu"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70a9f5625b7so38627076d6.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756117275; x=1756722075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy3EbFCheoNs2cuk9tdwnjT18BnvxZ78GmASClzOWgk=;
        b=LZDpyFAuWTS3D/hVQmlUVOCDZ32fCzhlWKdAGfiN7L7gbGItdv2WjkOLatdrCI8D+M
         38IqhDI8kXNmxlg6W7DhKyVJoVJ7z008VazL8ISaH5Mj80HXRlSNaGrJGxT5esr+rxP5
         GsQDTxSRmobkM0UlzpdFtb+ingk2jNxUI5bwG1hb/cRKY6gObi2WTAz4LRAQBFF8CWIJ
         mQgXc2Jq2/aoo8CplZvAYbsU3mKr7zjDTUagk2sSdIdkBXN1dNrYghiW0nlwKfLJ4P1B
         gM6mJ8HNPkSoe1XIzyUNooMlv1KxOaGFOwFWVT88LSm4wWoHDrKX71CPykyUSp9oPNIS
         XcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117275; x=1756722075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy3EbFCheoNs2cuk9tdwnjT18BnvxZ78GmASClzOWgk=;
        b=hfAMtZIHDNIvKffjZYy7TOHSM4VwOdk4AAS7PdX5JZfSoszEGQzC50cVrGBN36EO3w
         EMnrwL3xcr2bE6oArH7Xl+0N6cHZAPDNBzqBBAfs6tv+Cy22yPyKBR+JJb369qCGrsKM
         w5n+3eIaNOIOhjkWMwHzY1CHZfbE3FDrGDMlZMC7a7P5Gg1vlncdktflFBEYkh3OssCz
         HDfuB+Qkva2yHLv+OO8tSj8HBLa28qAvnNwjpHDwWwGFhp19Ue1md0maAVASfNvu4MNV
         GIDuUI42naQxeDbNTKmxYg0RbHaCrlu1MER7KcR7ggxkl2tz8ZIDWdiQnGm/CWMU6C9d
         nF/A==
X-Forwarded-Encrypted: i=1; AJvYcCW3+HbxmY+AO+0Jm9HPNNhLCGNIwtHKRYA1fmov10ge1J150DGeSzsUgqE3JCg5u4y/WTaCmqM5pyHq6ceS@lists.linux.dev
X-Gm-Message-State: AOJu0YzMzT4D1EROHvpJJ0rRVVdhF3+kpEpw5cAcedMXFKfnHLoqE7dH
	EV2DGb4Ub6akVDQVclN5+R9/4c9Vn1ioyZM9n5xsFG85rE4rdRH3JgMr/OL/39sCS74=
X-Gm-Gg: ASbGnct4LPiu3vk1TzcWSyQNOSKh29B2JhovGc2IuZYp0CrJbOCYpud1u16uaNfnIyV
	nw0biEUnA8+4YXPbiTbYx28FX4Z+pH4/Dcum2DDImAzNsV1WctOW6RKKdQabnT69tYOdOVWNzX6
	PvOFlaeL6E8p4sBT3dOSqLNcey75pG/tL/IFALz80gNsWGqBTjG9Vtf4YZaD+UPeFJ97BepYgxB
	uw2mX0mac7GCEYN1cUlH/ka5fDKICtdCM1wRSQGXAXOSq1VIvOxeft0qFgjjSIZb6sMEsf8obPJ
	1B0+dmVJESsESGl7V+YQxiH+wpvYE5CJpjAAWHat1vbhN0LLFBNodH7D77oSBoDPwzcm7kuQfqB
	fpmjgPzSksMycYyDoJCqeEdfGVgakpOb+er0UCiJ0xKmNW/s90cS4WIOPThO8w2ZfPVak
X-Google-Smtp-Source: AGHT+IHxj2yFPeKp2UUVuWOYEeQXghedbTJL3FrXP8fm/9MPMZANiTSsDkF7jPaSKQ7YlmWUyEdX7g==
X-Received: by 2002:a05:6214:d03:b0:70d:8166:b7c2 with SMTP id 6a1803df08f44-70d9724502amr115908746d6.65.1756117274535;
        Mon, 25 Aug 2025 03:21:14 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da717df65sm43086836d6.30.2025.08.25.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:21:14 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH v2] media: ipu3: Use string choices helpers
Date: Mon, 25 Aug 2025 03:21:04 -0700
Message-ID: <20250825102104.961139-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use string_choices.h helpers instead of hard-coded strings

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
Changes in v2:
 - Split the patch into two: one for staging/media/ipu3 and one for
   staging/media/atomisp
 
drivers/staging/media/ipu3/ipu3-css.c  | 3 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 1b0a59b78949..777cac1c27bf 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -4,6 +4,7 @@
 #include <linux/device.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "ipu3.h"
 #include "ipu3-css.h"
@@ -226,7 +227,7 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 	state = readl(base + IMGU_REG_STATE);
 
 	dev_dbg(dev, "CSS pm_ctrl 0x%x state 0x%x (power %s)\n",
-		pm_ctrl, state, state & IMGU_STATE_POWER_DOWN ? "down" : "up");
+		pm_ctrl, state, str_down_up(state & IMGU_STATE_POWER_DOWN));
 
 	/* Power up CSS using wrapper */
 	if (state & IMGU_STATE_POWER_DOWN) {
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index ad6095bf717d..2f6041d342f4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -3,6 +3,7 @@
 
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
@@ -287,7 +288,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -302,7 +303,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
-- 
2.47.3

