Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5378307AE1
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770324; cv=none; b=D1qKZ40++f7o65xZqnU65wizwoU9Ogy4a8jOZfqNDLWiiyam5HP1No2bKGRW38xQipgvdfw1YKRtKvbET1DhVHkDC4kEsvIz+kuwsacUMVAa3XRaB4HSORYi5WO2SkiKNQXw/dMVPygcEJk04amiXwrPCUvD/2+A78DkDASgQjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770324; c=relaxed/simple;
	bh=DgA+YQZ2PXtKWbfJH1XR71F2ykLEULNrwbgH40vjVnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfcPi45oAWhJpvu/v2M0AVcWskxrYSymW+SmbWyF/gE9tUwNKTwzhMCt/Xs6RaYxHBcKax7TLY2Kot/U6Hv4w1TKU3rUH2UA7IqLX7w8EuRRPqJE/21WdlP3n1eMjxOM++yRXlpaouR7NgQTayywAlVCCDO7x4uTuBnex77Bfl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y57PNJY6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y57PNJY6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae77516so33858155e9.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770320; x=1763375120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q6cLMd5HkJMSjJpe28rjQcWfQMB7GUBaFpYg6qXkBE=;
        b=Y57PNJY6UT0kkCXhrxYbG6zaVA3t8hOfE36OdceFrRehod6GIchMI7DMmrdmy7LREU
         bkX0TMURI0Zu+HoOIjpL7bA35nvNd1MXUitKEzjQ5GdltnSRrwSNf1J8tAHyakJ7L6P4
         SG47+0a1C3mf1DTsj35iI0H2NB/on6oBp0biq0OOjVdsdnrLa0CZwm4SnC0ABe7Rz3SL
         MlrQ9RTJj7GG5j9L80RDJtTsrC7RwxS47AoxPTpoy3qwtvgCT0K533iFWj3l5QShV+kg
         354fDUutzfzJ2F6YhthAV3/E13diO3v0cmd5+ZyutxezZ9Wm26nh27Xs8ln5oPp4BtyU
         q7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770320; x=1763375120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Q6cLMd5HkJMSjJpe28rjQcWfQMB7GUBaFpYg6qXkBE=;
        b=popUjnE/eVctaKL1cSwxdevC+oDCVMVHS5wYwKgcaiYHeTmpIqffpzG0UVq/FwK7Hp
         Wl8vvs08HQGj96vWwMVVjpdGZ+hoVWFbyPR6L0VPgS2DPix+I6BzaoYMrCKA/i/K9JNI
         485AgDrSR/LETbZsOvrPi92w4AVJqEaaMBw1aKyWZ361YKpClPY1ru7SvV47eOQMIecS
         18N1mPEBy3Za2bhw3IqdyNXybTex+BRdVegnieVFyfW+YaHkhGNsSsBNVuMWVHWWjfQi
         xvHDYo5S6QSyTNn1hpnzJvnLPKx7yxqNJXvDIP8xdNUmLlIlT1Th8UFux5T2Z9smexM7
         nquw==
X-Forwarded-Encrypted: i=1; AJvYcCWew5Q1Pdq+LyyZz+mgNPK+mK/g/i4gLpFL+TaMzEgnftFO7NGoOOgKUdoAPd9+ABbnySGgeRIRIpNQD34B@lists.linux.dev
X-Gm-Message-State: AOJu0YyXBcLyIUsHNsulMj+bTWL4blTQkJKHNGuQJl2MwPYObh0AReHW
	MP5ChudQN+2sl803uE1cA1p2pViE7l7rRUXC4nb2uOVEy6NHvCEBIaW4
X-Gm-Gg: ASbGncvjcdS4ArTprnXCGVaFurcPN9XP8RjXl0HiaqLAjTn+fOfUbaEwSPVhA56LYwG
	OvADM5pYZpcZGy1ofWcyjQvdu0o1ylwN+hc3BbcXNk2WccGf4+eXtx1RryGs5h3xeYOyssfG9sc
	E+xS1l3z+uGM7AbJOEe8Dim3J3iG1N7m+YfcDuK0LXVeCfegdMePNf/W0LfmcOI61alYuAIUX01
	vO7XsfbBjORYaIdbIh2SNFMd3AqhIT19pZk9os0mpzR5tX0IwgVZYYPppB4977zxXXopZq+Bzk0
	OfN/oqmLZ2p/P8lT6YcAFHvZOQTYDxollnNDN7rS9i4F+nOzpv6LcPiJ1mnIjKG8hmhsfabXqI1
	Rcc0CiCYJYQGarqXxJzNrYSSWSpUgpIRt1HHUyvTfmMT1rbm84+qnCVsJYoPDKnYUoLh5D75wcJ
	vxKAHC0g8qpgQV3UNwfU80ni24psg=
X-Google-Smtp-Source: AGHT+IEPmVXfG8iep1LXV3JrYQl/ln16zPfrpGAOurbePOD3z7RijiLpRk26CpWCIM4FytWvWOm4Ew==
X-Received: by 2002:a05:600c:b86:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-47773236f9cmr64888705e9.15.1762770319920;
        Mon, 10 Nov 2025 02:25:19 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:19 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 03/11] staging: gpib: Remove gpib/uapi from search path
Date: Mon, 10 Nov 2025 11:24:59 +0100
Message-ID: <20251110102507.1445-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpib/uapi header files are being moved to include/uapi/linux
as part of the gpib destaging process. The latter directory is
automatically searched when building the drivers.

Remove gpib/uapi from the header file search path in subdir-ccflags

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/Makefile b/drivers/staging/gpib/Makefile
index d0e88f5c0844..2d44fed2a743 100644
--- a/drivers/staging/gpib/Makefile
+++ b/drivers/staging/gpib/Makefile
@@ -1,5 +1,5 @@
 
-subdir-ccflags-y += -I$(src)/include -I$(src)/uapi
+subdir-ccflags-y += -I$(src)/include
 
 obj-$(CONFIG_GPIB_AGILENT_82350B) += agilent_82350b/
 obj-$(CONFIG_GPIB_AGILENT_82357A) += agilent_82357a/
-- 
2.51.2

