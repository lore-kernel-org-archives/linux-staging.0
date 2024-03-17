Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C97F1CF8B;
	Sun, 17 Mar 2024 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710698783; cv=none; b=cNVilioS9shYhH70xMzd1pZOCilg0gl+IWUoasE6kzGAt6UCsYuEc1A6UEvC4E28n4X6ErOVVQ2HQoEGrpivtldjMMtfgB47SkUTBPv2UqCcnMQDtSK+JhKRXoYk0A7pyA9qmwQGo3Dx3IUT3l+HqYYbMWeXVMJqel0EA6qSgCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710698783; c=relaxed/simple;
	bh=xMwMkKngWMgejOhxDouCnhEyArbQUSNsTw3WxpvWneY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWtQ5F8qTkL5zNA8nYU5KDX5iMOCzOatqd/8vOx1KXAgAk+Lcyb3yPVd2Y91VVo7jDJfTjJN22+cdEn/7X5UCF4ZhUZwfjt9uf9T1M11kVCMwvR519hVnH28hzXTm7l4XBIKGvPxwGjZhgXO07aFAcyLkJ0xHnfEvBF8razplts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXRzAOD9; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXRzAOD9"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3667770b8e8so21405695ab.0;
        Sun, 17 Mar 2024 11:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710698781; x=1711303581; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccHkhmsb5PGqPme4pfAQtFz0/1A/f06u4lt3vBFDYpM=;
        b=aXRzAOD9Qv58u0EO+Sg6Lt+80S2/A6C19+WsLSl3ZtzvelLLLaIWpxfYE3UGXTip1u
         swyOL6N71+TdDfTnHm5uNoH3Gnzn6C9AeqSTwg8ADWnY9p5ISWh+uKAFeQonD1srls+N
         W4Iwub926vxlohFcIDqss2pkXkgh1x8nOxrCQ8WNJxSS/QPR23SQoFsgshSoh9xA47Ap
         gb0sRL7GPWojES6HT50oLR02lNw6pYgDS0TveKze2BTL6ZUZf23J0s1GerY/mL96ZU0G
         YAqyuIb+AYAzi55vw5zFFo1oFcsCOdg2KvPqeh93b4SaOs2Bl/11AAr5kX9vgWw54p87
         b1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710698781; x=1711303581;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccHkhmsb5PGqPme4pfAQtFz0/1A/f06u4lt3vBFDYpM=;
        b=twlKcZ6NrqleZHH76CDkp+ekESbkIuc8vkBMyxmZHVjcP22vthr5FhILoRR1xRW+7K
         cKc3zdKy1fIOQoul8H7hC89SOvfHthQzFGZFu5Oc4pILXVUBja1ly5tY0+GVmZhUOkIw
         Hy41Y/ukQYT1oM9iR58PiDqzbOuCNBSBd5gFB/DH/nBHuIxKvI6OkhdMpeIarT/Cen07
         R6+gyyoUGd79LZ0XgDYrugRJWSqbGJ8ph3dUSHa3s0sBJl1wcoli4t/5RYTsty6fFKg7
         cputB8rw0VTNG9h3irNnXfoZlO/CPb/anRFyYxQ7O428A+P26fdWJt/CtFEt/Tq0vAG4
         wAmw==
X-Forwarded-Encrypted: i=1; AJvYcCWBrpc2scO7gim5vkDlBI679Nwiw/yxI0l0BPevYaMPS2FglAYQjoOnJVrHEaBvSiKVki1Gj3g4I+UAVJ7wWsSiL1tjO+UdHXhWDjzJcA==
X-Gm-Message-State: AOJu0YxcUPAjZjbbOcHAT9YqpMmCyJ+3xQJle7MuMRaUeaJXX5PT85Mp
	fvIU6XBBFt/Cr9ukmT1oo4gB92qSZD3m3VKBHClsUQU6p25c8Xc/5dgV3JsdX8ghfw==
X-Google-Smtp-Source: AGHT+IGXY3eki+RRJPtGy2lHfjQHnvEEuiKjlEJf18Bs05orQk+GSE/fK8qybJ75CZKh7aCsuOHQQw==
X-Received: by 2002:a92:c70b:0:b0:366:3766:6c4b with SMTP id a11-20020a92c70b000000b0036637666c4bmr8740240ilp.16.1710698781203;
        Sun, 17 Mar 2024 11:06:21 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id k188-20020a636fc5000000b005e438fe702dsm5624183pgc.65.2024.03.17.11.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 11:06:20 -0700 (PDT)
Date: Sun, 17 Mar 2024 23:36:17 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: aggregate conditional statements
Message-ID: <ZfcxGebTKxVUJONY@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Aggregate the two conditional statements into one conditional
statement to reduce code length and simplify the code structure.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/ieee80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/ieee80211.c b/drivers/staging/rtl8712/ieee80211.c
index 7d8f1a29d18a..3b7a72bb6fc7 100644
--- a/drivers/staging/rtl8712/ieee80211.c
+++ b/drivers/staging/rtl8712/ieee80211.c
@@ -147,9 +147,7 @@ static uint r8712_get_rateset_len(u8 *rateset)
 	uint i = 0;
 
 	while (1) {
-		if ((rateset[i]) == 0)
-			break;
-		if (i > 12)
+		if ((rateset[i] == 0) || (i > 12))
 			break;
 		i++;
 	}
-- 
2.40.1

