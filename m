Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7C613B7A1
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309793; cv=none; b=mPzF+yhTXujub1ZT0vxb36yxFQjzQIcNT94hnHrplbn92QLSFWSnInZYA9adaFI9Lm0dYUo5LTZAsItlpIpIhW1xCe5PhMJqvgE79Fk21majQUH95ibh4GMhKjHnR/X3JgJA+oR0Nz3UEN0ayp4g0/cc0+ruCLJlakWrjS/pDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309793; c=relaxed/simple;
	bh=A7Z2pNuahnQTHPxYxgbC81iuG8UWkVYNqmAEGoD+kuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UZz5rcN4v6gla2TRyMaRyx72RWAtdBR+2xDa3W5dO7h47GOCEv+UL2n5uZqS7eV40ahfd1uEfAOlNbZwcpW4Mw8kCLjaNa7Dn1GPZAU/6vVtIgXAI3yDl28ic85H+Z0rCDUVU0DacIqaZPC8DqjlnSOIN8iX2m0h6zWnfH6zvzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rm1yZgma; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rm1yZgma"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-421d32fda86so16460285e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718309789; x=1718914589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPaCGuMACw1TWMHFIb28HSglVp7CXEoBq/vp9txrrWI=;
        b=Rm1yZgma/sQLgTMhDPymensUsZEZK9wF6i9W+sgpG2qWGwgtU/nts4o57eahjKINbn
         GBDYIjrtM/tFFvpphIQg2bHIFQCv9aeL1b8jRjVRFqi4/prgCstUUPJ1HIjNfmN/Q127
         XQjqscV3DHVpEATBN+o6oXC7SFEQbY6V8GxVX6M/LTwXPwJJdIblEzVVqnXnOM6apicG
         YXDzbO9PBaAqdd0DepFICpK4B8cPvbFHXrSFniU8h23izBN3mDyZJrAPV0ml7ZjAIXHq
         VEi7SxJPCXeTDKOQvDjl0SNypGIVGF5amTz86wDZzmYi5DZvh1WJ/egZU4tLDq1rLR+o
         Ytog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718309789; x=1718914589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPaCGuMACw1TWMHFIb28HSglVp7CXEoBq/vp9txrrWI=;
        b=Hd0MUR6zvExVOFIpwqId+WzNOPvdzXiANUsZrVQl28O/ZdrYjxE95ycsPGB9PenMbT
         mNPsmE6e+6ZIac8iV7cHIDrMzVU8EXB0QaQPc30TYKp9dqvipvqkqbDBU8HSuCncr6pF
         GbKzYO6mIhACAldZXVjHc8RNl3HImRUHE8ls9AcUh6IeGC/+/6Y8hgugMEz8wgNLn3Bc
         Eh6RYnLnOvv7dRasu3t0w6HJ7k61RUXfBLoafBd8MZphkQXhlNInPzVmB3Iy2RhC/Y6n
         RMZcbrjxCWeNxS48gT8dbJDXxMSJIGSillE/OVij+nADUsvuyFhB8OM16l5aqrlYjcov
         PpsA==
X-Forwarded-Encrypted: i=1; AJvYcCW/gTbvXFWZtkxAMPuI4s0FYayAcgJNdEiALNLGsmFrQJGVmEfF10Xar//o1rnz4kblVsLV/32DmcVblbNzSsrRZ09Pfh+s13e0rNqlKw==
X-Gm-Message-State: AOJu0YyG19E/if/4WDFyRkRPN5H/oSxCQDdG8RtZGlwcqvmaBqQ7CSeb
	JnGPbwDgsHj+OzXeWEHqhkx/H89jC9UJ0WxwGa0g3NKBxKF3TOR3
X-Google-Smtp-Source: AGHT+IHGJVt1LrU7R8B3h993GSRPSiYf0kLxVvIxoiBJTPpIJskHQcvzdyg9qP0q8strnZvEQsqODQ==
X-Received: by 2002:a05:600c:1d0f:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-4230481bbe5mr8374605e9.7.1718309789397;
        Thu, 13 Jun 2024 13:16:29 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de618sm73817195e9.37.2024.06.13.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:16:28 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH v2 5/5] staging: rtl8192e: Remove unnecessary pre-declaration of struct net_device
Date: Thu, 13 Jun 2024 21:15:11 +0100
Message-Id: <bb7d1aa7b336e4d68a30fd17dae7accfd2d5a26e.1718309120.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718309120.git.engel.teddy@gmail.com>
References: <cover.1718309120.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove pre-declaration of struct.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index 615b84bca9b8..3a5635494385 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -11,7 +11,6 @@
 #define _RTL_CAM_H
 
 #include <linux/types.h>
-struct net_device;
 
 void rtl92e_cam_reset(struct net_device *dev);
 void rtl92e_enable_hw_security_config(struct net_device *dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
index 866e0efbc4fd..c645775b2150 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
@@ -13,7 +13,6 @@
 #include <linux/types.h>
 #include <linux/pci.h>
 
-struct net_device;
 bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
 
 #endif
-- 
2.39.2

