Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E619F426
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697918; cv=none; b=gFtrdnxJks6EXVZvmgqgzpKn3RX3u1Dc869kkLf5Aq5auc96Z1vp6iQGO3WVIlLeFglkM61qX95OQC9SqqNUh75vp7VYaJ0Ln0NJVPlpadNBGYhUFSvnLcq8jBX7OncNPXsp6XyhCPArYErTSgcjpRdb0PjZdhbGt89cNsrs51w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697918; c=relaxed/simple;
	bh=fxwhWvjSILXxCjv9CXZoVUVadgI45kHnpUpllcnsAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9c4ABLdMsQ/FB//+uKqX4JZZ+5AaBqHTSUDpAnIy+QQ+9KJu68GCGzAHOeEQwNzileIF7ptwJrmzCyrRuzUxabsEIjSiYIGRZc5MmTtbJuYoOllHN2wM38bLS8yfFzHGmn+zH0qcqomgde8xJ4qDByhiKFb1O+MRzDPzkfHYwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oIWQyhHD; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oIWQyhHD"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cb2f272f8bso40067216d6.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697916; x=1728302716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1nqJxv+kHTFXHSCWxO1NaLDK6vY0ti6KAFzNxfjGjU=;
        b=oIWQyhHDPCIG2Y7P9/ka7J/2ZU/gTxgvESM1JQq0e+vyLVjM5wzkYLfOBVWmZpGm1e
         FVjhnlR4P3o1B76zXpjg1vB76h5OB4V62PGcnvnmx7rmf3eqrMsg2WH6rKifab+4TQVZ
         ZnN6d4xqDHlR/SE2D/ultT5dWCivhAfpgHbKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697916; x=1728302716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1nqJxv+kHTFXHSCWxO1NaLDK6vY0ti6KAFzNxfjGjU=;
        b=AOh1ZaCL34dKOrXnto3MiuF1ZdFjY6sKB/in08BCh1ZH1KXibaML8u4Iw/e85gpf+w
         9swTCQ9egFzAy24pfnQ9AOMC/ogxAmBU3aXr3hxb4zvxEPWaQMzqwKGmvQdfrey6jRUO
         5R+F5V1954Szwi7iENzjPwSYdDGN1eyEo279QJhJ5kWlRZba/3q4AyFWpCT0PzQpLZMP
         i0DkWPigY4mTBUUKOiG0QvRVOX7kD+Nj/JXr/DTfGRqb8zAfo/oVQN4NZDT7jHbojBRA
         i3pUwvfGraxPU7UHdRf/dtpSX8ecQg3FvRZcXCN3LxQFv9YpujCm2thkUArAyd9aoCMR
         EstQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+OnRBRmVSRc3PYnH3eZiBH4Ink1TuszkbDKYNJLwTgo93BejoMkoTwkS9JI6LYovycqVS3as4vAybW/lS@lists.linux.dev
X-Gm-Message-State: AOJu0YzDgxIEa8vuXY2yZIG6r552y+JQdKSJV1TwVJ8aSGo/XwgK5VaX
	80W2tFSAuh8VVvjH9x+IvFPvang0UqZL/Y/xHIhvklhScjK6BYjQex4anwATSw==
X-Google-Smtp-Source: AGHT+IFHqIZOoSZ0SNoSJp6T9EpjigAIsbvAUF0oGwPlw/LLEGHSlB7PElYqfizjzUxKI+v34TuK6Q==
X-Received: by 2002:a05:6214:3c9a:b0:6c3:55f3:ed92 with SMTP id 6a1803df08f44-6cb3b5e7233mr204180416d6.2.1727697915550;
        Mon, 30 Sep 2024 05:05:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:31 +0000
Subject: [PATCH 36/45] media: i2c: st-mipid02: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-36-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warning is fixed:
drivers/media/i2c/st-mipid02.c:552:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index b947a55281f0..70a691504eed 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -549,7 +549,7 @@ static int mipid02_s_stream(struct v4l2_subdev *sd, int enable)
 		       mipid02_stream_disable(bridge);
 	if (ret)
 		dev_err(&client->dev, "failed to stream %s (%d)\n",
-			enable ? "enable" : "disable", ret);
+			str_enable_disable(enable), ret);
 
 	return ret;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

