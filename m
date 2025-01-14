Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E91B87C6
	for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736873660; cv=none; b=tKoo6oMyVcIKKGjpvQu4MhVtgw/FLas01ew2yxAkBLjSX1Ym+DmnGuVEN7I432LPEc/IsG2a2S+oTy48Iv9/4Y9hFRMXQmv+MQdjlwavIt9jxBAk+CLyzJLRwc/xfEF4dqTwuBT/ORMleS6n/kNkf3TSPT9cu2tLeV5an8Fct7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736873660; c=relaxed/simple;
	bh=/ynr/WAdsBsrVJlFmS5tGAz97u9To4XWhJlZst0DkyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNgBtNymMDA/NnS7pw3lP5+bebF3hjioTEbQ7E30ujO04rcKNBw34iFXN2SOlfqX3ucUj6Y/EDPparI3Fr65cVpaTC4xcNQknLYuUuDOUOG+2r/gfD1kqdOCGE1hJ6an5JmKckwQajN724RyCngTmX7GrtbBY+4xMh389hyiwrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7Y7YrUa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7Y7YrUa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43634b570c1so41507235e9.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 08:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736873655; x=1737478455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNAlqfxtWEXlRxhaBbY3J/Td2VwL6dxvd5kv84uEwGY=;
        b=l7Y7YrUaKIp/kzcCAJEQytLxCK7LlHQ2tQw8fOKcXNa/0qm0zkA1zo+NA94p75qiS3
         wUgGe38OtPgRk7nmWIP5YsPUrn2Q5NWlIVwq4xjIHzaouwcH03NwL7v4ZSexZtJTlPjw
         J7NHJYWq2Yl3bAl+qEl0TEp6gK6Fa2PQxIZRCe7wjRGcS8jMQuZyn3DUZJWxAFhrEvTO
         s2AZRsIEYE7xoLkXoKbcusNYQvslCTE2jWtSCEvE6+jAtEu/Wtqy5kkgtMkf1+7F5qIv
         KhKi782wubUr5HRyyVzIPivOZjl8G60iMp+4lxF9fG4ApEfCHBae1cW09fo1NZgDhDmN
         YobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873655; x=1737478455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNAlqfxtWEXlRxhaBbY3J/Td2VwL6dxvd5kv84uEwGY=;
        b=FZKL9iF37Zxc0MRKCmsVQVUr8cayE5wviL5fcl9lRfNC/+K7r9gFDtu4hAo89T3L7O
         SgXjJ179aIShLcJ4+JRZlROFO/fjjrjYEfb/SxLZcAGQr7aqWU5mpuR+C218MmuTq8TE
         JcEzDrB2bLPepFq7Xov4aJrtfs29uJO1y4jADRS6h09dUTDpgsFACQeK7T4BmeO0/XDz
         Us9+Bv8UzOPEP5yufB1bPNEr18y3DFRElRsS1Wfwcn8FaEFtwNDSzWM2vLxTwOGabXrC
         mMjLrF+NCalphVTwRu9Bjv0ZGX1BacGR/CP+3viBMHwZAZ+0LBqWRV34NCTvjyxyTDmQ
         I7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKrdz7NoIYGZpdQAgqTA1anSoHn3OAPOccSvfJIv9NiVOF8Ke1gmRAQJu7uIP5B94+NPhQdapZxW569z6U@lists.linux.dev
X-Gm-Message-State: AOJu0YxaLCjXQjsxxUPqcH+pdMvr9C9kW0SaAGo4iYuqNkFBCZuyoxQE
	UEx7RhK4ARrsvOX/p1X3u3wu7afQoumY4y8OhSv9MZ8sGjkpX+3h
X-Gm-Gg: ASbGncuqNHq2a3GHHICmTnENi5urle/26m0zk9Ofx/aGH3WUC9JvYakJpDLvcaLOr6g
	9AnQAxlqF9D1Cbkj1RWYj0dxDW8lFIbAzK/RSLigQkhNnEk4mb4acHJa91GWyt7j1f9JLPZZwA2
	gcpY46VlUVuof04PaM7C739f0PFCI/9biTsETzWIkEAE8O6RPsOURZ42CKzVgAve+F1YiFPuqdO
	S6RasefDrjgdwwBCmrI+QslmggICLfv1UDewHEjjvT9xNXwJCUb12cAPwuy8JRH4If95tek2oR7
	EHeWCIN2CJN0a3h8
X-Google-Smtp-Source: AGHT+IG2l98GAUMoL9AOh+vSHvMSM8KdiQS9Qv8llZD8pQ9Sz7Dem40Kx/Tluw/yb9ay4tsRWmj4JQ==
X-Received: by 2002:a05:600c:1e1b:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-436e2686279mr245204795e9.7.1736873654587;
        Tue, 14 Jan 2025 08:54:14 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03e5fsm179930495e9.18.2025.01.14.08.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:54:13 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/4] staging: gpib: Clean up types and struct initialization
Date: Tue, 14 Jan 2025 17:53:59 +0100
Message-ID: <20250114165403.16410-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address a series of sparse warnings.

Patch 1: Add missing __iomem attribute to io address space pointers

Patch 2: Add missing __user attribute for user address space pointers
         and buffers.
	 
Patch 3: Avoid using plain integers in pointer comparison and
         initialization.
	 
Patch 4: Modernize the remaining old style struct initialization
         and declare local arrays and structs static

Dave Penkler (4):
  staging: gpib: Use __iomem attribute for PCI memory pointers
  staging: gpib: Use __user for user space pointers
  staging: gpib: Avoid plain integers as NULL pointers
  staging: gpib: Use C99 syntax and make static

 .../gpib/agilent_82350b/agilent_82350b.c      |  10 +-
 .../gpib/agilent_82350b/agilent_82350b.h      |  10 +-
 .../gpib/agilent_82357a/agilent_82357a.c      |   2 +-
 drivers/staging/gpib/cb7210/cb7210.c          |   6 +-
 drivers/staging/gpib/common/gpib_os.c         | 119 +++++++++---------
 drivers/staging/gpib/common/iblib.c           |   2 +-
 drivers/staging/gpib/eastwood/fluke_gpib.h    |   2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h      |   2 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c      |   8 +-
 drivers/staging/gpib/ines/ines_gpib.c         |  66 +++++-----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |   4 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |   2 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |   8 +-
 13 files changed, 121 insertions(+), 120 deletions(-)

-- 
2.47.1

