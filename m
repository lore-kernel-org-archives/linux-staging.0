Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42D27CCE0
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894981; cv=none; b=AaDjZK1epirjtQ5+Cjno7siBdqMKVGcZesTUwoxXmu9DK7hfveOzL6CGWEnQBWhvoE1N28SO62Sya14buh7m9LK9nPkYV7qR3AdgANIyAXcB0rEJqQ0+CthiQDJqgPbLJdCs7Aka6ZTO88btR2Ubso1PpTWOW1d0pwSKCbY3MGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894981; c=relaxed/simple;
	bh=57JGXTA/fdXCSn0kscC9/AVmQdlTfD8eu4WZnPnRQVY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g7cgrSad9D9Vw82aoBjKyWYkmeRhG+vxDPU95h9bobUtK2zxq98QB8AV/aMr7um9xHYxSUu2LoKlfLS7ICjbgyoMatJBgXBLZzsncGI0bIVL4t8XedgnwSGI4d3bd7e0A8uzwpFLb3LHDiBeNu3MMmBz34fYnAY9FTk6ndEBIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk5TJvxQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk5TJvxQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso58024115e9.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894978; x=1775499778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YW4vpcapb7NsWIMP+XtwAGqiYygoWvg26VqVJdKdXwo=;
        b=Wk5TJvxQ8S8nSvfuOATWJMiBzbKWO9zLZw1WDYsPAOnDvG6e/2uX9thuCETkJRW9F5
         Blor0ATUakDtWeF5Tyy211pRW6Apgm/Pb0kRMV19TaFc8Z6a4MvHexww7djCdB3rM5JO
         gA7MhJKU8dtmXxivqn3pOs550g2vlvnHtd877DMz0On4MIYyDzYuoNFCZ1f0hb393Duj
         DbHKOuZLg5hQEEmQhu5GIfIgvSftO3Id+8TkaKNoygq1X0XGxqUrwknV32ouNYzvSbKY
         5qsmkMEyFSgZ6lOO0Z7qDcIXpIjN9Jx/IqaMTYPOMGyNXmgz84b5G9NDqIMg3vicD3Fg
         vJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894978; x=1775499778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YW4vpcapb7NsWIMP+XtwAGqiYygoWvg26VqVJdKdXwo=;
        b=a8ep8o1bRcIGtMMJOivruqKrjr5AlinLecolFETygSYAK4zVAhRujKASS6wHcGh1DY
         z69GCaA//cxDTm4cSrHp0CAQG5mDCEbrWLgt6ZZNv+e8Jx3PDh3tIonq3H+Dh9FMO3D4
         sToW8/ShtA/cfJkMnfMoHA36ReGj8jVteLsfxNl6bhFKc/RZvBtxBu2nc77bGAXY92wU
         roW89PqOWn+tZJwsbmY7b7WAgX/6ziNUkI5QnALTH8gfNvr1fHygFOmS8gm4MwINOUbJ
         meg1PiQPYTQU84/0qtt7+lRWWeah9L19W49fgal17wrPjNuiYUpqc9rqLMt79uRWXoZW
         3gbA==
X-Gm-Message-State: AOJu0YxRHF8yfgc8BqVcSA5IbGDilJjWmtf/yCd5sW+8x5z8f5VItpD1
	HYys36VEhU2WHZ0q/XzC0CyaIYuaGaw9dWaMN+wAZEhpKetLoiuuGubU
X-Gm-Gg: ATEYQzyfX9eRBXkRUTuvHSO1Hrkd5dU5vUkFMKpt7ZuN4mmU5VIKE0SWfOYLM9JmoD8
	jiOF26W11ZH2akkwMPD/cvTjS5Vd1XQ7NFbHd22yE16Ik6zgPsuvJm4X384Ha6ZXkZsKT5Nspm2
	woUqHOl4H4orwBP1ac8ci2dwK4LzsGmsq4KWDMalmn0+xge2RRrBYSQvnve/EKHKxjpH2jNNC7L
	67Hzrs/DMIld/lXRzt4Xa5rH3cY630BvmeVL1+sn1g3SMp7gzOof1M7uttE94b5RhToOhKNCHAK
	D3BZsDSaABMk8gbMOmEMy0ONDD2x8jo/CXEN5+JkH5q3RIU1RaP2U0flGe7lBO9TGV71ycdTdwB
	HwovYZtENiLucrwTBGx7w0TrCLdYNdCJTwOBo1uNs8kvhv1r1gHf7xSleDzpCwjtT1cBPi0IJ/j
	zL/7B3Lk52JEwQuHIqXcd0zG5I7LhOxOGlpsb9orwN6hu7qgL1rqAw
X-Received: by 2002:a05:600c:a00b:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-48727d8ffc5mr236839785e9.10.1774894977929;
        Mon, 30 Mar 2026 11:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:3437:41ca:45cc:e6f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48733c095dbsm130198405e9.0.2026.03.30.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:22:57 -0700 (PDT)
From: grondon@gmail.com
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v2 0/5] staging: most: dim2: replace BUG_ON() with graceful error handling
Date: Mon, 30 Mar 2026 19:22:50 +0100
Message-Id: <20260330182255.75241-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Replace all BUG_ON() calls in dim2.c with proper error handling that
returns appropriate error codes instead of panicking the kernel.

BUG_ON() is deprecated per Documentation/process/deprecated.rst.

Changes in v2:
- Split into one patch per function as requested by Greg KH

Gabriel Rondon (5):
  staging: most: dim2: replace BUG_ON() in try_start_dim_transfer()
  staging: most: dim2: replace BUG_ON() in service_done_flag()
  staging: most: dim2: replace BUG_ON() in configure_channel()
  staging: most: dim2: replace BUG_ON() in enqueue()
  staging: most: dim2: replace BUG_ON() in poison_channel()

 drivers/staging/most/dim2/dim2.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
2.33.0

