Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A22580F4
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150862; cv=none; b=Rj6jtC5X51Vt+Er+/Hrt4JTs77KVyHWIV399huszMX7glaOHYLcWrTjVvcGqmCJR9gTS6VEGYe4MJfAMoIa57BTGe7Dn4W7rHbhseovA1LNI50YF/a+30bb4PLBweURyyQ8rAzoaHp4eMIhVVVIg+ZJm0TgVIxcvvBZ80+glWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150862; c=relaxed/simple;
	bh=XyPbod8/7vQVXtK70+jplftstJkcfOxYtIGTLd7Yc4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsblkZKw9Fc9AKJMGvDZ9zkICBpe3Wbn0LGkdlW4LZiKwGgIOLks98pKxVHxD1Sy97KrIgH9u2jNqL5bYrjZiIgPhQD4cN9EgbM17RzEESV4illpCW/8y2S9TzzwqT/x7pv5UATyJy79+4L0BUwC6J9Z4LbIVTesU5EZ3Vq/VUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Bh2a+ium; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Bh2a+ium"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so5935502b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150860; x=1744755660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSATZl8+I0KjdHP6z4Ok+44QEtTVto5FwknMhI/D384=;
        b=Bh2a+iumRu/GuqiWlIzU3R0BWbEW74sw1pMs9dlQwnJiKp6ix1DAjIBSYpVYDaqq3s
         BYrQ59OpUWEZvNSTK7rw7Tcu/jMm7MgqqFo6+0xjNbTHyVZGuHYwNazK5dsHLMEqmUEP
         ZcceLKQTq8avKWfdyDKNTKG2+Og6RlYQZytrEjKzq2PYfVtVHKuDEAo5VeMuCsiQ073+
         CNfnsZ3Q1JsXxmr7kQRwDF57USPMnbOfPwHWpMMI2v9UzKcSUL14Bq2eJiyd7ShbH2F1
         GA9LIDcXgnFaMF59+IIC4v3WvsC4+hoGuYTFd996Cz2qitt2ALUlC93mw9jdI2BktZOZ
         0EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150860; x=1744755660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSATZl8+I0KjdHP6z4Ok+44QEtTVto5FwknMhI/D384=;
        b=XQCwqovNDvdzXSSLWaPwcpTrZBJ2Z/YKPtd0GT1pagB3ARFREYxWGeDPDXTHexBEDy
         +8gLuS/UsP9TY1+ihlzRneVwHfMa2ZCHWGg2zPmkuYdg564iJ5JmsaxOt7d0NaowlR7X
         MWXSA7WoSI0rEZXBRKyOvUsLh6OeVdp0/OhPZC0o4zA+We/gLBm/FoUjR9eTfpzeGJSz
         YTa0TncNDP/WUDaoYl17+BGHsXscr03+Gusy6JY677lfBmnHNP9qZV0/JSQV8YWd5izS
         4a+eEfb/vscinsEzqV4WKklw3w/ftmDQg05TUc7GoD+emRl23BRxAMtjIx3m2L4Qjsia
         qKGA==
X-Forwarded-Encrypted: i=1; AJvYcCXPV7PmaY1j1fI9FnsfJhvO+URsiVDZKCZel++q78yKllYDeE9a7XurmF7X3WDXJtB4ozo+XQWg7IrCzqED@lists.linux.dev
X-Gm-Message-State: AOJu0YzByrMAKP3FgKn8Bpv4XKsmKg+xV28hFdMw5cq94Kl15RHD7xdN
	popWr1y2Jx+2JoQn0ogyTHFy+YHdhw9kUr3JFi2qpJRz6Sl1cNbter0ZJDs6Kg==
X-Gm-Gg: ASbGncuF4vrNwKb4SppV5WbgyJkg4cW2TkSUfRNw5sCM2489YPErxsoHD/tlEWFA9om
	mXh2r85SAwydVdPg3YwjtgHpr55ieuvWNo45EUnuOX2PQvjreCh4u/S856b8amOTMnHR50JwUTx
	tyKMcr3fbWFCGZcLRFvm6J5e7XNSUbpQo3ZEdpVqpuyFuY7lzLO+1Ec8VvquWM7TYy381A+UpQc
	B3L5LKb9pG3DweZAu0yVYGl4FG6FjbVNinEUVSsLy1B0k/qRwmJhHzJ0F2bw8eDzzZW2o2tI/El
	+uSbbXMA+inNVybyDJI56V0MwTQxwH9lVHZ2bpXVwvM+TFab7PZp4GtJK/HZcdW2ofTqCwGeq5J
	dqVnAZhVC6urET71PtvCZ
X-Google-Smtp-Source: AGHT+IFmwXnZEkFNi+5qKrJ4pV+MlosS7Qw8EgUIA4Mc5+r6uHgJAKqAHOt/HfZICbbPLTKWVuxgDA==
X-Received: by 2002:a05:6a20:438f:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-2015ae9945bmr181239637.6.1744150859971;
        Tue, 08 Apr 2025 15:20:59 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09c8sm11459503b3a.101.2025.04.08.15.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:59 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/14] staging: gpib: nec: Fix Improper SPDX comment.
Date: Tue,  8 Apr 2025 22:20:39 +0000
Message-ID: <20250408222040.186881-14-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct Improper SPDX comment style.

Adhere to Linux kernel coding style.

Reported by checkpatch

WARNING: Improper SPDX comment style .../nec7210.h', please use '/*' instead

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/nec7210.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index 4b06ac0408df..5c57fbffb9d0 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -1,4 +1,4 @@
-//* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.43.0

