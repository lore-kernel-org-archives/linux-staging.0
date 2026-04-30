Received: from mail-yx1-f67.google.com (mail-yx1-f67.google.com [74.125.224.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B93636215A
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570288; cv=none; b=KaRq8Aa9ETJq9XGiT5/32LLgUphYCTGR5OGWqwc/nUsE+3/PdXp2vc9b2oTGeC0f2QWeN4Hs/sZDHDcOl56SJPuXyg18IalaKwEFb7WCKBct9nvJvtyNd8OxzFujfh+/DiZF/OlML5WIbgHyQFhQQ1jX+pNbrmjnamigIUnzDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570288; c=relaxed/simple;
	bh=kT8WjgFzbTexEXPtbHhIR2nfSRA1FicUqaOCOvqjDds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2r0djKiWJ0120uaJ8aN36P3e3g4qsz1YQaIE0ce/a2TLnpxmeIGVvCBzrZl+jfvDzx210RF4OK7B8Chpo5GtbXfZQ2UfWjIg1+N+T6PNOwcWFujnL/nDD5B8vecR+BWUYtjVvDkA84msb4QbtGrVvmNB/x+3n1nGIUb2yVcGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EufUw/dg; arc=none smtp.client-ip=74.125.224.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EufUw/dg"
Received: by mail-yx1-f67.google.com with SMTP id 956f58d0204a3-64e87a81639so1143213d50.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 10:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777570286; x=1778175086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/+4Wu+sU1O8P+03F6I8GHbXafqNDqKJAi0ynLG9Wx4=;
        b=EufUw/dgKjNRTUpn22TlNYYO5MTD5IfvAZiMYJ9LWkgWwOI9pYv99sqJK8K/x7QMZ7
         /490qwRGWr1bMW8hRSvZyc0MHWNqU3YfMgF87AdO9uw5chMRu878gbO/zZlpGlb1ZK9g
         9EIb4d5BQ4CxUE7aG5y7p9FAgCLMSOdF3BAoo5oqJUdgJjk58n3D69T0X0apHam0Vddo
         fHyv9O+1WPiA3rlH2ZRHofJPh/tgjU5h25UVhjbedZZ/Ym98y28otStcUW/LxEkzuhpe
         EOoxEx8HrN8TFav6uEOjR716jn8NCr37GUMzW2Mbg9yCF+eHZvbgtXB6j/zcm/nKmXJR
         ldYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570286; x=1778175086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/+4Wu+sU1O8P+03F6I8GHbXafqNDqKJAi0ynLG9Wx4=;
        b=OB8vo6h5DZYo1ZzU+f1QBg6d1tTS8NMmY00+HVg/x4CSVgXNKx6zq6/wPv9t6dKLhK
         D6AXB07QBjsYaBCEhxdixQ9VvVpjCw89cxw/amGFsMH9gIuXPU2oJwm0QXCX80Ebfnk2
         cgfhP1VSR9LPOmWmeGs0SMuDs9zflHD8vT0vDDBJHPtlGfUyIF/Kt8NBH6war0WtgG8E
         F1T965r5H+INVcDY4qfOhrufuNYnOJFm0lsW8qhk7Sv0tvNEh91IxR9bStWmVsyxBfQ0
         65ELdfh1jFLOA1mdk5s1tD56Ir2Zilk48XCszsuKSlYggz0zXAWBIppbaB5elLGbnH+G
         Vtgg==
X-Forwarded-Encrypted: i=1; AFNElJ+wp+X71uY3CUJYRy+VF8zrL2v6zp4Hq1oQm9Ze7Gemxk9+J5qgFW8DtdiD2kdfLdcKNWJTGy2YI/7x8is0@lists.linux.dev
X-Gm-Message-State: AOJu0YzsYJFVgZP/i6YN4KxS3dzuY2fZtB0EyPZs6QF09gDoy1rtFxBb
	KCv0o4XLanBzrW529niNLGLz8m54FNU1Me9Yy9/sDLvjDCcrtNq7Cqjz
X-Gm-Gg: AeBDieuo/Mgl4U/CYB6hoJsKMi/fw4+pgDapEhQnNIZS0VbG+vL/FRWqs+JuIQWnD21
	NNWrRrXtdy1JFkG12xuGgZt1jwr0n4FvbA18hQPfLYJCYad/iRgMS/n3lKIIvomgDDcQm0Wr5Wx
	73/twcyQ3RaVXjfkgtJ9RC3WEuCQWSU0ToxuNYUU5qDTfoClNipYUOUN2A24kKIecBibubNCn7s
	kDZ+z8JzHRG4Xm8Z+FndYDwP0Risp+yogsxin81BXjypd2aZXTwKXCHfettQsTCQhRcncsAz6I0
	n2ZfVTW4UYSFHV5UQ+4iGd/UwfLGLXpPxoxuoNJI4WVbdZ2AHiIWWhrcfHRi3fQBeNR8tRFabpE
	on8+1HZONeoTwqzc/L5rcIGioJZWMx8KEWWjpI4TyPEbTnXZTef5aCOIhj9MQcjXfvge/MsNR7r
	bE164X0R9nENYojWScE91bIlMlYKa9j6NjBP0/EUKTaCWRWO30pRALP++8JzbC6j2PI5mRij9LI
	w==
X-Received: by 2002:a05:690c:67c8:b0:79e:9cc1:ede3 with SMTP id 00721157ae682-7bd52825839mr41518467b3.2.1777570286417;
        Thu, 30 Apr 2026 10:31:26 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66888cc7sm68137b3.44.2026.04.30.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:31:25 -0700 (PDT)
From: Bentley Blacketer <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bentley Blacketer <sonionwhat@gmail.com>
Subject: [PATCH v3] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
Date: Thu, 30 Apr 2026 13:30:45 -0400
Message-ID: <20260430173045.4619-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
Signed-off-by: Bentley Blacketer <sonionwhat@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..058044ba7 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -163,18 +163,13 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 	 *
 	 * XXX Name it properly..
 	 */
-	snprintf(firmware_name, sizeof(firmware_name),
+snprintf(firmware_name, sizeof(firmware_name),
 		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_s2l.tftf",
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
-
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
 	if (rc) {
-- 
2.54.0

