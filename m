Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102652D7393
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877651; cv=none; b=O77jnx3KN883iyznE4bYqNjg48ptoJV/EEtDnrrydsftYJaQfTgkMb1X00ZDGbwQOhNxvwW4tNffX5pDxsiY1vKggLBhLw8TGp2DXAWez3nmj7AthGx7KChfHCP0aKPtZYF5Vxqs/F/CoMcqdQO1FiY+ltIZMy6F7Y8qH5RybnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877651; c=relaxed/simple;
	bh=ne42xYajKx8Kiea21amC61A8URblNNdzVSYQ5+DXQtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvtPaDzKHj8L+CTM4xsLvNCBwdUDyggtBGe6EWAtgH7TssCyLwOjX3hixTOygPmJI412JHM37+eyyqRQeM6mOImY51xikdTaXvoNhO6R1+glJBMfOp4tz72K7YtNxXBpLrGxGwbL0aBFqGCr/xrZr47xajnCU7HNt8JDaK68HTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q1SOneHt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q1SOneHt"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a86bfa2a4eso1678279e87.1
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877648; x=1778482448; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=Q1SOneHt45QURe8LKjDMB28c+T/Y/X/NfvRckknytpJwQeAK/tAXSbUHnh5oRpu1mK
         OLjh7cmHOpGCchl0WhJerNgEkeZTuxwFtlpbHtE+Pi6v0I2dwQQJqPPQjr2YcOUNzK3x
         Rzmp9vB1hv8C6PAmViLe6RwMxx0ExzjsGESrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877648; x=1778482448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgEZKNrl10DgxlH1xZQyC/yRD4psOac+PKsvu6TEYIs=;
        b=iGNeCi+5G4yNyYGSg2daF+ZupSOfH0G87fCSI6SUKiIXNhD4rrzYA4GcCyNQCJ36Kb
         J+81p/REtuKN6/YIrxjBU2jfjngzzO+lip044P2E+iCfk02FL2avEMYLMCx5ZaOO7Upj
         Ji1+i907As/buE5lQsBh89+Z2OPgsYxu1QvRT0BQ58EQB+dKUAFFpWONKuLoyDI1eIeO
         kV5FzrBK2VrUP7PFJmJiE4WFeYT3fy+G8rc7QUOXUhhajwsG+1DncgktoVsgqqNvG6YS
         zsONmB4kzcZxhqpfZWhI+ApBcGDeAmviqAEYG0sWjEcwcAfVlvinqrmgWTOAUcSTB5a5
         V/Sw==
X-Forwarded-Encrypted: i=1; AFNElJ+ecJAcXifQcz7tDtAuYub7Xvl+xxMsCsvdYLNz90c5rm+WQmWDvvGRyjo+S0puPWW4b9DD5tvGXR2mkGc+@lists.linux.dev
X-Gm-Message-State: AOJu0YwHOciWMHYScHZNajFaCWVWexcD6lpaLjsOba5x48NIHDgjRRGb
	pS+KtFlKZ1jSboWCvMwHSEJKyjQSaMLjpq6l+w6t5RwcXSWLetHQsY+VvAlVX9EIJA==
X-Gm-Gg: AeBDieseXY7WLfssWOcBewnjQtbcWkr2T1uC4qf/4AI5h2sKNcZf7H1Y2fLSdZm72vK
	eWhnCRvNIppXn5O90VqaH9W8R7wuHI/WWaSsUMzmdH4GU1SCC1xk5kvUdvdbVRNws5EjGyE17qZ
	Z9N+mssdYIkDhyqDikR95NB8F/PaQYj7oCPtjrhSCIj3hctSHAVgG0eksQiHC7w2kgdNOCHaxme
	fODgphYDfsSGlv6wOMiXnqscvneqIrXxMSQzxTxs7PkW9EDIbxiU7O1CIyz3ILAGuK8r756ZLAA
	ZORiM4PX6MKVlOd7rsWmbSAlPKYYCaH29g6NWcH9LeOVpDPxkbT6hDVwcfuzb/edRLnTcuHe+9K
	DOOENTdwO5NsmAwVu2AWS181A+BsYqUcnbRhOigCPs3F3LB0LFO4o7WOL1CVrX0TvTVYf/gmWeb
	sVUV2oSbPNXXLrrl52bfd7FOtVXgXltvhZrhAHJGtxggBwQZr/d6yHlP0d2DzbVZ8pIB4DDXqIE
	2sf7gDeFFmrQviaAA==
X-Received: by 2002:a05:6512:114d:b0:5a8:7352:a885 with SMTP id 2adb3069b0e04-5a87352aa2bmr615908e87.17.1777877648177;
        Sun, 03 May 2026 23:54:08 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:04 +0000
Subject: [PATCH v3 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-1-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code to make it more robust.

This check also fixes the following false positive smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5516b2bbb08f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.545.g6539524ca2-goog

