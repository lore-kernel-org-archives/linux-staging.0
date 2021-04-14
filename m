Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701526D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:13 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id u17so32840422ejk.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhAmTYohLIIwvjjuLrxG/y5RSYAwROp3z5v67OAGzeI=;
        b=RZXN6lPKVmVcgtHOpYhI1GFhq7QnuhWtdq06qY9XyxjfT3WfDhpdISSKJRi+FV4eat
         bVXyygPyJt7eZgBQ34C71ltnVfzxsYrUfvOE4PDNfGZ+k782tIagtwWH68+IHdyxjW9j
         X9xTfPymyOdLVrBlTvQ4EdsaBmYvn5Pr5ZRIt47+vK4U0j8om7ygdLMjSBkwddF0YfWl
         crwCLdRyHUhc6o7ng2n6bh32OOGLud0VyNpjcSkxLke5t/2s1GpUNm0UQ2F6t3Uib39T
         jbayZ7LZ9bIy81Mkt5oF8Y6Ql+7Xke6qt4T0MzAKmJAoCF2R11+FrZ3E3G0wXqAr8Eya
         QfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhAmTYohLIIwvjjuLrxG/y5RSYAwROp3z5v67OAGzeI=;
        b=fLfvc+DKYVnyueLyCnNPzhoDqr93qGGUzw+33aqvq6fXkFyezG69WhbYWsFXUwDxci
         LRq97QF6KTXRaxm12rd+v+YSGnUNf+Gp+0nRRge6kWr/wWt8OgUkU4u1hbwRfQCmlrCG
         nWUGI0Q5DE2uHLrG46LeX1kvnkCg0RKwz7YuPcW7SfsByfBuj5+D7cNavveCIrj4jdYX
         587YkJXD+9ktW0brtMXLMGhxGHyIcEbxmYgEW5UKirzjAy7rp4FCsbA2Do6q5R8x3eya
         4saE2bRxpx81l9ELttouSntfzc5/DSt8GIVIU0LhF6EGPq4kjgeadPXQL8ZAXiJ5gKUh
         UuFQ==
X-Gm-Message-State: AOAM5308EM4NrO0v8NPTWIvLR5g+zDn7vcu/6JwfYwgMIoo3KFfw2AYd
	D4F2C7U6vUXUFDCCdkfqCyUzBQ==
X-Google-Smtp-Source: ABdhPJxpeqrUArfM0i/J5bnh2etd5dkZm628UYOpISh+SyvynWas5VnTO5MoNwIJZk9CcWSccs+qnw==
X-Received: by 2002:a17:906:3190:: with SMTP id 16mr129670ejy.355.1618423932007;
        Wed, 14 Apr 2021 11:12:12 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"John B. Wyatt IV" <jbwyatt4@gmail.com>,
	Jacob Feder <jacobsfeder@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 36/57] staging: axis-fifo: axis-fifo: Fix some formatting issues
Date: Wed, 14 Apr 2021 19:11:08 +0100
Message-Id: <20210414181129.1628598-37-lee.jones@linaro.org>
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

 drivers/staging/axis-fifo/axis-fifo.c:356: warning: Function parameter or member 'f' not described in 'axis_fifo_read'
 drivers/staging/axis-fifo/axis-fifo.c:356: warning: Function parameter or member 'buf' not described in 'axis_fifo_read'
 drivers/staging/axis-fifo/axis-fifo.c:356: warning: Function parameter or member 'len' not described in 'axis_fifo_read'
 drivers/staging/axis-fifo/axis-fifo.c:356: warning: Function parameter or member 'off' not described in 'axis_fifo_read'
 drivers/staging/axis-fifo/axis-fifo.c:356: warning: expecting prototype for axis_fifo_write(). Prototype was for axis_fifo_read() instead
 drivers/staging/axis-fifo/axis-fifo.c:478: warning: Function parameter or member 'f' not described in 'axis_fifo_write'
 drivers/staging/axis-fifo/axis-fifo.c:478: warning: Function parameter or member 'buf' not described in 'axis_fifo_write'
 drivers/staging/axis-fifo/axis-fifo.c:478: warning: Function parameter or member 'len' not described in 'axis_fifo_write'
 drivers/staging/axis-fifo/axis-fifo.c:478: warning: Function parameter or member 'off' not described in 'axis_fifo_write'

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "John B. Wyatt IV" <jbwyatt4@gmail.com>
Cc: Jacob Feder <jacobsfeder@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index ed92810897389..8eee17dc77ab9 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -338,10 +338,10 @@ static void reset_ip_core(struct axis_fifo *fifo)
 
 /**
  * axis_fifo_write() - Read a packet from AXIS-FIFO character device.
- * @f Open file.
- * @buf User space buffer to read to.
- * @len User space buffer length.
- * @off Buffer offset.
+ * @f: Open file.
+ * @buf: User space buffer to read to.
+ * @len: User space buffer length.
+ * @off: Buffer offset.
  *
  * As defined by the device's documentation, we need to check the device's
  * occupancy before reading the length register and then the data. All these
@@ -460,10 +460,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 
 /**
  * axis_fifo_write() - Write buffer to AXIS-FIFO character device.
- * @f Open file.
- * @buf User space buffer to write to the device.
- * @len User space buffer length.
- * @off Buffer offset.
+ * @f: Open file.
+ * @buf: User space buffer to write to the device.
+ * @len: User space buffer length.
+ * @off: Buffer offset.
  *
  * As defined by the device's documentation, we need to write to the device's
  * data buffer then to the device's packet length register atomically. Also,
-- 
2.27.0

