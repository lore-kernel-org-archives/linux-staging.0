Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C49B145B25
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242551; cv=none; b=t9Oxxr4qKi7JEJRNLObGm5fuwCrEvH0/36bFtqj8kXtySs3FEbgmKdZRoIY7ba67MpiUHJPPNwufO0qtVgTttFgzv22r2YDFKQBflsi+tPqvPgUg1rm4kFR1O4rsCcn1SyT9hN5Rh/xgh+5MHpFAs5lLvtLrKPJbW51tmHfgswg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242551; c=relaxed/simple;
	bh=VU/rrhleeS/+15Sn+0xnRSbzdoNVglfA6iecQU6+nM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1S+4C9NJV+bo6CaAf5GsEXMeLsw7WlAzn2Sc2FvFNL/R5Xe8rpdbMU1AXdgISXMYUO+dGheJjNmj9xqiiywXAosdnzvajJfJu3Xh/uyQeKos+wcb57Qtk+SNHvB+CKizT4/aO+1newOMPmXlTl+wNSl229I/fupsltj6V1XvkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRk2f0pX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRk2f0pX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2161a4f86a3so7919365ad.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242549; x=1735847349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLv/TrsqKNLXFPXLidmCmK90WVqyL60WkqeVoeLIKIs=;
        b=kRk2f0pXccdszV1pBeVF9+GY3xZKX1T1q6nBb9eG2Ng4ZESjDlS0JdELXDdtpQdxkC
         9e9n59v7sZwWmEw5aOFT0h5cC1PXAj+R0deULflnMBPB9dYDzqNJSOivXwNn2RPR6USN
         2I68twHqijsmm1a/9ha2RAcqdcL6jMLDugPmRqA/Y2fp76UdzWubaV3OYhRR+Pn4Rs28
         R3f8mH/dkVmk7OFL9vqwJ8m55YdCywPWaI1c+M2kGQplJbkNM88G7UzoZb+OUF2nteY8
         yzmAWkAmGmWY7eAWkD4NS0rDmi/5ctP5buo+DnK7pj+LunKwtDFHdvkvJIBsZBhO2Z+Y
         X8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242549; x=1735847349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLv/TrsqKNLXFPXLidmCmK90WVqyL60WkqeVoeLIKIs=;
        b=xFKlaV8syAl+Mv/MHIyLBrG1MhiK4SufLCz3KDI9sajup4S5OEgNB9um6E15lGD9s5
         KnX4PDfpXv7c8AhoowgVMG4K7zNqLOE+vdtOBfiCx0HQSYbgz4P2dW3MfRwnomVYHSyQ
         fe3H2jGSYxTKUPdxuB6eO4NSk9CixB9Dvs0JvucBNobNpVM2JbTmYqmYNLcFaohqurNX
         SCUfPUZ6l+zl0+fg8HTcCivs1htX9I9eOWX2Ou3GKsb7fNPlg2jZOX6+hbyfdJ7Su2fH
         e2f3wlQxqd1hiYObFpBoTGW8sybNoL4ae+Yk7Mc+MyMze4lhidEwFOMJ9IwB8U/+/sQm
         fP8g==
X-Forwarded-Encrypted: i=1; AJvYcCVCHRWCjC2ypBIAMRYvQimMi2SeH6Td116Ux0H/ZQACMnB3vxgRt7zb9fNU7b66HmPoPgOVGB3/b0SmRULh@lists.linux.dev
X-Gm-Message-State: AOJu0YzJYTIS5mIiA1QsOl82XdHL9BwG5Zi1evwk7qmjq921VB7E/Xh2
	JPJFAhmJMqlc8lJ44bowQHcQPU7Zy+QH300sbkP98TXWPDa47cdFsOCtdW6p0Rs=
X-Gm-Gg: ASbGncuiIzVfpaHHhHdWOQ3Mx3JP0sSI7IidEOtzRAa44qXqH984WQCFoqQq0BJ/c5g
	OGtUwveDMWRBKvLsbxLGzx5StrGopEQT8NNLp/mHVkeEAQvVU22h4pSsi1j5mzCLX01C6QR4Mse
	l11m6kRZqqx/yu4KB8+4pzQ1WzlOeoauNopVEvhC3NTbTLYYmXtSy+C/3cUt66jC3j14U+HFzJc
	sj086X3DtEle9hATgQvDLcTWWualJewJLA4aj6K/JhaX/ov2oeeZjw=
X-Google-Smtp-Source: AGHT+IGPHRpatZpeO3OHQr6/82Ll3cTeuH2yhyXUn6+2MEIQIMuUxptiY/LzfNwREyNAYRuVbOPSDQ==
X-Received: by 2002:a05:6a21:6801:b0:1e5:d3cc:4632 with SMTP id adf61e73a8af0-1e5e04580c0mr13477510637.1.1735242549434;
        Thu, 26 Dec 2024 11:49:09 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:09 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 01/15] staging: gpib: Modify gpib_register_driver() to return error if it fails
Date: Fri, 27 Dec 2024 01:06:25 +0530
Message-Id: <20241226193637.241049-2-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226193637.241049-1-niharchaithanya@gmail.com>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
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

