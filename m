Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221075809
	for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200233; cv=none; b=AmoujAhmoLyQR6BwXZfPgP5sJ/RwtHYkqqdsHxYftwiFury6aFzjBGVo/QvZ8wgcTRzqNoZdy/SIFECUTLi5vNJU7T2/ehlddJxKyLk+YZJLtNq3UMnOLbM0am7mdamCSCRyumiWsEl0ZRltLhJAamtxX7dGBZMqaYWWArabhds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200233; c=relaxed/simple;
	bh=/WED9W7vj071TIVLce8utn3oZWKaP0jz++GiWe9APm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bG0ZUYNI27qg8dUgtNN32W2kXxUOYH8Ybfd28loUCkuBYyhCoYc7gZYOBRNgQUzDtRN07v0ycN/vgsPorPe7S73zy+KN4WI9UmqElgfutINFppwgavTm6A9zsM+JZXQPQGlIUt9lE86gUQvMKXxMjhBQGi3fTuisc7Fqt9o7BrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKQRDMgJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKQRDMgJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436345cc17bso30942705e9.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Feb 2025 07:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200230; x=1739805030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7ywKxO6aRoA2l5hpZMYFuLPKAduv3SkzGzfh6WzbJg=;
        b=dKQRDMgJKv3Q02q4W//ugH96y0k3pgw/7KJrC4k+6YJWWwAC7gI6QX/TdVKlMa5HK+
         zuxnc5Np6PDSXMw1JVu5M6kYYIfSfLNtmL4sp74eCB+72FXNCQSRWMQ2dq5yL1n5EeZo
         Vj+XgcihzGdStkpfcrgDFSiYTtJocLMe7MenWQoifWYvWAygUJ2AIRVd0EqQciGcaZ9N
         y/EVyNL+iY7KBbyl1HiQ5oVpJJhTot/wqJFveChZM5R/hl/zfOKectudHm723/k0txTs
         zi0yyXsGF9Vutqv+OK9J9r9TJRWmnJPLbEUC9yViHG5+rpWG+6Zk/n5I7FQM/SRrLQI2
         t1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200230; x=1739805030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7ywKxO6aRoA2l5hpZMYFuLPKAduv3SkzGzfh6WzbJg=;
        b=XRTi9BCI42E3V6aOF0Htga9Q8m/OU4GqjOmv+AkxOssH74rTaGi0RwYJndzNPmSZWi
         HyZXUuyCtjRLKgI0+YgBrX/L69miXSfKgW9ysmWtBc1j4JrAGkgMExI61QfhlEECqRg0
         6Ju/fDZF19+ByGR+oIXIysci24arxzNjdbrXwhdsicjIIiBT6YhnUNOUk/8T/b4cITk4
         FbVmapfYbRxTTysANHccottcMNwmX5B8zwY9dM44Oh26v5sm5WxEvrKAB8dFDBOyfEP1
         munrkIm1c+//6dHECwHGb0GQQnBalPVDUjhqO9We4U+FRC+aB2NRG8LvVRTX1L03sVOw
         ys9A==
X-Forwarded-Encrypted: i=1; AJvYcCXO7acnZSUQztSjsgg9yvZbTHIOdVJCwcaiYkvIgmAYAWoxFMUIrj/e7EuWrB6GnZ0zwhV607NnrS4wnEgO@lists.linux.dev
X-Gm-Message-State: AOJu0YwOS+V6SbH1iOLeL+llLU7lQtmFUWoK+t6oK0wOBPPlUuLsDt/g
	YzvWT1r0kfLAH4DNOqS1JSIxeVcF8xJ5xtK3Fhp2ZSRrnmcNxKhp
X-Gm-Gg: ASbGncveIIrbdHdK0gsxTSkCzn+IuRIP0R7FaDfaQ22cXoPNiiKl5NI/PwnF5tAvYW2
	4dYLGY1GZbFRoqTCTzm5rgWIJKtXbcIXpCxmPu5G6VgXIJYJc/UNqn6OHQu9fffF2dOo6IMKrCN
	lRXjiVsp2ezV3Ug7G28EkfvG16hiZ6RDLs5fBRw42qdbrMDjiAufksm7PqSqt5zc/+G5eYOZZgj
	tGPtqda4YWAY+KboqmdyaieYhm2etNmtc0qyaeV5rWq3ji5cPqXsIrKhu25KCM0xBbmq3Oqs2k1
	R3JBB0GeE4mZt+oKlRA7rtOlzZWVzlIj7KkUwQb/E87JAVrfEl0=
X-Google-Smtp-Source: AGHT+IHgCpTtZ8NwKI57dDhEmalZGMf7ijeLpRg5cTwpLhLrHKRjjs//L8dap3yq1hkftdRf+672lA==
X-Received: by 2002:a7b:c4ce:0:b0:439:4696:c063 with SMTP id 5b1f17b1804b1-4394c8461d5mr1393855e9.19.1739200229421;
        Mon, 10 Feb 2025 07:10:29 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm146834645e9.28.2025.02.10.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:10:28 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/2] staging: gpib: Remove redundant compilation symbol
Date: Mon, 10 Feb 2025 16:10:20 +0100
Message-ID: <20250210151022.4358-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intermediate symbol GPIB_PCMCIA was used for compiling the optional
PCMCIA support in the out-of-tree drivers. These patches now replace the
redundant symbol with the Kconfig symbol and remove its definition.

Patch 1: Changes the drivers to use the Kconfig symbol CONFIG_GPIB_PCMCIA
         directly.

Patch 2: Removes the definition of the intermediate symbol from the
         respective Makefiles.

Dave Penkler (2):
  staging;gpib: Use Kconfig PCMCIA conditional compilation symbol
  staging:gpib: Remove definition of GPIB_PCMCIA in Makefiles

 drivers/staging/gpib/cb7210/Makefile        |  1 -
 drivers/staging/gpib/cb7210/cb7210.c        | 10 +++++-----
 drivers/staging/gpib/ines/Makefile          |  1 -
 drivers/staging/gpib/ines/ines_gpib.c       |  8 ++++----
 drivers/staging/gpib/tnt4882/Makefile       |  1 -
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 12 ++++++------
 6 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.48.1

