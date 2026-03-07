Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A9E286412
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 05:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861625; cv=none; b=s8LnV25YGqG7fAsH573gJItxD9OaQAArx1Cam+YltJZQzUf+R6VrYOwLV6JWrpU461FdyQNTAheEwyZyijgjnnXmaReC7wtclYjySBiL9AuRrAg6mbhCRhZ3iYR8WthJhqxxVptgkL3X4i9UeNvQFdien+n9Ta8MtDDoqd23tzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861625; c=relaxed/simple;
	bh=DGWHSyTFVRKcueyZ7bXDVwwm7kMw9KAVUmrX9Vd/7Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqOiVwxWVoXIRotBAaZ7JiYcQZvK2isH91536R8rkfB8xFU1sDkQOzWtjyz0il6E/he6hGEgHhS6a99qU6/MA8+Hmtf3Zi8BGQjNcFiBruY2eQzD28SpVT8OZtXMjvpoOM3Ndpqg8ypIKhX7ZhawxWcZEiKAggj3+lgKWsRV+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWcFoJOi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWcFoJOi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae46b9c70dso26976645ad.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 21:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772861624; x=1773466424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1V4H9atg5j7GogEbH6jTkbiS/6ESGGAmZmDCJhkJ3I4=;
        b=dWcFoJOippUrpIvVjZmEN/6KHb13Lg24lHCwEnHywDDIAOqLFGLWLwxz8fkdpMiB7H
         cYWWzo6UiWLkegOjOFPvSMcBawKbQ9NBvL0ElE/l/75k63Olko2/quzC7qxGup24Jf0f
         ykixh67vKNPW7For8mNFyFLuZ3PhuzEzJBCLk5gbN9CKnRzsG0B+fXPnQxflWXyly52E
         JkufUV2eKy4QKCbXeA2OWr2XqtV92s9N7vpwhP45JNZq37YdlsGBT1vVboFxHRU3ueza
         6qFaRgws2vk66ak3d9u/32jte2OMxdrVzxRSbdDa+1MAQ6snPcq5uzGjGoz5WRg8ihPQ
         T/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772861624; x=1773466424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V4H9atg5j7GogEbH6jTkbiS/6ESGGAmZmDCJhkJ3I4=;
        b=Rg6VmpEHXJVEsA2ncehX/lVfVsgXjkFjzpYQVNaCIb03rpOfMee47f2eEbddsyF9Ib
         j/64cLzuErGuvbZhqkP/zePpejHAZ8j4iGbh4XFUiFQa/EnhtvFpwpZECgbBjybHHsXf
         l8Iwa81cPtxhlJq7TCveSGT3YHwWN6kyPtQ/KFQiryNpVcKBTOMAXVWauckdRWaXH8gZ
         6bkCwmNJpdgXlounXCgoMvqSWpO5DhH/n6fmdHj7RJLGiEftjgYt+M/705uQlFJ3bkVb
         HyyYxusH+xL423lI+aEJO0mK3WGbJ2+uMrelAleKtRD323CRGPlzaeQ2EENwz9ds4nfv
         ie8w==
X-Forwarded-Encrypted: i=1; AJvYcCWQWeGG8OllUOjWls5zwGlWIh9m6ZnHM6SJeUSTJGiqL15kNuR+MB9sAjlD2+b0BzD6Nk96p2NitCGgXQkP@lists.linux.dev
X-Gm-Message-State: AOJu0YxJukb8RjJ/TTcU9llB10nUARuaoI3d7oBn6fPRhpbvgigtO8Ro
	IuZKas58earjRf0T/vrMf6wtm7AkErE00N96Iq1CimZwiOtMp83s8knR
X-Gm-Gg: ATEYQzw+dYir+/A2LgJx53Rsarhj1JnHSTh+qZERSJ6YY84hMTfLKGIIdHxC5HrxbrX
	bAOZeABpu6WqspyXHUBidZt+xu+UhkGephMy9M7DDWnT7buGFjmEXOEZuz3AxUB9p3wsfj/AIoO
	v1P7t4BaklJHnHgm+B1RByaxoYmxrtCvr6AthqyLRQJfuc3v39UWUiND7g0Gz8KPRIslGkQDcyY
	VIkqeXNUg+WCY/OzVY14CQa0IAPs9iTgLzzTeTI3djK//v/6Cw5tKAltY/n+jb2BLQic+0hAxRr
	hKAjOCzNWu167R5o4ffZuQeydc+GCF7KOd6hmS4HMbL9+GrRtTfsOAzuWp4LMlv9CPLNrot9LJt
	5mYf4G5y7s5R5O90oz/TNk0ZW6c3vyX+ZRyOKA883SXDkWUa9fAvI0yGK7+U9Wxq5iCUx/Cc2iA
	VXoqAmEze64KhBgEpkLLkZYiuKmnREMBERR3xVPxqQFyKLUZQIpb4/ubOCy4p+HP4ApfM50jHYL
	0RnqiyPE1UgvYGn
X-Received: by 2002:a17:903:3bd0:b0:2ae:5435:1940 with SMTP id d9443c01a7336-2ae829ec14bmr40642805ad.20.1772861623278;
        Fri, 06 Mar 2026 21:33:43 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e585a8sm38447325ad.7.2026.03.06.21.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 21:33:42 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: media: atomisp: i2c: replace msleep() with usleep_range()
Date: Fri,  6 Mar 2026 21:33:11 -0800
Message-ID: <20260307053311.15746-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl flags a warning for msleep() being called for 5
milliseconds. Replace the msleep() call with usleep_range(), as is already
done in the same function.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 6000);
 	return 0;
 
 fail_clk:
-- 
2.53.0

