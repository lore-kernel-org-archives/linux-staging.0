Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3599A198A37
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585786; cv=none; b=AVVbcPV4xJzNI+UoW20pIP4bLegcxkkWI71IqsXqcF7jmpap69YKb9wKvfUMsNQJzRrI/WsAcxcse2YT7LTm4aeaH5whxl+O1kS4ab7xwAmqZiMnjM9nAzrVksnQV2h5ma9XZqT+cPFfE1SaygWoNXfEEY6qzOnb2X6E7/YIhk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585786; c=relaxed/simple;
	bh=inEhfls+rd5SvLmjK1jyBzMZzSokzL7jOsUV1xrZHjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CtdeyK7svKFkvh5VhSLQmsXlFLd1IBv4FtstFhUInIRpw0t5nNVKnsJvz/88zGjIw85wR9N2/gq3F2W3F8BMvh3hu/IHIelnU+6VHczjdBWDRUU67GT/VAf+cMrhTq6So4gozT79yj7KUkNIsVdRkxmgPeGgdZJaZLY9b3I0Mqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGpK14yx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGpK14yx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-215464b0432so11654665ad.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585784; x=1736190584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAsHzXTlNC3UmvdMU6pJZD9xh8CT7SmzOJpjswVS2/Y=;
        b=RGpK14yxsqn+rmwIrwk0W4v/49OT6WrhJNsM3owYB8Y1WtMqq2elcP3Gc/U7a9BjQO
         nwAWLWQIVW0zhwKvMDxf0HCdkNP1YfxTgfVZCFaTBVGG5xS4W6lSLiUb4Ms3j3t0MtNN
         IPajIC9YLyOiNwawgu2cImup3Pwn4mkvNrgpa/sEZWRci5fqWHl6MgyXymCqBrpKHvOv
         Y1g6cvZoomwZtaGeO6DnWb/MVe1QaOSAc5D7DHQNLWtis13LurcKx+DSdhPMWMsRklI6
         evuMBRm/j9xmHOocz2o5W6X0V0oO9cHUKSfiHLfgAXiIUz5n31TZ8hF05wWOebdrvJS3
         iaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585784; x=1736190584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAsHzXTlNC3UmvdMU6pJZD9xh8CT7SmzOJpjswVS2/Y=;
        b=lg9VWukgOX0xs97asemnr4EauQNPCgVvRaOobJYF3+gMZFpfGj/7Ovz2RlfjVDmfso
         lpqRyUfjgy/mjQZmJM+eDpoBXnmJZUii+/79MhGa6nivIR9Vkuev/BW32Y4/9vXyzwOR
         ciF5JFen8MyoXISpixHbDG0ykY4Zb4MiEdWbG+kZzwHEx8fcsRH3vmijTOH3Q4tD3Mi4
         0gqKHc/UVFPuk+Ukj5U+Ffo6dOBx30EMwmsyehdVvz+lAybhMKy9aliaRnGALKkmQhCm
         pBcIPK4RqNumEAr+lRsoUWn03/ptPNntfNY3Sa88uULKM1dfziPe6MavRuRgS/FXS2qB
         K1WA==
X-Forwarded-Encrypted: i=1; AJvYcCXALcje1gTH9PCV0wTyfwQBlSTCEF6X7Xvw6cHKYBhNfnrieQE4ss6CJoh0Ic+gcXJvNYTyokR7v36Zcf/J@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk90E612AwG+gSWJJ2iIdY0yA9o6ZYrSu9aA2+/4rso3mrdR76
	m7EfzuAYjxIA1JJMdN0mNgRseZPedYSXNt9Zljy5DwdwFe5/Zgax
X-Gm-Gg: ASbGnctAemODawF8x787IKpi5+ckBcOsdLfAHmu9Iie8WAGyyTk0HW3HQkDDa+2HwSi
	/P5Lr8n/H4bY4VbwG9R7GhsZroUfEw4R3MMM+HebvK95EFcqA0/hxE0gmJiNOK1kfBcPgRZPzr2
	AJiBBB1Yy69zyP31ZkrgEbNMcX7XpZNTNc7IU3SNFEHmmrN3XCfXlTezCRPdU7hOZ/1USLCNw9H
	P2unmkUUhKDTsjmUH48s9imXgV2g6xPUpKosyKIkLeE4hJQzYNgvcY=
X-Google-Smtp-Source: AGHT+IG2Am3uEs46mNP4pINCD1qD41B8MIb1NgNJxANN4KQ/6lMIiTFpYbJkGodGiLYXkHYQG7r4lw==
X-Received: by 2002:a17:902:c402:b0:216:4339:70f with SMTP id d9443c01a7336-219e6eb45ecmr178090045ad.8.1735585784580;
        Mon, 30 Dec 2024 11:09:44 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:44 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 01/15] staging: gpib: Modify gpib_register_driver() to return error if it fails
Date: Tue, 31 Dec 2024 00:26:21 +0530
Message-Id: <20241230185633.175690-2-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230185633.175690-1-niharchaithanya@gmail.com>
References: <20241230185633.175690-1-niharchaithanya@gmail.com>
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
error code if it fails. Remove the pr_info() statement.

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

