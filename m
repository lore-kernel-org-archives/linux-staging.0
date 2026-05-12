Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2A37F014
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 03:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555106; cv=none; b=jwfS94mTn97RuBT+cKX+2MbK5HVm8xwsk5fHS3n1az2EiXDy5VepUHJt218f89bNXO6MhTp6vmjENsJiVNzZeUX+0XidU8g9ZS02pRzsMLlGueLaJL0mN9SYUNE9QHEhWRCmSqHGrle5ltDMJ6fFvSQq/L0z3e1V5TdTBn2XzzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555106; c=relaxed/simple;
	bh=EjGD5HoaVVzUYwU78JUAMLOnfWWBS00oKothS3IZ4Jo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bm63h1k5au0BTUsGf/AAGIM/qTqjXUohta8dGUIv7ucLtFb9opjfBGE5E7yb+9TetkrMmviA6CAH9F2jDL0lpoFkz5Tuilrg1/epbGzksBZfoquJZUlYXPysIdVyXZ7vqPRUozs+KzuivzkalCfOQyJuYyNqXuRuLcPbnl64UhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxi38EI6; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxi38EI6"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so12246421eec.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 20:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778555101; x=1779159901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ok4/hNnRAuFO3b4eBqtC47nNQ5z27lpXv+R3F+4gAUY=;
        b=kxi38EI6AKp3SK8b3mKpHYTs3yRoj/KOqoOgyB/VRkLf2Rz467xXQ07ZZmqIXuAeJ/
         kOpl9cDXm2njzr2u37qUHYWLItYvRby1/ryPSpOikGyYrQ1j7Foz1vgmFs9CAHGb6ZAZ
         ZZR7hKTPQ6mEQDRDBOTEqf0MDoKuv/VhMGOqvUTDr8BOQP++yS9BpYwfFzio+kJr4y+3
         Yy7VlidpJJBgoRDrRDx0jQtHnTfIc+PF/+OpA6nQtv9prgGbWm75y21l/hb7jK0pGfWJ
         og7D5/lqitXgD0vxYro9FiZTEXQLBdsua2sl5MRuaoF+kR7xES7fIvW3u2n7/sejbL9X
         tVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778555101; x=1779159901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok4/hNnRAuFO3b4eBqtC47nNQ5z27lpXv+R3F+4gAUY=;
        b=RPCGxT/H4abRdT5ABQXL7l+1R20ePoo1T+JpDFt5HC0HPcBQa2ayYNgwqkdNgXSFbF
         yLo/x6yugGWw0QqnbZRSZXmNFDT13nnQHx5IpFZqCyb1XMK/t2PIz367LbgVx6xf9fTt
         QrtppAV1DQZ7nO8XaOuvoXceMUOcRIMSbH5kq+DlTgBRer48/fKJOC0wu+Gfe77lVm+E
         Ffn3BCDXryXVhWkofvP+z9Y+XSo4KtrdaZpKGy2oleauBxPyIa86yTA6E6aNzBs1JQBT
         Lo1pPp2i1ONwtcTtqHIsOOhkpLZrEfc19SuyZxADu69ru7T8Z7jUbBO3qovnyBjM7R5G
         6RTA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ynk1oWMhIbua0DlAKmxWe6lGmgvMMoYFFl8PpMFr9IrdeTumVZUiBPFw3V27EGLmOSOhPwCEWzeqTUlxM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Zh4koL4+o05C1t9o5+cozp58RI5vs3hXmEgG331d2gyqv7Js
	8KWr/zIDqs6OaoDXtGWwqAFg632YWjnV810cVTPU/RXwVqCKSYSzrhfZ
X-Gm-Gg: Acq92OHrP2P3fHzni+ycEbkeprLWhiUMqcV8vFJTw6zjDnfict5qjA6wuW5m7sAsl8C
	j9HH/GwA8WoA98NGVDG8VAE4m05Q83ojg0dEaHgnDlEzFn8gI9pI3AcWIkAzrXcB9tdfxOaQiZ6
	3A/Yp8iZxLsyJ3Q5TxuFF+VxvKiyPSH5rxP1kmx267JRl3NGS1b0FGVWoLROTuDOgWoulo3e/QT
	wIdSmyEdCzaIdSg/pRblyK4p9RMvF3I5VS7yIKDuyAJZu0V+G2Ra1+ug/xwQ6oZ2S6lW+XAxU6w
	b2phgMYtIZathvHBv0ErU8/mZz0f7SM06G6X4HxX1V8dblgO3jWWnGjQfkN+Vh3kR1doRnZN6Bt
	g3C2wRpzkrgxTlR4jn9OR8gNfxroZ3H4dw9q5O/uTs+Md4SAGkIrLc1im+tS1vVuGhKRoV6HWd4
	PFz29eX5w4U/rBbsmlJKpbY+fBUbejS0RDYv8q8IIczQ9qjhxOjhvavw8=
X-Received: by 2002:a05:7300:d003:b0:2f9:5c29:ffb6 with SMTP id 5a478bee46e88-2ffd57d062fmr653820eec.13.1778555101293;
        Mon, 11 May 2026 20:05:01 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm15858223eec.26.2026.05.11.20.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:05:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: cleanup LPS_RF_ON_check
Date: Tue, 12 May 2026 03:04:43 +0000
Message-Id: <20260512030445.6360-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up LPS_RF_ON_check().

Patch 1 simplifies the control flow by removing the err + break
pattern and using direct returns.

Patch 2 converts the function to use standard kernel error codes.

No functional changes intended.

Hungyu Lin (2):
  staging: rtl8723bs: simplify LPS_RF_ON_check control flow
  staging: rtl8723bs: convert LPS_RF_ON_check to errno

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 26 +++++++------------
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  2 +-
 2 files changed, 11 insertions(+), 17 deletions(-)

-- 
2.34.1

