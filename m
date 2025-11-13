Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8FC3346AF
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030752; cv=none; b=sW+XqmyyEH3KJ8HaqEajjZoG/4D2FS0LBsVGywmpHWo/8DxXI8Tm+TvW9BPwg/D8UXeKerwyBc88k5GkM5CmthbcrcAE9J80t/ZZqdJXhQ8b08qTdrKY55CpmZAWN3EBqShEtWFuZv99JXVNmnbLqRNQ5etq+AoxWscJEkS7L8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030752; c=relaxed/simple;
	bh=DgA+YQZ2PXtKWbfJH1XR71F2ykLEULNrwbgH40vjVnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0CnOk7JSAbbZX/Zt7qN4XU+tnftbeibvebTTwM06XBJ8tN5YlNunA44baRdlYu+54FlvVQqwpZugL05YK9sM1tohTqd/TCO+XEmicuuNNHMBa5GCsMWvE7724iXPFE7lLjV5Se2e0lMo3Bj710VMZ+4J0fN/lzipdk5zCr0ze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESKdBwlz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESKdBwlz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so7942485e9.3
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 02:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763030749; x=1763635549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q6cLMd5HkJMSjJpe28rjQcWfQMB7GUBaFpYg6qXkBE=;
        b=ESKdBwlzPSBma1i5Af8yjBHcOT1XYQd1WRkj62VVM1+EzBzipRUPBuiHInUuruNPFg
         3Qz5J3G7GlHi5vayVBYHMjUB9cthdB35zKv/Ebf5Uaw/c5t0/ET3+XJcdRQi3HcMqAEX
         snEnK7g9SxQz0vKygXw062FS0+ueoHX5nSG96QiQlMJVwg6WGpN8AMy6Ixdz7rvDHRQ+
         WjDf1s36BLj+e28+7hMFqJj4DA1Sb/JD3rAonQ/chGVrH3ayc7d/LfV+VZ48Ls+eGcXd
         9AB2vGUCMyfvJjmUnzFbvugIUAMSJm1aXH9EJUlRc2E5whFP4pYgwkmZOQt8o8/os5P/
         UyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030749; x=1763635549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Q6cLMd5HkJMSjJpe28rjQcWfQMB7GUBaFpYg6qXkBE=;
        b=sK8yBbDWjhqKfOvzAEwrXDjx2QDswljMAfQHvm4wtp+sVVZa9FZxR0g8Ni1maQ3sNE
         5BXvBxH52H7t0CANFrWueY68sJEDwtb1TE0W1UDfx+zOMXtDpF+PbTcT2r9oy8XShwAP
         Cm1EUOzn4kfANHzg1lRmiMNlawXlpE0Ukqu3oMlQrZuAEYDjGcZRmD0gBjCFnYSu0yWT
         xqWNTlBHeG5uVOLderS8ffkpD08Osx74QkN4kR4ymla/hh0Zh5cDukq2KoHOWC/IbN8y
         w0xTLRul4RTmmmUXzHZZglXsB4ut/fPgD7dqfLq4GrhZ1xPvLMNN/zdlFT39gSX4RARE
         ze8A==
X-Forwarded-Encrypted: i=1; AJvYcCWfbIOq+3Z72HEE8MMuPj9xIVhhBAuaiVffCxieQ+fuQzBB3wGcSgzQEWI76BX6R415ZAkWdDxO5GKJ2mdo@lists.linux.dev
X-Gm-Message-State: AOJu0YxC8rqm5zbEB64/194fHW0XbBQxBi5SPGM5PXV65q+YMtXfUSzN
	Cn8P+h5q8oRj5g319QhaWPN8TPUHDqYCZRU71hQXoMxV3AJMkQQz5zqu
X-Gm-Gg: ASbGncsmYxYyXpE2K6YtD72yvN8+vOSR/2/d/yMJ8V9XXyQ8Dyk+2g4pOnr6aNO04Lj
	3BYGtyktS5OCZ640N++ayJOJhFqLD1kjRp1505EZ7Mn+zZ8Fu5V5HA2QU9uZLWe4nBs+NVrFbY7
	/+k4QSJo/y8v9pPP6AqX9YviDbxmuqr6lAlDVJhk+GeGKk1yOuXg1xmBWhEbjDmrApvxcsjc6nB
	S5SccnKq7HfyNHsZsu9NkXApuozGEYjBQpd4F085WZDC2CY3WW34cmGfpUZDqj1KShP25PIKXAV
	M0SCgf5lFzTK47UK4fENZgkSJKKju7An67P1MJfSWdKYMHgmHweboiLz+07ytvtubfUVaJtl/PG
	qY63I94jjuJST9qi6N90t6LJSPA8rzBaEKO9o0P+jsDLkNRJetLuGb7FffDjpTaDhixroCHDDgD
	uMjGGUTEKuF39rK0/+
X-Google-Smtp-Source: AGHT+IHyTFt35dOUEl4C7+ARegy2Feho33shK60lCQ7QsAOD0eQRQVF8cgi3sjrl8oM5XURyD5xYPw==
X-Received: by 2002:a05:600c:3511:b0:477:54cd:2021 with SMTP id 5b1f17b1804b1-47787041346mr61868365e9.8.1763030748717;
        Thu, 13 Nov 2025 02:45:48 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm1444975e9.5.2025.11.13.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:45:48 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V3 2/6] staging: gpib: Remove gpib/uapi from search path
Date: Thu, 13 Nov 2025 11:45:39 +0100
Message-ID: <20251113104543.5875-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113104543.5875-1-dpenkler@gmail.com>
References: <20251113104543.5875-1-dpenkler@gmail.com>
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

