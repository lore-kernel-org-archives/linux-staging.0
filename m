Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FF1F1302
	for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759059248; cv=none; b=kwltaKFNHxPFP9ebUDGOiL7GC222iWjxtlJ3nn8bhMzLZ7GvbvBrcIp1Vti3QbPLjaAntdp0ZjTemXVyhnOF+mpM0RBiIjbrwAn1UqPy6yxE2/R8bC2B+LP11LwrzZyi3mogz8QkZviqUCXJL9x9+7EX2/Imj3nAytEUne9oUs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759059248; c=relaxed/simple;
	bh=4pEzXbyqNaA08SPPfKeyNhR7oN7okL0k7w6lDTJ3Vao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a5C4KedHiz7hCIddruxSQDrBvtxMQHHpS2NOo0IH6BG48gfn/dbZ2VMAueP5AZEOiX1q+KwAZpYXATpL4kHaWgNeKcLhxXiqoS1N6gaoXHslJB68bpyY08G8/MdWZ0I+SjEvenXGeKEdQjx4S47+RODWxrxwTga+tZJQvQ3H1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUqJWa3e; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUqJWa3e"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e501a9034so1414455e9.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 04:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759059245; x=1759664045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgw6TjSJVeFP42Ff9QkzhsbHEBT9jT4Y72Hq/p7Nq54=;
        b=KUqJWa3eKfG3Pp9cN4uKlQTMEnNuiUo6lQdtKpQRPH5pSZuCz40EAdCKHBq+Tnofuk
         qx3H4EoL/+O1nXpo7qGoOwQCA8iQeTS+u6QnjhgPsloQuDe7tP/mKwVL0khQScjWxvay
         bwMM9wfu7O+MnCWT0fhmvtWy9a+lH6bfanEu+PCRfZDJGJqD9A5Oh8K5BHMrbV092yi7
         UlzICmyYStBetwbG/KahOsNMCm9tGfpK+89Yq9SeIzGt6Fm3yDfd0oufWYMTRGu1LtXl
         eKIy2Fta5DGPFqpmlhJ8OptqciASNkQlU9LsDcNqSkLKFdMfjB+IXIVaJYD0FaX6+psi
         qhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759059245; x=1759664045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgw6TjSJVeFP42Ff9QkzhsbHEBT9jT4Y72Hq/p7Nq54=;
        b=m9mE/EM0F2YwUBIPBwqMDeHMlVwDvh4FtjerhYpMx+BnlqUql6byhKBLMz58tXx7/1
         S1zH9fIfid3SwfOFxDSoTVrwkPVe3/CZBIsDcua1Vf28qf6CqFquWg8aiulzdRoz/d5a
         ofbWSm82K0zZRPi6xhVRu1W9G5korXJVaYuoEQbfRcghpbacEiigao6avZs+OtDDXR87
         PGA66P1qPVWau2nQK2Ckd/C9CcE7Ww0zbhyCQOz4S4XaS6tDZVQT2bejzAQ7WSOdhqiI
         5e25N+V2xSmD4CLKw2m6GQGVgBDDvAc8JP3uFBvDWw+hJDO4b/TEl5v5sAJf89WaNlPj
         is4A==
X-Forwarded-Encrypted: i=1; AJvYcCUAiUaPFK3emKNaEOahZUquBNrWsbsNP0/uZI2DKBFH/PNgahVxJO7a4l7asIe1Jljm5uReYGFDlbDOTcfk@lists.linux.dev
X-Gm-Message-State: AOJu0YzX+PR+tY8bClQwyS4xnxXDTtNCaoTLDFZd/crXUt8gsjDd+hfz
	MQ7WwuxuJ4bPROzT5nr7mmYzK9Lf/HPcZ0Qi1uGdkggIEeTZ+hIoeNZW
X-Gm-Gg: ASbGncu3p6uKXFDHclU7rp/7zXpjAFqYSNsGdrXNw/Si/3AlfZq57OtRls+37ig/DPK
	RGWooKaqovgxXN3fqKJ0tP8C0Yw6jUjH0BdHsamc/xpPiwu2FvMRG7mXXtZvFA2NA8t+Xv/my9C
	3BSfWtaOSBvRGwCRO8zyANyX+EL6DggCGiXVCOZfOzKJjeQUAIhF/qcf2V9ImaT8e1lJt1QGMxD
	KwqAF57bjaAXEN90+eSQ90hRLb2wGQC5QcxRm+cFolKB2Kvpb/hbwry/wgHHqPLj2DU7Zmu9QHw
	W38tWX+OmEcRAqrjiYpQlGbHLmn4WNJ+7etJfX9vnbGvPZl0jTe3lS2bCdhfEX4H3TJWEZfWXfB
	9XqeUKiW8XRsGTElbWIFEx8rQCV8Iz0CF9KShwg==
X-Google-Smtp-Source: AGHT+IG/rzcz2uI2Na97ExP28EzFCPCjQ1Y1kmUih3xOPsR80Z5IybTMgEWtmNWOKR21alHBoAqfjQ==
X-Received: by 2002:a05:600c:1c15:b0:46e:3956:6810 with SMTP id 5b1f17b1804b1-46e39566c90mr117278375e9.18.1759059244915;
        Sun, 28 Sep 2025 04:34:04 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996c03sm187074365e9.3.2025.09.28.04.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 04:34:03 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/2] staging: gpib: Handle device clear and trigger
Date: Sun, 28 Sep 2025 13:33:57 +0200
Message-ID: <20250928113359.6197-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses the handling of device clear and trigger
commands sent from the controller when the board is operating in
device mode.

Patch1: Send device clear and trigger events
Patch2: Return -EINTR when ATN is set on read when a device clear
        command is issued.

Dave Penkler (2):
  staging: gpib: Fix sending clear and trigger events
  staging: gpib: Return -EINTR on device clear

 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
2.51.0

