Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3A6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:26 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s15so24839903edd.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r1wO3iDdDqMfyYacSY7a+W7LGniemZmarQ01JRnrRic=;
        b=gbdr4W8RUQTZKCM7TQ5BxltTeff0/2jaixIaQZLqa/cHxXp+LSC/wMqNL6I0GC8cKX
         2S/BCDgpj4GswaxBvK8QWZLwLO70a+XUh4cfxESxXasRpsx2r4HjB4hy8PrkhMSu+K/9
         K/BaimGYhw6UPbiVglkrCsE5SOvMJE25snVMKREsvPoM5b7dZZwM5HNRLEp+O6+8+kgW
         zsYyBSioSMXcAhWd6uRNKViBAFeGI1sEXYuXsmTsSNqQGlCgyNGCg74Bc0cE03R47itg
         6VAdI2lXwbZv2HoWbk9yjRAgWL/1G2g/GADNlrFxPcvWhLwLm6SsEw+IYq/9JZNNKA7u
         cTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1wO3iDdDqMfyYacSY7a+W7LGniemZmarQ01JRnrRic=;
        b=DYd/DhrHBnDAxcw3WeGn1cmPlTc2nwg9y5GfY+SYXHS3f+6s1nXQAOet5iBr17Y3sk
         ZMPpuDRP6E08dAKpDVPNhytJfGB9DDbSTqBrNJMz3wM0V4FM+KARHFXPJhF45ABebJ2u
         93mAd6aiWe/6+vMKRpsWygPCejR/+bef094CSBofZT2eIFoKLNGdQC2DU3zxFsuo+izK
         X3kWIN2wLtM6mcaR92G/MkP85naPV/AkjDhyCEEX8P12bWXYG9juRt9LaifGNFvxkNaD
         NMxsyOrlCx897W1KLlJX1vKDnWRoATfa8BYoy4BJjnZO9QWG2t6q29d+N3YCjPysPbnD
         3mCA==
X-Gm-Message-State: AOAM531leTz0389LAjpyfkSW8nHBYyogQzVMN5U/OLYE8M+tvOeqvTS0
	XpWv6QVylB/SZtoUoq7LKEX+hQ==
X-Google-Smtp-Source: ABdhPJzCdaAxZa/y0BlHGUMRRGSRTpV0/R7v8qypn8irX9EFs8BoHOJ6AwuTL/1wpcOqmxuAUCU9Nw==
X-Received: by 2002:aa7:d4cc:: with SMTP id t12mr156173edr.261.1618423944794;
        Wed, 14 Apr 2021 11:12:24 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Anders Blomdell <anders.blomdell@control.lth.se>,
	linux-staging@lists.linux.dev
Subject: [PATCH 48/57] staging: comedi: drivers: jr3_pci: Remove set but unused variable 'min_full_scale'
Date: Wed, 14 Apr 2021 19:11:20 +0100
Message-Id: <20210414181129.1628598-49-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
 drivers/staging/comedi/drivers/jr3_pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/comedi/drivers/jr3_pci.c b/drivers/staging/comedi/drivers/jr3_pci.c
index 7a02c4fa3cda8..afa2f8d5c8c0c 100644
--- a/drivers/staging/comedi/drivers/jr3_pci.c
+++ b/drivers/staging/comedi/drivers/jr3_pci.c
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
2.27.0

