Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD333290C5
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635184; cv=none; b=lmMdcZcm0otpgdrBRdVYPdO17tsO84o8dAoC7eKI4iWgqnYTayKmVgbGy/3oCdHhIpddlwLHkcZvpxFZUCOeD9ICz/rGycrsYn77td181ojH3WDYyTE4tFeVtTWfm9ZSmsmaZtyv2+j/lcDoyeewx4opGzDTleqvrtYBb2qfymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635184; c=relaxed/simple;
	bh=1ZSaYK9KkfV5+GCoFqf+X0v1Q+Y+dHjA70Bg+RMm57U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMqlz4EMMyWMCnd6fQ6K66b423IZ6MPw6fisfvDuKtSC7zo4Y75HItrUeYXSqQj96ewvS+YayG9IjYRhESAKEy+c4OyxdQO66MHT1Eh3I99aSmTldQDwfvz+VaY4q4WIpeG8LYg/Bo1D2DbBmNruO8oOzmimmK3Qbtt3925w3EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=blB/fMMD; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="blB/fMMD"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59dea72099eso1998641e87.0
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635179; x=1778239979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=blB/fMMDskNL6OmfeJXbv34gHQh3qTGLSaKKhwz1BLlVtM5eTQfDHdKdrpyxAsXpRp
         oWqqy8ZMEgGBBsUzR6L9XLv4gL8/A6R3s6rVSmC1uiRmOox9HTrAnTzWdqpg83HIQyHY
         Xu4r7YKudW/SQAZ9sWbASpwzBVYdwTGHIJbPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635179; x=1778239979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BnXlL3KzWzfPtDefDXKY2+uDbjeKnEfIYOtp4pEQbxI=;
        b=c6FVBzYGZn0aToBBw2hBD7XIVNPJSAkLciLpj/UNYPmnH9iKmE8l4nQ1GzSNkgOvbo
         dCLZnMwm8Vo74Y+e5YFFNUmjSVFjh4nDgokTziYLgOKVU1YNg3FAX9fcjjZf6ASkvyjt
         VIL6PIJmxRjTYQdlPCBM/wHLnAkMGlWgajT3JLapNi9RhoOJrDhETjHBDIL8kyH6aeUF
         n41jAdfP/SXOst35+2/0U2XHM4TzvDerNmlJiBaWCO/M2pv9eNOJXpLWbcdl8Rq6i7G+
         XVXIY+dpnYvO83CNaIIhn6sgIA+/uMQ0B/svXGWHY2lwgPVAks6arN/oqdsfe0+Wj/xY
         ET4w==
X-Forwarded-Encrypted: i=1; AFNElJ/51P/01xQLnimOGHD34gprEZ4At8wqerZ0wnzjq5aUQE57MYm5Mln9X9KaJOrsLk/Gp5rzAtrruqKQl4+G@lists.linux.dev
X-Gm-Message-State: AOJu0YymUpk5TmQB0xpAnBAai/4vOxpguiknOdWfou7Ui7UIZHPaaBdn
	bf+HrOLLvdKRL8SmvE/kdAFLu1bzJYqlGP01VY877J5Hiv2PBXwgvGeElKee8kLtkw==
X-Gm-Gg: AeBDievJU7xsMeT1O75ZHViCK1aqC66Mar/TrgthVDUNVfOghLSRmi9tmZwXeLGviq9
	ahIiEz++O6YO4x8LO/n0ddgWleRa1/39WMxJVglqJzpP8Ldaa39EMST/CILA831FluuQBMK4YzX
	PTJu+6CGzuvlxv3iKZTw4grb3vYPb6RQuDlUn8io8l9sjAuYvpoqrsd2Yc5BtZmed1Mh0DTz6wr
	7Nm0kpSzubkla4RZzXXfX/mqsmwOUh4aTSvPP7a/Q6r0asEC7JyW+prCl6vhup1Le0JTjn1gQ6h
	KFQQT2/ucu5YFIz+v7avzYDcD/2dXlqoVYtElQ1vxS6TaZkRutOLHSTZvC3YtmZaoPEsBaui/5B
	k2E9Pfb81sotQV2EtZOxpaZmIA9r/MZuLjTyNNPnL0cSWUdICJS/nhpcP7ib7pVebAVDSwTYmQp
	kCEOERtQ1L4k0IpnkxiZY5qoNQLSXYcs4ZNVawoKWxzlANKQn5byz9TpAuBMwDOmCd6Gx6d7Hsd
	91LrGaizOLDn9pq9Q==
X-Received: by 2002:a05:6512:1092:b0:5a3:cebc:65ca with SMTP id 2adb3069b0e04-5a8522b1196mr2252516e87.7.1777635179035;
        Fri, 01 May 2026 04:32:59 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:48 +0000
Subject: [PATCH v2 3/6] media: i2c: adv7604: Add range checks for chip info
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-3-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3

If the driver's chip information is invalid we can end up accessing an
invalid memory region.

This fixes the following false positive smatch errors:
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv7604.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 67116a4ef134..ae75982fb514 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3668,6 +3668,12 @@ static int adv76xx_probe(struct i2c_client *client)
 
 	state->source_pad = state->info->num_dv_ports
 			  + (state->info->has_afe ? 2 : 0);
+	if (WARN_ON(state->source_pad >= ADV76XX_PAD_MAX)) {
+		err = -EINVAL;
+		v4l2_err(sd, "invalid chip info\n");
+		goto err_i2c;
+	}
+
 	for (i = 0; i < state->source_pad; ++i)
 		state->pads[i].flags = MEDIA_PAD_FL_SINK;
 	state->pads[state->source_pad].flags = MEDIA_PAD_FL_SOURCE;

-- 
2.54.0.545.g6539524ca2-goog

