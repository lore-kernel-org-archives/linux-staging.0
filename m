Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9181C1F3D56
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 05:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699202; cv=none; b=RvrQnQ8IxhpiF+YNCEGrljkojM3p34H9JfCqZsMWHqJDvrbCK17XTrlR7RhBxBnDlO5kJuV6Lisn+QzeT5OTpAsxlTsEb8aIH64/Ldf1kfigR6iEMYwWKJiFE1NkE+L0PNpvV+LZoWHGf0cu0nFDvtWgEAoclOAssmTOK0hhjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699202; c=relaxed/simple;
	bh=XVWfsIAgGX9Xd1n8zXWGc6IgbtmhQvC36aepBIb8Tf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f99QaiO2je7Jh/Y9PFhGESKnXcUO6cQVWpgAv1nAUWpIgs7ZtGJ4IpJWtuiZspCV3ygJfI2SKevFvS6beMKPL/NB71GiqGUJAWybqUUGfxJEeBynF/dv88SfUTncF4DQuQU1Az7B8XXn2GCo79oMIfzE79aCcQBlcopVNnjWO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmaT8Jqm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmaT8Jqm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso8225778a12.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 22:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784699201; x=1785304001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=bmaT8JqmmbUGJjG1+OHFuwGLCkdQDJBDl1c4sAA9pB6HPrKnYBRNvry5wLo8UGpLdK
         u9mbpra8cdCWCfumTQeT/OyN4/vI6tP9WlM4BSNpAXSIPLcxWpmaWVCw6ULLOMIALPkK
         +KKUvb6xJqt6YirYfGgJy/KT5OVYXaCDW7tgt+3EhC2U0zZAwglwz4pIqdmQTS6/aXbd
         ogm3zl/vKOF6TM1ZJuW5yQnSBUFfiC8fEs3o0qdgdXMVpWgASYq/eYB5kX9rKOMof6yh
         fNVcp3t8n0q3WRuRFp23igP8UgsOIcuCgVHJjKMmjsAsda/25Ww8o1SknArYkC/Zuc0C
         zbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699201; x=1785304001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=iV6fxZd6PRTlILvafd9sfjNMOVaVUPX6e+eGsajBnpC2GaLP4wbINz6zVeCCr6zHts
         qmfpRLctKsKlzoNyXChgaQVfjuwfKUzY5MqWtwQwJaKzgNfr8MrWNVi1zqOMkEbJ4/fN
         kE9RtK31IRxQ4RhWrFIUdT1jReH6sXrtKdU04sCt6aKQIusXkXkL7/J2BBE7lBCidPlX
         oQGHzF9b3jpyRMPiCerq6a2OwgKzURQKewu+eG5KcSnmZIk8JaGhbSWxjAdMoIDzXwKJ
         NBg0lneHa7sE/qHMLm4Oj7O4xVfNeON1JMoRZH5ZEIXtrChEVvj4umW5rfqTZRLW2v9a
         pkjw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4CCr05tyaatsD9q+LT3t/j0ZEGdTVD20Nv/Y4pkz5ooCnK7GOYktUBWD0tDPMrx417O+LMahDMvc4mrfl@lists.linux.dev
X-Gm-Message-State: AOJu0YxEsfpXiDhy8k7ommljKxGBUM5Q98jSGD9jOuNim3HlDdVmOYSQ
	6K3GAiiDgbb6S6Eg9LzilTbH87Yu2685cNWlvoKrZNj5+9n85tYFAwKe74MYWN5Q
X-Gm-Gg: AR+sD10gPrM4RJYISxMgT0l4CrUj6unvX0q06BJ/iRIwQFq1ZW+6sYopLLxA8FUhr2Y
	sMC4/+5UKnwI0XspUz9m5W9M4GF5LhwAWPjC63ghgHnsOk3cHYM+NMKqp3HVQz5bOGsZMX6O1/i
	WdD4QQqak580+PUG6ggxOsH+Y89j19Z7c58X2E75kEJsZkVH6a78hXMY+xUnBn2rK6o7lTkSXrC
	kMuvPjtbCnOcexrICddBTdyhTVX9YFFpeGIRqsUSPLyNjjiZQ1eEVaVewx5V6k6Cyo/4qWWB6f9
	bItCAxCItfqRKJHHfqc8mnUxUcoSc621aipJrHMm4hPKv0yIHCtscnqU0CtQGazXTGE6nyNhnC/
	EDW6nsJCbCZBlDMr+N+dLdkaJnGnIbxXGozdYRhyNAY47YMpS4J9Cq8EZmGJAeHF8obnlJtpPzK
	L8p121jB4yJrdF3b4R
X-Received: by 2002:a05:6300:95:b0:3a2:f7bd:a9a5 with SMTP id adf61e73a8af0-3c3ad95b577mr22524251637.38.1784699200774;
        Tue, 21 Jul 2026 22:46:40 -0700 (PDT)
Received: from UbuntuOS.. ([2409:4080:9090:9e2f:1d63:54d5:537b:d849])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm2501696c88.10.2026.07.21.22.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:46:40 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	sakari.ailios@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v5 1/2] staging: media: atomisp: Remove pad_w and pad_h module parameters
Date: Wed, 22 Jul 2026 11:16:14 +0530
Message-Id: <20260722054615.21492-2-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
References: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
 <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
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

