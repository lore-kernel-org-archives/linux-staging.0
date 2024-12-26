Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BC218C936
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242557; cv=none; b=MIZKrNCZfX8ZMiP6GnLr2p52KfgTqfh0eWib/DOs0D6jTmA++IiyY/vsRTbdHCP2/E6Rzw2A0epcDgvbOYiBqszkBcZRdvyu0+5HeOMR8OHfSW9kZeJihDRYL8+HlkE92C9jh5QNMLpjlS8YqoNfMhbEGFPRJjUqTN1aROWrycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242557; c=relaxed/simple;
	bh=u3cJyewB0tyfHja4vFw79gzzgMChdWbHeOvFQeP3HcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JmtCBVAvtV1YMXtzRDhb30QPZzsFzrqUcShWQTIrMV9jmkdSV11fictySiHVsc++K4qzFd4zJl3/HHpXwSOVh17MWltoLcAyJbbfC5GFjZ77bi7eEp9/9FNcKzB4zQkPMDuOJ2c1YHk5mqLqdbtgqnJUv51vWKO4H/MMGCGtPf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=husiHq4F; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="husiHq4F"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21634417587so10480835ad.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242555; x=1735847355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOoEk0tyYf3jxdc6YHVdHzWzrpuWImBtU+LJtV7lOfI=;
        b=husiHq4FJEieoDNI3vpmYcn7hpX3ouO0so/QkUb0cspySa4vXsioZ2KHvS0fL+nVeg
         LNRn1k8KQIKTVLvXL81yeqG50BRVHgLR8FiDWDhjx4iIQghEOFc4ms29y5En4tuSHwMd
         ScBVnsq9awrB7P0fTL3rleQ4z1y96vsaVzvUjAwNg3ZQHTzoVDQ3KDvqXwVTqPZChvDN
         y1qRu1XsARf6ztz9Bc5iMeu7c3MBIKkL2sM0wfUVRKniDkKG2JDYnYprkteBT7lwnBdL
         bnCOX3IcyV9Jc0+HBNKpYOrVPSWu0BNoE+RyVvTlb/EM2Ctj2JtW+7NdBbVyBanta2lW
         5taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242555; x=1735847355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOoEk0tyYf3jxdc6YHVdHzWzrpuWImBtU+LJtV7lOfI=;
        b=W/BxPljp08VMveeb4Jw7R5GHeea/oC1OFGG1CO0NMhCykhiseox0++77jaJNs84yaa
         H19APihsBtOrDl5MFaDYyZeUtI9SZBZf8gS66xJFvhhu0QVzboBxEhlZoiQTZyeDuApa
         uCKgtVcb3LB2IWLwYfDnOeDfiL4Y5iLdnSOO6ZVO2fbCiQV47Waev/OdRYNdZNT3S6xp
         jXMsuZ0TE5wDJ2tMIjOOTKBmYSxZ4OeRXlKbqiIPyiWkmjKRzCTBqlJBkh05Uf+si0ro
         3ZzgxPX4VzSlPZ3+ygBntQm9dawch3BcplrY/oQX2hIUP14aebc6Ik/a/jyjqjKXCTnm
         TKSA==
X-Forwarded-Encrypted: i=1; AJvYcCXqERH86jkar0eLax6IBeJIRbWOdrUYiRA3fZ3xEKib7xDWRV5/pNcBCtmVsDh4b+7tkyZ/4yP4dX/PboLd@lists.linux.dev
X-Gm-Message-State: AOJu0YwU6yu+Bv/lKmuFlq34wGE90BmzvYQAwLzEnjbKz6YAPyHHht+p
	Kv7dbcKY40TMGA4zl49bTmnEJrXnH74v9uizMHad9oDmCosixabV
X-Gm-Gg: ASbGncuFkbOLXdM2pm/02BpAEuxKHpcA+TvMbR7NCWwJVhIo1cSXJmK4mDg8KuHLJ1/
	sMZz/uiCojQgvGOqxmeTvsZQ8KAL/bsbAowMiD4ofNFdE6HhW6Gmi575CtAmNj8x1tkAUD/L5Eo
	u2um06XdEz40sYp3XGut4y45x4OJ/Lq+5fCUH+qPluFTgnnRdjzT48sfTSz5cKgHXvaA/qLR6eh
	eKLhGwRzXbn/KzD0h+1UMDMJ5tmUdzYhIcMB1RJ67x1wpYR/Y10gS4=
X-Google-Smtp-Source: AGHT+IEg/oi/pjwuWuRYD2MRFmlg7q2JW/QnFqN29cnhbWknm8up6+gUuf9/RBXspHF20GHs/bJ1dg==
X-Received: by 2002:a17:903:1248:b0:20c:da9a:d5b9 with SMTP id d9443c01a7336-219e6e9e74emr121940195ad.5.1735242555346;
        Thu, 26 Dec 2024 11:49:15 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:15 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 03/15] staging: gpib: agilent_82357a: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:27 +0530
Message-Id: <20241226193637.241049-4-niharchaithanya@gmail.com>
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

The usb_register() function can fail and returns an error value which
is not returned. The function gpib_register_driver() can also fail
which can result in semi-registered module.

In case gpib_register_driver() fails unregister the previous usb driver
registering function. Return the error value if gpib_register_driver()
or usb_register() functions fail.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 .../staging/gpib/agilent_82357a/agilent_82357a.c    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bf05fb4a736b..60311ce8d164 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1691,14 +1691,21 @@ static struct usb_driver agilent_82357a_bus_driver = {
 static int __init agilent_82357a_init_module(void)
 {
 	int i;
+	int ret = 0;
 
 	pr_info("agilent_82357a_gpib driver loading");
 	for (i = 0; i < MAX_NUM_82357A_INTERFACES; ++i)
 		agilent_82357a_driver_interfaces[i] = NULL;
-	usb_register(&agilent_82357a_bus_driver);
-	gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
 
-	return 0;
+	ret = usb_register(&agilent_82357a_bus_driver);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
+	if (ret)
+		usb_deregister(&agilent_82357a_bus_driver);
+
+	return ret;
 }
 
 static void __exit agilent_82357a_exit_module(void)
-- 
2.34.1

