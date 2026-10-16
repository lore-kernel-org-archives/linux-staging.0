Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32097175A8D
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 01:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113700; cv=none; b=P0KrJQ/nIlieKlCM6/Hs7ihVDZaTiMDjrevc2kErjpKsrRz8AB+hZyLUMRB4ZrJlIh69j8s99XnD52Lft+gYwyapoH3zRcBvQDddKjEi9/al8CFOGcY23EVAaPBSOD0P/vm9cgQUl3jHUUkBfZXrsqXF818eTVYP+i9B1OMcasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113700; c=relaxed/simple;
	bh=+i07IwIEsP7E/LMwd68sFQNjGMiry34gNPJZcRbgehE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZGDZZhzrPel35qUl1IExn0RiXyyrsSDBWFv5YG6ELs506D/q7FdChA97E65TClqL9UtMeG0r9q0xylzCYlidqlGnPJ8PlwVZHDpilQf1sUgcVaM9+2YqqmyWglw+GQSan7Qv5UHV7CxCjskSsc15S5oSIkV9qeEs+t9uFxP/5Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coxB71vF; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coxB71vF"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso4297366eec.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 18:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792113698; x=1792718498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+S8LbbbkE+rdxtgh7jfWvM5EQN41RJP14wQndkrzGJ0=;
        b=coxB71vFJG59wp19eWtWTr/2XOGSC1BxnBn7Fln3wXIVyKxD9qKNqbS//WBPO0hOnn
         1yNt4T6dggHzTMFhBydGdZ1AFiHAAoeELCGTadLElSIBYMsN/zRh9ChH0NlleXo+rtPx
         xXA40p0d1jV4/SI9088V4ztcUep2FeEUn04NP0I5Fs8bJuVqaa2hReHYibuekpoYkKMq
         raIC3mqcs4JnW8RcIx9vYmreEjZr2ZQPQL69ISs9hgsl7hZwXarcaHAZ2SNo6DRxJHqo
         TBpMuYeniyjpGJYw4nTCHBqlzqVgRIKpRLkGaQZna9JUaWP+zOMIQfyqPJI8Dh520cXN
         AWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113698; x=1792718498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+S8LbbbkE+rdxtgh7jfWvM5EQN41RJP14wQndkrzGJ0=;
        b=0QLBze+UF3mDWB1PVbibr9OnJ6zBUvvxAicMJtYGvy0LS6bL5hi0BPPqS0rUs2JAyK
         hiCLf3vsCmPy5FTXfRHftRNZZ9n5BCxG08ekFFnDlubcu64seRem0UJLnnYxK42yLnjQ
         mk1mdbPrsfSMxDOii2/WiRyOj+5TPKqVUtwbC5N3a1TfV5VYBnG0l2M4ZHe+1FH/5W9M
         SHyPeyGChNayQ01K9SQ2PyXzEqS+6dZjcI512EeBKj8CVkwqoEN64pTwPt3aVNIcEmay
         tvhPKVXKCyKJwjghI8DUE3bx2AuRKEY6ulCqKr3a3t+50airOyucJdZD7sOd7cWWJ0hE
         7BTA==
X-Gm-Message-State: AFq9FYJabU2baer7mTqYFslpXI7kKfWCVvrOJE+SIYDhsVPIK4UM6q5D
	DMsMrFaGu+WGbpsm3Sp//RJazhek6zbPqkUBj5XW7neEPE4xk+/Px7Ha
X-Gm-Gg: AYBFou17fVWmDpR8Rgw4DUKAPvpFJFD3mwW3GsJ5AveNH6dTnZtTygDKpTLvxs9kvbb
	pvBv/qL/24CUaN25F+DCrnkUn32GEXPbxYgAK1XHkpRyDy8X3coD3sAHLysxHeffSXvW+I/DQcv
	KYqriY8rYDB8uqgLeted1GHNCeTPNzOX37rQ1mOXAO8nOZe+/zm7L8HG0VKvbtQ7aJGKPf92xi0
	8KdZl+J6cE68ro/GgwFr1I4flM9ZWn4/Vj7PCfZ7whhzU1wH0DNhIHovDtIEyutXgABkeplmo5b
	PmKinYZFYdvLWBG9uufojJfZ4fQWbNvo0RxkZCOxVV9VrWuTiOuDQyvp7uRtRjUavrfBP5HWZrP
	FzJDSwm+Zz9MlOUqDPs7FC1eShD3/nF3hn3AARUu6PB4y8T2kEB/eD3m3wJ9m5qVwsYyiYjTKau
	HB7L6TCNgEV1iZuQ4k+4v6ZoYjg+x09x6AysJyrmdPijUiThDxhA0L3qx2LhPpSfmiprApmUdOl
	LMcADOiT7knQ8w1ykB+j4uyJgHeuNSN72YBBa0BRP8kfH5SZMc=
X-Received: by 2002:a05:693c:8641:20b0:360:34e4:39d2 with SMTP id 5a478bee46e88-36034e43ca5mr2055483eec.10.1792113698111;
        Thu, 15 Oct 2026 18:21:38 -0700 (PDT)
Received: from samaritan.sole-larch.ts.net ([38.78.160.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm1897927eec.20.2026.10.15.18.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:21:37 -0700 (PDT)
From: iuseacosbtw@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Alexis Buttler <iuseacosbtw@gmail.com>
Subject: [PATCH] rtl8723bs: Remove redundant macro in basic_types.h
Date: Thu, 15 Oct 2026 18:19:44 -0700
Message-ID: <20261016012126.65939-1-iuseacosbtw@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexis Buttler <iuseacosbtw@gmail.com>

LE_BITS_CLEARED_TO_1BYTE_8BIT() is only used by SET_BITS_TO_LE_1BYTE_8BIT(),
and its implementation simply expands to LE_P1BYTE_TO_HOST_1BYTE().
Remove LE_BITS_CLEARED_TO_1BYTE_8BIT() and replace its original invocation with the definition.

Signed-off-by: Alexis Buttler <iuseacosbtw@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index d2436459cff6..e2abbf691e21 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -143,16 +143,11 @@
 		((((u8)__val) & BIT_LEN_MASK_8(__bitlen)) << (__bitoffset)) \
 		))
 
-#define LE_BITS_CLEARED_TO_1BYTE_8BIT(__pStart, __BitOffset, __BitLen) \
-	(\
-		LE_P1BYTE_TO_HOST_1BYTE(__pStart) \
-	)
-
 #define SET_BITS_TO_LE_1BYTE_8BIT(__pStart, __BitOffset, __BitLen, __Value) \
 { \
 	*((u8 *)(__pStart)) = \
 		EF1Byte(\
-			LE_BITS_CLEARED_TO_1BYTE_8BIT(__pStart, __BitOffset, __BitLen) \
+			LE_P1BYTE_TO_HOST_1BYTE(__pStart) \
 			| \
 			((u8)__Value) \
 		); \
-- 
2.53.0

