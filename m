Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B603081DA
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770330; cv=none; b=tFZgSyK6lrskQmaumizAt4zQusOroXOR5LLAy2LB5bMak+Uo3wgj9ECYEaSjI0cV6CozN9RoHJSn31eF435R+tvW/e7FdHShhEJJzI8QkLvAgG8Uk0XJprhxygejI2rgUsu8OOiL37WPkLeOMbmQrNDljefMR/jVjAv2iM+3WZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770330; c=relaxed/simple;
	bh=lf7WAmXXlNMNByc6t4LTsXWtP5fFo0VO8PLMA4FvwHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8Q7SXLoy6OfsMlWF17toZyBYJVEaQx6IEBCsaInTKhT+NbkQYnor2J4CUaiFHbh4EiK86ZmivNTmemKNATwkFs7Bd+chLykq9nnFTnAcKC8xF4+khVd0FezSIW3j5A0RIzd2QDoIoCRnCBwJxr55bHDwbHYapVbc/G0DC+McpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiawkT5c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiawkT5c"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so17699205e9.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770327; x=1763375127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyTFCidwYxLdrRo0mrPJg5BpG+UQKkEfi+EP0wnzqpI=;
        b=YiawkT5c1zf30HC3g9CjIIp8dBsOyc1kdVvlD+UYnr3YrEB8IoWeGuKOCgvv4eXqXD
         JW0t65ySB0emvVoQhxyu8AY6mR0r/VAFT1MkCVJ7Z07MQYP41+3n4/X7C6AXX2PmyR72
         yCLvZoeBHFgj7e+5pFxoSJbEq1iPL6W8hXCZloKSAXBdFqLYV/8JfraaLer+10SgALVi
         rjCJtulRqrr782niUX6D2ZrYePL5rxEGOhXh76Xh8P8NEmKJZxrwbMBSGXSmLWwjiLyc
         h3qXq6BUZdDbIOZCkdiCJnLFlrxBzrmZ9/2njnmmI+tHGRg6ezuUkkcwFKq8zI1D85Xz
         f37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770327; x=1763375127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyTFCidwYxLdrRo0mrPJg5BpG+UQKkEfi+EP0wnzqpI=;
        b=m/EvG6bxH5blP4mTvo9mw5jAHenBmNyzN2LtN2bxc1mf7auiXkzDUbnpuR6e6uVyz5
         qhUK7KavWBNFK+5m7W6STFb2PsZQlulGpKYqqtTgcrio2LogAljgSOGqCSKeYuYhKZFB
         yGOe4uIzj4pz026MmEeIhWocV0ry0TRd54bjZBUrWA5yGU1gj5W6/pTfdGbA2Uj2/dql
         AHInSgKqXyRtOgOe2Ek3oE7YBNjLr7C1dpVvJ3DequImsayvA+2kzYclcfSbLZGoGXX1
         JBaiRf99+GVNSVYMHS+oyfpAPP7kfLCBDoE97jJu7DRfxQWTf1BHYbkbM4+GOVGEnWiG
         oY4g==
X-Forwarded-Encrypted: i=1; AJvYcCWYIouW4hQ5eokTEnNkpp+ZUrDZBKoLg9sBNHutfdQXZWeChbSVDb0k9j5x9d1Z6MZhmr714yEslIZ+NJWO@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmz+TagDUXQZjPa6FsyYHucJWgRFWpea5aQWtsKHHM7gt/58td
	MEP+/7dExnk3YfyvM4ci85yfgand3CoJ7cHxmFMGDDHCVUiB/dlaHl/5
X-Gm-Gg: ASbGnctyWu3HNiNCuH5fCc+sUwsdt0IerZqsRpXfqS+xs72d8qsyP7qzmc8YZOrBbS0
	yM7ORxeKgqf8UTSPWzPXWfkvw7zdrNCfo5Iuk5tSTwsffFa5cz5d6zgjeVx+qxWLkLS4vUj2sKl
	kpiaQvKIJbPZzd+/isj9/rZc0jr92AlSEBdCMWJdEscsxQbZx/VBMFBaGB1NuadiSN83ezunSfk
	rDSaev9OWhLyjMM8XZ1ICACdIDIcwIzamhok7KHUw3SnxyZ45jr1vn6KySj7K8Zv1ZHrauFwmRc
	0tt3etHqoFHEmT8jnW5PTckvjgFJzDx8mYQ7NTLsIL/N3TEgbVzAEwsbnfeuad/Pd0luELI5Dqs
	bjxrgGOKV0T18D3WYi8X4yhCv3QV6hgj8S5/CgHwOjzxwTjfrkzzSNdk8vvfcEuHAaL/MTZkdj6
	95gJni70y2BcsPj3KA
X-Google-Smtp-Source: AGHT+IEWrxNPg0t0pWU7KElrVQT6/O72wqDN+enIu6RrYho/Apw+M1RPPrkl99dAqKyGSliKeno5PQ==
X-Received: by 2002:a05:600c:3b0a:b0:477:6363:d3f0 with SMTP id 5b1f17b1804b1-477732250bfmr58815635e9.3.1762770325506;
        Mon, 10 Nov 2025 02:25:25 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:25 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 06/11] staging: gpib: Change gpib Kconfig option title
Date: Mon, 10 Nov 2025 11:25:02 +0100
Message-ID: <20251110102507.1445-7-dpenkler@gmail.com>
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

Remove the word "Linux" from the gpib Kconfig option title as
it adds no information - it is redundant.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index aa01538d5beb..2f42aa2d55fd 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig GPIB
-	tristate "Linux GPIB drivers"
+	tristate "GPIB drivers"
 	help
 	  Enable support for GPIB cards and dongles for Linux.  GPIB
 	  is the General Purpose Interface Bus which conforms to the
-- 
2.51.2

