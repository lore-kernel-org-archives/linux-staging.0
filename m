Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B0301715
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765359817; cv=none; b=kHm87hwdC9Zk9gXnIWzkJ9DTlMXRyvvOoHWe3TSGZyikV/5Ew0fz2+QJHHYqCBLK4UM6w3j0u9/hHjm/UD0BMeLQTm0eG+noQghVBbIFP5+mgOMBqaXEJsgt7c3wXFzweT/Q0CKp6pyyWeKVWGcCRHRdN8VnzuWPR0gPmV12sJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765359817; c=relaxed/simple;
	bh=dn3+h+xAQ2J8sDTnDOr/kyYXa2xXS2mubWTyZS2KGUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=porXkgkT+m7aVo2v05HCiJ650yOZnwy6YkJzz+en/te0xOZhkfkvKFmUfnMAZuBY1vn0zGBtMGA5+qCpFz637rIM6QMX2szu5BoHEwQ1ZRxqyetuRrhhzWYfzVWyUlfFhq7O+zkB1pDmvQWtJZLHV6o1zcyXbYTt8eF159GZM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWqInfzn; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWqInfzn"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-349ae58a7baso3227442a91.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 01:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765359815; x=1765964615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+v9WYRYaF6ILbuAh4Y51zdZRPGNY6Q7/8y9sigJ+tU4=;
        b=EWqInfznIJpIY9l4Fz2Ri9D/PdUdjMNkiyy0IvtiyoqXe47I3A9lq3DS8lxmWAWEvy
         Uaou0h03cMTV51sgfINah3w+VB4NLnY7uSpvxbJ53yqCTpq0RkqkZzcAlcGMydtxhsH4
         35UoCQpueLISURycaKEAV4I30TzbH9+TvwIZacFfszj+XpvLaOYX8vn6YGaX9e8UH+P2
         Em3o/HlS967DoYXQVZcW9Ng9+KQLAGePCr9wey9oqqEeHZrorKYQD3D5qesWg+kJnzt7
         PMIOe0Sard0IH24tgULG5LPdjB3LqgtxLrNUSI+PUa9c1RlPW6yTA2r65iuzhwAF2hSm
         LOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765359815; x=1765964615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+v9WYRYaF6ILbuAh4Y51zdZRPGNY6Q7/8y9sigJ+tU4=;
        b=fKGrbaLm6oDJXt+oW0tRYiaK2ImB0fseFxrFX1fYpY19W7yITVpk3HaZvaHIjlQFgE
         kQpmeZ4z4i+3BvGTk90a19KoNbwmVDhXo8eeY2JvICf1fxI7AzZ2saNPKHn7XDEQEyN0
         pLM2sxMUWCb/Bt1ApCszEItVu/+krn5EP2WdZNQgQ0+P06n/gf8iArGAfSk7wTvamFxF
         /t1rzckS1dFwj03SyL2YPQwmow6E0y3IqpNNe4MH4/Z3la6U2Plsj96FxrnOyqIp+O7I
         d8d3hGCB7RjTAbrTYd002sB/Btgd7X//kpi39XehIHfPV+jM6gU5CqMCjrR+Dqs4Bofd
         473g==
X-Gm-Message-State: AOJu0YzF0gu7AG16yMZd7FxqATTjfXjclE7QDCWsskoXn8riNgIyxY5U
	d9jXo1PkGmTJpZlIPsQQoKsAfR3hKzVQU+AyLlk9ZFvZaO+K8sTrCTcL
X-Gm-Gg: AY/fxX6RYE3qk+1hVYWim/DQRGpCBfAF+WLA+Qs5jb+pHOHW4Kr7gveVjIUmg+UZOqV
	60MulIUHGcEbP8THLIf056jikQsIAqjFmboLjxqENUwtmlZL8uzeDcD5zuXxu9W4DYIcnZILzkm
	K7Tqx8ySAScjPl7t26tnXpNRSYvB0VbIH6jvwKuDfdBSS8qmB/1LeUbqoZ+VAJ93FLC4/FPgXVC
	uSsUREu0eC6NVhk0VgP3kyT2k5xJpHtXM4ngmaFzAf7joiTr4WHFZtD+YmkJ+jktJwDrBgvsYyi
	YLJW9PckoOCHVnLCDT7LNK4my5bsYFxn6QBwRAC6T7ri/tvWXX+OAO0eqB2GQnHXh55Cj3yNMWl
	kSeCDO9VsZ4Y9mLV4moUyBw5fP41PfUS5HGnbuQCkOLcZTGc3HpWmz8qK1P55RCMQ8mEnQUV5x9
	ign896q9NCqyV8QprjkoQRGGs1JnqwZl7M
X-Google-Smtp-Source: AGHT+IF7gYSRSgFnmvZbN8Sg/iKDWrjC4V2sEN4Xs32FEwOFa5t+zuTqO26wAtymrMcBJ8ADa8s0+w==
X-Received: by 2002:a17:90b:180d:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-34a7280cc32mr1502333a91.5.1765359814949;
        Wed, 10 Dec 2025 01:43:34 -0800 (PST)
Received: from localhost.localdomain ([38.134.139.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a47bb279fsm2597892a91.1.2025.12.10.01.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 01:43:34 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dharanitharan725@gmail.com
Subject: [PATCH v3] staging: vme_user: simplify bus number allocation using ffz()
Date: Wed, 10 Dec 2025 09:42:08 +0000
Message-ID: <20251210094207.33671-2-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

David Laight pointed out that the loop in vme_register_bridge()
is effectively searching for the first zero bit in vme_bus_numbers.
Add a check for vme_bus_numbers == ~0UL before calling ffz().

Replace the manual loop with ffz() and use BIT(n) for consistency.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/vme_user/vme.c | 15 +++++++++++++----------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 2095de72596a..45381e677475 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1765,16 +1765,19 @@ int vme_register_bridge(struct vme_bridge *bridge)
 	int ret = -1;
 
 	mutex_lock(&vme_buses_lock);
-	for (i = 0; i < sizeof(vme_bus_numbers) * 8; i++){
-		if ((vme_bus_numbers & (1 << i)) == 0) {
-			vme_bus_numbers |= (1 << i);
-			bridge->num = i;
-			INIT_LIST_HEAD(&bridge->devices);
-			list_add_tail(&bridge->bus_list, &vme_bus_list);
-			ret = 0;
-			break;
-		}
+	/* Ensure we have a free slot before using ffz() */
+	if (vme_bus_numbers == ~0UL)
+		goto out;   /* No free bus number */
+
+	/* Find the first clear bit */
+	i = ffz(vme_bus_numbers);
+
+	vme_bus_numbers |= BIT(i);
+	bridge->num = i;
+	INIT_LIST_HEAD(&bridge->devices);
+	list_add_tail(&bridge->bus_list, &vme_bus_list);
+	ret = 0;
+
+out:
 	mutex_unlock(&vme_buses_lock);
 
 	return ret;
@@ -1787,7 +1790,7 @@ void vme_unregister_bridge(struct vme_bridge *bridge)
 	struct vme_dev *tmp;
 
 	mutex_lock(&vme_buses_lock);
-	vme_bus_numbers &= ~(1 << bridge->num);
+	vme_bus_numbers &= ~BIT(bridge->num);
 	list_for_each_entry_safe(vdev, tmp, &bridge->devices, bridge_list) {
 		list_del(&vdev->drv_list);
 		list_del(&vdev->bridge_list);
-- 
2.43.0

