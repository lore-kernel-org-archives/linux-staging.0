Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A16D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:35 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u21so32814207ejo.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQ6LsJ9IQJ+Yl6+6d08CWal5YHo2OCheSLf3tFDPUAQ=;
        b=Ze/rpY12JS5gY5CDBwu6rl7OzvQoiDMot5NY94XG+Zmxn39b+vrw4DKYfLoVqNspf3
         jKl0hulX0Ez0MJrS6zNSEFnsAb/aWpbO2a9mPblH5i5X355OsjumHqNPbuq8y7i4+S03
         KRT13qpbhKM+4Rtj3ek4XGjRMnGaNEd0WF/GFVn7D5vgr9XmlH8vR8C0tRKBM/kdcZ06
         3NtWhDE+9Gl6k/BjSkrt7r64mAX+M0VJHVkIiuSJDhrLJjMU0KUgExOC5MZoJ05ewdWr
         RtNV/WxGp8VlraCXjCySR1G2RLdRaHoTtk5qqCkkvUAWC5TIV0ONUTaYtwoGBQFuqvsU
         cOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQ6LsJ9IQJ+Yl6+6d08CWal5YHo2OCheSLf3tFDPUAQ=;
        b=RfQ2SIU1h1etUNdaju+/qRusgpXhKzupQ0BYQq9hW68hvuTrVKuHwzq9K3Hdrj5pOC
         LCEV2CvpsoLgq1wuHF+/qCPtK1QnN1AfFvymMXd7F5PtYV3pq0qiFkcNvL4y1610WoZj
         dQ62IGmb2WMu3FMDryE8neUPx147FekgjXwsi7tn5PNIRpu8AKijl9W9yepo/ax7oTQc
         RpCLSKOyZoSOAKXtOC3Otj9ajOY5Ii8UyL5daOqvZO734WZPxbOIXd2kNT87jBh2OAlS
         PWn9lOZxN0ZVsFOZ2POfZEMwvx3qJvfQS8XxmR70iR2t7TRTn6WjWfcede55ckSBD3gJ
         hkFA==
X-Gm-Message-State: AOAM5317ZhrXkPG80z4GXMUU0eVYudCVOYK3iBzxQCv1gKctp4hiuJIa
	74t0VIErc7RpE7MDBuokyA4kFg==
X-Google-Smtp-Source: ABdhPJzLyeqjXT0+oyS/9pM50oCEQQ1b44WHDM3TWBcp1BS3Hx3GiVnWiZo8cEPn0XFrAyPtwz20Zg==
X-Received: by 2002:a17:906:39c1:: with SMTP id i1mr147617eje.59.1618423953789;
        Wed, 14 Apr 2021 11:12:33 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 56/57] staging: comedi: drivers: comedi_isadma: Fix misspelling of 'dma_chan1'
Date: Wed, 14 Apr 2021 19:11:28 +0100
Message-Id: <20210414181129.1628598-57-lee.jones@linaro.org>
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

 drivers/staging/comedi/drivers/comedi_isadma.c:157: warning: Function parameter or member 'dma_chan1' not described in 'comedi_isadma_alloc'
 drivers/staging/comedi/drivers/comedi_isadma.c:157: warning: Excess function parameter 'dma_chan' description in 'comedi_isadma_alloc'

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/comedi/drivers/comedi_isadma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/comedi_isadma.c b/drivers/staging/comedi/drivers/comedi_isadma.c
index c729094298c2f..479b58e209ba6 100644
--- a/drivers/staging/comedi/drivers/comedi_isadma.c
+++ b/drivers/staging/comedi/drivers/comedi_isadma.c
@@ -143,7 +143,7 @@ EXPORT_SYMBOL_GPL(comedi_isadma_set_mode);
  * comedi_isadma_alloc - allocate and initialize the ISA DMA
  * @dev:	comedi_device struct
  * @n_desc:	the number of cookies to allocate
- * @dma_chan:	DMA channel for the first cookie
+ * @dma_chan1:	DMA channel for the first cookie
  * @dma_chan2:	DMA channel for the second cookie
  * @maxsize:	the size of the buffer to allocate for each cookie
  * @dma_dir:	the DMA direction
-- 
2.27.0

