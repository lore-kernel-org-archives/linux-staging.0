Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C911E72
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:25:49 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id h4so17431340wrt.12
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z07GdkBe9eIVIrPcp5F5TqABOA/nGZ8K3dUhAPpDc9Y=;
        b=K+hUVHSRgJeo2EBiTpYthKEutxBQbbC4ebDBdOvXnjJMITppIq6c5ja5k5a0x79uXd
         QVMSEUxv4E+v+b9oTU1sHW5d5OnDkqGeO0VITY26zRem802gxGy88RbuTAjbUSOxSA23
         YqyH6+evCzX9eZTRCScvtP02eojbSqozBrdOsh+r8Cpz+I+27GiSgfP5V+dBVI75osXd
         Gpuq7ZRdviva6t4OoJ8W9pqXfbAEP0PUQLcti4cvgAi0D9baz+UVcISkUSG7TysQv7YE
         n9WEcvdSar2iuxg73Ixgwz672yesQLrKwWu3kChdzFdCmDm7bQau9SD1ADKii1EkbIEs
         LO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z07GdkBe9eIVIrPcp5F5TqABOA/nGZ8K3dUhAPpDc9Y=;
        b=Lr6FFnbHFxQsz7ewlqz06Rz60QjtAciqPOQ71nO3AwePXvrBvE+2Q0yBo4BGFA6PJc
         Ur3soNhkBBPK/NRkt8s476FHztA34oTaWgeR7r36SSYiScZCfYivWFNHGd3FnxQao62n
         D3k65xbDtKYUN/bzFNxJQEmKoAt6b9h2X1/lZWvNXQIDc9dZqsZ9Bja70NEDCgvaoLzm
         7fbDPVMsoBUD6VhfAHze/tyqSNPscR+z9PgOr3ZbZYNDwGu1UI4b06Srjd4cEkJeExMf
         YXwaE1QC15PzZDjXoK2Y+ETsdVkcs5AOyQ8JVUxfebHIQrt4OCOziCk3mU46Ob+n3UAo
         G0EQ==
X-Gm-Message-State: AOAM532c/rWWPqUO70lMFbLYQCc1PxVP6mNnbvI/Lr5Ol01oseqbjIK+
	jjIoriq5ttPdiS3F0ieEUDl1TA==
X-Google-Smtp-Source: ABdhPJyZjzJUcN/fRmxz0rjZRg79nZlnDT6ljiRWB+m+2P1+yTlHF1LBWwZqdwdOBqiQAwWHD4wHrQ==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr3128064wrq.344.1621513548401;
        Thu, 20 May 2021 05:25:48 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id i11sm3205643wrq.26.2021.05.20.05.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:25:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Anders Blomdell <anders.blomdell@control.lth.se>,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/6] comedi: drivers: jr3_pci: Remove set but unused variable 'min_full_scale'
Date: Thu, 20 May 2021 13:25:34 +0100
Message-Id: <20210520122538.3470259-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520122538.3470259-1-lee.jones@linaro.org>
References: <20210520122538.3470259-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/comedi/drivers/jr3_pci.c: In function ‘jr3_pci_poll_subdevice’:
 drivers/staging/comedi/drivers/jr3_pci.c:507:22: warning: variable ‘min_full_scale’ set but not used [-Wunused-but-set-variable]

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Anders Blomdell <anders.blomdell@control.lth.se>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/comedi/drivers/jr3_pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/comedi/drivers/jr3_pci.c b/drivers/comedi/drivers/jr3_pci.c
index 7a02c4fa3cda8..afa2f8d5c8c0c 100644
--- a/drivers/comedi/drivers/jr3_pci.c
+++ b/drivers/comedi/drivers/jr3_pci.c
@@ -504,10 +504,9 @@ jr3_pci_poll_subdevice(struct comedi_subdevice *s)
 			result = poll_delay_min_max(20, 100);
 		} else {
 			/* Set full scale */
-			struct six_axis_t min_full_scale;
 			struct six_axis_t max_full_scale;
 
-			min_full_scale = get_min_full_scales(sensor);
+			get_min_full_scales(sensor);
 			max_full_scale = get_max_full_scales(sensor);
 			set_full_scales(sensor, max_full_scale);
 
-- 
2.31.1

