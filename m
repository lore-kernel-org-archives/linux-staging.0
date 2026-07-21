Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF4321F5F
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651769; cv=none; b=SVCBxZ1D5QSlZcaXV20+Y08TVkwP6JDu4QaxjjnMgT9hqCVjn8l44tOI3LzEwylqIUoDKuK4/TxABBPlZi2rYRvPwiVPKPc+LN4FdEegohRpYzKEgzEmx01I5oXUO0F1+IfrDl6X1A0d6YgsMiNC8sMQ2M3cS3Ren+geDftH2oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651769; c=relaxed/simple;
	bh=XVWfsIAgGX9Xd1n8zXWGc6IgbtmhQvC36aepBIb8Tf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ogQUhEoDlJ9F6SvtokNcQJ1dHrmVala4R9yg8dZ/wZDeSj0eZ0S4pWNqZ+igeBqEv/xoQVzEGCLplwVWkxKedmcIsK05ouwYv6HUMZ/i0flBIOI2KM2Q+Rc8JL9Sml5QbyKQX65IdCxAURYnQOCsS28AuEeg1EgrMiBLvLDZUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLhEQiNh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLhEQiNh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso7827761a12.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651767; x=1785256567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=BLhEQiNhQAN6YQoGO6wRjNSq1rpQEHFyE2SwIWZObnffnSuPEpuXvwfhzVMm0Lk7a3
         Q8m8FX+m7fO1y5MmC/cYIO4J4VKWNq37fljc8+0B10fXX/Y5isxtSwHYwT21YZEkGnuR
         7g9IhQ+/5E79PT35UQtkOHPHAUVM1VbSETJ5ETT87f3IWTAoyHzB3I2AMTg0cXB8zZO5
         nLeanscPZhDwvP5ax+gZVatWadUknto3F72BrYpzd++vtv7BDTZCiL9n7KQ+s5eTXkks
         uInuaagsgriFRSLnzTgUyaPkV9/KfJTWQqSrlcWb4PPoZ3ZI9SPqainXHr4OleUH9aZv
         ClzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651767; x=1785256567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=FIiWa+Os5UJYTmpVbAvdnZZHayG8nCbN1b7723ELdAkmp0Ovz6Qu76bVYjVGtO/tsO
         G0bnn+dLB1rx3cmMV8KyLp0VR8R8pMjrxZs7S8H7SqGc58NXlQNF8V5l3Yt63gwsMD23
         TzV8/Iee/DybIsv+macwuoNo8OmYRRin+UFs2+VbXDM/clbD5nCSXe1bfBVN/etu/OpL
         W0301fgioJNVLLryzsD/CQEYIDRAcC6HqSBkJqFhFpmKJL2aRAJXKRqSt/oP3pzlFG6/
         KhuReNyn5VXPA1schH3l8sQFOikHdWOkqT9zDTfvPO5/GQon+YGw17F5O7gbw+zp8PXt
         wkDA==
X-Forwarded-Encrypted: i=1; AHgh+RqUz+M+pbjtGxUccK/tC7rO0obfxbaluNQw+ZsZMUuvf1WRgQ2VH5X3i2isvopYavvXkJYfveEqWkmzs2ve@lists.linux.dev
X-Gm-Message-State: AOJu0YwtWlDP/hIFPs9JNTvW6tPS9xqv6Ld+5YcNYDv54Mx8by7nAIMx
	vkVt+x127I2Kiu2+BktHFRU1OQ677X1HrwOvDLrA/GEEvBKOOL3/Llom
X-Gm-Gg: AfdE7ck3QWWRpyDBHnEQzrx+RfJnT8dGdMB2yeKqVb3+sJkZArl762+D3/FGe5opUtF
	9geWxHBzaDzRr2AhkzRbsrn7o4ic7OaxZadfpmlYrj7Rp306fXh8oi0RQ3v9/NA6y9stjQ7vAcV
	JxAwPhoadzKjZZZaIfemu4BNEEJ1gPiklSk6ApsUtM6AtSi7Fdet/jZeiu+RC32c1BnJ4yBHQaJ
	YN/NASf9zCqXiFskdkX7J3viqjUGIRquo5LQItytLT4rufKgHDhVOC3OE0s1ANXAVzLIDgxke3j
	gzhuu6N65Rg8xSGnCHHEcy35byodddDgEbnZZ1wMYngn6lGZPcmRVBZFylPGWSxGyadtQlg1E9c
	lTxqwk1TUsrGVuPky5DOBxDCsO+RBsaXCgYCE0v2TlOuqCE8cojoTIvJPHRai5gu1xUbZsgOndp
	oPUNGYN5UcTJuco73k9koru4bA
X-Received: by 2002:a05:6a20:c70b:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c3ad8083e7mr20534478637.33.1784651766739;
        Tue, 21 Jul 2026 09:36:06 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.103.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm482146eec.22.2026.07.21.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:36:05 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v4 1/2] staging: media: atomisp: Remove pad_w and pad_h module parameters
Date: Tue, 21 Jul 2026 22:05:31 +0530
Message-Id: <20260721163533.15888-2-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
References: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
from overriding internal ISP hardware padding boundaries. Convert them
into internal driver constants instead.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..7c6c0124ff72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -22,8 +22,8 @@
 
 extern int dbg_level;
 extern int dbg_func;
-extern int pad_w;
-extern int pad_h;
+extern const int pad_w;
+extern const int pad_h;
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d117fea2860c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -64,13 +64,9 @@ MODULE_PARM_DESC(dbg_func,
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-int pad_w = 16;
-module_param(pad_w, int, 0644);
-MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
+const int pad_w = 16;
 
-int pad_h = 16;
-module_param(pad_h, int, 0644);
-MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
+const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

