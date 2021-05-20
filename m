Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08512FB6
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:25:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y14so15384584wrm.13
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q0C+y7HOfSg/6tgxS7HJNLZy6uehQaI3fIiA1xOsmw8=;
        b=EK5UiuJJcjQQR3bHsXev1MOW/juVA6ocYp8BJrkzIcxa0qhd6HL136HUsZGgJkw186
         et1seY37AEl9JKcpQtC2unmPbHSWVFpWnJwREQlArIcLycJ9s3+ETovvxG0WrDYBtTXD
         f42w2nBL9s17nvIpySDBtNLdOsxlROt0sUBoRCueHgxNqPlXRGPT3WsdPcu0Suyf/jij
         sfd8htNEjZ7c93q9JE+b9SjhiNNHucEMTJaDrWNHPj2aSoKUn1nBXyku6iflwlc87yVG
         6ZCRuQf6Lw/G32n79EhGEvrbxlsqPn6dGvsRXlXCTEmZ1MVoqIT0gV1q9BLIik97sEml
         5DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q0C+y7HOfSg/6tgxS7HJNLZy6uehQaI3fIiA1xOsmw8=;
        b=KN3MsrRfaIkfWJsqakzhveuXtVNdtdyNWvk2aiFEHoEu7vwUm2tD/DJK6F85GhXv8p
         6vEuFGdz2hPaR7Gwu2w7R4fWPfR8T/t9VZgVycz99ZS6otfRbjjSHisHTxEDoEEOijI8
         lz8dxXFA0zScQ6SNdQXLd5buanr6O1g9KuwTnkOjZyLBBJdwXjWqGoAPRkdqczF4YAPx
         4Qva0Qad+blCycP6c3xSrtLgVObs5wRqDJMEtHqDZId+If+RZ+If7gZJA8ELRLzAksxi
         FPcG5QRIiAqWf+KGYg6Zke147PfLxAVZppDYTLhDJLLo8O1TMrtOqQKN2wdMgSdXBBr5
         X7IQ==
X-Gm-Message-State: AOAM532PW6NP2cFi3P5hONxthP4rX5Fxv43JTF8AAsDmyO5rYafgyKrQ
	79HPHwDfgQfoh6R71byuRK7pkA==
X-Google-Smtp-Source: ABdhPJxQEE80mbLz8n2ne+LzLhW0Y2jI1/+Lp7TCBgF57VR2JCx+aj4e86MZO8U/+nHx+2YK2UZPtw==
X-Received: by 2002:a5d:4f03:: with SMTP id c3mr4010026wru.158.1621513547499;
        Thu, 20 May 2021 05:25:47 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id i11sm3205643wrq.26.2021.05.20.05.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:25:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David A. Schleef" <ds@schleef.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/6] comedi: comedi_8254: Fix descriptions for 'i8254' and 'iobase'
Date: Thu, 20 May 2021 13:25:33 +0100
Message-Id: <20210520122538.3470259-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520122538.3470259-1-lee.jones@linaro.org>
References: <20210520122538.3470259-1-lee.jones@linaro.org>
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
 drivers/comedi/drivers/comedi_8254.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/comedi_8254.c b/drivers/comedi/drivers/comedi_8254.c
index d1d509e9add94..4bf5daa9e8855 100644
--- a/drivers/comedi/drivers/comedi_8254.c
+++ b/drivers/comedi/drivers/comedi_8254.c
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
2.31.1

