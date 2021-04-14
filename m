Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F876D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:39 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id e14so32777176ejz.11
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WEiIs5zldwQSdjjTkKUv/mhQ3RM5FwCOCPjXSs5433Y=;
        b=fwT/uTndlASvYBIt5/5KCCO/xLT6H2Rn2t7JP+I+oiy22ey4KdbmgbWji51ZB3GyDk
         ajQ09kp/D+xSSKe70AMeNgZSVWQq3UVZV2q7j/Jr9qaYEE26oRn3Ljata6dJutw9hPM2
         9n0xwC9AqqXGDWwisrDyqN8oHr9BTIn69VYnEyIt+OBzCfIKUUJcpQiSCyA9EEe+DxxT
         4v2ZzQnnz5oOp90xUti0N9gtZsFQX8JC+7RKgxVRLJEngCodouV8IT3hjNNYp4jMDfF1
         YC2LLFytnHtIL74UgXh5kPBMCRthmHZbjrweU4g1ARQ9MJsiv74dgbv7hbCCv5hFD3Jc
         4QWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WEiIs5zldwQSdjjTkKUv/mhQ3RM5FwCOCPjXSs5433Y=;
        b=UyHdRP0YE3nqZF2dlmFlVGAbHR7eRPjQsZ0lw5mWMBvMQNpadUsm0mamBXuSucMiF5
         99T58ZL5H91ubtQwpTeax9tVgQMnGudIxRhqRNDNy66kYvDDAigYjLS85zgzmdx7rcgs
         w6G/HDpy6ssZxDvwr6K2M2TzFxwaCEEWuHf/Pxdkt3LtgPGT1OKqEYfioU9S7C5+/EJV
         mtD+n2sl/FL9f76x5TC6+AIwDP7km4SDX2c6krSGStqG/oPV7y6ZbgT1uS/JVxhAO3Ec
         wIw+zM76S/O82uyN1uX8UWg+IOGof9klHP4nwM+7l3BtVSvd7zmPUH9PVu8tFvedlRCm
         9QWA==
X-Gm-Message-State: AOAM533aP96g51+CHxpUDpvZj6N19P+CYBygg9QRuFhtxrFlS9AlXEtq
	q9tD4xlJ/u5Lva21Q2Nw5uP3/w==
X-Google-Smtp-Source: ABdhPJyB9jWZKykG6LKsjtIm1j4xpGTK73yjBzcWI12qePyGRIZ9y67xaS2oTYaiG/ZDw+fVGhWQiQ==
X-Received: by 2002:a17:907:6282:: with SMTP id nd2mr137503ejc.173.1618423897629;
        Wed, 14 Apr 2021 11:11:37 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David A. Schleef" <ds@schleef.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/57] staging: comedi_8254: Fix descriptions for 'i8254' and 'iobase'
Date: Wed, 14 Apr 2021 19:10:35 +0100
Message-Id: <20210414181129.1628598-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/comedi/drivers/comedi_8254.c:561: warning: Function parameter or member 'i8254' not described in 'comedi_8254_subdevice_init'
 drivers/staging/comedi/drivers/comedi_8254.c:620: warning: Function parameter or member 'iobase' not described in 'comedi_8254_init'
 drivers/staging/comedi/drivers/comedi_8254.c:620: warning: Excess function parameter 'mmio' description in 'comedi_8254_init'

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "David A. Schleef" <ds@schleef.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/comedi/drivers/comedi_8254.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/comedi_8254.c b/drivers/staging/comedi/drivers/comedi_8254.c
index d1d509e9add94..4bf5daa9e8855 100644
--- a/drivers/staging/comedi/drivers/comedi_8254.c
+++ b/drivers/staging/comedi/drivers/comedi_8254.c
@@ -555,6 +555,7 @@ static int comedi_8254_insn_config(struct comedi_device *dev,
 /**
  * comedi_8254_subdevice_init - initialize a comedi_subdevice for the 8254 timer
  * @s:		comedi_subdevice struct
+ * @i8254:	comedi_8254 struct
  */
 void comedi_8254_subdevice_init(struct comedi_subdevice *s,
 				struct comedi_8254 *i8254)
@@ -607,7 +608,7 @@ static struct comedi_8254 *__i8254_init(unsigned long iobase,
 
 /**
  * comedi_8254_init - allocate and initialize the 8254 device for pio access
- * @mmio:	port I/O base address
+ * @iobase:	port I/O base address
  * @osc_base:	base time of the counter in ns
  *		OPTIONAL - only used by comedi_8254_cascade_ns_to_timer()
  * @iosize:	I/O register size
-- 
2.27.0

