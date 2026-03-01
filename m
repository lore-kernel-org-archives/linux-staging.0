Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF171F5825
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 00:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326523; cv=none; b=T3uOIkb/o6AI7X/dSaRgmMsS8hnlBwbUp8qAtfGGakGd5wyjX4ePxs+tohJmZnTEG1CofdCCDLbS0clPHzCPWlG6V8ePdIy5EzwskvvFZHY9IwrnGgYeco/DBqe+JCrr7+R24ZXYxNF5KkK8DQbNDODrOSuHs7M+D9RkovbvzLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326523; c=relaxed/simple;
	bh=GdYUHD4puWeOoOKtztcQ2Lq8iRfJfz7+aLgPfZpNVpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szoeO7aQwrtDdC6k/BIT62hm97g30ozGrb/ZWkpLNvfLSna29sKe0Twc+pOJ/te5zEle4rY0P/y+mvNdmhmzB+aVpDd3n+cL69i5rsdmhNhLjP4meCRxs99fDhXoJv+CSwaNb5xyWeq0vJuxIMTD6AReNC5+HdtGoz0gJ6yMnos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZpDGsZI; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZpDGsZI"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-896fb37d1f0so55200976d6.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 16:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772326521; x=1772931321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT6X3GNyl/4X3+3IlxkqRIyQryOUKSzRU583uCJbsXE=;
        b=NZpDGsZIpoVoLuogrTxBrXRK4i/Yd6QT07JX4/mnpYesPzrwrQ0VDyWCpCPv88g+95
         IbBG9cQAg8vPAdb/l252RrwXRjyL7zuHwupRB/vvZpZ+c+ZgbbBWx4QDXkCoHmrsVMwN
         oxg+Pw3Qy/JCAy/brrK9JSv4lGnSORAT7E0Oj8Hf4LgBvy5LEVCTJ0SoEH3TMRotTi8p
         9/9CW0MMNP5zh6JGqkC4nfnGB1LdOY7ZQpUkMtvbcSjrMdlaAE6/7RcRGhA0bueO9jsd
         7w6GGUaed75pheTfG56tIwPE80s98Jr4FpNejUxQzZCjocA7iMPivz7eb2Wq2LQQcLrj
         +izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772326521; x=1772931321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TT6X3GNyl/4X3+3IlxkqRIyQryOUKSzRU583uCJbsXE=;
        b=OPP8a4ScJPYHZHIredsNHxZ9e917UCOxzCG+UAbxx9sKxpgzoTaAoqL2GW4i66ruNC
         /stvHj6CM4F5XkGfRlZJ8gdOEd4W1hTEHxiwluI6/logFrkoKfvMMiAnwVyQyviyGpGP
         4zmisTt+9CBWpO6nzxC2Gl6h/KhmlwQssKiFpq9Qb1Y2hRRFAqW7CDGkHHyB39my4eC1
         KAf6zhtXKuHLerEaIwurxdzu7s9t8EloNht4S5aimNYmp0jFbgnUFBDntTslDfEIcOvz
         EFaB+pXwxVNgfYD7Obqr/4utDo0IXdnYOvWjhHHbfOtM2iueA6lkH72VR0/TUcs3jVgO
         swGA==
X-Gm-Message-State: AOJu0Yz+C8QBQh0bCOVZaS0K+T2Pi19YREMrrxYrjgI2EduP4mAxNFIb
	KoC5TrcO7sqrkIuNCUfVjTSfzOlsoNJex7y70gr/IxdVEJYmAEFDwCz1
X-Gm-Gg: ATEYQzyCeecb8oaO1l64rVae5riczsJ/lhExC3OJ4tvVMsXmG6A3RGAxDWRQWFpco1V
	QDeo08XHOA+OGLakARYpzCez/0jqbfwZZkmA9BvfA22DNjRaz6IwlQDXJXDle8fWD1FFIsXiWMN
	FT8eQ3K136dTYe0uP3BfRFryFuAabXdwKDYV5wdJVLA38nmRb/Daj6qSahrKJRHJm0baVjwj1dQ
	m3ypsWIabGJNOpbPVwEATFsIPPAE3pChlxi9TgtTCPXHUeyW4d5BJjPaGtkiKr+Mku4Q7nlqvkm
	rIBPAmTRQJKjLv2LK2pBhQKjmcgRpY2yM96qNFnpnCSiNINo2S7Ut837oL6Hwv/zKVe4KTPYefn
	Mk26iSf9MuYNKB4xNbStRCL2e0KSTSzY93PRzicXqrWxYuP20zyKR7FsBXaaXRcG6ftW/cnAeER
	myM3alJZsdp6gR925saJ0AAOlUWDPHQWZort6YZCRPGe90iDtdEiMmeQG0/4Pel0/SboLvXJY7Z
	yRtNE2gBuCTp7g=
X-Received: by 2002:a05:6214:226c:b0:894:823e:7708 with SMTP id 6a1803df08f44-899d1e97ccemr109024686d6.63.1772326520987;
        Sat, 28 Feb 2026 16:55:20 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66f325sm815840985a.16.2026.02.28.16.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:55:20 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 2/3] staging: axis-fifo: use dev_err_probe() for IRQ error handling
Date: Sun,  1 Mar 2026 00:55:18 +0000
Message-ID: <20260301005519.2512706-2-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301005519.2512706-1-objecting@objecting.org>
References: <20260301005519.2512706-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the error handling in the probe function by using dev_err_probe() instead of dev_err() when devm_request_irq() fails.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index fc8e35696b31..28268881cda2 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -484,11 +484,9 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	rc = devm_request_irq(fifo->dt_device, irq, &axis_fifo_irq, 0,
 			      DRIVER_NAME, fifo);
-	if (rc) {
-		dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
-			irq);
-		return rc;
-	}
+	if (rc)
+		return dev_err_probe(fifo->dt_device, rc,
+				     "couldn't allocate interrupt %i\n", irq);
 
 	fifo->id = ida_alloc(&axis_fifo_ida, GFP_KERNEL);
 	if (fifo->id < 0)
-- 
2.43.0

