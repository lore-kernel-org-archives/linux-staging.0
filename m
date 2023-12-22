Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448412FC46
	for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juM/LxPg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d4006b2566so15258605ad.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 12:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703276117; x=1703880917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLrEctJKTdv+9DQYIiqT5d8pIz5ARZucJNkVZeQocxI=;
        b=juM/LxPg/KNsJHPOBjOZkyqyXNiCS/Jx0SOQmA6S+fU0EZnG2EB7bhzMLZ9nCFL5W3
         Bf7tctqCIes52/X/8LI0z8OWOV0HAQ43JErrlUv8ggumFqaFl4Fc5hFOteHPbROZHcC3
         BGKWEsg0YqU5PQxN5DzlPOkOUv3p3OfqsiDMeeh9D4yUthujxe7OHYiLLtpvoSuulXLa
         Ybk/cUvWIpTz1x+1D1or7ijcOM+YYtRlVac4fzy257KNoufc9tx5VbQIu5N7bGp8k3O9
         WJ5Ppni5PaKRwcVkKsI0KEmZiM01Bce0MJqjSlmoGRCIYjmh8sMMS3LZA0+OYmsJUAEh
         vJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703276117; x=1703880917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLrEctJKTdv+9DQYIiqT5d8pIz5ARZucJNkVZeQocxI=;
        b=xDF5vjxuORAAqW91PPT3NAQ3E0xzhGZbKXH//1x0+H9tFNgZFyXcwkYxdjR/1pEwnt
         hsuB4umundJaS2JOLpxXuKN8l0tFG5Wa929zeYBUDsa9NdIa8A6kWPHRUpRLnGVuX3pd
         JMq3wzpnjyFjmmxwHDjhLVlo5oV+fRrm553cSw4fjh5DYD0Rp6w4B8azFaEpYfOGEGC+
         kxf5Mfwas3kL+B7zWgWJRA/uEMpz7mOq6SX+bcBuBi74Blxl9Nxo2BTAUGy15MEkPPmw
         0W8sB8sU9Gir5tXwgfUpLJIrUHMjWa7hdePjAVJY6XFuFksoC9f/SeCPYHtJBU9yeVXC
         lodA==
X-Gm-Message-State: AOJu0YxvHrm2GOgolmk2PqmAoAkoZdO6mZn0LrLgutsME9vRE7o0XHPJ
	DwhY3/HpWp6m06Iretk5BPk=
X-Google-Smtp-Source: AGHT+IEIokT7TBCD1z0pxoBMQ+BF23UOr1l/aVdCm8o0pnIaamekIXFExQ3ix1pzgG1NcmHoUDZFlw==
X-Received: by 2002:a17:902:7085:b0:1d4:8c4:5e07 with SMTP id z5-20020a170902708500b001d408c45e07mr1149471plk.23.1703276112357;
        Fri, 22 Dec 2023 12:15:12 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id b16-20020a170903229000b001cc1dff5b86sm3792746plh.244.2023.12.22.12.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 12:15:12 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media: atomisp: pci: Fix spelling mistake in isp2400_input_system_global.h
Date: Fri, 22 Dec 2023 20:15:03 +0000
Message-Id: <20231222201503.2337-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported a spelling error
in isp2400_input_system_global.h as below:

'''
WARNING: 'upto' may be misspelled - perhaps 'up to'?
//MIPI allows upto 4 channels.
              ^^^^
'''

This patch corrects a spelling error,
changing "upto" to "up to".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/isp2400_input_system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
index 61f23814e2fd..3ff61faf0621 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
@@ -19,7 +19,7 @@
 #define		N_CSI_PORTS (3)
 //AM: Use previous define for this.
 
-//MIPI allows upto 4 channels.
+//MIPI allows up to 4 channels.
 #define		N_CHANNELS  (4)
 // 12KB = 256bit x 384 words
 #define		IB_CAPACITY_IN_WORDS (384)
-- 
2.34.1

