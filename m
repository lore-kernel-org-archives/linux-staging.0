Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7D40DB46
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769421; cv=none; b=N1qRqEM3UAAriAy763/WTj4FZfAgxM2ki6wIop19c52aOzDW7cV3mLeWNHh3ZTOqVGzCDii5ewS6d4c3Suf9Sz5HuQT1kMC3eHrst0ApmHr90/YE2XcEw/nJIHZtHxmR3fnzfGD2SXQmFkqwVQaRKXxCG5CSijRcBLBMdResz7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769421; c=relaxed/simple;
	bh=UkL6Ifc7x0i8Rq2qR3qjbDE7NqW+lN+tczSVWLgjzXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFe+ubYKZ5tEPQtuGUQyTMPLZLqoUnv33ACa1ltO1kcgA/E0A5c6Miv8y1C77Kb5+8A4iY1DPlD58lu5OhisduYQ+Tdyqy1+O84KIxwWYhXX91+O/DLQ0SZ4NDnyffsXP22NApFixfk5K2WrQGcaEdy1aEWjNtREfLxd89YRdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioaHaBMq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioaHaBMq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso36888545ad.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785769420; x=1786374220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EX3T3Ggd1sc1uw/8kcP/ExPM9XE7OXdbjAhKGjdSys=;
        b=ioaHaBMqr3kHFus3EQuHmomf9AGUTWrWbNATpYx1YQLR6Ey4XjDDe2C5FOGEGK4MGn
         BeUBDqrC5u4OBQSWxY8oVVkBsZNTBbShKHhVi7kkvB+jWIpP8MsZn6neKIErbnNlnBU/
         z+7P0QaW84z/vxiDftJ6cBVHRrViiBpGZr3uXb084+R1ajtrEu8oGduYbpvLyQBRM/JM
         k3uTOuX6Y7/Xsge1yt//Xz4lSVyrSxAsYJZFXAmwjySr/Yyqm38yNrXY6W6pwfMFAt0x
         0rq2X2qqmTBG7bTpVrNtRRUAZJw6BdPA6k6LewVExV8XKlKWgfLaiLg50agn9mALQuqs
         wjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785769420; x=1786374220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EX3T3Ggd1sc1uw/8kcP/ExPM9XE7OXdbjAhKGjdSys=;
        b=PuRgCHGbZsAA0x7naYYJRA5qKBWXTPJZdn8bqNP2nxzN1bzbOuQsquqYy9dF+TVCHF
         EeJKNBOhXxI0PyREhiR6E8s4s+Fz+bePYjvQZdwqQcnsKImhEqS9GWxGg4dw3x5xuApL
         guVDK4r6cdwZzkOA8T8Zt3Izc9+LFdDKp5a7ii+IbprFkRWTeef2ZCwAsbFqDx3ZbGE7
         M2XpNgh1ZwJaHjAHmVu2a2c6Urw/CjGQFu+jcxir85V9QpcSSMi1CH5JZ6gumm/i6X4z
         RFGSp7WC9NYUzIV052KFNTswmu80QB8/sPXdCzWGAwD3yxA/1iYc5Hd2I2IZsneAC7YW
         o2WA==
X-Forwarded-Encrypted: i=1; AHgh+RpBu9GZUZ0KzKUZiHDkfhZYglQ3XnZw0Na14o5nLiBw4WEKnvlVpPzScahm1DDs8eVnAsZR1+t1bhK0bQ08@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7yZHgZcNSI6bsXeHr6TaZ0SO5lNQSean6rO3ffZQvqSdDL/vK
	YnBG1LXhYWoYfNaR0WUtgR20Czfqom/x83RsUdX6w7kMa2eMDM9MCa/u
X-Gm-Gg: AR+sD11mbM2CSM7QGoY8OOI4lbL8HU4D3NeqTAEuC02sgpBmjnFo924b1eVc4IasoH0
	1LMJsIr+2hsT5rtg3gaXAmGyMwlUP3GDc1MCZnUqmFvBkTTy2tNCgWNBP4oh+jw4D7tNGvYTz+N
	U2e3cIfdviw1F2EBqU1jFpYucekZo5WotB58rZrBuxWPaBU63LAiJO9K/EzA2EswX9nl+O98WIi
	p57WssT93exawWcwpwv0kApLVyBxx9LrfxumJm1uni+W2YfENYmFHtLaT5fO/infJ2ItgFBXM6q
	CkLswqIUKYA2QFy789U1xexIDvKNWrxB5Bc+j2Nh1VXi4Mx5fjFRz9Hr4if/Czrr7eurQe836Lk
	OtcCLR7rDQS7vYbgOmEQfM0QVaRkA5OmSyZjXkseKQ+XToNXCb4KkurKzlsDAU1dy8/1NRNY2of
	Y4AthMynHEC3KMckSQW6EO1kmQnrUi24woHhtqMgJRMFDizsS4xB4gYMxZ6DFgo50+SUxTNoAQa
	AFCDaEzG7kvfaM71yQUMJgHMQ9UzBq15+kBKt5yQ+A+c3bXH+r3u4YdEr9n5hj0IR0=
X-Received: by 2002:a05:6a21:610c:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3c92a749de4mr10683890637.22.1785769419681;
        Mon, 03 Aug 2026 08:03:39 -0700 (PDT)
Received: from MominYounus ([2409:40f2:2160:25df:e8f5:8b52:4a57:c0f5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm51855863eec.16.2026.08.03.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:03:39 -0700 (PDT)
From: Mohammed Momin <linuxmomin0@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mohammed Momin <linuxmomin0@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces
Date: Mon,  3 Aug 2026 20:33:29 +0530
Message-ID: <20260803150329.24065-1-linuxmomin0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around a single-statement 'if' block
in HalPhyRf.c. This resolves the following checkpatch warning:
"WARNING: braces {} are not necessary for single statement blocks"

Signed-off-by: Mohammed Momin <linuxmomin0@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index bf44c1050be5..449db21e8a0b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -117,9 +117,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	}
 
 	/* Calculate Average ThermalValue after average enough times */
-	if (ThermalValue_AVG_count) {
+	if (ThermalValue_AVG_count)
 		ThermalValue = (u8)(ThermalValue_AVG / ThermalValue_AVG_count);
-	}
 
 	/* 4 5. Calculate delta, delta_LCK */
 	/* delta" here is used to determine whether thermal value changes or not. */
-- 
2.55.0

