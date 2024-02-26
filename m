Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C1B1CFAD
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919964; cv=none; b=EjGhHQxc89yan9Xa+nNyPp2w95kOoUfkBP6ocxDpzTYQpN6luzxILGILMetbM47ABA8G5szC2h3dJ9LbA/SDasfdjiM37Z0SnZ2ws8g74jlXhRMKB4bSWzmnsp3fANvXlyEWHsjmQMpu6blAgB9zPxRWGBf5TUKV6ULPLZ2EUVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919964; c=relaxed/simple;
	bh=CUzAmkzeuNS+ardZO0IXvXaDVeR+7cwztnx1t8/HX94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBsngiqAo0Ot7XVUC/kSKIVYkAIZdV/kUk5XPJkCJAIHfhvEiOxuETIG8pQNDcttZ0ux0O7/VC7KXg/Yj/5pgBZ7Imwxl6pLDI3oFqqvbc502cBNZDbJA0Ha6oU5u4mLbfOeDtDY0Oq6suy0ratuVQbBjLJvtg6Qw1GfkjjkpRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Yqcdgq3z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Yqcdgq3z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e46db0cf82so1649193b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919962; x=1709524762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drEptZxnwbPEaWM9Gew1sqUiaGk3zefYJ8jVoMExPx0=;
        b=Yqcdgq3z8mDT+5Ler4OwPK9yiYUvNS74IDAtq0ZvcobSvhlX0CxSg0l2ICRqrYPPUg
         l/GDeiVjlVvO6+BY84mmuf6mlp7fkdqY7uSHnYOrxbnPCYxeKa7QhPv2JfIkv4Hdzky6
         Z8fflRzZA1T7etrkGngEqk6V+evI8H+f+XRlAcf1Qv/F/tYJ0NXMn8XGqDUhGnYfS/SY
         cXI8pLzObZh0iieXHpbK5LfA7+gXbMo1G14QXG3YHvre6pkFSCYjMEMW36kwmq8jOMib
         IdLM+qKZo1OKYq175cR1+HlfTpoeIMsCOV5IfGhc+fPjt4X6ou/S35H0htqcdrdB/sQA
         bHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919962; x=1709524762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drEptZxnwbPEaWM9Gew1sqUiaGk3zefYJ8jVoMExPx0=;
        b=ulL7FyvoQaTtX+kLcI+4fp7VHKmu1FVsnHZSPOd9C6/MQa0CMsnFlAy4lma8J8Z+Jd
         G1ueXgQRRJxqJAL6GsJByopRH0Q72aAAAwQOXVvSqJc4SXthIYEHC673XTaNii4pjnm3
         D6oWAb0RNmmAgQWGzer/zK3XCpgnALzZ9M+VrE4WJ3Afdjx0mwcDWL/C9uiXGCHHeO01
         Yd7i4LiutvSJfNGd1z7yTdIj4gWDuBP19MANnVz/nfYRrOQogrowdZUfjyjKhJUAxF6P
         ZjudJLVtZXuqWDDQIvrQicF5KM4xdiOtm7vKE9566I8jFH+ldimQBXRLpUJCx+LbYB8k
         aRRQ==
X-Gm-Message-State: AOJu0Yx9WeYYex8XaqFpuGYUwdr4aCwpDbajIypv+VqIgZYWlPZLCWUS
	jKrWCZgYMItROB+M+9VFKmM+1v31oq1wdiw5W/T67yXOkNTXsYCbN8qhrKuEm7Q=
X-Google-Smtp-Source: AGHT+IEFhqsmKVfTDyyxbzbGk44AfA5zmxXnUw1DK6TLDxr7yPgj1jVL6ty5kAY7muc/w9Fh1dYxrA==
X-Received: by 2002:a05:6a21:1644:b0:1a1:3b8:8283 with SMTP id no4-20020a056a21164400b001a103b88283mr101250pzb.47.1708919962711;
        Sun, 25 Feb 2024 19:59:22 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:21 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/8] Staging: rtl8192e: Rename function rtllib_send_ADDBAReq()
Date: Sun, 25 Feb 2024 19:59:10 -0800
Message-Id: <20240226035915.370478-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_send_ADDBAReq to rtllib_send_add_ba_req
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 030e0a87c931..1aa57f654b82 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -173,8 +173,8 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	return skb;
 }
 
-static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *ba)
+static void rtllib_send_add_ba_req(struct rtllib_device *ieee, u8 *dst,
+				   struct ba_record *ba)
 {
 	struct sk_buff *skb;
 
@@ -481,7 +481,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 
 	activate_ba_entry(ba, BA_SETUP_TIMEOUT);
 
-	rtllib_send_ADDBAReq(ieee, ts->ts_common_info.addr, ba);
+	rtllib_send_add_ba_req(ieee, ts->ts_common_info.addr, ba);
 }
 
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
-- 
2.39.2

