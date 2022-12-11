Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7A3186F;
	Sun, 11 Dec 2022 10:56:53 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w15so9260930wrl.9;
        Sun, 11 Dec 2022 02:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAvGt3vLdbPiY+2Of1sNsoY/Xfkar684+8jXtNIqH/o=;
        b=olfa3spiHiwdBT4E0YPycmSCjFe+kp3ZbHrQPbsQmCqGxibWDc8qV4Cz+GMaAg5VrV
         BzxYFgRm30SHRXMekG2Y+n/dNSrDUBP3mmi80lzChaXL99dUyYlG/cuQEhzo8zyZjtMR
         qxWv49uCs4ip8zaJUbclokn8H9YjUAaQ9rC+soeBppNF2TwXGZ3i2lCc9InDHa3G3w3Z
         +QP5le2wL94RYD5WQEKe80IIFZQHJbBgN4uvZEZ6iQrgGivWQSjPWAK/b9DYR+3AoTk2
         onOFyAIFAudQBNZkkNMJa8pEJY4HcUQIFhm2X7CzIpd/88ifNl2FPeGeJQkpVGo+kr7X
         AuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAvGt3vLdbPiY+2Of1sNsoY/Xfkar684+8jXtNIqH/o=;
        b=UyaMCew2tySFzdDkaFLie7RF6hLFNRQJyiBTaui//PIVdW+al1TckYzOfewnNu6JAC
         v+vuqj/FvaDI/EV+ntr6QMFkzUzcQ504b8uduvWpRbJDQdnZ7Bm8LFwSMl0OXQhWBJkz
         yURozD3XxKdLbK4zzWR1bgZNRrqCP7juQaA6R4/j8a3hmjWgBE+1CiBKIVsVrGVqXmLt
         9GGlKzkAd0doer8ivLapdddTijzGjYjelJ4MHEiimly/6waxCtlbU3ILGdgSYaBHMFI6
         Jv+Fgq8y435tvZFQB83RQlEyxTdWqp3y1X2WeVetSFbgYSxUWG1Rg6CZ7+E4H8/G29iH
         D6bw==
X-Gm-Message-State: ANoB5plYnnY3CFdASvUxMKHtFSUlgH6x2O2sRJX8O1fxjGCBE3pxcM/a
	+aKVCDe6huqZlZ2MdaUJrw==
X-Google-Smtp-Source: AA0mqf7zKuKHJILouCKRvL3z3BO4PlGpMm7J84X65Ob+k1s7jKSRMTqf9I/8n9TZCQ3eRFCbyf7EKg==
X-Received: by 2002:adf:f88c:0:b0:242:5563:c3b with SMTP id u12-20020adff88c000000b0024255630c3bmr7406248wrp.59.1670756211870;
        Sun, 11 Dec 2022 02:56:51 -0800 (PST)
Received: from koolguy (dslb-094-217-227-056.094.217.pools.vodafone-ip.de. [94.217.227.56])
        by smtp.gmail.com with ESMTPSA id h17-20020a5d4fd1000000b0024246991121sm5821908wrw.116.2022.12.11.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 02:56:51 -0800 (PST)
Date: Sun, 11 Dec 2022 11:56:49 +0100
From: Dalvin Aiguobas <pharcodra@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: fix checkpatch error for spinlock
Message-ID: <20221211105649.GA4683@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch Styleproblem fixed by adding comment.

Signed-off-by: Dalvin <pharcodra@gmail.com>
---
 drivers/staging/wlan-ng/hfa384x.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index 0611e37df6ac..ad117d570bb6 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -1171,6 +1171,7 @@ struct hfa384x_usbctlx {
 };
 
 struct hfa384x_usbctlxq {
+	/* lock: Protect structure fields */
 	spinlock_t lock;
 	struct list_head pending;
 	struct list_head active;
-- 
2.25.1

