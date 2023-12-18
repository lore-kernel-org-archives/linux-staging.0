Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89A3D556
	for <linux-staging@lists.linux.dev>; Mon, 18 Dec 2023 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZlNQAoV"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28b0016d989so1187344a91.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Dec 2023 07:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702912646; x=1703517446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sSlpTRou09JsVwTLNvbg+U7lQZsRkp+48aYZvwXB/s=;
        b=cZlNQAoVqurF5M71i75XaaKI2cs3wVPOcdgWEzY6ZPuGxt59huBGYpNLEP0tV9zgce
         lLUjxqRiftyXs+QbQPhlAGzbEfrg+Unuqtu2o62kmrnNFdYhwBI3lzaPxblIiIPUmxk9
         O1lFEWwy9+qbtfgYFy/yQ3+M5NdoEdfCOhUPBm3LLeGT8LHArWQAHUqVqyRHw+GKvufD
         bIVZ/O5Azj6DoT67pzzmSsj1WzGGQOJ8SpobHVAnOOiz1vKyBRJM4bbzsXnNt+pHbhpi
         lUouMH0mYz844VRaZWwDowVKVe7PmP+M2K9hUVm9punZhFgtScemHafL5n+EzbH9F6t3
         lS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702912646; x=1703517446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sSlpTRou09JsVwTLNvbg+U7lQZsRkp+48aYZvwXB/s=;
        b=FMh0z6bdP6lK3UjaDPtHmini19GwtPmEFr0L54xZkrLYSI3IcVkaHHMMxiIqqe5+Qk
         oQGiy6YCETS9vxh5F/k+ZgkMlxvPS8oAJFz0P7ysJtB14/3pQgYdlHWFpYaSdJt280qq
         72xLMJKjqUJoots8A5qP4hYgeGDnhiuRZvjVg6dAPkz8ysP74qWsLRCBfDwAfVUjcKBf
         02DDRKTKtXJx3K9+/HI8SZcZ4mr5RH+5G7Vf0G9bh3VJ2Yo9ODsBTsdcn7QDkIgrJSyy
         XXUm22bJCbSklL4Qek0JyEZ0LL3Hrspe1AyVdDgFwkGrmEANe69CfCC+ByGV/ofyolGW
         W9GQ==
X-Gm-Message-State: AOJu0YwvXAbiKZcULSn2vGUioJ+YXuSZNkU5kJWZh2G0l/Ady6zc9F8l
	/K1rZeGnvN4/ur5pZWLdjBE=
X-Google-Smtp-Source: AGHT+IGe3IJac/lizAUEvlaMq23plr5Jr6d91eSJPJSnKbCGX35B0n+f/GzjuWPVTiDYXG5ZjltwNA==
X-Received: by 2002:a17:90a:c7c3:b0:28b:7ee0:4ef0 with SMTP id gf3-20020a17090ac7c300b0028b7ee04ef0mr667374pjb.39.1702912645812;
        Mon, 18 Dec 2023 07:17:25 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm10514190pjy.10.2023.12.18.07.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 07:17:25 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drivers: staging: media: atomisp: pci: Fixes spelling mistakes in ia_css_irq.h
Date: Mon, 18 Dec 2023 15:17:04 +0000
Message-Id: <20231218151704.449883-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported spelling errors
in ia_css_irq.h as below:

'''
WARNING: Possible repeated word: 'in'
        /** the input system in in error */

WARNING: Possible repeated word: 'in'
        /** the input formatter in in error */

WARNING: Possible repeated word: 'in'
        /** the dma in in error */
'''

This patch corrects spelling errors,
changing "in" to "is" in all three comments.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_irq.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_irq.h b/drivers/staging/media/atomisp/pci/ia_css_irq.h
index 26b1b3c8ba62..00e2fd1f9647 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_irq.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_irq.h
@@ -84,11 +84,11 @@ enum ia_css_irq_info {
 	IA_CSS_IRQ_INFO_ISP_BINARY_STATISTICS_READY   = BIT(17),
 	/** ISP binary statistics are ready */
 	IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR            = BIT(18),
-	/** the input system in in error */
+	/** the input system is in error */
 	IA_CSS_IRQ_INFO_IF_ERROR                      = BIT(19),
-	/** the input formatter in in error */
+	/** the input formatter is in error */
 	IA_CSS_IRQ_INFO_DMA_ERROR                     = BIT(20),
-	/** the dma in in error */
+	/** the dma is in error */
 	IA_CSS_IRQ_INFO_ISYS_EVENTS_READY             = BIT(21),
 	/** end-of-frame events are ready in the isys_event queue */
 };
-- 
2.34.1

