Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345B741760
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367146; cv=none; b=QECJdr40Hq27xUTAXd1wjzSNKS9lo3YzCCfugFCdODwcBPM/QdvHnOpQRT1YqdnDa86qOyzfySmLHrVKMjqjAFJUkhCmW5+usUgp69HnEUzhu3pv+uqFSGoznytLH7wY6qBICfXX5NUt9rd4vDh+BzRlgPAz6qpH2/dregqz5zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367146; c=relaxed/simple;
	bh=hUxZ8FrvpBx9aXpZcCXs3Uo5cPIbsMPecSxvj8HGdKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cwib7hxbWWW9Ao1O74irzb/UvP4rxKJFPz7bppxPeOaCtKP2fEB2sYFl5ZWqxCVsyxJfrBkz5RpQzaWO8Of8JuGleHjvzrCK4sfdNApeF196BHouZb67qHdfFl2BVgbtWFn51q6HVJh1l9skW4RyNwAGb8mvjPed8aV0aCqzn64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlXycvMV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlXycvMV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f45244a81fso1246710a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367144; x=1735971944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLv/TrsqKNLXFPXLidmCmK90WVqyL60WkqeVoeLIKIs=;
        b=DlXycvMVjRa7ST6AAB/u/IjvMAoy4trxH+tkk1hIyWAMj3PKTUHN3nVajhXpuDAnzO
         MdIfeeoeVrDflqItLDw5p0La18kYVlb4sMLikkZ2XojfMh+GuTJ56SVAYGi6wL8k8yWG
         Kk56ryuVgDe7YXh242+mjXx98Z/OP0NoU+ZacrwRci9GdmR/JTUH5M0jzErZFgdvVPus
         0au4IY7P1IDGOTIEAesIzSL1B/3/8bK8kD3ltfsxK4dygVQHZgJcnPEfgsrIsJpk578r
         ufHyrmMn9gdfWJgXXObWMUkdpW8ReCz2CM7Svt7p7hb1efMBkDbOYyxWD9pGd7Dt7Hpi
         WdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367144; x=1735971944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLv/TrsqKNLXFPXLidmCmK90WVqyL60WkqeVoeLIKIs=;
        b=fgfc9ssoACstWhFEdPKH1az6vlcPIiSYYO2Cpfp44u0eaF4vqvK46snclw2YQoyx0K
         8/4gWZeLiiDJLl/iGlETvvQhrz/e5HEMyjiswSy+UTXUlidqAiNBFtGOI5uK4k+06fRp
         abUS30uQ+p9KUy30FUF33NIdYF38R4V4pTXBnqiQTLRiFS5LjefDkkwIYob9Nsd0M/4P
         9zC6GS/KDJ6qkkzYdBK0ApHKVJolx4gkrgDMShWb/417m2u5qxE9HSn61X2gUtPZ9Qdb
         9L4AVetFcrQTZiCGKgSuJhxvtsTTgdBXhmheV00IjlKLUzT6qyEz8GgXZsb0EC0UXDGu
         LfYw==
X-Forwarded-Encrypted: i=1; AJvYcCW0nBDAlzDZPWzd5KLGU5GUtvibR3PxaVD6uEo72jM2T+/721OgH9jcDWjAtrOtV6Q+cuOpjB8cIKGrQFli@lists.linux.dev
X-Gm-Message-State: AOJu0YxviUl4hNbKLQS/BmfttTUPgezb5bdMTgXqIttWmU0VT4ANdSvm
	KaLI5n1M3jhSOKkBz9efLROfypqO7iN8ZjMaNEtTEURLzTvYsbhr
X-Gm-Gg: ASbGncugzoJ5bcgSQHsp01vWhDA9czZqB+kyYAXnqGOsjIeai4d/lpYxvjX9qvG/C51
	gvxPFgGcfRNOCLSBGjsStIORrMcrqHp3Y9gWp69BoHXXbs0Hv2S7XHlhNQXNIMcYDoPVSFmJLbi
	+19rkHkyQ7G0sCi/mSURhvluk699ue0G2NZWk61RGhjsb8iy5sNw8WOtqQVfjqJ+NhOx401izep
	naYozSfmcn24d6vX+AIYFi38t7y0ismhzQxxDDMZdM55tZ57T6X4Jw=
X-Google-Smtp-Source: AGHT+IG6+h6YfUGxLZ2dRC+aXcdBRJjWHdaWKAQHDgTLK7vryRIgHyU98oxdi8ypalEacL9fGWFH0A==
X-Received: by 2002:a17:902:f64b:b0:216:30f9:93c5 with SMTP id d9443c01a7336-219e6e9e81fmr156977005ad.6.1735367144443;
        Fri, 27 Dec 2024 22:25:44 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:25:44 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 01/15] staging: gpib: Modify gpib_register_driver() to return error if it fails
Date: Sat, 28 Dec 2024 11:37:49 +0530
Message-Id: <20241228060800.107653-2-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail if kmalloc() fails,
but it doesn't return any error if that happens.

Modify the function to return error i.e int. Return the appropriate
error code if it fails.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 7 ++++---
 drivers/staging/gpib/include/gpibP.h  | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 405237d8cb47..07795df3b721 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2094,18 +2094,19 @@ void init_gpib_descriptor(gpib_descriptor_t *desc)
 	atomic_set(&desc->io_in_progress, 0);
 }
 
-void gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
+int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
 {
 	struct gpib_interface_list_struct *entry;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (!entry)
-		return;
+		return -ENOMEM;
 
 	entry->interface = interface;
 	entry->module = provider_module;
 	list_add(&entry->list, &registered_drivers);
-	pr_info("gpib: registered %s interface\n", interface->name);
+
+	return 0;
 }
 EXPORT_SYMBOL(gpib_register_driver);
 
diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 5fc42b645ab7..d0cd42c1a0ad 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -17,7 +17,7 @@
 #include <linux/fs.h>
 #include <linux/interrupt.h>
 
-void gpib_register_driver(gpib_interface_t *interface, struct module *mod);
+int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
 void gpib_unregister_driver(gpib_interface_t *interface);
 struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
-- 
2.34.1

