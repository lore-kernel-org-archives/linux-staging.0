Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAA26D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:29 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id h10so24797332edt.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s8OST0xufbhkOg8bq/II3lYCmlLBTeSK+I0VSNE/vKQ=;
        b=fwSJ0qBGY4EpGSC6jbiXacV7NqfWFtL6GbVHhRgHLfD8LB9cfd/gbzae843uScn3h8
         642chEhytynS56Bb6W2cL6plzq6j0L+7DI5uRH/hijeGBQV1GT2wbzLnT5I1P1syV5Xx
         Kl8QiB+RkZ33Vyz1B3QXjfQOhuio5mTz65NqiLIZHckNRXas30NalIQ544p74bW+CBMb
         HR/PvKzANwxuvhJQVUVMjNSgFy05f9SDob6D228otS5KfHQJAdS4VgIM28QU90DnenTl
         pnqtI6mg9srpE8JKmCJoE85r3azWQ1QbNhv20KT3hfAu1OjK/NPm/M5bP7NhaQYPf93I
         S3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s8OST0xufbhkOg8bq/II3lYCmlLBTeSK+I0VSNE/vKQ=;
        b=FPkmxC0Ts6RFSlCCnxHY7EBpnZMzOSht6hWO46wqrZKJ657pMlYAwwklcbmYfEovv6
         2la2wPIOyBZr0Cfy2G6xxVRG6uRpMVAuDR8apYxIx6jshj0M//IodayrLxIor7MMfvCU
         tygJL6jxiDqIgesHTuvRo69Nu28lg0nCtlkpAmPYRQNwJ9ziG23X84e64AuhErGb3oOu
         i9E/9fROJR0oA7cjRMJBSqbkVtRm2c1yYy60wkpXn6dbgk11x4ICltxJ5S50Ml3/JRp6
         Rxk4dapMvJgZffZt6NPvhWGynRHx6A310xswSdYKM/BXpHOMGLfe/h39fwuVS3JJXX1H
         AwJw==
X-Gm-Message-State: AOAM533XobrzN39dwXpZJJNZi++nBX54HKa7kNqlUlV+vK3RSm7vxwkO
	8q7UJdCovLSs5zD2KcOj3iwkSw==
X-Google-Smtp-Source: ABdhPJyGoJlrw9typPW7k6oNawhZAjHzYNp6uC7k4FbauiHDJw64BxkBg5ZLZnWJrtoxpYw/AHkYKQ==
X-Received: by 2002:aa7:df95:: with SMTP id b21mr182229edy.338.1618423948264;
        Wed, 14 Apr 2021 11:12:28 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:27 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jacob Feder <jacobsfeder@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 51/57] staging: axis-fifo: axis-fifo: Fix function naming in the documentation
Date: Wed, 14 Apr 2021 19:11:23 +0100
Message-Id: <20210414181129.1628598-52-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/axis-fifo/axis-fifo.c:356: warning: expecting prototype for axis_fifo_write(). Prototype was for axis_fifo_read() instead

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jacob Feder <jacobsfeder@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 8eee17dc77ab9..b23eabb863d17 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -337,7 +337,7 @@ static void reset_ip_core(struct axis_fifo *fifo)
 }
 
 /**
- * axis_fifo_write() - Read a packet from AXIS-FIFO character device.
+ * axis_fifo_read() - Read a packet from AXIS-FIFO character device.
  * @f: Open file.
  * @buf: User space buffer to read to.
  * @len: User space buffer length.
-- 
2.27.0

