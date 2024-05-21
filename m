Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C9A50246
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261450; cv=none; b=dFN1hWkelH47J5Opp3orRJCKeEaQzkPOpP3gpHg4ov5ExnHJo4lx48heo2xJZxflYU+G/Asee5sq4CV/NrnkCyRrNbCY4JioZoy9uEGWWWvfQGfLgLz4u25QeaRdWSDlM7aM7ew9dL3G0g4dSLP20dmbCeLs9GBmOhrmhIF1vn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261450; c=relaxed/simple;
	bh=BUrbjzcQWwyURME4rVWO/h6tgucWYD5267uEWABz2kE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L0IdWz5/EnfbGAFB6LMpbU44hImC2wuzL6kC8JQXCF/ef+HfmlBohYPRe0pHBgBR3oqzRzZzz2mgcj/cd6to7/YCZMwC8b4MRDxJdDZ9IjxrioNbHeKyNQPHYrBNPIg/wDUMlaxJ1E9HFLaTstk+VrqFCuO7kneEXXdLZgnm3tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lUIzCYmA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lUIzCYmA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso88928855ad.0
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261448; x=1716866248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZwyL+RFncPuaE+b/XOsaY3FBas0Jn4bpiLgCt4nDwA=;
        b=lUIzCYmACV7FJOuZj2iX23hh8IsVn50dFept+KjbmPiqD4EBuX3O5+0m3WtZBnJEOm
         PDQcstWaE5WS833fcesihA0FL69HN/Tc2b4LGiZZv+y18L6TOnErUWBXFet+N7v8g1wF
         jlu9gOg5yhuapvi4R32gwlRo2TDNtbO1X5WRjISLqog4wVkRsQg2gRfyoJsY1AUOn659
         iyzVvm8kQ443Q1mDVa7R7R5YQ3nx+mfJrb+DtUTCrhU47/O7pAnfY5SP8dn21lr/xZnR
         oXPtEZ5fZnhIQPSCgfWLPlGa6vzOSEyhWgHbXf1NcOfv253BqDfFkJ4QEuW2T3+X0jWo
         9m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261448; x=1716866248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZwyL+RFncPuaE+b/XOsaY3FBas0Jn4bpiLgCt4nDwA=;
        b=W57P9FokUF7jg/2ByKgUvmxvd50wSIki9lZRq9mF53wjL6z35IhZiqAJcikFsEL63m
         eHFpaszd/xdaCzGTCC7dVnR/hdzjP/6K6Ywv8B7p5e8+UsGiQw7fhFzvWqTK0rrh7C05
         Hjb/Ln9yT+rGFs+EI+bJdpCpfk0pW7FFbJHWm1tpjvWwZguA3ycLY5McsL54lEsldT0C
         fdfpGcbrjMNiwakpwb3UB6oii8wNfvliFXpH7bybWaiFnhgXkC4zR+8D8GYhwikhYS0m
         NuFDc9rDfu7veeqYr5prnY6ravImCtvc+KlP2Opv+P8lft+wk43AyRfoNqhAXHPieZtp
         5zXg==
X-Forwarded-Encrypted: i=1; AJvYcCV7XlDXly2TjDNlR0/JeIIW6e4DJnIQseNth+5RRNPZ7lLGJxhQTa5i+WNW+IkPReNbU3rLzynr7z7argx8GrKS3Corc0I3CLF0y1ccqA==
X-Gm-Message-State: AOJu0Yx3mLPD76k4wXKWfbNE6gb03xlp38V2JsfLGGsD2s7S+GjTJGuo
	B6jxtT+mpO6bj8aFOhzmy4fdlYHuYQDAAdi+Sjk8e9CxgLeoNWxY7mhp/TnCppM=
X-Google-Smtp-Source: AGHT+IGyMNiay+OKPoZtkCBgoCgQD2kIuJLu79V7dIocZ4883CscupBlVT6PBm4ZfOBZs+l6TZHs0w==
X-Received: by 2002:a17:903:1106:b0:1e6:1a7a:98df with SMTP id d9443c01a7336-1ef44050d9emr371334135ad.66.1716261448514;
        Mon, 20 May 2024 20:17:28 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 09/31] Staging: rtl8192e: Rename variable rtllib_rx_Monitor
Date: Mon, 20 May 2024 20:16:56 -0700
Message-Id: <20240521031718.17852-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable rtllib_rx_Monitor to rtllib_rx_monit
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 76389aef53ee..108fe1520cf9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1383,7 +1383,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	return 0;
 }
 
-static int rtllib_rx_Monitor(struct rtllib_device *ieee, struct sk_buff *skb,
+static int rtllib_rx_monitor(struct rtllib_device *ieee, struct sk_buff *skb,
 		 struct rtllib_rx_stats *rx_stats)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
@@ -1434,7 +1434,7 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 		ret = rtllib_rx_InfraAdhoc(ieee, skb, rx_stats);
 		break;
 	case IW_MODE_MONITOR:
-		ret = rtllib_rx_Monitor(ieee, skb, rx_stats);
+		ret = rtllib_rx_monitor(ieee, skb, rx_stats);
 		break;
 	default:
 		netdev_info(ieee->dev, "%s: ERR iw mode!!!\n", __func__);
-- 
2.30.2

