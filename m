Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683EC950
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 21:48:23 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-502507c7da4so266537a12.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 14:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680731302; x=1683323302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCqBVJ5FUAqz6et7gCXC65lddEZjuyWxiqbGgbtDS3g=;
        b=OddqGCVQ9nguKkoLetqbQq9AWu6vI93zintV3cneVBEclDnwlebshfdw2KJ1RnFS4Y
         2sXG/aRTSQ+Hq92MJ4CXM10zB7bau3pkNmAyMclQ4nfhjk4/C1z4XXzhEilgRYy/Pnf0
         D/8ocAm7myGvsbgbrQLrRYcyHeVXQOVbKyHBv5TrAOmdXxzN3XvHI1VGmPjO2zo/Mstm
         X4+6x2ogjas8UYmc/Czy7rOzfp3AXz0BqwWcK+cr8IKLPWPOWQT6qWJe18M/+aEQaIVM
         aVwH18TW2wFqarg7LplLeFXE0ptgWP1EN1XD5MHnlx/7MKcjiTt4MWsfxXlCzb7TIVxR
         k4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680731302; x=1683323302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCqBVJ5FUAqz6et7gCXC65lddEZjuyWxiqbGgbtDS3g=;
        b=yKIL+al4AMRBc03OJbq7cPiAlHBOPteJQIsA48DzyMMmqjkA+ysvFKPQ96iHkD5KEj
         DzUcR+sqECnw23cKKZy2apoQiV9ctyYoIroyT7yxFN+dzS9MZTFLzizvUKC9E1rPbzGH
         oOLJ3CZB8lDJkS8wnCSLSLwvT8ZrLna2Tk7+X6DuRt8TFxj8vOO9knv4pUDxgZABPdZw
         LZGzAIwEs2SAWQ/jikTU6sJF4vQq4G/jVQbGWSGyjgQfRILTVgsyBFgmMb16pnbp8tl2
         B9Cl/N+iW7oQ3D3nAu5AvhPQOMWc+tmjPejALo+MAh/W4/vKsRok+UjbMAJPC/c+cf+R
         M7GQ==
X-Gm-Message-State: AAQBX9cvk0RQGElmRT9m5S59Fh9Otn8Stdwg2t6Zbq7Gwc+5EohUrbDl
	9tWqhCjpQppUSwBcTbIxk/A=
X-Google-Smtp-Source: AKy350ZiqXN0VUogUx+7XtQuAAa4tmYb5kYNfV+HwIMGR9f8ezTep7UPNCtho/PsZ1Fr7C/0+5je3g==
X-Received: by 2002:a05:6402:27cc:b0:4bb:afe3:e0a with SMTP id c12-20020a05640227cc00b004bbafe30e0amr4846026ede.3.1680731302114;
        Wed, 05 Apr 2023 14:48:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm7867721eda.30.2023.04.05.14.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 14:48:21 -0700 (PDT)
Date: Wed, 5 Apr 2023 23:48:20 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] staging: rtl8192e: Remove unused local variable irq_line
Message-ID: <6ec702e12cb30501fc81693a71a96b238bf09ea0.1680729716.git.philipp.g.hortmann@gmail.com>
References: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680729715.git.philipp.g.hortmann@gmail.com>

Remove unused local variable irq_line.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
index 0bc3e013001e..1c3ccd2aabc3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
@@ -33,11 +33,9 @@ bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
 	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
 	u16 device_id;
 	u8  revision_id;
-	u16 irq_line;
 
 	device_id = pdev->device;
 	revision_id = pdev->revision;
-	pci_read_config_word(pdev, 0x3C, &irq_line);
 
 	priv->card_8192 = NIC_8192E;
 
-- 
2.40.0

