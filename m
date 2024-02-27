Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8B11586D0
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071935; cv=none; b=k/rENYujMKBntQbTu3ZcVi+yoRxhss0xMJnlRUMD5/y2ByTn9mZv1Y1c7riZ7mil04bZJIFlMKFj+groh7N6Z1eivtkHSoYTHHcBDqPBWIpUHTDZqrnTrMqWhnonCUvKTODhtoej2QrMJM+Np9VJaEAyhoTk12NdPCqn/WGq148=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071935; c=relaxed/simple;
	bh=ZLpd/FTiTFzHnfpWMzTXSPkcqYPvkCAzdFD9LpcTNSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jFmRRH9x4T19TYq5mv2IU0/B4Im5pEQY0SKhLDV8/O7jQmz0v4UkVGQwH2MtWJV/E3To1k5Y3b4KVK9TBfMf762sSF/ZesEcnCl+tbV+HrSDirK3rqtqkhuQNbwb2MvmmrnCLaA+nDAJh5s6ZJzdKJm0GUB/mb8Y129PJE9md/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVbpLMvJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVbpLMvJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4129ed6f514so24406005e9.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071932; x=1709676732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56OYpxv+7Sg0fmYSpVc7Gnw4S4WJ/wpnYoYBTxSpZBc=;
        b=LVbpLMvJ69VaChf2rf3rPbejKZ6BblTgIw63nO+Jjm4LmslW/h8E+SN86U07LzslJB
         DHNkwXTZOVoQV5SsO48PNI2ShdLJdk2sVc9k9EYqPB4gE1UEbeWX8TJX4dGKlhwxtqi2
         M5FNSrZW7MZ2ffC/ygT+eIBNxsgoJLTk/5LqjpcDRD1+xjx0e0P5CLTWc7nQsYRlp5EF
         mlGKkU0YIC03CkTtEcYn9BUMClincLMbiJkPDqMOHvp8RnFhybvSmw4NU3rEejSwEFkI
         FOGrxXA70VR+SYljrY8i04pfiQBYarYMyLIqiWlilavLywnZUfmjZ+veaoSSzNPRzg4f
         sLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071932; x=1709676732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56OYpxv+7Sg0fmYSpVc7Gnw4S4WJ/wpnYoYBTxSpZBc=;
        b=tmITG22s53CATLSIF3pv/nuiA2wPq8L92VE8BcFKvR82IucLKm87CN9XoOI1IkPj/k
         XmgjklKNgp1UDd1L4mUXwKbGvJnarjTnxFMr5svDcdPbqB4H6NqZYzKCcDhvcJTqTUFy
         +Ik4QFi4e5z8e5w3bgsOf3LxSbPM4pl4u5bbbY1Zwj+rrE3wk5b8aZaqtUy6nYMtmHq3
         MNoJ4Lc+NLyywH34ZkncEWjFsleaPSHvYr7h6N6F3zWCq+RCJ7oF4jUqFFI4c7/cKwre
         18yjWDM4j6Iqa4mIZcAhM7sy2jbkp9e1rbI1WvwUrMfJyJ7sRIWoVLbOl6e8T5NUDoEY
         M1ug==
X-Gm-Message-State: AOJu0Yz1tUk9pqq0ltJbh9lqjg+EIs5EgFohJcZXWaCqfpIr/xsGI9JS
	wHsaNG2jf7z2kBA8lxedDKRxRGRtk6WBTkyJJsycgX4cun9SSnxb
X-Google-Smtp-Source: AGHT+IEj8tptFBYZE9yIKo1btwZirTUVTC0IDKeHJmBh0DqpHi/ZZQQD/glicH/eZ/xctGMYD9cGzg==
X-Received: by 2002:a05:600c:4e91:b0:412:a04f:7f5 with SMTP id f17-20020a05600c4e9100b00412a04f07f5mr6186950wmq.16.1709071932249;
        Tue, 27 Feb 2024 14:12:12 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id o8-20020a056000010800b0033d202abf01sm12415560wrx.28.2024.02.27.14.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:12:11 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] staging: pi433: Remove the unused FREQUENCY define
Date: Wed, 28 Feb 2024 00:12:03 +0200
Message-Id: <20240227221204.534131-5-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221204.534131-1-ikobh7@gmail.com>
References: <20240227221204.534131-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FREQUENCY is not being used, delete its comment.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 52e43a909b03..e63e87fd6cce 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -11,8 +11,6 @@
 #include "rf69_enum.h"
 #include "rf69_registers.h"
 
-/* NOTE: Modifying FREQUENCY value impacts CE certification */
-#define FREQUENCY	433920000	/* Hz */
 #define FIFO_SIZE	66		/* bytes */
 #define FIFO_THRESHOLD	15		/* bytes */
 
-- 
2.34.1

