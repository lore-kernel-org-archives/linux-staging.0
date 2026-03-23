Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B41244665
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 05:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774245278; cv=none; b=GfUuAy/C98weEBBv6GLEu3PZUh//QyuIZaQVgTz4T9SQLYdbKvBiLyLxKC6wJUCDJPcWN9fNZmeStMon6XZzHzS6EQ1DzZfR76012mCp6qomuUHOD/6EOSaPy5WUhdQzIDax1qWTmLHaLRo2U7JYl5gldPrfCK0CoeQi/SfzAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774245278; c=relaxed/simple;
	bh=1sC4hK3+d2Vv2v2Q3a0zO+Xp6s3RL9v/j17zSWn0xiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVaclrjc2uCy/Uj1sZUvcLofLW3IV5QUo9IylcU/FQpTh435xBU8pC7ct7OGxjHgr8KNz6MoodUO+aLsyD4NSLv+xDiNWnf6wPVKXiYqWWAmi7tP6+X53YpaF0Qi9OoLS9Pqdqq0ZBaQrHZL9SpvK9HAun3FbO6sFeeGfviEeCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJSaEKbR; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJSaEKbR"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so1814996d50.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 22:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774245277; x=1774850077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWVXIThHx4FUX1dRsqXssslq14CCCZEezOpYHvzorME=;
        b=LJSaEKbRDK9Jqt/7lnyeWpwFOYoI2VpPBYIqfTGPuBQVZZc842XoinXsdpZks0Gwsr
         XzQrUXOc+As3z7sGm4nf/t8JYbPVshO1sRDJwhNY/HtxogldiRbn5IHSM0ty8RkQV8dD
         m9TQJS4HCzuf6dpn2lCjGm0jJgOpR8h3seP5rqoQZEh2B9dJRNtEomon5UJaKnp/czew
         CBSF9KKPnKnfQLQkx0/wDrf1w7QPSCF8zaDSToe0hwLlzDYWFb/FXzE0i6EYwJFHYdD8
         4V3+bOHD7gWmNItu0iV2RNRhBB/oMyBDb3VZ59ruuh0fLHIKneKZV6/QYleIjvE0v1WN
         F7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774245277; x=1774850077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWVXIThHx4FUX1dRsqXssslq14CCCZEezOpYHvzorME=;
        b=lW6+eERsWc2gbzEmGye8kVPJ2UroOPBnMbW2cIG7AM/KpYI/+eHnPBK0/b5tzGIg6/
         Mv3IIqqrpIRetnUizOipl2Kt6YzCuQcQ3cL33Z8QQGwWoDrh4BXu4/rfxsa3ig5fFF8Z
         lPGs7hn04FtBbJPk9qmUgA2Bue58+wr1eO7n1FkG7TQPaCc5mYFXxVdHeEXQ0gEYZ/Pe
         gwVIVP5xpQXjkrJGlDWUH7KrZd1xeACoSY7z8vAhkWUZnVQOnqIKEHbA2IdQxaOb9nJB
         WOMkY/HLYbh/7+rFb7McbcO5ZM41zeADxr220HNfw0yqxqUncWbkKHqMCX0L01kJW/vp
         bQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCV1/D0Xo5GiXVaybubHLZe9gZJ40OBub+OQgv3+5Qr34bkTIwvlFwADqi7YWbMt80TkJOjFUWMtezoXYk3w@lists.linux.dev
X-Gm-Message-State: AOJu0Yxiwbxw1ru6z57fWVUlRG5rrBf3kZhlRFZFkTSYB6YKorGqfBuM
	D/arF1r1CsWi0p6zvpBvUCW7LUnZljHMdYR/U+q0CuO3nkI5yVRA14iy
X-Gm-Gg: ATEYQzwsvc7vUXyeOIWpIlNCyXRmLe/Hnd0nvF1A+/P9cwJmstdU9PsUwCQ+1fvWFzG
	X0AYnReQ7+KJDu75BSjIyfkjCcMiErDoF856FyY5UywV6RqIkFYgzZG9ioIFfuJiAlqyLQHj/eR
	yjQM2DDfUCyltbh1wLi6UMwGQ6cJCNC/NRv6xyDFk2SKhSV2ilUeEjfVxL/LlkRUZKFGfUaxPKn
	7HZ0WcCxs1XKN+oWEp/hQOClwHUYf/NetY8fCZxEDHMcrQ6YR1Uy/U8mmwRAq91mQAtjFvkr2yx
	ffKoedtUKrCQULwSulBtRJmQOgMQWV+Uuu6NaiT791BCZ6XRrdsYVi0C4Esh42tGPuExXeW9jkv
	pEGC/dL3S9J+mARx3dQe2CaGNoYkz4gp8P1z3tKU5qYGjI/TcaaUGolNGJPJJ9rYxX/w7AzJL7F
	pKP/Vxch5sqnGHYYwOjL21GUwh15p5ippXul7cBTzvmYbnEbIsMepJdeCpQiqPLMRQPSW1zFSF9
	fn8mkVLvsZZK+aLmeq5fLVG
X-Received: by 2002:a05:690e:4282:20b0:64c:a3de:57c7 with SMTP id 956f58d0204a3-64eaa80f72cmr8585056d50.58.1774245276631;
        Sun, 22 Mar 2026 22:54:36 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabe9fdafsm5697406d50.14.2026.03.22.22.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:54:36 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Add myself as reviewer
Date: Mon, 23 Mar 2026 00:54:27 -0500
Message-ID: <20260323055427.1181112-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create rtl8723bs entry in MAINTAINERS and add myself as the reviewer.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2: Remove Greg as M:

I've been active reviewing patches in rtl8723bs and would like to become
the official dedicated reviewer. I've noticed (and Greg mentioned it
himself) just how many patches have been coming into this driver so
would be very happy to help with the load.

Also, recently ordered the hardware itself, it should be in by the end
of the month.

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..fb3a987c0ec7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25113,6 +25113,12 @@ L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/nvec/
 
+STAGING - REALTEK WIRELESS DRIVER (rtl8723bs)
+R:	Ethan Tidmore <ethantidmore06@gmail.com>
+L:	linux-staging@lists.linux.dev
+S:	Maintained
+F:	drivers/staging/rtl8723bs/
+
 STAGING - SEPS525 LCD CONTROLLER DRIVERS
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-fbdev@vger.kernel.org
-- 
2.53.0

