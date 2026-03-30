Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2B3B4EBC
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894984; cv=none; b=NELqqpq6E7scHbX5PV8o7UR/77LQf2smWNdOAfYR2Uphs3JS3qIUkKfK5HGOTsmMLiRg+9LL/a/WRgjj+vgk6shOlPVxYIYKU94gSK599Did4MnLJ3UiTnrQ2noPrNhnUQBu+t2o7/jpJyj1WkrFAose79yyEeQ/2lXCkjAyR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894984; c=relaxed/simple;
	bh=afnlTER8NQZCosHmqikaBKCytlvj1AE7Y50aUK7CQCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JEQglXhcvGb71yPEjoojzdjVm1B/20PyeR77inQEf/7GrmsG+3P3QVL+WerHtEeidJ3lnLpdkAxRRnikOF3ZDRAZN3SHhPX/KVWKQbD0xTy+SLDs5TU3aao3QlRAl7/WVHDgRe0nI9yiz7r3ikV9XIpxYcCkEe9qhF5A3CqvT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsPSyC42; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsPSyC42"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso48866475e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894982; x=1775499782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjhxgiz3AskIlrAxUl1wlfuKjiBj1EhlUuK3gAiRWjU=;
        b=dsPSyC42eIvkK6N91iyYlZhBrRxZN7dU0SWALYi7+Zmn/SO51Ezhm0ECVSIVgQ6XAX
         slnbrkc3fqWJWC9bXwIhtpjC+6WgWBUQjdF7sG7HjkjgvHMKW+TP9pD0ilnmmml/z5at
         EjDfoXaUUibayh7wdKA/AuqbkzB2so61b0TW2+cB4YzND2TwqlOaJpQfWyomBu8CdhJD
         MZLcFRGJWcui6Gp/Xa84zl0DQlennP37ur9yNlX9xhrkmZOyjyd6BL6VfbqN9dRbNFso
         Ic1Qogb/eoSoQdN3QuOKAdX3J0KonxNQn4lmW6AYtT3/uEmTS3LJbZkb2MdbL3Z0qYMP
         smGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894982; x=1775499782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjhxgiz3AskIlrAxUl1wlfuKjiBj1EhlUuK3gAiRWjU=;
        b=CYJ8KuYgOVzziBX3dk8kPtr4DgGiS/NfuAYxoCkOzja5erXo0GM1SrMG7n0ArE5WjV
         eFWZjJiT3BCIQLvQvNu5Qvt0+5WSOPSsxFt++b0I+FwFvD2VnmUmx7D49UTFyEJwE27b
         rPkzyPGA+0DcjG7pca5UgS7tO2xsf0A86hEwDHsegQd9391RxDXASXzePgsRof40otAL
         iY0tmmHoBL9+5GVqyOKxSI3KDcuo529Ls/tKg7fjtc/87A3nHTwLaokOlLr8fH7vy/PJ
         PsuHeJ5YHeKHTV2hDZrLffKlfv3/ffYXfQ9ufM3NHdzuuzT7JgNO1cK5lls15Qjf3RYF
         6Ilg==
X-Gm-Message-State: AOJu0YxRPZWh6qfZXXg5r1enL0lXhzE5BfEgyg8S1EoAheC+4UMAUx4Z
	M7wAPAnSGECk5WHaeBXTE5rezzKAq+MYTjLc2R32+QszDM0a7TDFd3lo
X-Gm-Gg: ATEYQzwgrqey486qepaLvNhOx1hTV3UuE3XzMe5MG4St/N5bWMWBkERp5P9b+bxgnn+
	2aL9jVb72XvV9KHCo9RMDHPQuf1OLeKra4WOAiu7AL+z3QoasYzo8/4GYKmsPKfQgrg9Adtt3DV
	GCxnZQNzOH78grpCcRpLBwsug8I8bN2p3rDd+0Srig9de2eUCdi6V4lUsdbECv7f548OowAC1zn
	NyVR9vBToo71xuetdzpnfJBPjwPydT//5JKUKo7JOLifqeEmK34OXQcxx9KI0zDE98BD4EG6vtj
	1VQpIs34PZ9bxDuMNuRtEIrb9TForG3aaAUJi7wnTyP7WK1um2SOeebDDGAdj3vO1wJ6X735zr2
	fa1O/XncqeuK7aiJAbQ4tkWcEk+JKKA0xmhvafbAhdqE1jpFv/FEedtSnaF2It0ektbBPAxX8Jq
	a7NjoA6nhXQWfkv+xAXZACEkoIyO4+xmataMQJnKoITVrHK66WNjkA
X-Received: by 2002:a05:600c:4e08:b0:487:1fb4:7b3 with SMTP id 5b1f17b1804b1-48727ef0cc2mr250199165e9.23.1774894981400;
        Mon, 30 Mar 2026 11:23:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:3437:41ca:45cc:e6f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48733c095dbsm130198405e9.0.2026.03.30.11.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:23:01 -0700 (PDT)
From: grondon@gmail.com
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v2 3/5] staging: most: dim2: replace BUG_ON() in configure_channel()
Date: Mon, 30 Mar 2026 19:22:53 +0100
Message-Id: <20260330182255.75241-4-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260330182255.75241-1-grondon@gmail.com>
References: <20260330182255.75241-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Replace BUG_ON() range check on ch_idx with a return of -EINVAL.

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst).

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index b820c3647..0b80f313a 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -457,7 +457,8 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	int const ch_addr = ch_idx * 2 + 2;
 	struct hdm_channel *const hdm_ch = dev->hch + ch_idx;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
+	if (ch_idx < 0 || ch_idx >= DMA_CHANNELS)
+		return -EINVAL;
 
 	if (hdm_ch->is_initialized)
 		return -EPERM;
-- 
2.33.0

