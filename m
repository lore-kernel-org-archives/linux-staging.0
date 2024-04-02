Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4461699
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056465; cv=none; b=NNV34J3gbeXlalKv9ZB5jk/NiqxQ4khqM6MhLf+QoA35dBcURnumUsDO5bb5JBXI0heebiHJ2HcEEa1avXH7WcnyedYBmy5THkyNQRPJrh6ugMxloCrp0Q8cHjyEIxIgFKO2wRJlxIVR+Q8ye0ZTZKNtwcPUPfW3sPX8ybW7HaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056465; c=relaxed/simple;
	bh=bg3FZCaHqZX06oJSKp6iBE/SGrAiqjVv/OdhY8teOo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H2VBOX6COwv4F4ChToYXFkrgp8JfR3yA+Tcc/MAy/obM+T4o7vc9G+VNJAj7B+5rTrky3zZdmb/1Mqsp65b9d+CjfgpOa1cOHmN7qqyCKP0ciBZ6l6ZKk05zXabtbkDsoOFwfVoOqO/3RDWas86omSJjpaO8ZpM0LE/1rvItWwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcytduWC; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcytduWC"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7e074f8ac06so1416469241.1
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712056463; x=1712661263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Rpe0ztnC/I8hQfOpeDNBquHJBgfBNtikMoRmWSLkcc=;
        b=YcytduWCqSVKiC6dGLzBxkQP0E5CN4OO0Zoud7JttVmJbPZwpYFTfkY2W9fC5iejok
         jz/dx0lgwv2RVDso+FOG2D4vO5B2+H9ODz/9Q11rilc/VINOgkgFy9fPiGhCxwRFYBxZ
         M+3boPvdBIQyrDjkZNktKSav7QWkyZMy07XhJLtd26Nk05IanEXpGfJi89mODPeND0Wd
         3vB5rX4XYTripJL5BwnEC1MMuYvxfcZY6hoOVEqV3HShSMJRxPjc5n6qwxo8pyNbsUtP
         EbBREkKCSjb3jNE1qEXiU3DET6lPf3Y+p+1ik6Q0upcdnHNmoQfWfDcXXwY+WeuRLcC7
         pszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056463; x=1712661263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Rpe0ztnC/I8hQfOpeDNBquHJBgfBNtikMoRmWSLkcc=;
        b=k8GbnXOKUEcmqi4f2cJaek5BVYcDC6XX4DzEWzvAWwSyNg0Xn4sODanxM7DBcmiTZl
         OhgmFQgibXhlUomNTz3DBPIIsUuvvRmjDDROwfc2q89NgKx1iBK9rYGkP2+Hk1hI2GyM
         lrIckmLcZp+mNM65KVJk9X+6Ba3Mwa9YTzPRvd84v0hHml562JAh4COFh5P4EedPyGXO
         W5HX/3kIeX6zRLAin0yyVPV8bdOWYf/CEUf9kaZKOgO/BsIFRzRUKQwPt0lOfYWR2RrI
         PldWtJFN6CpjFoQ9oxwB+fwDkV8N+I9VINytvGJ4EzTXD+Mphra8oSxRoZ1ag5m7gdDU
         GVrg==
X-Gm-Message-State: AOJu0YxYQp+33hH7GOIkMzY3L+geB9JQ33yyI8fIDHcWWPwk2RKnAeL2
	jZhIWKiVAUiQuw4Eavk827ONCz7DqKpk26Op8GDRq3RU0lVGNsu5
X-Google-Smtp-Source: AGHT+IHkZS1ozDBjeiZJKzzA9oQe9Tel5yd1op4D7xSCaoipnH4dQFBrlw96ELBRkTONCE1B/hOHEg==
X-Received: by 2002:a67:eec9:0:b0:478:5ca4:db7f with SMTP id o9-20020a67eec9000000b004785ca4db7fmr7964522vsp.26.1712056462663;
        Tue, 02 Apr 2024 04:14:22 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:2c6f:6cdc:f641:6ecf])
        by smtp.gmail.com with ESMTPSA id 11-20020a05621420cb00b006968a6fb010sm5428855qve.91.2024.04.02.04.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 04:14:22 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] staging: pi433: Remove duplicated code using the "goto" error recovery scheme.
Date: Tue,  2 Apr 2024 14:14:08 +0300
Message-Id: <20240402111414.871089-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset improves readability & maintainability:
        - Rename device related vars.
        - Update pi433_receive param type.
        - Remove duplicated code in pi433_init.

v2->v1:
Followed by Dan Carpenter's <dan.carpenter@linaro.org> comments:
        - Remove empty "fail" goto tag.
        - Reorder pi433 init & exit calls so they have reverse order.
        - Add "unreg_spi_drv" goto tag.
        - Check "debugfs_create_dir" return value.
        - Update "if" statments for consistency.
        - Rename pi433_init return var to the more common used "ret".

Shahar Avidar (6):
  staging: pi433: Rename struct pi433_device buffer field to tx_buffer.
  staging: pi433: Rename struct pi433_device instances to pi433.
  staging: pi433: Replace pi433_receive param void type to struct
    pi433_device.
  staging: pi433: Rename "pi433_dev" of type "dev_t" to "pi433_devt"
  staging: pi433: Remove duplicated code using the "goto" error recovery
    scheme.
  staging: pi433: Rename return value from "status" to "ret".

 drivers/staging/pi433/pi433_if.c | 710 ++++++++++++++++---------------
 1 file changed, 358 insertions(+), 352 deletions(-)


base-commit: 20952655235dd9b1447829591774f1d8561f7c6a
prerequisite-patch-id: 91943193af2fea74182be67fb583235a3fbeb77b
prerequisite-patch-id: 2cad031ba6a0782a67ab1645ff034a8be65c2e76
prerequisite-patch-id: 1a852ed8f9d133aec7c651fd9007e59e39c55fb7
-- 
2.34.1

