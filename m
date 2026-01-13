Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AF53904CF
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312667; cv=none; b=HBAzwnCqMmED1nb8bLBNnjnoCJSFWlACjF5Cx+UDMhHQatJD3xHccMsAKCGUGiQsBmvZiexnYHuVkUXnLLFkEIF0b2uzcAySI3JVjAfhXUcSNorhFO2Io1AYo33AfmtMrYwCxgQiLYh9llV8alC0Q5bnPYC6KqhJf2kh1nI7ubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312667; c=relaxed/simple;
	bh=vGepSoXqXFNPK24g9jxbIFgRn8KdUM+VLaqxS4+chjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QVf5I6JfXCY2C6lkV/xv1W42Zi9DlUgK8yDoWyzm5Sn/VHSwuug6lXYm8ns0nzRKTDxZws2Pe/JCFsKe5Gx4Dt8ETXmlvcULwx0jNe6TC5tgHbr2THPsAOje1Dzjph0A1thZiuwTf0wT16+/5aJV6aggUZaSy2eDm7asGHxvrmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PPav2foi; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PPav2foi"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee07570deso1360105e9.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 05:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768312664; x=1768917464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geRxG6VtkxUTJZHQL/oixDlpv9swofSsiDKuDbcROUw=;
        b=PPav2foiCm9m1thwr3Z5OcyPeQq450BBEZ2IBSLdpA/ES6EjmyXFJRuc9Rhn/fFk1M
         TBxJQoN/jPxyRkJs4TaGvnBnt2imx6hJ/p7n7kLKIuQkmU5CWCeufEfDFl43OTXO5WGB
         x6F3J7XiaFRkA1kxDbdIMSQN9Cfd6l/FFaLDMHQmLmAqLvZ/Fb4gLvnYcVKwWckXVXG0
         sbeEqolf4I/6vQCsEFWIuqkKHyyvhCru3hZwFh42xB99QNJQ/0VTbiymTlA5PfwVKxoj
         BVQmZGdGc+nbeob6ePqaqawZ2lq/JxX+1tmy3xKuGjHw5LUpxlOhawP1Rfjzx8NLyYEz
         E+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312664; x=1768917464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geRxG6VtkxUTJZHQL/oixDlpv9swofSsiDKuDbcROUw=;
        b=TJPjeqJMOAJ5nFzD01sXAMfNy+SbKv7jJX/krMUHuHbOS+n/6jP7TswCVUbkBixJGk
         icH7WWfkwlG71NV+jsupODin9uyOVVugZiIorG+1Zb6UUT3OdQnd7kPVYYIhU3sfz90B
         +38SjEvtzxRCNwx4nuYGEwJ6vinPNeYsv13XehX8LDdYVZrp6og04H0dElRMFRhu1G36
         WOHbvGsBHwWEBSwml95x01j7/pD4kDCQr7NBY+0b9sKL+xpFEXc0/KIW9UGlJeB+CBS5
         4xGG2bk8Q/bfR+1hQKGGk+03j5+i5ZgoHVS+HoiQA9sAukGo06h7q6e7BAu7Ekm83iXZ
         d5hw==
X-Forwarded-Encrypted: i=1; AJvYcCW1IFhCO/551DPLDK+UYmS/ImrEGhfpeETeXp+hOIA4br82atM4TG8Ce3Y0b/yqU1TiUAs+w79vQaW5xqCh@lists.linux.dev
X-Gm-Message-State: AOJu0YzT5WOKE5P8fWBTB5WDTEbgDQQFy53zfYORHBslmvYT+5INpKdV
	gMFB9Ec66dETEoWKUdxNacW4zGDUf35xJmFedFt/AL7qbl2+fe1NgjkUOuCRizQKZ7g=
X-Gm-Gg: AY/fxX6Tzj8OtxI0OzJyJXEePXwsSYFgXALxvkG0loa5hC+e+ucCP435OFSFfHSoJS7
	l52alDEfkrM+JfLBQKigEFlrgjNfxwoM1IFykY8xK+HlDHIv8y121DFBHnRslchbzFuN7sxKoNt
	urE1rXZLHoUFNao93Lq07zPUliA/tXtgAgma54DkLA2TmiYQlmoNAcCxJjDScWDboNdMoh4U7LM
	xzwtJrJuFE8+kbjEQFaR1tuCGHFreHUmMnXTVfYylmfxi1bgbppDN4/fIO64Pu9WsjNyR+qVIzl
	QaxpQzsrkUYKQsDLcx21AT7WLP2aOFX3ojdG76+fXB/FH034LxGe6E5Z8dGUvCvmlah1PUflnS/
	DregDQwfVHpNWQkuj1GuKCkudEnoMqZr3xhD/UEa2iLcJRUj8IJq958lQz4d4j0V8BFL9bbCAh2
	y9zsr9rJyNjSV/T34rd/Jpobko1BBOsfV3DCA=
X-Google-Smtp-Source: AGHT+IFjRGoeW+J5Mh33H1Jx+UT7KMzmBbyH1GEpCHxRS7T97DB46YiBWucSvzZHYtUjHNiFGgqvhg==
X-Received: by 2002:a05:600c:3152:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-47d84b17eb9mr254066225e9.12.1768312663867;
        Tue, 13 Jan 2026 05:57:43 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b48921sm1282225e9.0.2026.01.13.05.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:57:43 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: greybus: add WQ_PERCPU to alloc_workqueue users
Date: Tue, 13 Jan 2026 14:57:37 +0100
Message-ID: <20260113135737.190636-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/staging/greybus/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 5326ea372b24..12c36a5e1d8c 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -806,7 +806,7 @@ static int gb_sdio_probe(struct gbphy_device *gbphy_dev,
 
 	mutex_init(&host->lock);
 	spin_lock_init(&host->xfer);
-	host->mrq_workqueue = alloc_workqueue("mmc-%s", 0, 1,
+	host->mrq_workqueue = alloc_workqueue("mmc-%s", WQ_PERCPU, 1,
 					      dev_name(&gbphy_dev->dev));
 	if (!host->mrq_workqueue) {
 		ret = -ENOMEM;
-- 
2.52.0

