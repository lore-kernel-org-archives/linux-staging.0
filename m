Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084B3176AA1
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808874; cv=none; b=URtmpvlhDOxNtfWdMfDZIJEOY1Uus1tOUcW651Xk3BaYblPlunFigk56IBCFrdFHjVUfoRfOY8iIPR+iNxnhgIQgTB0vYLJ0incG2Cd9XhczDDysP5ZouVE+4gUN4B4hmR5Gw+T9WAnthBVMY+5Q4osAc4FYSR8HemsEkKoE+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808874; c=relaxed/simple;
	bh=T4h0Qre/mIOSlMXo3Yr8NeEL2pNQs3X77eQfmfVCN30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QC2t/s4ruU4aCfvH+gDVDBs+q0hdFOdm0080WjOadgRzisXanp4XtmlBAGizdw420tzFT7RcDE+TKw+1tf3O0zRZ5CPWdyLgvs1djZ/+u26Ew84FhUPz+D2ETCfOIl4Hyz9sOjbmr86AZUSDECSKGhs4zAV/2UU/SGoeumFpuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fw7qJwDI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fw7qJwDI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ede096d73so47225585e9.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 06:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744808871; x=1745413671; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVi2C6WXa2d1wRatlCAKYxbFJ2sUwQ9evBa+lyOMzw0=;
        b=fw7qJwDIxQGmQwt+Vg38s7cDvbtdEwEsricgTeMV9w5/J0ap6y5YUuu578PArE4opr
         3OmmCq26XrmbJMklB4MnRtPKcyE65Fg3xAEaXujhz3BzALP/fWX196w2/1OAydlM4SBA
         JkjIIAxDa9GNhDbNCea7MPdK0CRX/pcyPhFsmU3G6v1T5yyPPMqdyxwmq0oFl2IhwQj7
         DVpc3+sqwFUWgD9uYYGME+0zMEX3Wb/f1y6S45D5fSIH68QkdenDRsu2M+jXT6CKXD/Q
         qZxGjRjtI6mvazeM4fYIOJuXMddw5/Em3WPUjfeHjPHWeOcQk+tHGJ9MD4ixfwMVTdDX
         fX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808871; x=1745413671;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVi2C6WXa2d1wRatlCAKYxbFJ2sUwQ9evBa+lyOMzw0=;
        b=O9P0VSO+0OqzHjYILxYNgJ5NIArFqK4V/VlxXpKe2qv+cYoCrVe7pbY6p2/sP2jI0d
         MelAJ276h78hEzEl+ULM0vVvjY9BeoEm3j7+HEe5kbBhMYbBSIbzYai30b2B100Zb/YQ
         T8mKDwaPxflK6XgWgo56OdvL/P6uryvP4VSlnumbuJG9WExCqsMpIsUghTLOnHzncnZ8
         y2bNK7GU/sqFRYVi7o0Ee/dJMv2M18mrB2Fn45X753Ezq80G7UexS7845ePePmfscwaB
         /n2zLWavH52+mF2R49k3bu+jG5t29vkeZPdm6XMyFKrqWRLKoRnZIi+9zj7tVbhePpCb
         UwOA==
X-Forwarded-Encrypted: i=1; AJvYcCWIxqGe7uT7CwESx8oJe30gfeJrSBnLodp6/agu6DTyTzJQuLzkOelZjlihVg/AXXInPtDt/oB8MlVfvkp+@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkj62HkkuDqH1l1etfO86sMbLFJmODWaTQpppOQ33VqrrwggiP
	5Ol/gjnwfhhNXFPjoWmoGUSnzAXOZVyx164BxqL3vodPS9QYD0Q=
X-Gm-Gg: ASbGncuhjFTVm+ilEaXr2FQ8jI6p5SRd99QRJb7inUEWAEA7MJWRjPfVScLMuHRrKEQ
	KmwXx58w9ufr+HK2cO5iZ6khc0zGo2j+WRBckpg1DNu62SU+27eIQEnLo6hB1lvFrN/7tQwtzza
	DOYFbnWN1e91StapJDoxxtKv2ln9FB7xHy32ZaXo/NmuunCsmPtoRcXeqjr9nCvCMl3Fd66h5lY
	ka389cJIddTn9c6LlmT5hGIf/7PjS86rmupQkjxEOEloc8THG9LfqvQySJ2xfAeTnx99XpXA0w5
	+/nJf37bHPm+AAHdTzBjAYPdpxGO/5dm5vVh4zREtKs/NsYxIJRTAA==
X-Google-Smtp-Source: AGHT+IFb8J+NNbk+VOYcmnH5z8UaoC9eNwMxuBvzfTteJDrUd57AhkcZ95OMgGfajO2gFLJb7lIQhw==
X-Received: by 2002:a05:600c:4e8e:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-4405d616aa7mr21535135e9.10.1744808870684;
        Wed, 16 Apr 2025 06:07:50 -0700 (PDT)
Received: from octinomon (ericanang.plus.com. [81.174.158.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58ca92sm20678415e9.30.2025.04.16.06.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:07:50 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:07:44 +0100
From: Jules Irenge <jbi.octave@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Fix Kconfig
Message-ID: <Z_-rcegWISUc6zhk@octinomon>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Chekpatch reports a warning in Kconfig

WARNING: please write a help paragraph that fully describes the config symbol
         with at least 4 lines

To fix this , more accurate description is added.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/staging/gpib/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index aa01538d5beb..1255035a995a 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -41,10 +41,11 @@ config GPIB_AGILENT_82357A
 	select GPIB_COMMON
 	depends on USB
 	help
-	  Enable support for Agilent/Keysight 82357x USB dongles.
+	  Enable support for the Agilent/Keysight 82357A and 82357B USB-to-GPIB adapters.
+	  This device allows GPIB instruments to be controlled over a USB connection.
 
-	  To compile this driver as a module, choose M here: the module will be
-	  called agilent_82357a.
+	  To compile this driver as a module, choose M here. The resulting module will be
+	  named agilent_82357a.
 
 config GPIB_CEC_PCI
 	tristate "CEC PCI board"
-- 
2.49.0

