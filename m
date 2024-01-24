Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB5A13B7A0
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136310; cv=none; b=W4mq64elU/irdzuRi18MtlYuJ+5AigcNjLqKL44HMAouqLhFxvm2I7sB1eUd2yp9n8oAGFJaJwO4NZ6rOmbyzL37fngLd4Kuvt39b7pv795Qqjn6jXzWcC3SIO3/mcvops1PVytpljfVydcet82+cElyUOhp8I/nkFNAeCY+HiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136310; c=relaxed/simple;
	bh=+cP4t/OPevl84lEdP4szFceY5NLbMzWC8dsMPnnt/TU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YYtXOJAbTo55FCRDX68a4hMLJgoj7WZsEqLtRuVnke1Ucqa1AdcvFWIHl9YqgaD7XrP1009sYmaIIpKDL9rD/95NlyL/W78k0NvImLsDZQbMSY2tuaq+WSgzr3bPZPTQh5bRkLa1IjDZcpW5oorFHvomgNHi3axc6TVVfREkf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=LS3tB0Xt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="LS3tB0Xt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d51ba18e1bso55218275ad.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136308; x=1706741108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtBjG1Apfhx7pBdMhXK8rtOHkvOwtEpOApdgYpd3hWY=;
        b=LS3tB0Xt/e+/gjAakAK6W7ULvQ/L6fuNzniqnQ54W/h2bqtrtFtndZW9c+w2asUyLw
         XZvpcBWpwE+HtGFwfL9+83sM0OZrrrSC/cwvYFa228+oy5fMnJo5HKNQinmSy0jVTAhM
         Pgyei8tmRdSJngKeO909lGXKot1Tyipwbb/UA7z45SUFdWpJOtyaxcviurxvarYd5yHb
         xgwlKa21lGSPzzPVpRNAHurRf8Y/IQnlwGDJ1WpI9QWLXqf/bpatHgiovd20m7gk9K+p
         oCpUKlcAF5A5g9JQefDfwewMpydPdNRcg5kFt+mfEtqOKrEZLbJzVd9qgG1KndCBP5JU
         1k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136308; x=1706741108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtBjG1Apfhx7pBdMhXK8rtOHkvOwtEpOApdgYpd3hWY=;
        b=Owc4RDa9O5d3PQWDolUDg8HdvwM8LoyW9yRqNx7pEz4OnRY7hdjP7yB8OhvV/QUOie
         Zp8fI83unhqO9egmMBBbJXIdmLy/272ApQOADIBtR93wQaV5F7ytuD/8qh+WHw8yN9LW
         iHUOUzhkdcf2OYX8ajZJ/M8DL0fw49mYttagbb3iNMqgrvgc1brpEQc/sUYil4OjhHXq
         vFgjDxKvlRsfssWHkPvkTgJT+26gGe8N6Fbmxy3Ly1N0gjMrUnRcUxK7vB76hFDsjxqd
         Zw9L3e9TLKJ1BVK0EzUeCWAHKRSgVY2YiT4ddK+WD0UAUbqL/9zAAUkSQ3b2Y2vj1yY2
         s1IQ==
X-Gm-Message-State: AOJu0YzBkaXt9ZRudVoUqoXeZQ0elHPzh0ZuAsB64MALipIi3fep7yqW
	9ml856DZ+/C8gkewhyI2Asj0VCMiE2iANcBoZMXsIU617L0kmDA0TEsSjbqvtQI=
X-Google-Smtp-Source: AGHT+IGeVctv8uX5A9KjXwUmbEEwQjrkreN3EKUpGNhs9bneQnJjatGwhGLMPjsTLzmy3IeYq5zU6w==
X-Received: by 2002:a17:902:ba8f:b0:1d4:25d5:5a75 with SMTP id k15-20020a170902ba8f00b001d425d55a75mr90163pls.74.1706136308677;
        Wed, 24 Jan 2024 14:45:08 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:07 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/18] Staging: rtl8192e: Fix if statement alignment with open parenthesis
Date: Wed, 24 Jan 2024 14:44:48 -0800
Message-Id: <20240124224452.968724-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a space in front of statement to fix checkpatch warning:
Alignment should match open parenthesis

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index dc91e59f1bc2..5281138ad468 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1207,7 +1207,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				    ieee->current_network.flags);
 
 			if ((rtllib_act_scanning(ieee, false)) &&
-			   !(ieee->softmac_features & IEEE_SOFTMAC_SCAN))
+			    !(ieee->softmac_features & IEEE_SOFTMAC_SCAN))
 				rtllib_stop_scan_syncro(ieee);
 
 			ht_reset_iot_setting(ieee->ht_info);
-- 
2.39.2

