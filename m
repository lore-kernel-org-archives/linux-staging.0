Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AC2235C01
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461404; cv=none; b=mWJVWbnW/9lq3ZsT5RwaZFbWDgUoBi0RauvWSIiqyq9QBMV6gVDsF9VOSQjkdtZTIDmF8YULKmv1EtyyThVbFXVk653bjBx/1XNEC2HBOVCGznht+UsPCMDe/0+zMggSDMIyT+zJThyZBkwwBPpE6hE2PdOxu6lGd1WylEIXxv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461404; c=relaxed/simple;
	bh=TelRQU6ROzWCCtcHFdfOAbx77Ijxec9i1jna1aOoEfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CWrXLKMP9Nanx/ylptTHcXarCu0FGoiLg+wZ7ljXoHqGonaPRAmdFtU66KGp+Pd8ONiJpjTEyRYB2LC+CLmgajdcf+PdXHm630H+ARI9KpM0Wkgt9Uh+yeIzIYRMe4qMHd6x4oNY8g3cSbEGjD5VggyfPT8l9XrXvCy4S8ZXaWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1h/yay4; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1h/yay4"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1363fe80fe8so3671161c88.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 11:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461402; x=1782066202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIp7MpwVFcziXXXpq9r1N3xLlaNPaHpnwbCOThGQS0c=;
        b=n1h/yay4mdK8GNcAAoHgXY2Z7RLAogthX60SxxYivTkwMxv5byUWyP8XP7jEnUn/HY
         LSwPThhTvHtz90zMopgXz/ZhdTJxuloWs1qp8gAZIqmDpkvK0GZHYdGmruW4IAiCxerG
         1MOLx9Bt+hr3CtTa5ccya6gJshe7RA5XDlPbEF4qjAwXBuYwir8KbR6ZT6jDsG+DgS6r
         pWXP9ikaHm8zm6UzfjGYSvYeQs9dSRBwPt3t76C9/tNHGCQ3qIKgmyoj9Bg9DClqGzGE
         npas57KzDhTZIwKpL9OY0cR8Lwa1KUFqeR4ARnWufl7MlwRVt6eGSbZJTKapJX7LAl84
         6cqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461402; x=1782066202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIp7MpwVFcziXXXpq9r1N3xLlaNPaHpnwbCOThGQS0c=;
        b=gcYvmyt1DmFoVHRlTF4M1Ivrrbho59A3tW/3F2JdMfvK9CcLXZCE2mdfjbcRMDEmxp
         O/HOuMFOXnkLo9L0kCYos0r4K3RWziVNAWJxwcQYDrSqt118W+Gbks2nnC3izwqhaGeG
         H1sykadnKtEOn31jZpODDHKVN70NQqt5lF91OEaGk1XfIHH4lgBsK+DGJfSzjT/ms1GX
         v3/mKb7Bni7uzfMRgY2T5osjLAwsuNQ6J7e+WOuh2CWPm25omQu10rlcwuzWl93iizkL
         IMeebZeiFPHu48eQ2UCKpIDzV+Wguc1yjNTu6fJznKxmi7wZX6BTLhWxsNUg4ROJVw+Y
         Tt7w==
X-Forwarded-Encrypted: i=1; AFNElJ9m3xdihh2uw9jIRGX7Hy5qqJlblscp3zNMYCSttpHWRH7oXAhLbbvq7qmHDj4EBcECHRNU+OjJBkK94iPo@lists.linux.dev
X-Gm-Message-State: AOJu0YznrndkPoqvsJCC93ZBlYe7LA3z9A9juHvThIRA3P7hnOrLTnev
	zjR0gcmio4hcAXYoprzZ33w5PRJVRauab2h+eLmN8rbv4slql5Iw9cZY
X-Gm-Gg: Acq92OEPLvFkpPw/zdG3X34ePAlTVqwB6uISkGIxYEdmQZsflWJWQ+mZg5bBn9gtm3D
	Eyfge69QBtl+y4A9VlWCqmjEQlN/u5kYRkdKpDfmOdF4Km/iM3vstOsgBeG3xS9U642JwlYJQXK
	Y5vlSsHeAIdj59e0Y0IfQNfKW5wqgs6rEAyzD0RKQzB6w0gwvVmb98I7No6YOBVllGs5cuF1aNG
	+6gxKHXNgJGO3NFI6NYhXAu2JjRrbXI+JJQ3wGl5b9sKzus54W1KFSbowlTIg52UJ4kI8xSey1u
	qcIVe0FnK4WokrDFi7MbbQLVfW9IIqenmRl1H5hRaxbIox2fCinYA3HpucYdCYA5OIHUZ7hqCTo
	c+h9HlRDJWNVL84JUY/MLEWo4ZMGhrwcQMcb1Iv9o4GBgq0HZgKOlofNcEdghLY9PmMigHTn3LH
	ak9TDjur1pHf80xUmLHB723ogmllgC//xPVA7C+UcAGmXgFzy5SY0s+wU=
X-Received: by 2002:a05:7022:5f11:b0:137:fc71:664e with SMTP id a92af1059eb24-1384baee6b5mr2325194c88.4.1781461401702;
        Sun, 14 Jun 2026 11:23:21 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm8435022c88.13.2026.06.14.11.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 11:23:21 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: convert update_attrib path to errno
Date: Sun, 14 Jun 2026 18:23:05 +0000
Message-Id: <20260614182309.96110-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the update_attrib path to use standard kernel return
conventions: 0 on success and negative errno on failure.

The series first simplifies control flow in
update_attrib_sec_info() and update_attrib() by replacing
goto-based error handling with direct returns. It then converts
both functions to return errno values and propagates the
returned error codes through callers.

Hungyu Lin (4):
  staging: rtl8723bs: simplify update_attrib_sec_info control flow
  staging: rtl8723bs: simplify update_attrib control flow
  staging: rtl8723bs: convert update_attrib_sec_info to return errno
  staging: rtl8723bs: convert update_attrib to return errno

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 54 ++++++++---------------
 1 file changed, 19 insertions(+), 35 deletions(-)

-- 
2.34.1

