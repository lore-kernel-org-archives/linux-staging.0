Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3C2564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 19:28:26 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id dr20so12871160ejc.6
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 12:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TqnfFy/w5L8PNXWjZ8pBP5o6bpYqg195r5wJAqZzJso=;
        b=S0kjE+2qCuvEZ1CmUheOO7iZmHfj9QkPQUdmiTDhrKhsIXps+vyYg4r0AoAGJInCxi
         T5A1u37Etw4Vhc43pIa+rxhlK+cQ+qSl0jyDRPgVFYFkKSIg6aUtmfrT7kUZrSlu1Hvx
         tmRvmFG8KC0IrrhOpsK/6u4UeFIKMatBbftbDOvjZilcwLdL1TR207Syk1W4HfrQt7Sm
         WgnyQNilrGwsrX9f3pb81FPjl/jdrWpAtsrTkMfYL7ue9a/2YHdYVPfbpgzMjq8mePx4
         bg42CDN7Acs+axwkiSy4Ni5/4DyOy1SYs60CGaAznvrSUUThTg4crKZjScdSGEqnYQrv
         UwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TqnfFy/w5L8PNXWjZ8pBP5o6bpYqg195r5wJAqZzJso=;
        b=CBqIdZ98eTtLYIguOSF7B0jHhBjd3OBBGkTV2w1PYTMziR+VSiMXheaOobpWU+pt5O
         xu2yWnYk/PYeV4kuP0NrIspe+hk5dAlAbPf/CnN+Q0yX9bIjalmKX1GVjLGQuRSm8CmQ
         fvgSY2mgPrz2CB+p9Fmkk38rXZ59QEr14gF1d7fN43AB5vVkTjWVZpNic4E9lQP5wDZ2
         1MusAoaCq+3jN8RbWaDHq4Hc5Re+mFAQRyXZyxL4L4uFPlB9jTKhhqbxtvX6n58NALVw
         sc8wmACoyXs9bTJKd/r/vpczeFE2b0b0Ylx6k0BG2n7rbLrOZFk7+fLsQh7rnUPvUnoE
         +QqA==
X-Gm-Message-State: AOAM5332r785/HdDSd1r3wbuhBRMmNYQqoj0M+el2pQv25QjN8zzdo2M
	BXQW2FePzjZQzRoPZ0hF2ls=
X-Google-Smtp-Source: ABdhPJyJpZX0eq9WO/d5bSjQFmCX1ob68cON0CQmf4s3b3e0ce4GcXHLW2Gh1FUHL/wxwhKB6176CQ==
X-Received: by 2002:a17:906:2bd7:b0:6cd:f89d:c828 with SMTP id n23-20020a1709062bd700b006cdf89dc828mr15003377ejg.232.1649359704644;
        Thu, 07 Apr 2022 12:28:24 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm9652798edl.22.2022.04.07.12.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:28:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/8] staging: r8188eu: move struct rt_firmware to rtw_fw.h
Date: Thu,  7 Apr 2022 21:28:13 +0200
Message-Id: <20220407192819.10661-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407192819.10661-1-straube.linux@gmail.com>
References: <20220407192819.10661-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the rt_firmware structure to the header rtw_fw.h to have firmware
related things in one place.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/drv_types.h | 6 +-----
 drivers/staging/r8188eu/include/rtw_fw.h    | 5 +++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 09fc27082f7c..ffab2ee0848a 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -35,6 +35,7 @@
 #include "rtw_ap.h"
 #include "rtw_br_ext.h"
 #include "rtl8188e_hal.h"
+#include "rtw_fw.h"
 
 #define DRIVERVERSION	"v4.1.4_6773.20130222"
 
@@ -116,11 +117,6 @@ struct registry_priv {
 
 #define MAX_CONTINUAL_URB_ERR		4
 
-struct rt_firmware {
-	u8 *data;
-	u32 size;
-};
-
 struct dvobj_priv {
 	struct adapter *if1;
 
diff --git a/drivers/staging/r8188eu/include/rtw_fw.h b/drivers/staging/r8188eu/include/rtw_fw.h
index c4b1a8370b4a..8f74157ee9ac 100644
--- a/drivers/staging/r8188eu/include/rtw_fw.h
+++ b/drivers/staging/r8188eu/include/rtw_fw.h
@@ -4,6 +4,11 @@
 #ifndef __RTW_FW_H__
 #define __RTW_FW_H__
 
+struct rt_firmware {
+	u8 *data;
+	u32 size;
+};
+
 #include "drv_types.h"
 
 int rtl8188e_firmware_download(struct adapter *padapter);
-- 
2.35.1

