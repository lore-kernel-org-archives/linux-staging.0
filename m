Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0913C6A49
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389901; cv=none; b=Gz0nAmvywx9HdcaxvCa5JF3jchz9ggIL7kd2pXMUAM8vKZxSkLo5dW6OQBenK/Ko5qs8gqKEIrHITYm48MOgNoeuJq9Hgt5yzfGJ8HkdwOFyJgIJp81L60DIWBUVmNpnScbvYZODMvAHmHtrCKL6snh41WfJdgBHgpjRQYQmp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389901; c=relaxed/simple;
	bh=4f6DOT62ggBGsTASA6oSlYNYuz92aScisGHpB22l1FE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myoSl7AbW8wOGKsx1saOqpjqOWYIga+tJj14yw+XUSABiUJjwJszghIErWQevIGeVxp1ZU3mwPGtCqJOclnt9CS+EdUREtwUUBTIYYiaGltMW+Oz3Ygke9LyPoRtP9XVaMw8f1iV4104W5AKG3AjJYhnEfF8gR5dU/MbBQNmWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPJok6rp; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPJok6rp"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89c4468686dso60450416d6.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 15:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774389899; x=1774994699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNdaz3fx1NTeJPY1Kng7X6wkER+os8LVlbI6aoGJx+w=;
        b=TPJok6rpEF2HGeWSI9xL2OcNPr3w88xKmDdGAyxHY/EMwOjpX4xKgQMOIf0vRm38nA
         28sRiLK0IvRxZqFhGUslyX4Jtny2Q2r4t9QFuXKq5IYmrNYtc+HM2y5Wj/JU0SRUX0SG
         HrDNQ+Rn4blyj+KW1A2cY9CIjmkAFlO4O5L17Wsw9hsDbXug54drDRwAupgFeQbVcIwB
         CUSc3SewWLPnC/sxI+odZtZ96f3mhACc/R2b3xaVFUMevBWlvgswjjv3mobNmO9ahLom
         o/cCGc7+tPy7mVEB818FC/yPqjMxfCK1ZTF3kd9RXYQqcRAckyROvKe117Sj5mN/bF6u
         Ce8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389899; x=1774994699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNdaz3fx1NTeJPY1Kng7X6wkER+os8LVlbI6aoGJx+w=;
        b=n9f7zCSo2s6A6YHa6kRQNJYVLj/keRJFX/i+WC8gEH+m2q4W1i0QA5AFgHILnNY7Jw
         M/30BzYQSt2NyvU77NruhoaqjTdiFi445KoYEu0ubrBPM132PmO1xGh9OjNLhHpkOwRO
         WlsjagsyabCR0kn/W67uDWxD8jVX0ZMZCroOZPY07TUqIN9PJvFIU2+X3qc1bCNNQdCe
         uV0gkRterDIby/YEnAiNHWb/IkEs+SpeAC9++Ae52d9bytLTi5U15JQGp6YBrOO2T99v
         OSJOsgP0f2VjpklcO8XX52JKfwcFyqOziu+dFpOXeJH+jYPBT0lQ+DzL1CrcNMb17rg9
         76tA==
X-Gm-Message-State: AOJu0YxxYuCc6XtkuPlLQ2tiwdNWNbV7VJLKKJKENLqHOL8seFoq7HtA
	PlmM06r6zpBPuaXXNrVQzrEy6fAIkTxvwOib009F4DDyqvwnL3vE70kTPOQvj0ND
X-Gm-Gg: ATEYQzzsisIrgDIATM1y3BwuKpStw4aQwW9xDtkmmjHKz02Ogx7P45ZthmYThHkjqg/
	E1JsirfCjIdY2s/RlmPFliwN4RuqXMZmK1XLoSvV/9mMT9jN18Rchl+R4z+hV3qvOHJ0nFdNYLT
	CKNkov6zMa5n/LzpppEcQE0H/K+cG/L/yaNNQ6/DdHzDQp9Hsomq4S2cZCl65OG1gp2TVfVgtBE
	/YOEBFhWvuOTOKmcIdulPZ4eLj2nZ+UQuXcm0PC7AKRfD6u4tWwYlI/Au5SG32dfWlxmOVk6A3R
	iOOoh7sZVYIQX/IeI+E/zItF3XsOkOwaHP+LKGoBDv4M7iFuu5C9MPJAzBF9SemUu9D8/dTF8L+
	B9b5ELXByBLVGWNAcyQ3jlR6qE8V0JNJ4M2k9S+uHqK8trnPiSYXSntN4FgcYkxFJE4qjGoNs6O
	p0PKBzuvyv1EvD1MLZ2P7seRU=
X-Received: by 2002:ad4:4eef:0:b0:89a:1031:383d with SMTP id 6a1803df08f44-89cc4a4acefmr19936316d6.31.1774389899270;
        Tue, 24 Mar 2026 15:04:59 -0700 (PDT)
Received: from potato ([31.176.161.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm127590976d6.39.2026.03.24.15.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:04:58 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 0/2] rtl8723bs: clean up error handling
Date: Tue, 24 Mar 2026 23:04:51 +0100
Message-ID: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up error handling for function sdio_init()
and sdio_dvobj_init() by using conventional errno instead of
vendor-defined _SUCCESS/_FAIL macros when returning

Omer El Idrissi (2):
  staging: rtl8723bs: use direct returns in sdio_dvobj_init()
  staging: rtl8723bs: cleanup return in sdio_init()

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 21 +++++++-------------
 1 file changed, 7 insertions(+), 14 deletions(-)

-- 
2.51.0

