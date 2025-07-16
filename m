Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589721F91C7
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 03:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637091; cv=none; b=IE+UOWMpUazOBAAquKBGBdgk8/25eDlutFU5Qy8VxE8f86D3J4n9s1PwvM5sS/Os5E+zg+nZk1CAsWdcIJL0JLFFYd3AWPg5ZBX4pGyAZknikC8AHtU1Vpdm+uYussDvm6rqyBD7+e3dx0XFx9PwrOG2ZuX8NMdQ7FPjUm5XswQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637091; c=relaxed/simple;
	bh=9fmm5M55Ppy7CKgsyBOqgK6g0dO78d7D3fbfugO4hzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDumd83ZyZNGySIsU8hzJhFA5D3rnqizvj6wwgKkaqcaNk6ZzOlOd17OcwGrzZPAC+mSSzMCwBwCu1WYxCZs2zieBjCu6nOuj0sNfpoWUd55OvSXAwmuZDqh9eNS98s1avzgfTWHyefnysdywlGNr4tnIi32RJRW2CpmHeqQtbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrCQzJTl; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrCQzJTl"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ffb85aed35so71385fac.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 20:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752637089; x=1753241889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyAgi04IKnPOMF045RBHfSOBtdrD6l8/VwYx4LR0WfY=;
        b=CrCQzJTlFyn0g+sK53HH2suz1Q0ADL25uWbcfJQdYUrolt4rmZNIiiEWdeQcsH3vh8
         t4DRV3JTvbg5udquhrRDK6YZn+4N06wFcroSbXQhbEENwSD9yE2HmW3TS0iK44tcn+3r
         w6boqOOcBMSc5GjlNqXFKqE6sCffsecZRnOeWnJL0OCLb/i7uNCtPj9g+oNI+QGA3kFD
         dDPQUodlLFpTq6VHdYLvoSYOhSv5yUMV+DIDRW/GEl9aMTpbtRMOewtvDMAREJyQjZaB
         MEyMmiruDq+0IIB4ytLVAR9B1eIJfwOR0Q6HagLtq8DNQojzgS/yLWW9lBSgFYcOAxOC
         KoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752637089; x=1753241889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyAgi04IKnPOMF045RBHfSOBtdrD6l8/VwYx4LR0WfY=;
        b=I/UMaeQAnqCUWO6NIgvntZRMNaqhQn110jovhLGX/YDJA+ezYkzIK+KbjV1BOtof65
         DE7t7kf2ekhdGzaz+7aF8sPHznviOFlsmr6M7XZCZfRU1PNct2NDve0qpOf7JFKZGF9j
         /ZlCexvLVxSSlNJv6N3BJPV9fuVVMv8UegDgXa9jggW6S5ClOrp1JdfZRqm25X8ZlcTR
         bnatSwRtAQR/OaaxvYmU0baZC2LNG7+yVQ0tJ56fG4HqPjx2kHscwlM8nFsCihpxmEc4
         W5PFcB8uzEIPHSF8bUGvItLOeaOpqyeQ6gB0Y09ACrZdxMX8Ry/9mbx9Bn6DqrkSp+Wl
         dWAA==
X-Gm-Message-State: AOJu0YxWBc4i7ycbLly8Bo30FywtIdvmq+ifivtRfrLA7warfSxrvDIs
	NL3VY/HhUMKSdLae+kb7acfRjblzoQD/pG+AZ27YlGmqiTjHWBoVQXpF2PYoh2I5JQQ=
X-Gm-Gg: ASbGnct7cY2SJtePcv7tQyJDi99BLOuBvUIhdjPDqXAEYhGsyb3TCZvsXvBGEyTePO8
	0JvwbuZRHHoYdNCpq0SfxU8BnNCtC71Z0xLylAzz6deqrbp62ckLtWZECwDpVCqcyZAl0ghF5j8
	z2Ri2jpsQZt1lg8WgOXf9W6u02N3synoEnqDvZvplJBzRCfkHk9zqAVJBpIlnkJZ9IO4aNjQmJm
	6exPjH+q/hyssGtvQhwG8gGSdJVPAIJ3D3cSElub4iXL2dtFKzNUhQAInoo7V1tt2imiEg82ZGB
	lwOpfBAFcipnl7qFLzEs2eZ+xXlbA6+T86dy/1NIqnnACO/tGiH8kJ0mwU7/8jUdQQNnUhuE1BK
	zjLxdUAMK4BkA3lSQ9x+VzBhAywZxjaBGqYHHCvhofFLlOPTJlU1zL1fDhBwbM3Y=
X-Google-Smtp-Source: AGHT+IGQO3BKn2UcWw7Ik8pzXHP0U4Uv/SaDrxeJaOX3rFQLbMUuLy0SunGeQW2s8mb8i4Oejit9nQ==
X-Received: by 2002:a05:6870:5494:b0:2d5:25b6:ec14 with SMTP id 586e51a60fabf-2ffaf32804bmr1505309fac.15.1752637089255;
        Tue, 15 Jul 2025 20:38:09 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116d22easm3140980fac.33.2025.07.15.20.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 20:38:08 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH v2 1/3] staging: sm750fb: Fix const declaration for g_fbmode array
Date: Tue, 15 Jul 2025 23:38:02 -0400
Message-Id: <20250716033804.59650-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716033804.59650-1-ignacio.pena87@gmail.com>
References: <20250716033804.59650-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The g_fbmode array should be declared as const pointer to const
string as its contents never change.

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca3..d3bce107f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.39.5 (Apple Git-154)

