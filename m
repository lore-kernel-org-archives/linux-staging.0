Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72733AFE7
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 21:50:38 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-502aa0f24daso180874a12.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Apr 2023 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680904236; x=1683496236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w24X/TbkOlhe1U7zkhFMh7hB9JLN+Ijqh2VJDsOo0Sg=;
        b=gDghUNL/fvbVLDFmHvr+OBiPW7ov5lHgqLUfl2QJDbQge/x4RYx83DAuLiDhs2eQQG
         4bOsNbT7k0UmPCO3+mgz3US5tRO+o/EVC8R3uRQk70trXbMy7//f1KHI0ofgTpjkvIXf
         Bi5WUl1z9Et19qO3SIBmaRbdKSKSOMrcPZcQ6whaV/7PuZqVv6JdBSF4+pzLEgBMVSud
         E2DmPxW8vlXneGU7jiEmbgIOfTWio1WegxWNgj6nrVSk8jo7f3gLRExENMaappk2U5aj
         3qjRxLVDWVkG5p6ghH2g0W6SrpiW9ty6rpXnL9Up54tUIGpAsKQFX6r3gb7fGp1D5LHN
         H3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904236; x=1683496236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w24X/TbkOlhe1U7zkhFMh7hB9JLN+Ijqh2VJDsOo0Sg=;
        b=rTZ03bZHYQb5sjptO+SLUZEI6CDqt7iEw6OI+tCBz84vkbT3ZxJrR3trIAF9Cyyn2o
         rx0bpfgnXqVqS7horMhnFAZuWSMyn/lyH8OC7yVh+XglYQNEBYEdVnFYhRYYOaiGYZEl
         d8epSX7UE1TuVg9A7hJ2m1VVOn+HmyNW803P4eiU1W1wSu5kIdtTwjk/+M2vrIuva77l
         hFAshfv0Zrck6piq03Odql8Wi4Nb1fFKzfFTYnuw2DUH568ZjRvyBlnRq7oBV+dUwnyl
         +m1M/aLgvhoW8dYdkcERSDW4WpocYORJr2qKQ26BA2+kR9XTmmVHx1DrqRT0c9vPtlZH
         ma8A==
X-Gm-Message-State: AAQBX9f8AtjEdwOYm7a+UfLmFnF+gEWXtD8qFbm3S52TCZSE9Z2sW/mA
	4YcMfpZPRyAEe1oZkYMhzQwgLU0oyBA=
X-Google-Smtp-Source: AKy350aKOrZvwH0oj4GzRu4RTu18UPqzC7HcJaJLYwNWqqd7ETYy/LmbPmvBVGl0gtAdGxYHZroGBg==
X-Received: by 2002:a05:6402:2787:b0:501:ea97:519c with SMTP id b7-20020a056402278700b00501ea97519cmr703836ede.4.1680904236475;
        Fri, 07 Apr 2023 14:50:36 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709060e0d00b0094a2f515111sm88920eji.42.2023.04.07.14.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 14:50:36 -0700 (PDT)
Date: Fri, 7 Apr 2023 23:50:34 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] staging: rtl8192e: Remove one of two checks for
 hardware RTL8192SE
Message-ID: <4126cca73739c75b1a0379af2ef8b0c63a705639.1680902603.git.philipp.g.hortmann@gmail.com>
References: <cover.1680902603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680902603.git.philipp.g.hortmann@gmail.com>

Check for hardware RTL8192SE is done in function _rtl92e_pci_probe()
directly and also two lines later in function rtl92e_check_adapter().
Remove top level check to increase readability.
This pci_read does not follow a pci_write to ensure data is written to
the device.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Added check for pci_read does not follow pci_write.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7506d7eb7b4c..45989a77a27c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2130,7 +2130,6 @@ static int _rtl92e_pci_probe(struct pci_dev *pdev,
 	struct r8192_priv *priv = NULL;
 	unsigned long pmem_start, pmem_len, pmem_flags;
 	int err = -ENOMEM;
-	u8 revision_id;
 
 	if (pci_enable_device(pdev)) {
 		dev_err(&pdev->dev, "Failed to enable PCI device");
@@ -2189,11 +2188,6 @@ static int _rtl92e_pci_probe(struct pci_dev *pdev,
 	dev->mem_start = ioaddr;
 	dev->mem_end = ioaddr + pci_resource_len(pdev, 0);
 
-	pci_read_config_byte(pdev, 0x08, &revision_id);
-	/* If the revisionid is 0x10, the device uses rtl8192se. */
-	if (pdev->device == 0x8192 && revision_id == 0x10)
-		goto err_unmap;
-
 	if (!rtl92e_check_adapter(pdev, dev))
 		goto err_unmap;
 
-- 
2.40.0

