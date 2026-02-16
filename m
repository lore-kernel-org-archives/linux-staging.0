Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D1C15746E
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 06:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771222163; cv=none; b=DklZae5kIz2w8IFTpN4M2gkRdHzRDC+iVNCBOfcCxfwIJh+GeWdESe9Onory1Rl6cTVf/dH0MRM/HAJJ8/PPTI6K4hpqK0kzBS7nDzy8CnqSEXsFsjNfCp3PTt+GvnYBA0qPwmwUEuznZ+10e1dmgwFaCPa67rGP0FMMYDNuaI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771222163; c=relaxed/simple;
	bh=aXWlL+na0A4YBSDu22PFGj3EXCa3yrf22yFRe/reMds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CmUWfrHE/VvP70Bz0JhQCBwNdn+MtRkTMcKHX2CEIbXVVnDOnxcmldfGJ1a12DC+TIA6rttrQ3jAx6DclA5vEQejsP6NJ8ZOFkg6/XOhD7BEa/8WZr9FGMwE/22z8J6unamgcc5coyqYMVomRBHCJ4tltqYYG+KkjEJ5SVtQ8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsrBXFeA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsrBXFeA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4837bed3d10so1766935e9.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 22:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771222160; x=1771826960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bK1wT7090TgwsrbhxGMt0qludG5kNg/w+ExMmog18gQ=;
        b=FsrBXFeAC+isnL4iI9U9iR+TWCZpBN5uuOGqGhE54KMKNboXZRdv4bhK+xlbn3tkPZ
         wBygnvK/4PC/TkMeFxEjrkCDMGIdlgPIpv4sU84DZhFvPNU49uQx/yfm3h/aHO8Rsyti
         uz6Z+0Blpj5EgV6bRolOi+0W/usByA2zKifCuZWu/hYIqtKSzd4lrpr0jD+E6TYcQCg6
         gver8q/6EZ73b/iqM0UDWZ8rgmW495+6Gchb+laYoidrCaX30ZALwZBvPtM6k5DzzQD3
         gxHfr5w1X/JUs4BXjDYzQsCkTH7mrp0c8axUL6A5/WDlNztxi7XgXtwnQ45XwKYHV4ub
         hPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771222160; x=1771826960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bK1wT7090TgwsrbhxGMt0qludG5kNg/w+ExMmog18gQ=;
        b=fBBOZFodXFVDKU6aGz+WiV20QQLbKjY53Wq/JW/WTTOvUnf3oSw5obW2vsxKk8ciOs
         YJaNPvXc48WfQh+qGFcJOco94ZEWeef9bZ9zVGgq5i0Sv2H2YFJQkzpY2QPT/ty8x62c
         Kfy/K0EVL26VbcexHsUJ2BEluMNZlYH5VQcneGlFjGwpDOq4ofjHjpaaKCkc4476jxGS
         /IMkP6YWwiOywEx2h6toukM4yQs5s3AcOaY/mS8+WtROudSpTBHcUnLS6MKBw5JBKPSo
         3lJ3oBKjRLxxrz3Q1NMr2Be48nqUXdWC3e+jGhPQ1xSRSI3X0ApfXr03IChn7+VLyNkF
         7toQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF1jDrQhQH8rlcrt36E88iAaQBmkA9Fodr9Wm8xodpM+FHZj6TC6uMQCvbViYUYh3Bl1v2y5tWPmqj59Q/@lists.linux.dev
X-Gm-Message-State: AOJu0YwTqXU2Drf5NZtbArAEffCNx3TbZxHaRUfdXyZRbNii61xHpMPz
	0Fz/FCuHQo7DYuM4OF5+vkNuLbk3wNk3mfsTmeDZ15RVGVZUoxfvmsGH
X-Gm-Gg: AZuq6aIuL0Ef1o5liity9TWp4wmQ8yzGX8KZ32vouc/eaX9oheJikxiIw+8UzVrmiPk
	19nJiw9kxEoGGGjbI0EwzQbdzNbJRB1X2uQOXlsKods0kqx6Yqlf6K/Jgp2RCnIz5le6TeQQLi+
	Vv752kekEnrcFvd4TIWGqSYjWk74pxHIFblV3Satp1p8oKEug/OQAafs07/mpSWCOMKwd9vYRDr
	zbQcSibRXt10JSxh+x40EeM/ncIawhCBF+hCVUwa/29Kp9RvA0gHjQRG6f+041x29BmeeeW8RWE
	+KxED/U+RxuUjU3TQfZAKYFUlz0PTSD2GQpNcS18KNNdFCL5yMU07pH7+t9gexUjnQM3T6KIFIQ
	uwMzyhqvCNFEaNcDgmN4uyhP6tWzKyDehXJ0FLM38eSTTGtSLcjMFuThj88rJsF/VuSDAsEqDGl
	DL+SpVD/OJiuwijX5I/K31TaV80edgMISbngLHQvgng6ArBu/CJUBwk6uxlHFi5n7vRfddYzr88
	Pvzr4zY0zpo/I460TSbQPwezuq5+MYTOHYCaZsbOMDH39BdlFgf
X-Received: by 2002:a05:600c:6912:b0:477:aed0:f402 with SMTP id 5b1f17b1804b1-48371067b29mr98407335e9.8.1771222160366;
        Sun, 15 Feb 2026 22:09:20 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b68e5adsm199709475e9.9.2026.02.15.22.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 22:09:19 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: greybus: sdio: Remove double whitespace
Date: Mon, 16 Feb 2026 10:07:54 +0400
Message-ID: <20260216060753.19007-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix double space in variable initialization.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/greybus/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 12c36a5e1d8c..443f47a610f1 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -206,7 +206,7 @@ static int gb_sdio_request_handler(struct gb_operation *op)
 	struct gb_message *request;
 	struct gb_sdio_event_request *payload;
 	u8 type = op->type;
-	int ret =  0;
+	int ret = 0;
 	u8 event;
 
 	if (type != GB_SDIO_TYPE_EVENT) {
-- 
2.52.0

