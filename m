Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A182877C3
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380403; cv=none; b=D4vzyoh/gUKUX+ELrAN+5U63zWUher004ahbM3Y4ol14znyCWmb8/z/umau6A0XD4xh7r24oFmUPkMiHcKawd6lLao+V5W9YJt4w3w/Nh6NQK620XxwaST9ucNbhZ5/AQsemB0JTtS0pkwrtwf/tF+csPA+yG7byltMjfMXljzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380403; c=relaxed/simple;
	bh=M0bWYtzPsgG3SCHGaZog0mJn1NCzjaaPUCXC8TDOtXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7zsYgXE0xeccKdgi6WjGkZ/+Mnq4WyCCDpgF3Pmwdi1+OQro4z8C8Lh1rJF7jyTPv+1lx6K+OqyWingC/lJOyLqwc/3FaxQAsU7MxXRlsN/QLzdBAkvkZ5pqTCBP5Vg8nCx+PWUiDeeGjonKEyqDBj71iubDWJMbnyq95z14AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqLXpl7X; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqLXpl7X"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899aede64e8so35053696d6.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 07:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772380401; x=1772985201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fudjfnqIGGYXrc570MStAuZxRYLay/249ROu5jioiEU=;
        b=MqLXpl7XORI6jdX49k3vlIJdNPUuHmhE5gJLZeprOOsqZKpTCp38vj3b8pMUHGJbZI
         hfPnTpH6TMwkN/Lf/Mv/yCcIwonGq6iuVfrS6eM1CH8HMHIYB1sZBdUGQLr20GQNcY7m
         FDAcOf/PJpUGOgeSKfEhQc4ZFe8Y2tugQs8TVQfhNfz8Fb788VYU5tFB0Ju+C0WXH+Qj
         ND63XeTWsoruQR1bZo+9dXras4PPhAa0bIOvSFs68ROVwwtKyR5hbKTgNEVYbH2O7THv
         Vmq5bLZ5Pj6MWBByzQPTR9yDzorV93EaMHtGZjkP1LR5k/9SzBWfREq+RqwGtQFjyoA3
         3Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772380401; x=1772985201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fudjfnqIGGYXrc570MStAuZxRYLay/249ROu5jioiEU=;
        b=G+ehBa48Vq5wM5+SwxdDDM4+JBzQlyzYmoyiBj4ZCJgACnH5g/8tzgsy1df4/GmJlw
         J8Ftxhes8aXB9/epD3rMfc5xNksd0WVTIfnEzONiUMWCsiMIbFbPjyGsc2eBZHzoeR26
         vSP8+gRbVVOA3kq1/b2eln3kgNpQFNjk1m1lvKe69Y0GcUcIVAndMZwenorotP0utNCv
         HB51NSqbLpvRBanTAqXdcR0xrEvwaaE7t6rFgkvKA9+jXJ7rI+mmF7fH1R29z+43arx2
         ryI74QonZoj7sGZt285FnuPpfdHj2MzJVknnOfwr+aFw3NfoFaYdXxKuGc9DmwwwsqlN
         91OA==
X-Forwarded-Encrypted: i=1; AJvYcCUhPW5vsb+olG947YxR2T5+fhNTD0jGOBrAuSkSz98fxd/YQQkgbB02vebsZ3UYq1AwVK2IGqc7BQVB+01M@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9C2wsxmOffAjBVvZlspKNEcUc/ENRGfX4pRclCKjXgMbFlVzY
	8UCA77i0HpR/fdUhgPwyS2Wurz2iTXB1XCXj6dlXS+NYCJv6XEgGdHDF
X-Gm-Gg: ATEYQzyl2WZWM9XkOaKD+xq7cgaN+RUC9qeLu9ERnZj2qoq6fXSVvcpRrJXLfzQqtaL
	B5endC+ylACzHb1RmMoP4aTyiEbPyUEDjq19vCo8vNVd9uNaC+VVyFr4xC9PFnRbGujkTek+094
	9hdYXeJTRec3dtcKRtNdkPN7rlla7Sg9FmVamB+r3a4OTPICKS8SwYVOdnr1Z+50maGzOdNlf0l
	YpP5PivxmwcRvGfA0g2MvgyFY7qinu1FgUVuubeAhD/KcrKeStVZ+I6m19aDaUGuR9sKGUy3j9g
	L7JS+pXMbJxmd44JDY+EH34f3jdXE/MFb97zrtQuKJil6YNGKHubTE2bKWE8MQibq9Yc6BiYZIC
	1/TCWT9b0fsmWzzcmCZASgmvkJjnSHcueBaO62uu+DnUfzrfxDHmjc5spQrwENqkokd7ybkLctc
	XhRrnRQZOWI5NBb/nBdOmq442bN6qXfElykG1zKnPdfJHO59UGjFPyhRQL5SxyNHaSDTksdQ/Im
	oFe
X-Received: by 2002:a05:6214:c4d:b0:899:fbb9:90b4 with SMTP id 6a1803df08f44-899fbb99242mr7800176d6.1.1772380401194;
        Sun, 01 Mar 2026 07:53:21 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899efc810e6sm21128516d6.5.2026.03.01.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 07:53:20 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 3/4] staging: axis-fifo: remove unnecessary variable initializations
Date: Sun,  1 Mar 2026 15:53:17 +0000
Message-ID: <20260301155318.2596519-3-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301155318.2596519-1-objecting@objecting.org>
References: <20260301155318.2596519-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary initialization of 'fifo' to NULL and 'rc' to 0
in axis_fifo_probe(), as both variables are assigned before their first
use.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index e154139831ea..7ca0404b0875 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -456,8 +456,8 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 static int axis_fifo_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct axis_fifo *fifo = NULL;
-	int rc = 0; /* error return value */
+	struct axis_fifo *fifo;
+	int rc;
 	int irq;
 
 	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
-- 
2.43.0

