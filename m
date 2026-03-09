Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D134CFD7
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 05:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773035925; cv=none; b=k4RvQa2MB8EzWGa1uvS/eJC94DCDW+LA6iZMEubJNeQONh8WgzQxUyBneO6aa1bqZd6LQY7/2oqQ/FTENywp5TKMlYt7jjk5plh8R45IWmEF4Ydurbt4Ifh6NuEpfCzDPqtL5ky1k1nCfhy1A+zFk0N7JDQOAWvbMAETP8I+0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773035925; c=relaxed/simple;
	bh=KNmwdvlWjUeCYR6ghPoXvJ/kO9KcJoWBSCJ5aMcifvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQB7HzUXLqbNsxp8nwWrKDwqFn5/79OcQZMjkZYWAyTmSBJCYcreD7Qe/ztLggu1QyXyn9iUzBi3pamqRKt6iYBV0jyn1lpgBFJ0SfaU5adCCvmz9IAU0POLF7HGcrEeb7itjJB2C7LwNZe9OX+Ay06HPCAJJ4aGBoTU0pYJQlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdnUsizK; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdnUsizK"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-439b9b1900bso5594088f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 22:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773035922; x=1773640722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LvaQBRQb9TfIOsrJLT5t9DbWINsLwuxD24ZJGY7qCeI=;
        b=SdnUsizKbp9NLMBIRc4RvunyRx/Yuz5iuNry92Cl29egnzaSdTyFANsMtvBVhtOEcb
         oEf+gBaP70Vc/8bFbKFPl7wmQII00Vlm0+QDvrqX1fDFMzqsinS/8tjU6A5ZXreEDF9Z
         0ShB8bMZlZRnPDjpPB8Co7SGKFUrc+KfB+8GyvKqrbiEma2J0EKUIjCS6egU/yQOv8Sx
         QMVOxcL+ArvtAQ6nut7AyNtWCtFtUE7n6fnkk9I9eOAAfMlvLLkgwS2lg2K1uTtUky4S
         37BTEQzEQxqFMM7dLz5SGyY7+40o0wz0GusX6dMABLXtHXY8gpQqtMv9xt8SjkigG1zk
         A3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773035922; x=1773640722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvaQBRQb9TfIOsrJLT5t9DbWINsLwuxD24ZJGY7qCeI=;
        b=ULnKn8r5LOkuGXPyZUD/M/zYzKIIlnzuqocPP+2uEM8K7UUYh0P0/bpQCke1TRfeyL
         +sM/Pwrp8FiW0TjV+A8cQa+5OE9EJf3LUTgcpT+zvnsbjUJip8RtcWeUHLhJPJMolm0x
         Daph7oMVEq7yFWsm0oTfbRcxgd91C+/VPoKs2OfZ69UaeQxsE0epzEyZnpI9vj6+f8jA
         R0Zs9E0dmktgW2Dt6jwANuK6RFQMJqTAV9aypnOGvL+XJQcEhBynjfbR+J4VnsiqiJOd
         Xtyy7PtjSYySnqGO1SIX3+bD4xWkKYhYTZyjyteHi7kNtmCy5DXXogqvaQHbByMduWst
         aHvQ==
X-Gm-Message-State: AOJu0YxI1hC9/+iQOFB7C3B1ee1VghJva0cbTyYay4jH7JPVeXriYbyD
	NmN7DwM9f9YvpphaDYwx03GboBt0XrKI307IMlObmqvgPOH3HjRlqxSj
