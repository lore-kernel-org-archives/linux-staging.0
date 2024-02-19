Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D20928DDA
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708341795; cv=none; b=IB2tnfmJTYSXVSDD1gmPHIx1MLP6QjZ0Famcrfj0YpnM5lVL30EiHldvSIPeNyAmE/49YhNohVO+lvt7dD/ycZe1bhM0lcffPz2ctrZp3fZXqtfXPiILni+OCfTTnZChF9gSPUk+wjDDbOnlwQ9kcAq96x71xjdAr+ohvrr/OdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708341795; c=relaxed/simple;
	bh=iK0e+c0J9gt3ZVOym87zEAk44jIgYaxHSgdf2FUECRw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sscw12smzG92ZHRTF1Dg7Vjje9IDfPqtntnCLwnsuyNkfR4bfb8euDJEg4FMNtkw+pNjY+HQgwUhWFkErP5pDIvZ8R+ru81icSm2wUOrNFOO5UbAa1uEdqqDjZFYIsDd/0Fula/CaHM6X9q4SjDZpdiiWnSOALHFKytODxVlVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak/YmvyO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak/YmvyO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3e8c1e4aa7so78713166b.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 03:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708341792; x=1708946592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmDgTWHbaX2qtPcYpGBlJHczQDop2U5oSFjT56bWXAk=;
        b=Ak/YmvyOZiEllCwIRht7xEMfle07kq85qOOwoUkkZSYT11B6MpTVtqyFtkUs8duJP/
         Gi31okL76fITuQMzLT81hkcjM44WgwM9NFfN8/JxonmaE3jjN9gAchGoPJg1VavH2AqY
         C0oHyAgpWSYWJoXDBWPAH8Y3ef/dlZfXDBxf/RpB1fxaPWya/U7EQY3CQ+uaznZCwYcb
         J03hUGYO7BVCvZrfWltgLusvx46OMmsRwPTuLg+PWRjwCEcNbecRx7QhzZVqGvZJWMnS
         BEdSeqEeuhvNdm1xExDKE9ZIOWJJ/ylYjFKKMr44n0ED+yjG6ci0sHS21FrSpoVsD9lf
         qPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708341792; x=1708946592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmDgTWHbaX2qtPcYpGBlJHczQDop2U5oSFjT56bWXAk=;
        b=hKuR1+maByiSb8bGnbmH3WiA8AvKYKNKA11UP5A3qeW0MBPcVtIBP9z0z643JZq0uO
         I+vdQYlyyGDqldVmGernUJGbzFhoywS5/GCWVjvzab/dstI6Wj5JzzHfLoxDxAV8jj4e
         zgnA9ML8u0uxXEe9OmdvCq3CYFFqZWzm4mgozXys2C7Zn68qnJNYAUMBqD96SpyFqf+9
         1PSzUOrW6CR0fZ2Yq84bsrlBmMs3vAxpwz9L41HJTeHmJPXhza1ocLCSxktJ9cEVlnAP
         5AOVNTQXnpsQZebzlt7s0ujiX4cWlQ8SYlpCR1OQhfNJ8Y+maUSo8bCP6dQgNCtC/hIw
         NkCA==
X-Gm-Message-State: AOJu0YytfgY1dP0txVqZkAVR8pKo5P7XeNr3pOk140j1gxnyO7qhdzP5
	eliYSBDLHv6bew3Pf7sQHg8+rClqAuSziRp2SN8m7jPMvu15mXpM
X-Google-Smtp-Source: AGHT+IF0+e8nNULuQdit5i/onzkhM2XG35UGS6l/IhtByN/m7Oo7XmQAuUWffmZBjcClq8nu1hedEA==
X-Received: by 2002:a17:906:2ad4:b0:a3e:19cc:16a with SMTP id m20-20020a1709062ad400b00a3e19cc016amr3606631eje.52.1708341792503;
        Mon, 19 Feb 2024 03:23:12 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id ti12-20020a170907c20c00b00a3d581658bfsm2826495ejc.24.2024.02.19.03.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 03:23:12 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v3 1/2] Staging: vc04_services: bcm2835-camera: fix blank line style check
Date: Mon, 19 Feb 2024 12:22:33 +0100
Message-Id: <20240219112234.8673-2-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240219112234.8673-1-mo.c.weber@gmail.com>
References: <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
 <20240219112234.8673-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove blank line to fix checkpatch check:
Increase readability and consistency

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e6e89784d..e6ff5ea04 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1006,7 +1006,6 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-
 static int mmal_setup_video_component(struct bcm2835_mmal_dev *dev,
 				      struct v4l2_format *f)
 {
-- 
2.30.2

