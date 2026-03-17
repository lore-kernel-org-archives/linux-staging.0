Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4643D567F
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755772; cv=none; b=FIvYhAjDQHdrAGMQgE+ZBmZEU7wGvXi8iRNIRpsnV7QeO2TD2ij1b8R5fV+kluQYEt0Jd+f8Gopfupmbal2sjZSKT3qhKroJ2WKG+poqE1UqTGLu4HtsA6ZIeMu7BEkhA6wlYuEN8SSNVe8V9QMu6xt1ZgjkNY6wJhcAmeuHNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755772; c=relaxed/simple;
	bh=3J9dD/+pNREfGuCwa8TP4UTDHLnRcsXKNNSKghxT/YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GoLLHQeIveSOhmcRfUgfPGlmqqQNyE2Bf8mPWCNFRekgMcSipTPnUvHGRSUzSLa28NXg3ceVMMXWgH7YWY4w9sUb+VUyMfdP05k3Kf4HJB5Nh+WVMMWQn6KE1fKlwXQEQ0cHMNAYINhwvmCe/GIUDn55A6sBu9b/4p8x3dEY3/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8Gw1zZD; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8Gw1zZD"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d75d698ee6so3174767a34.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773755770; x=1774360570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hmIzLDbU7ohHQaWPdr3saHp2RfTo3UywBpwK6UdqCe8=;
        b=f8Gw1zZDGBO0zpFX0m1ieIKy1w6AiQopwv8Igw5chMRcIgDQwof/PGGE01pODnXFL1
         xZGunhxRFhZaPv8BVN6ANRebqEtvvfBAIUaEqCSiOpxFz7mLUqYio+zqqR4n30cFBx+6
         aE1O1TbcHrBqSh68TJlPngHYvG6YQLVJi7AboddMJQaNJbsBFZlekeHhltLLMu+rSHeT
         JssCoQSNVfUsT/Q9Mlaa4xZnQJqG+hQotlnQi9pyUM2MbfqwUdjQx9BCVVB9m5GXn1HM
         bH/GrWcwnfJqX6XoKrviQbw5norxzyQXFJ6rlsmqE61Et2OSqxAExhl57/JwQocQpZhw
         BZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755770; x=1774360570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmIzLDbU7ohHQaWPdr3saHp2RfTo3UywBpwK6UdqCe8=;
        b=pQcUKGBhXCGgMVadEUKe9K5VxJ0mTKoC2s8bIfHtHfQLwOWgeLYhzfnfpiCpOLOWP/
         R0AntO/JBiHMLdUy5VpUqk7TdGp+Y7b97b+u81UaFs4iUwX/hAPOdSQ+SFbj3db/1ZNe
         3W5+RUgI4JrgY0Khzgcwv2a+SofTIyf7+7c02B5UugXTAW0FJ9gZyRqxO6vCydXOjJLb
         ngKcJLZcmiYk/rofvWdaAsl9I3beOpG7sfGVh0XH+8lQdA559uE2/alZIi0GeSXKgZ0E
         dVxpqaZ67UZ/YvwvvoLqa1C3RX7FZNg30pRyUUTrgN0b0oi6GubygWq5Af81SxxMDqft
         OnJw==
X-Gm-Message-State: AOJu0Yx93m3DTUDjf1Hwihw8ODx/QzxiUqbYUK2nZuFvgWnbaJ0oKYBs
	z8iktK4tJu3eKNnYHOTEvKvTbbGRtlax5yp7qqoOmviR4yKQNegybjnW
X-Gm-Gg: ATEYQzw6AFDqfsbiHT7Ta99FDaRkfiwnY2J9xt4XrDOr0lOY0eqpauujV7h7H4Xs972
	oCPCzFlJHYqGKq+fw2lkAC7h5/zGwHDXoP1vCApPkJoMQI2UMfV5pHQ/ygzKjX7i2h7aaa5QUGs
	N2Qio1gznpUvxNYrz675kwDzFi+8wgHuwr3AQaWKchY1Xpswb95Y4r0XLjEpM8U/b0Qni9j6p8Y
	DvElwf2swY7KbCGF1KAjVu9v6LNyCGeSnjOSNapCHyR9QzbicoSLfTDP1mZbatGLuXaoymvWH6G
	w1Uo4PcRMevsAW0HNVLOOBG+eA2sPSy6bETnm0eqAYpqz0UPChPGq9aho7VC0Wxm2aMxHhmAI9U
	qk3kSLQem5DlbMOvetsRhLqchpjT+s8muxXZMkAyn/b+207KB8GB7kNWE99fIYlA7EqVgICnMiP
	84FCxQjkhBN+8c
X-Received: by 2002:a05:6830:3497:b0:7d7:798f:c4ed with SMTP id 46e09a7af769-7d782593b85mr12699638a34.29.1773755770521;
        Tue, 17 Mar 2026 06:56:10 -0700 (PDT)
Received: from arch ([177.249.163.104])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae9a51csm14562127a34.23.2026.03.17.06.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:56:10 -0700 (PDT)
From: Marco Antonio Solis Segura <mshdevv@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marco Antonio Solis Segura <mshdevv@gmail.com>
Subject: [PATCH] staging: rtl8723bs: collapse duplicate goto exit conditions
Date: Tue, 17 Mar 2026 07:55:48 -0600
Message-ID: <20260317135548.239746-1-mshdevv@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine _FAIL and RTW_RX_HANDLED cases into a single conditional,
removing redundant branches and simplifying control flow.
No functional changes intended.

Signed-off-by: Marco Antonio Solis Segura <mshdevv@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f..20f5f8760ba0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1339,12 +1339,8 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 
 	}
 
-	if (ret == _FAIL) {
+	if (ret == _FAIL || ret == RTW_RX_HANDLED)
 		goto exit;
-	} else if (ret == RTW_RX_HANDLED) {
-		goto exit;
-	}
-
 
 	if (!psta) {
 		ret = _FAIL;
-- 
2.53.0