X-Gm-Gg: ATEYQzw5TfkLCrDAML3DStXXScjMas5ai3nnpAY5Y+iQwdGWKGX8Xe1U0H3P1xj5/qX
	lgET48DfjbUd/U3b0MQ8RxpRCcxcJjtZ6r1YY2LfzsNJ/hD43KJGIVQ5o10SEHeNhc+fUpqjmse
	I7chYJyJHO4FcMovAHsDeeAzz2lht1y3Qynlgamclu/tFI4L1FrXLW7rtktCHuyNcfW95/O8D51
	qNusd+qxvIplfZW2u86GQk3qSD1AyjdAeE3T9hRlR6vKoPkDg4JxhoS2gicCc1Ual3+IddXt6So
	VV1tgwLZgagtgPc+YhU5ivWe03M11R0fDxZyLfgQ/NBKeUQsJ43ZUCYoMrHT9dYayDpS44PiqyL
	Vo6wJl/5ZrdQg9KRBrroNraKeUEOqYHrk9gcB5Bvrt0GkG2h+YKoEYka0CumPiw2oo7904UgoHX
	jEk7XkqRoKOfiyLRA1r6LpHBh8v6mszt9HU3Jmodnn1IPPfDL8eJJIsBaGCRuf+8hQn659dJZim
	mfs02twhx+4D6mOze+fGNRocIkpkGw1lvFMHzrFgNQh5A==
X-Received: by 2002:adf:f189:0:b0:439:df17:b037 with SMTP id ffacd0b85a97d-439df17b06fmr11414304f8f.12.1773035921580;
        Sun, 08 Mar 2026 22:58:41 -0700 (PDT)
Received: from sinandev-VMware-Virtual-Platform.localdomain (92.40.213.17.threembb.co.uk. [92.40.213.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm26438624f8f.30.2026.03.08.22.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:58:40 -0700 (PDT)
From: Mustafa Karamanli <mbarancemkaramanli@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mustafa Karamanli <mbarancemkaramanli@gmail.com>
Subject: [PATCH v2] staging: most: fix typos in driver_usage.txt
Date: Mon,  9 Mar 2026 05:58:36 +0000
Message-ID: <20260309055836.3741-1-mbarancemkaramanli@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistakes in driver_usage.txt documentation:
- 'can by used' should be 'can be used'
- 'config itmes' should be 'config items'
- 'isochrnous' should be 'isochronous'
- 'packts_per_xact' should be 'packets_per_xact'

Signed-off-by: Mustafa Karamanli <mbarancemkaramanli@gmail.com>
---
Changes in v2:
- Add description to commit message body as requested by Greg KH's patch bot

 drivers/staging/most/Documentation/driver_usage.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index 2fa8dea1da4d..f1b6977f4543 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -101,11 +101,11 @@ following components are available
 	   Userspace can access the driver by means of character devices.
 
 	2) Networking
-	   Standard networking applications (e.g. iperf) can by used to access
+	   Standard networking applications (e.g. iperf) can be used to access
 	   the driver via the networking subsystem.
 
 	3) Video4Linux (v4l2)
-	   Standard video applications (e.g. VLC) can by used to access the
+	   Standard video applications (e.g. VLC) can be used to access the
 	   driver via the V4L subsystem.
 
 	4) Advanced Linux Sound Architecture (ALSA)
@@ -121,7 +121,7 @@ The driver is to be configured via configfs. Each loaded component kernel
 object (see section 1.3) registers a subsystem with configfs, which is used to
 configure and establish communication pathways (links) to attached devices on
 the bus. To do so, the user has to descend into the component's configuration
-directory and create a new directory (child config itmes). The name of this
+directory and create a new directory (child config items). The name of this
 directory will be used as a reference for the link and it will contain the
 following attributes:
 
@@ -129,7 +129,7 @@ following attributes:
 	  configure the buffer size for this channel
 	- subbuffer_size
 	  configure the sub-buffer size for this channel (needed for
-	  synchronous and isochrnous data)
+	  synchronous and isochronous data)
 	- num_buffers
 	  configure number of buffers used for this channel
 	- datatype
@@ -229,7 +229,7 @@ packets within one USB transaction. This renders
 bytes for padding.
 
 Note that at least (2 * subbuffer_size) bytes for isochronous data or
-(subbuffer_size * packts_per_xact) bytes for synchronous data need to
+(subbuffer_size * packets_per_xact) bytes for synchronous data need to
 be put in the transmission buffer and passed to the driver.
 
 Since adapter drivers are allowed to change a chosen configuration to best
-- 
2.43.0

