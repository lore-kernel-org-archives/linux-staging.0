Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1754D30E0C5
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770340; cv=none; b=sWR5HwSmXR7LC16a3znZFqoXm2t492ON1E/WanfiJKQcSLUjF5LBdwYZU+Xy1EcjnkAw5LPwYSfI/mBVmcVAVOuUmgXhxAKiN+gWCnLMUPzQpuzU0iTbFyCFHHLMVRezl8+Vcy4QsTErtG39rH18BAPuTEFshpNRncaOEJKwofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770340; c=relaxed/simple;
	bh=QM7JQ4r+KVKXdlBt8ePVLl+ChlxycOGtsLSETCGPfw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KE57WUa0QppaCwcvileSvswP6owCTN6dP+TJhFiKa0QQ/nhIYv1kuh3H14zncjMnrc2GWZX+u+PxIX2nBJCmFGlkz+claHM1yCb44/0Zs/kajdD5DQx2yh7oW7o0gnHJTQXLM7peAxBPzdS2PwSYasPeC1sMgnA1nd6ZuViTuO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1Dbq3XJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1Dbq3XJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47118259fd8so19260415e9.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770337; x=1763375137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKcbMV8I+97Kq7vbT6kb85upBfX0KBVPEKxg6nSihFs=;
        b=B1Dbq3XJlR6W9i0iAT8OZiuiM1Mg9bdWUtnMe54Za/ilh0FmA6Cc7g2JwNSaIj9eCs
         wtRkUNFKWTriMHfYdOqJx3C3Bl+h+bviElyxalYrquS+12H7EI1p1Cead0K8A+Ol0Yut
         PQn6qHirQZBj7J8LOW7jBLKhNSYiy7bkVflvYE1TvFJBs6yQURGIE2df/YyHnUSS6rU9
         dH/DAtA35Zu/hAtkAT61WWMaPNS+LS485L6V+2e2IJVPprASt3bAyM2lfm5C6ID8oCJa
         ZsczdTPXhEhA972K3lLMNRSpACKKCbkceUUWfveUhmdmmao0znMc6dhP6//I+EiocO0O
         0olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770337; x=1763375137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKcbMV8I+97Kq7vbT6kb85upBfX0KBVPEKxg6nSihFs=;
        b=fsDnzh70q+9V8DrCSIrLzeQbN+V2R81YXwQxmMdUWEgntCQxmWW1J30UKyuBC6bz7J
         gCc3bZz7tik6BhAVqoTN+KQ+39pNiTmyKxD8aVTOkTwtdltfYLMQp4B00XpxjN8mMCpg
         xghUE4rmb1kR8rsqlxJR6Hv2yllXbh3VbLQ6Q/XmWVf5l8rCnc1krWk5wDA3f19iKXfL
         11+CP6tyarKhKXxNlLPaX9l6gnlmJcSmrO+BiTx8AkAEyeaQlXJp7WQ6mHed29m+BgHk
         Hg7oPtKLaa14Ojt22NM/hT6wTyfLACVZRIUMKKsmP2O3aKK8b/zacCdzVjevSB/AE5FL
         uVog==
X-Forwarded-Encrypted: i=1; AJvYcCUpLY6vugrXLr4V0l/nokbVsi9p4Cts+uBZze6+YEuUpqZrNzzXNgG5DdS/4VDV+iYi6R6+MEHpaGubsYAV@lists.linux.dev
X-Gm-Message-State: AOJu0YwVeRDrQu4vn/gb3tySgQCVm3fGRuuVpFI5u33uhct6tlEeLJfZ
	kPt2A3gT9qW6aGDrk7YXqUXYAdcYLpHUh0eecElLF1guC/f6U25JUGBC
X-Gm-Gg: ASbGncsMipEfGMhBPVM+Vx18Q1hgU9ljhioZq+DeePmEV6xPmcAiF1h4d+DCocsrKGf
	HbC7xbNbaJ9RlIbM4Q/PnXGngPVQl0yIEzkrW2YC83h1hFprzSy1w25VFqiI57oiJp1dVjwKLJI
	A4oQ//kvD3FCWddOv0WOlEuSxRBagRmHLoWI52Ehdpy9OkwQd0RF9QzWJFu8cXH/0H3a8cymy2K
	b3jHJZGtCpASxzAoaxkz5ytNKxL8wDiVl4LgYyWTi+AWvA4u4KFTw1SJMnzvqxSvpSdarzfy4Uz
	d91gvvMueh2nGbZIvv+7M1+stCjbazimRhawSbNZKuGYMQZVATt69eDGYjv+rcEmmx3CNNG1F1Q
	AziR6UbNW2Rtjf5lHtq1FUqRPvTJfbsrLZA4nSATW9CLY5OEqwCSYj3VSvBCY1Ul4XHVHk9HHh3
	6+jEjX7XisLoF0QfAkkPe4OXeGCf0=
X-Google-Smtp-Source: AGHT+IH+MISqoRxpIDcPU6EuXvAZX+QLnLFanB9BywEGc4BZ8+o4mmL1QjM0lxQTquh4+sLSRzlb9g==
X-Received: by 2002:a05:600c:350b:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4777327e71bmr63409645e9.23.1762770337470;
        Mon, 10 Nov 2025 02:25:37 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:37 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 10/11] gpib: Add gpib Kconfig option
Date: Mon, 10 Nov 2025 11:25:06 +0100
Message-ID: <20251110102507.1445-11-dpenkler@gmail.com>
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

As part of destaging the gpib drivers we need to add the sourcing
of the gpib Kconfig file to the main drivers Kconfig file. It has
been added just after the Kconfig for the comedi drivers as they
are most related to the gpib drivers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 4915a63866b0..01602581b880 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -161,6 +161,8 @@ source "drivers/greybus/Kconfig"
 
 source "drivers/comedi/Kconfig"
 
+source "drivers/gpib/Kconfig"
+
 source "drivers/staging/Kconfig"
 
 source "drivers/platform/Kconfig"
-- 
2.51.2

