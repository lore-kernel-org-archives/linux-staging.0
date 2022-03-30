Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC017C;
	Wed, 30 Mar 2022 19:14:20 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id bh17so3996543ejb.8;
        Wed, 30 Mar 2022 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCSDRJRZlCX3e7uOeDLU6kERCIj4I7Er1tKnwqwYKMA=;
        b=Rmu0hvbOX8eaSHKORfu191SNwV2QA2hqAtO5gsCaJUm2esBMjCRaCKSAbSwoaF+Hmw
         dIwzPn0nPjLOzIOUpLTukUBXGqqYHQce7E7kGpF40ySsgsuyyBeZl7YXZSMcV3srcgre
         DdQS2MWjhoUSVeNVricufO8tcpVtetPppOUWOrFscaDwoIhIwc32kknNESIMVGgTA0zs
         tlaaulXQIQLV9Zk9pBCafMqtiuWX6tkumTdij8iejOB90Oed+ZefR5UANsJ7gYzEYwDN
         BVw8Va2tT65rsA9kFZsle+OGfKg2/jbRcBJNatQ5MhNWbiDnH8MktPWpIeU/Fmny39mV
         9LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCSDRJRZlCX3e7uOeDLU6kERCIj4I7Er1tKnwqwYKMA=;
        b=NFcaY7uZUqYjQef/FK0QfQ/SACRyJOg9mEwkBYeiYVdXug/BbMsA6slTmatkiOeqez
         COiPHMrEYi3p2KrcJFyFE3J1uOCefjG4Bf/6zTyB7sseitt7Eb7G+HViXUiKY6XTYxrw
         atVLXr3DOmHMwIhejSKbxlGQPQ5MvYbNyr+SIFKATRfzy1eYLtE6hRgGXf+hyPK9i4m9
         66ds4LuTAs7H35p2lGKk2rW0QXF0ZZdJP/9diykGYnzpY7p7UHjvRhp/ZolMhRd36tak
         AoyGihIL3f5kpjXq+imig/d/aLkESBCHIRAVaH6C5tK70IA10UwTlRo5q0cgSB398wWr
         R/iQ==
X-Gm-Message-State: AOAM530YQnRr/FHR75ck0nm6mwF2rpHctHevTbQw9S0C9l6AlD9QtKwJ
	V/gTxBRa3MeSEZBToKKeAtM=
X-Google-Smtp-Source: ABdhPJyal9zlxaOI9M9P6dckapoFO3jQ2Nw/aHbPR+kqzTd8nXpGWQZsitAgb+8prWXHo8YAK+krcQ==
X-Received: by 2002:a17:907:8688:b0:6d2:c19:e1a0 with SMTP id qa8-20020a170907868800b006d20c19e1a0mr1102572ejc.249.1648667658992;
        Wed, 30 Mar 2022 12:14:18 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id eg6-20020a056402288600b0041919c78082sm10257328edb.87.2022.03.30.12.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 12:14:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ira.weiny@intel.com,
	outreachy@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: vc04_services: Convert kmap() to kmap_local_page()
Date: Wed, 30 Mar 2022 21:14:14 +0200
Message-Id: <20220330191414.23141-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of kmap() is being deprecated in favor of kmap_local_page()
where it is feasible. In file interface/vchiq_arm/vchiq_arm.c,
function free_pagelist() calls kmap() / kunmap() from two places.

With kmap_local_page(), the mapping is per thread, CPU local and not
globally visible. Therefore, free_pagelist() is a function where the
use of kmap_local_page() in place of kmap() is correctly suited.

Convert to kmap_local_page() but, instead of open coding it, use the
memcpy_to_page() helper.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c   | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f0bfacfdea80..efb1383b5218 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -431,21 +431,18 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
 			if (head_bytes > actual)
 				head_bytes = actual;
 
-			memcpy((char *)kmap(pages[0]) +
+			memcpy_to_page(pages[0],
 				pagelist->offset,
 				fragments,
 				head_bytes);
-			kunmap(pages[0]);
 		}
 		if ((actual >= 0) && (head_bytes < actual) &&
-		    (tail_bytes != 0)) {
-			memcpy((char *)kmap(pages[num_pages - 1]) +
-				((pagelist->offset + actual) &
-				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1)),
+		    (tail_bytes != 0))
+			memcpy_to_page(pages[num_pages - 1],
+				(pagelist->offset + actual) &
+				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1),
 				fragments + g_cache_line_size,
 				tail_bytes);
-			kunmap(pages[num_pages - 1]);
-		}
 
 		down(&g_free_fragments_mutex);
 		*(char **)fragments = g_free_fragments;
-- 
2.34.1

