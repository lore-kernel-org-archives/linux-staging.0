Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA8E35C6A3
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 21:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670176; cv=none; b=EqyoQ++Q+lXsHCL3SmTxMKqAi94kF3uBKfGlsRUS4svDWK69Kzqa4+7eHBfFO7EdkduevhiNoYHVFQqQuzsSyGkwzDkAON+36pk2OV6UPCCK1Zzv8VcRu4CsQuGoQhsbB9gorYiMxSjG8GkXL9j15E1fjUT0e56+Leo0XbUs8y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670176; c=relaxed/simple;
	bh=nSby10eixiNXpEVM4IRFe/OWoXHBpKDZpWGj3xtjijw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+i7xn+UksUbBmLqMbjL+HW1apU+yqnuhpxXBx+6tgdVo7mggPzfvz/V6Ae/NRqDP1bqtD0CPjtKbi5x36dmyMeyWBnGZZlwDR7eLQ0s2CsHrFJheLs0UvS2pY4o1teBMQyl7VQCOI1CXIrDbK88xIDkH0RTBNlvRUcH7gB8PEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOJUltOu; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOJUltOu"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so8119096e87.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670172; x=1785274972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYs1gyhVAxRTo9qDMZGfTtIgo7wOc8NJz2ZLJ7Uus+g=;
        b=LOJUltOuM7siYREa2+buX62s6Y6vCjyGIyiJCm7y/UIbCPjQJq8BksYveM1k//+mAm
         vuGGxd3rYHXI38htFazpCXZ/A9+a61A+GgXWlnuDGKJeEWJaxkiPbqBcDEvj0K+UaODM
         a+isM+RlszotF/D9LWFNCgyVwjoOcsg8NE7SD9DxJMknAZTc2nJaxMLCmjQfwQ45Tiaz
         ifc0wxT6DD4mVvEuq/8VFIRNXKyfRvWzIracT2GZteA7yz+d0N1HUUIcG8YqzDFbrWtA
         /gRoJ7zkohcpeLZJV+9/VpqswVXnCzozoXDaViD0tSq1jGugxy7T3IxylI8z+pdO5BAd
         f+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670172; x=1785274972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYs1gyhVAxRTo9qDMZGfTtIgo7wOc8NJz2ZLJ7Uus+g=;
        b=P6kQPm332H5pkqG0YFoZwut5Tszbog1+CBvC9VNsITgVJRNQxy3ozL++1nOO0s2/B3
         a9hD+QeGDR+CQDiwE3Rmz5+lfuSGz8JYV1dpHVdWn43akWQy8DQsIvGQFr8ASLbdh0c4
         nosKwPBc7n8+C13K1iro2kaJ473VOS4T5X386/Cx0gn2S6j84AR5yBRzTExC184CgWZC
         HDzPs3dL4U6NplTidBOBKWS/EK9GM31AoidIuL8/6SydiugKL8zRU1Q4zBrxEKgw+4lf
         xx5hS0p4WtdMkR8JoWT6QUACbF1GYODT9YVIBXufGpN9WieasufbM8uVSFS13zeKxrJo
         T6Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrYhKCNhAxajgH9B74E2R3GftZVdue3WzrTmdC+KqAOsD0RxjLmsMKoRdbp8lXaE0tIlpNO/8qelir4hvTE@lists.linux.dev
X-Gm-Message-State: AOJu0YxyEISHNPQRl/wUyjEFhvyBWOxGyzT851Rq+2tHJWOJWQ4H3LzH
	61y6X9F+NVFsvjkIv4vTB/8m/MzQoYJ+t0O6uPlnH+9ZBw5vEplsds9Z
X-Gm-Gg: AR+sD12xVkjNvX+y7Izz8G5dvO1dCaHRR5JoVuBpiyh1/HzrODP0LvJ7ANyy3rQnyqe
	o5JTkD/WKws9DheT1uv7R6Dyk/RKyBqXPBbI2r2o575w2rVJQG982jYJCWkWfDY1MmUjLvCA6oN
	kbnRzrUSXWxF3YUfKOgLjOTLRrwWVWWOuIy5qdwYVbPIK3CzECOqyjOzSZOn8J+hjmwePYwekSH
	LxzkVpPnFcD7oWalubwyDPt1BxVXmdBwDEmhd6veNPIGyJuofLB92X3zb6tAYeWxEom8/OVT/Ce
	omaDqKU6jvL09nlr91V+n5/VH2ztMkgRZ2qTQvKC0SkWqwEI9spI/mVi5H5i+qLuZc0WNor6JMk
	r4VH4JYPuuLlrqwDYsHjm0Va8qs+c98wltn8SCgeLjm2sWHZMzmADe9tAKqp4Q3kMl5oXD8ouHA
	4=
X-Received: by 2002:a05:6512:2315:b0:5b2:9dcc:8e26 with SMTP id 2adb3069b0e04-5b29dcc8f34mr2348492e87.60.1784670172296;
        Tue, 21 Jul 2026 14:42:52 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bada25sm131509e87.30.2026.07.21.14.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:42:52 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/2] staging: media: atomisp: remove unused functions
Date: Wed, 22 Jul 2026 00:42:31 +0300
Message-ID: <20260721214238.840406-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes functions in pci/hmm/ that are declared and defined
but never called.

Nikolay Kulikov (2):
  staging: media: atomisp: remove unused functions from hmm.c
  staging: media: atomisp: remove unused functions from hmm_bo.c

 .../staging/media/atomisp/include/hmm/hmm.h   | 16 ---
 .../media/atomisp/include/hmm/hmm_bo.h        | 19 ----
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 41 --------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 97 -------------------
 4 files changed, 173 deletions(-)


base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
-- 
2.55.0

