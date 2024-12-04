Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6ED20B20C
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324263; cv=none; b=Kd52dXIHZROWumxd6dtap1liBdVVDRZHrLKkdarVWqhmrM+jqWbkJ30ehAcvUVo5UX4t9N5NmbQ5XnbKZb06ZwCbQEEDhPytY0UkbXYrpmYC1Xy+iEwf+kLQvv1xWYHW21EBvtDNso4sJ6xgsfNMRvq3PlZNnHswLIxXNlpSFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324263; c=relaxed/simple;
	bh=zFemeNdsXzisgsvq89lAZ24CodpGYNFEybzOY0BuMW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpRLVn/GDqSTg+5syQl54ogHlBWh+HCEzTwcq5hYobnYlO8u3loGDDdG6m5JT/2WudHWDFUdrEZum+FF9IbQIeSciX5VxS8uOto/th9YsfpK1ev6G6xdg2lVHU9vBO7fU0i44Lcni3dpgLl15s4bTMnQMzbF3yrstF9Dgm12cAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYmbyIEP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYmbyIEP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a1639637so64165425e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 06:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733324259; x=1733929059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXFeRuSiyz1DRjRD/WJqw7AW44WiOtldoytIzy/FhN4=;
        b=eYmbyIEPPQuy+axnSPmK003OLLTxs2jlcukcyD47Y7mzdms/NYLTpSSWDKAIm9E6UP
         h31mFCFasjijP2IURZmshuqMAWndmGMRq7taKJ0gnmbD/eWg+sejXHzVdHWXxIO7wZmh
         6pEYBlSu2kRGneJ3KhM1lzkDnM1uOWk18kVNOEEd7oNDTzZdLgEQpiRT6aZCGCqlXRby
         PSCIXYz/1rDFfFLbxIZemfbT7ae0nGXnwhDtTlYLIKBzFdEzwVKgqPWL6h7lsm9Zeu+w
         GZv4blaG4Bjp2YhHlQxQeqUcvxLgzPHUX60QkyODGplXfdkCUwGdoN8wiU8oOsneWAK2
         kYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733324259; x=1733929059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXFeRuSiyz1DRjRD/WJqw7AW44WiOtldoytIzy/FhN4=;
        b=LY9JsORxA7ONLXDCVGiUJQ42xlU+qRDXRQd5dqvybJ3Mlo8Pk29XIjl+frsr8ANiFy
         s9mtIdQcLB8Lc5ub1RLsb9+6dud3PCnrQOyBNBg7dCIzuPRKA38SDpHO95yagxSOqeej
         Ay7Zxz5rKPF7ozFwOZiwMjLwhoSZpvsurt6mCnMD6sjBdyzFQZ2CU1/K3A3MJEOBKWpQ
         Pk0a5qBHegsoanI8ULNSMkF+3EZcogTC7BE2mWb8/z8A1avgHcnF+pm/gZl664XTpSjA
         +WDC7EUOQnbXr4F6uNTjCkm/nc00JyBDk2WEiAKY/zciklLBtIunu5XeE8gfgY9rBzsJ
         vTvg==
X-Forwarded-Encrypted: i=1; AJvYcCVpUTe7Q9U6UELbjiCv7y11QoFicZDTscBN/K7rNn4BdN5jHesIwMIdi2ZdDS/BDxgLp+QSP6eEr94zk7jx@lists.linux.dev
X-Gm-Message-State: AOJu0Yza1JZXpfi/oKgy5kwNulgNA+KIiVPC6Us62bVVH8oNeHMhbvDh
	OK/FVEQXzDjFJSk2lCXsX4dKwdt6GYmTHsM7IsI1j4o4pI/Zoa0R
X-Gm-Gg: ASbGnctH5csonI036CQ1DVf2D47biEfvpmU/6FKyYwFiMYYQS6cfq9w5rnu7hu5JFzy
	CoFajLBPf+klr/okpw8AFKqO4SKtNHa9bSjI3/5zZPEIvoBrHX7hJiC4iShaBuCoKIPDBmQlW9f
	5vkbABVJHHHdOcsJ1nfb61I8x8njxq4jKUTvh/d0YK3D2QIeSS8vAVNjES1gybnJATs1qX6Cnh2
	bRg7nfbCL0QZWGPhniNXpvnlwGXhrBkQmnRKRJ1iph4sc/Mzc7XZdoVTiJjo3jIzASb1WXdmqlN
	NPgfyDVltA==
X-Google-Smtp-Source: AGHT+IG8q8m21NtDLtnT0gBHFFs2L12/0kB0ww+aIagP3w4RBI0B8SsVIBLeWzwN5TQVY0ufkyKGeQ==
X-Received: by 2002:a05:600c:4e8b:b0:434:ba13:e545 with SMTP id 5b1f17b1804b1-434d0a1505dmr57315045e9.29.1733324258485;
        Wed, 04 Dec 2024 06:57:38 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527e8besm26678955e9.13.2024.12.04.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:57:37 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/4] staging: gpib: Remove duplicate include
Date: Wed,  4 Dec 2024 15:57:11 +0100
Message-ID: <20241204145713.11889-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204145713.11889-1-dpenkler@gmail.com>
References: <20241204145713.11889-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/uaccess.h is included more than once.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410110406.mQENnj09-lkp@intel.com/
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 9a3271e885d2..47db17418a74 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -24,7 +24,6 @@
 #include <linux/timer.h>
 #include <linux/delay.h>
 #include <linux/sched/signal.h>
-#include <linux/uaccess.h>
 #include <linux/usb.h>
 
 #include "gpibP.h"
-- 
2.47.1

