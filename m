Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE54242D72
	for <linux-staging@lists.linux.dev>; Sat,  1 Aug 2026 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605819; cv=none; b=mW5mbFzdX5Fo8ll7/xRufG4tVcTRcb+jWGL15PHYVcNZD8kGUQugriD9lrtcUXRl55krGsWLPDUKJkKW4OGWbzXLgKuPTcdkeXwdUIlEyiLrek4JkejwDbbbXTspJtrmpPAyDIFW39+X3agG5Zn62D8hzD71bcNtJ2ojpiM6eB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605819; c=relaxed/simple;
	bh=Fdw+T38N5SdWYIhoqS0GEfMDWeanf7vjxSBMLXdnro4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JI5rWvcVU/L2mFwYowCZsnOwQbqHSK3/ggQ9vK+P101t+H8bcFAuqbu5BSdsParxbLQYQ9xfyatL0lAr1GBfnp8iQrqlMBbfK+dxkOHUUYCWMev1mL9pHYs9KyyCfqinH0Hp+rDBNughHzgBAdNUI6iQ1RmziJ2kJSaHlr1/a38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAv5+AHA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAv5+AHA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce98cb8165so21334705ad.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Aug 2026 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785605817; x=1786210617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jegZtKUrU8Lsg67WkyerCWWl/Ur54ZIdjcm+N4p52Ys=;
        b=aAv5+AHAv15HtOiqdha3p5LxubREYyan3utb3ztwN8XS5t8T1C9d7PWoYdWuVOuihb
         6uymoMsCi6N1RwKzcUqT9z/bf9nzjj3JrxBeT+e4+BEB4lJeJA8HeUX5ujyIjzX99lSz
         AC6X2T2/VL1oK+T2yn7hd2CeV71ayGzZ03n4vP+T6g/Mg0Um6GvcVswHzt+oydHqrqWf
         eN1fNATAJCQXFS8tvILUwXcq8J208apo3vP1mWGvlKemF8QFHk/IbD0pxSFHqk2u9Rci
         C0JuZ/4mVFe4zOgnxq4dey87ahGaBKsx6+VKU06qeTJtcLdwnKdmStp+jnUe+CO9mkvh
         kd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605817; x=1786210617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jegZtKUrU8Lsg67WkyerCWWl/Ur54ZIdjcm+N4p52Ys=;
        b=CMnwV2z9PpIhLjTBUd6BIQelj1yI6JPSn0ygm+uBwvSaOQ+rSwZcT7tyPj72ilwPnP
         e/IrUktV9xKIyEy5VA3mR93DpuVx7WZGeAQ1HsNxwWJy7N92ixOM4NAN8ixTeRuVY8h7
         igss2Sp6T/fsV9dCBo1GVWZr7G3//+E7jguzMceq1AQM91jxa6/XRlteuzTqbSEFsNKg
         gX2kdmZ0dFBOS/744ZVSxlN7u0PFuEfqePBpA/flWe7FECFqNXgnznj/vmJbZtOQhR1j
         rMrmhjx6rtZMMngrWSn9z+eV8CwNzMJVCVMH7KYj5Yz/012q/91vBjXTbhyqJelz0Mz0
         nnew==
X-Forwarded-Encrypted: i=1; AHgh+RrJB4oaG0pNjHsdM4mxa2nuSghA25Z4/rnzSmTbzs/+wHcf++hwUMebdz7eM9XhDVeRG9iNrJNphm00mVvC@lists.linux.dev
X-Gm-Message-State: AOJu0YxqUfXEXzxJnMv+IIqrwU/HNRAu1rsOvz5jKxk4ZjualI1IGgdT
	WIt+UfT62Ira5QaMK9F26dSFzaKK+MhD+qt6y4LlcH6q5M3Of7+L39vp
X-Gm-Gg: AR+sD13d5SWxWww9Y/wSIwn96MhRU2oAII8LL+SSEcurwJgQ9WJneeJdbLvLduQdVHs
	z7TZ2WhfQpwDRhixOo9gn4w3YVt5eDTLOOK17Ep5Q7G5vzpZ10gaYnVQIFEz4bbQFMB/jyDKGfX
	bPd76PvokE5WYAeW9lw0xx9g5bkCwo5ctHkpe3IrBoIr7yDbaxhnGthfyUguhiNV+FSq+ZFKwvH
	GSW/DLbEPo03DWuXBnEyuvT+T/G07rSrqh3MAMAtAGTrSHh7uQD46Y3ScBhsIKNE2KZlkM8sVKH
	XhqM3G+Kj32U5+g7WpK5UlCS1eUc1wlZzQVX7px2WnP0KTuNuzAzP7AAiUc4+5sqeMRzWiaUA7b
	7q7yeqcv8lWzRAgY+aHnH6+2+CxU2l5KBqoanj4MTDzgUFjqCemgjYj8goDYGmIWn6VnHddhoMK
	RPpi26VtCYtS5oLhGXnT8BNfrVk8fTwNZxKHvJT9oS3yMH9/Mxodb9c4x5Vg1jX+DcM3vVcKIme
	FSsr5515emr7UZG+TAcgX1C5xeDAHwCGrmYB0LtI+A=
X-Received: by 2002:a17:902:d58b:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d047e39483mr54897385ad.14.1785605817113;
        Sat, 01 Aug 2026 10:36:57 -0700 (PDT)
Received: from lucas-inspiron153525.. (host110.181-12-179.telecom.net.ar. [181.12.179.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5c7sm22155725eec.5.2026.08.01.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:36:56 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas Jeffrey <luquijeffrey@gmail.com>
Subject: [PATCH v2] staging: axis-fifo: use size_t for write size calculations
Date: Sat,  1 Aug 2026 14:36:24 -0300
Message-ID: <20260801173624.106971-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731034307.327377-1-luquijeffrey@gmail.com>
References: <20260731034307.327377-1-luquijeffrey@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The write length is provided as size_t, but words_to_write and the
return value storage used narrower types (int and unsigned int).
Use size_t for the word count and ssize_t for the return value
to keep the types consistent with the write interface.

This is purely a cleanup. The VFS already bounds the write length
before the driver is called, so this does not change runtime behavior.

Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
---
v2:
- Clarify that this is a cleanup.
- Mention that VFS already bounds write sizes.

 drivers/staging/axis-fifo/axis-fifo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..d2b30b7b6845 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -214,9 +214,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 			       size_t len, loff_t *off)
 {
 	struct axis_fifo *fifo = f->private_data;
-	unsigned int words_to_write;
+	size_t words_to_write;
 	u32 *txbuf;
-	int ret;
+	ssize_t ret;
 
 	words_to_write = len / sizeof(u32);
 
@@ -257,7 +257,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		goto end_unlock;
 	}
 
-	for (int i = 0; i < words_to_write; ++i)
+	for (size_t i = 0; i < words_to_write; ++i)
 		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
 
 	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
-- 
2.43.0

