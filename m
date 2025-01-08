Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A250A201116
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358126; cv=none; b=pxyfpnjvhdVUIV6DaUOzBqi4FwxUQxbb+iObTBG3DxMCKWKyLOmZnIvMILBqgqxttz25gzr1qOeydWjnWc0Cr+5BdusL7d742WyWQ3t1dSVyJ2Pyn5nqcA01QKsbr0AvrfasdgUWBVEAlX75gGJiYTz4vpO49chojzDmSM2jLoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358126; c=relaxed/simple;
	bh=tvW7XjkscpqMn4ljBfxShf2fRy7UlSc1GHf6W2xCKm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dqhp6zJpaOia/8zso6HXFyXGkTRNViXLC8NZ0is4ecXYcWhKZW69yT9ti6XuAPNcZ+G28bhc/TzKp7zHT879zrpsjfwK2yLxxwVokGDFQH+vX2oxcabGetDAkHwY7R6kl1rmMEhLSbNCHduVOshEBKxJS3OfyElvPbyeDIaw75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+ZWqFTo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+ZWqFTo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385df53e559so30339f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736358123; x=1736962923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcSfewpLUtlDikVw3/XrxgvLaw/gAi3tPSMGU/8/Y98=;
        b=A+ZWqFToJ66s96lWwenVuGv5x+fwfqypbOxdXmhch6V5NkW1tQvElGCvzlJEWcnx+c
         fR4mSuKppzAZWbKa2yecwfuMMATqNJhzMEOBZYcmkdQDghORHRM9ZJlxkosA3mYsPxyO
         b/vYOIqrN06G43thCJNRT6a0GVUxXILNivLfK/UuG7INrVvZrvSmtbgQ+UI9K4AiqqkD
         AL43Hc3oQ7/hzU07Cp741zOKRclyDWq0plqBzDDUXX9seQL43WIEKhUTcpo1DG8Q4Tfg
         dQPoLlrfKeG5ikA0w1Y+4WzV+hR0YuyROii5aIwkOuWhon7ET1TrU2rfLwSn2dsONAgc
         TJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736358123; x=1736962923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcSfewpLUtlDikVw3/XrxgvLaw/gAi3tPSMGU/8/Y98=;
        b=JnAnzlUAC1veN1xZf7PR9TfGJNSRy4izTqT93Jop/o6u5oDjOFISHJypLbHtC17jMn
         JB5EnZPQsXM+uHIzgVi6kKaQlNkIQiIP4Bdv1yZiAVHiJtylnQP6jXT1965CRoEh8F05
         yWJbjJQZ/w+u0zyVyQylkzb8e/8JakI/pHeAWByV43YXVG9KBi5kYb6cLsErHtdAbdxj
         NsIt6Ocov6BuGszKxWmWhdhRSF78Lhx6DGHT+O/fEKdoG/GMZvsiN0P/CYF6UCk2KcRD
         Lb3XyXpVX5XUKV6d4V6BwcNh/Y1/eB6mqSsQ2grwDxFl20MwyIID+3AXbIQ8cwU3ARtL
         b1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV8G9GsXI5uGT7Yg6712spoyQbvjHOER0r8wfH+mM6ebbJ0ITouZY5gIu+WxTzgY0FRE8UNnHc10K/lNv1a@lists.linux.dev
X-Gm-Message-State: AOJu0YyK+xLy1mzcGIZ//AjCwJYZFd4wuUk842RRL/shTumauf91nJDn
	7WhkEOrKhQkGWZxGeGqkOmN9FjWp3KwNUbAmHLmb5OPAWeD33XNs
X-Gm-Gg: ASbGncsszgFgK7vyr4Kh7hIc6aHap6Pxwmq7ewpEv2vseq610vhe4VrAee8Opl/8SdA
	x/mmofPOKPQVnrJRg69RWLkEY4dN/C2kgbWQFzMHb59HeMq9M1rUNT7JyhxrKwBnAJT+sW+9EhH
	vSNq2CCgEK5OpWRm9cPs764wd6aylgDoajHlg3LTJnQjD7A9yl8AmQ7T3mnltfxDKervnQOYJN7
	9RC6rSZlzpmdMyLFY/tzlCD0eHEaw55qJ28xnGvxTR/igyo/Mb2rIm1kg9p0jIwbBtb6NG2FRc/
	kaIZ1joqvLSjqDxI
X-Google-Smtp-Source: AGHT+IExRkq1xRf6MB4hR7AdEnwopL4A0jwIAoEyoSh/fMwYYHw25hL3o8kLrphyC0Z+RqerHVYJGQ==
X-Received: by 2002:a5d:588b:0:b0:38a:3732:444d with SMTP id ffacd0b85a97d-38a872e567fmr3300909f8f.23.1736358122745;
        Wed, 08 Jan 2025 09:42:02 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm45998305e9.1.2025.01.08.09.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:42:02 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] staging: gpib: Add missing mutex unlock on early return in
Date: Wed,  8 Jan 2025 18:41:58 +0100
Message-ID: <20250108174158.23077-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no matching product id was found in the attach function the driver
returned without unlocking the agilent_82357a_hotplug_lock mutex.

Add the unlock call.

This was detected by smatch:
smatch warnings:
drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_attach() warn: inconsistent returns 'global &agilent_82357a_hotplug_lock'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202412210143.WJhYzXfD-lkp@intel.com/
Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
v1 -> v2 Add subsystem prefix in subject

drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index b21eadabc466..c22c6bb30776 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1365,6 +1365,7 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
 		break;
 	default:
 		dev_err(&usb_dev->dev, "bug, unhandled product_id in switch?\n");
+		mutex_unlock(&agilent_82357a_hotplug_lock);
 		return -EIO;
 	}
 #ifdef RESET_USB_CONFIG
-- 
2.47.1

