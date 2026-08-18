Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCD6420484
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041336; cv=none; b=OoUnKdhRGXat1mbX8k8TySXxuTPVS9ODEhDVr9gdD6LhhZA8u1ZdlJlh49bgKHgvbQQ1wiyqg9zuLiNN8oNFiU4jxJE2I5o6KSI7mL92Yh6gH02KW/WjFVnZKyygUYW4LfMppEngOXCvOZ84yvPVT7j5czz73O0Nm6/0UR8hsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041336; c=relaxed/simple;
	bh=29Lmzd2fQV+/6FxCrKRQqOtcDBZBWVQZxXhlE9e/jZo=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=cbgK4LnsPFRpRxTbCC50Yqh+eRzh7f/sR7ffoJ73YKiC/8iEni8TOMqSh2TWq/0fuBO5ebE6M7Fc4fzIu2j8IHDB8pXY3j0UQ8zwhItTCVOaG2nsGgOS3UfJ27SaggSD26nJuXRnkNNbSWSfVvT5GGyif9QynlbTG/rhBLekGrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svvFZMDn; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svvFZMDn"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39faa67fab8so26166181fa.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787041333; x=1787646133; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:content-type:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PS3TP+lrjbKGGHmwEmHvjD2zjs7dqwryTa8jlgq/A5M=;
        b=svvFZMDnCRqGQ4q1dCdmmY4ECdsS8FYOec+RCVIdr6bn8ZsPKQIxXCrS1p3qCtFhOS
         quTQwRY2Ws67CUkJgBAoqWuf+ElVuNJS4WJU6fnbQzjak39Qg7vc9sLDQw3YjN1UZCdC
         FAKYrPyC7B52BeBNAo9liiZqHDG8qjWM/yvphBydTGH1OVrKWpr9UO5PFOSHh3WZ2Xfk
         poTXCzKuuj3AhhCdQPyoVs4EoF2dLgnpdFWFavRr2/2qyfzO4/fyMRebEfJ46g1ET9U+
         IHY5pm4kp6bZE0SjkPpl2s701Z2NJNJaAVtaGNvbypkh1MmxdDJtAgedYDsJbkc6NVW7
         6vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041333; x=1787646133;
        h=subject:cc:to:from:mime-version:content-type:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PS3TP+lrjbKGGHmwEmHvjD2zjs7dqwryTa8jlgq/A5M=;
        b=iekaHYHz5KOmMcWSDWqARjpBd5LQIobAth1HMh8yTd52dtSYpiogKBYO9N5epemtws
         25yr28JiN6TZ4yN3TziNIa+FLSSNeoEBodWIJ4UrfWnrna09sLSFIs1a6BkE0ZeeRhi5
         OrsaDDtBW9UsneLQM8BJuQZ/NM3nTQx0s4VJi7UOUASBZgXi96vVLvvfz6EzoekMsPjj
         NBpgcTDaKYjsKO8Mk8JE2BHVtzTAf4wkxF2fh6aSAqXD76s9g054GUhZspiyD3fb6V2v
         5QURpu/6MkPVgm9rAXRmN+vi7KhcQ1RdPmcpk9oj78PorJcjFHS2bzsOUh9pzWkKP2Vs
         8saA==
X-Gm-Message-State: AOJu0YwyTWpXFhjWqqjzog6hWkRGY+7f/u3F07TWsMG2gYuLbfgWNFc4
	ImaHSqxxAdOn7r5YM0VcsgRydOtul8s79WI4IHIGqgu1vtBmRMbjjwi0
X-Gm-Gg: AR+sD13AxsP4pyf8mVKGvYYlCeGK9pRKokqIUpAPKv1AUu3BK4b7pXtlt+0P4RfOZgc
	MOHEPnZm4f6e25vXxCObeNVMXrgINZ2WODHWcHPHAmkfQAyId5oDnLBw7UhVndpbscd8ONP+s//
	C/irQ6V+LTNnm9yW8FxWkfAsnY9yV0IdLtC+DC6TFfxSV8yEW+mPyqSW78nkk1baqJpRGqEp5i5
	+pMuWOgFnoji3M6hjFUzwqF/g9C9n9hOWQQiTCTUXXD6SCS/bCMmJqQNvJ8trTsnyvJmG8+tErG
	OUpTK/onEZ8rnFGXnX/DFDMlkwedhL9wMzE8bcsml5/9OmJukeJDTEX2I+hLAXu0EQUAMn4ZeXE
	gjSWPC7hfjgwkL/84cX3MMNpuEs1f3EgLSB4psPURosSIxmTW5kCTUzFTrMb4KReSGCULAnU3PE
	Q2gTg6aMjcYn4K/m3FLJmdskagmytjffmfUfZ04VRRcQN+skFQ6qTqpQkboR3mak+z4fvAD7w=
X-Received: by 2002:a2e:bea8:0:b0:394:5c9a:f315 with SMTP id 38308e7fff4ca-3a1751fb822mr8990151fa.14.1787041332601;
        Tue, 18 Aug 2026 01:22:12 -0700 (PDT)
Received: from [127.0.1.1] ([46.187.85.167])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1a98dfsm10938181fa.21.2026.08.18.01.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:22:12 -0700 (PDT)
Message-ID: <6a841634.1f5f34ed.15764c.8636@mx.google.com>
Date: Tue, 18 Aug 2026 01:22:12 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6572360312566155718=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: qvkap <qvkapp@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasoorian@microchip.com>, Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, qvkap <qvkapp@gmail.com>
Subject: [PATCH] staging: most: fix typos in driver_usage.txt

--===============6572360312566155718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From 1efeca4e18fb084e21e8b1719953b076305ade3b Mon Sep 17 00:00:00 2001
From: qvkap <qvkapp@gmail.com>
Date: Tue, 18 Aug 2026 10:59:21 +0300
Subject: [PATCH] staging: most: fix typos in driver_usage.txt

Signed-off-by: qvkap <qvkapp@gmail.com>
---
 drivers/staging/most/Documentation/driver_usage.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index f1b6977f4..89ced829e 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -2,7 +2,7 @@
 		Section 1 Overview
 
 The Media Oriented Systems Transport (MOST) driver gives Linux applications
-access a MOST network: The Automotive Information Backbone and the de-facto
+access to a MOST network: The Automotive Information Backbone and the de-facto
 standard for high-bandwidth automotive multimedia networking.
 
 MOST defines the protocol, hardware and software layers necessary to allow
@@ -151,7 +151,7 @@ following attributes:
 	  pass parameters needed by some components
 	- create_link
 	  write '1' to this attribute to trigger the creation of the link. In
-	  case of speculative configuration, the creation is post-poned until
+	  case of speculative configuration, the creation is postponed until
 	  a physical device is being attached to the bus.
 	- destroy_link
 	  write '1' to this attribute to destroy an already established link
@@ -172,7 +172,7 @@ name in ALSA. The sound adapter will have the following attribute:
 	- create_card
 	  write '1' to this attribute to trigger the registration of the card
 	  with the ALSA subsystem.
-	  In case of speculative configuration, the creation is post-poned
+	  In case of speculative configuration, the creation is postponed
 	  until a physical device is being attached to the bus.
 
 Secondly, links will have to be created inside the adapter dir as described in
-- 
2.55.0


--===============6572360312566155718==--
