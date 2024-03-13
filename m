Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC96A320
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353271; cv=none; b=ffc/b8pdO7GZkON0SSygTuCTGbyjL4rtxEPTcmCjycsipihNv+BdJurpENQxcZ+GdVS5nCB8JGthi/FI4NcH9Nuoq4lTi9D8MVxcpGXu1aoDOl9jNBXc2XN0ZG9zePmbjbWFmKPiHYOGK12gqgMeAJjnhlCYAsNDilFK6h7ievg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353271; c=relaxed/simple;
	bh=Uuplj9eaDOr9flWRmzj0THPm4GMMx7dTi3+SYBcmALw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipVEdO/fKkv0BX8qvoSwpI9llJYzHXzZe5EavzUVXcR8JhJFaxMvJhEkgL/ScoDz0661/5tR8XqD38NMBVlEE02s6tB5AWKn0NVYEM1hM0OceSBwh1GqDlih4h3jdDhhgSC/9CHRmb/zdTShCFPa0MDESSixQHSHaIgQqqWWanU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZN9AHxUZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZN9AHxUZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a466a1f9ea0so16873566b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710353268; x=1710958068; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMXTFuaRy2/DahWa3k1XzhwntrhYB+tFZxVYLm3/Iu0=;
        b=ZN9AHxUZxJX4UcIx/iYjZLX09XeB1mgSuZhOgMNxk+C2Idi4ryD/qb7fYwWzS+L9Vz
         cBlvUrY+rllNB6ZUO7RjXJqu2VEJwALjWrRPUzVtvWDgbBu182DtDlOcjM+77VNmoVl2
         khhyx62JfYyHl/Qft8+pjBI0psdQDPpYTrqvkwvdo/FyZYlpdjQRgte77+hAoQh269iA
         R+eNj5nqjNO/DRtQFK8raSYan3uZTrRcB/eggpfE1vNx2ACEKYvBxyu4SCq9MJ+Qf2vQ
         Ys4DRLqE4xvtn8bCVha8U41HQBfamslJXUCHLyWFX6RGu2doYbOOjjMNMSEJ4E624upr
         6xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710353268; x=1710958068;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMXTFuaRy2/DahWa3k1XzhwntrhYB+tFZxVYLm3/Iu0=;
        b=kdhrHVw2pbTJdwe1GI+VS1pQigZrcEu+K05aqabzwoV37EwKGT5bLdNU543L9ZjiqQ
         1pFJOnc6LmQGAA4jLmFUhPWrkV9VLV1UW8kLgq/K/zcpbqWVa+lS4cbgVZKDHAIvJjMb
         IsiVGuA7N1Hn0pcFZzZh527vekGtHbKIG1Oa/7OHZBHhU+KY8QTBAbWstsqdlFhikX/b
         zqHWBlotj7QRPLFAR7O0ye0zYSVfYT/vVO/o+Hytv3Sv1DKNGGY03jcog0WbW3BjYc4I
         YnpZetN7CkLZIbhdIhecx/nhFYk467FsGXFMLPN4RamVr7Kiz1Bk+FBNHQ025OAYwO/3
         KhNA==
X-Forwarded-Encrypted: i=1; AJvYcCViDMqmhb+m5OYIPl17pLnmmsm32cQwnWpRcDMVLJ2OzmHchLKh8XCiy7qf2RGWHf7No4/Wk2WCohVSEoklF+Rt8ekg2fwg1CmRrlTC+A==
X-Gm-Message-State: AOJu0YznHRuXfPxoqiYBSst18YCqjHFuP6/5ZwaMtGjjUk+xGuZ0i9Z9
	urhabnJDIHdk6u2DCfMpDdVVsGvDYohWcmV/kSp+/TJsIQ+WNZqLFjJP9gIkGY4=
X-Google-Smtp-Source: AGHT+IEiATRc7GICOzHn/pmaYtsR17HXLdNvPrWgb7fWYxoAe+7+fLoFXGr/dxWbtiPy38J6/6/nCQ==
X-Received: by 2002:a17:907:9918:b0:a45:d040:2a2f with SMTP id ka24-20020a170907991800b00a45d0402a2fmr7695229ejc.29.1710353267621;
        Wed, 13 Mar 2024 11:07:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h27-20020a170906399b00b00a3ce60b003asm5124787eje.176.2024.03.13.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:07:47 -0700 (PDT)
Date: Wed, 13 Mar 2024 21:07:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vc04_services: fix information leak in
 create_component()
Message-ID: <2d972847-9ebd-481b-b6f9-af390f5aabd3@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The m.u.component_create.pid field is for debugging and in the mainline
kernel it's not used anything.  However, it still needs to be set to
something to prevent disclosing uninitialized stack data.  Set it to
zero.

Fixes: 7b3ad5abf027 ("staging: Import the BCM2835 MMAL-based V4L2 camera driver.")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 6ca5797aeae5..4c3684dd902e 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -939,6 +939,7 @@ static int create_component(struct vchiq_mmal_instance *instance,
 	m.u.component_create.client_component = component->client_component;
 	strscpy_pad(m.u.component_create.name, name,
 		    sizeof(m.u.component_create.name));
+	m.u.component_create.pid = 0;
 
 	ret = send_synchronous_mmal_msg(instance, &m,
 					sizeof(m.u.component_create),
-- 
2.43.0

