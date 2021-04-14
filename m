Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CD76D37
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id h10so24795680edt.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a5roCrWCSkmt1RP3Taphq9R1YmlOTY/ma9pHzyYzjyA=;
        b=MoUMuWuFAAarvGL1AUHSNosCqD4tw/Pqic0xuy7Q+2iF23t1JCt3Vyp2LV2En4tT/s
         ZLhySDKnh00w5s9Hofv8uGG4YSUrCQJfEIY/6JjRJWi5uxTcBPKcn/1qzGOnWYUy5aBD
         GYcuxIxHDSxh6L7X2IHS2s6uvfHGZaYW5JvB1+16BkP0unMj8rJONU+mj8T5OXWirqzb
         p+JZLMSSa4tBhjuFmYOKCk4KpPrUdtBH+0R/nzJPvk1SWqGko6Q+DkYB75Hu4Yu9dADU
         oRR/zmrG+1FNpReIHC/lVLPLUn5pq6eyaK8EXs2V4WhulXfnwyHkMojT1oBmIr/xW/yD
         EIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5roCrWCSkmt1RP3Taphq9R1YmlOTY/ma9pHzyYzjyA=;
        b=R9HKcDQ/S/EmI4MlqxiklYhQ41cYjIPakzsEsbMIpLnyQhWgLJL5tsh+6haQLVyk7m
         9yAcjyOjT7rVdhePlMr6D2nwGln9UCLKDojDYwakfK61Z/28vPnGwfgJbguSLxzugNFN
         H0VcziJeOijNRPJ2ZKrJxiZkf/OA3vKgPJX9iU1xdSmdfNJQA6TFuUj1XUarTKkHAn7Y
         xuUGv1OmjpR+HqmxMwnyyF9jfyBdI2DWiZMq7GOpoD4trfJHN6PFF3qp2ahkpG7DB6ES
         hbtnBJdcqanjCJaujdcumvdCIW+WcwzE20n3HMXkeHxvvqiZq9zqC3Ap6bNDO0Hw/sIk
         MHHg==
X-Gm-Message-State: AOAM532uPIUAkKTDlMGX1GGIsYWNXxIKaRfZdsw5RzP3Dv3IGRASjwgw
	o/d+KC8iwRx0qk+kP+0xo1gJ0Q==
X-Google-Smtp-Source: ABdhPJyR0mBukYZlK9GIkfQp2+J2Vxx6FhpKATTYgN0Ed8PS2LyMu0qvOBL7RPLb8lf9BQSs5wEseg==
X-Received: by 2002:aa7:ccd0:: with SMTP id y16mr171436edt.101.1618423920890;
        Wed, 14 Apr 2021 11:12:00 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 25/57] staging: sm750fb: sm750_accel: Provide description for 'accel' and fix function naming
Date: Wed, 14 Apr 2021 19:10:57 +0100
Message-Id: <20210414181129.1628598-26-lee.jones@linaro.org>
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

 drivers/staging/sm750fb/sm750_accel.c:155: warning: Function parameter or member 'accel' not described in 'sm750_hw_copyarea'
 drivers/staging/sm750fb/sm750_accel.c:155: warning: expecting prototype for sm750_hm_copyarea(). Prototype was for sm750_hw_copyarea() instead
 drivers/staging/sm750fb/sm750_accel.c:321: warning: Function parameter or member 'accel' not described in 'sm750_hw_imageblit'

Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/sm750fb/sm750_accel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 8faa601c700b2..24b9077a634a6 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -131,7 +131,8 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 }
 
 /**
- * sm750_hm_copyarea
+ * sm750_hw_copyarea
+ * @accel: Acceleration device data
  * @sBase: Address of source: offset in frame buffer
  * @sPitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
@@ -298,6 +299,7 @@ static unsigned int deGetTransparency(struct lynx_accel *accel)
 
 /**
  * sm750_hw_imageblit
+ * @accel: Acceleration device data
  * @pSrcbuf: pointer to start of source buffer in system memory
  * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
  *	      and -ive mean button up
-- 
2.27.0

