Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7582D59C981
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887471; cv=none; b=th/nHOF9xV/xsTeM7MsIGT/bRFXBF5GF9rhVzc7xMTiJ23scLL138Tv2kC8+CA2HeffAGxUBYcL56gwBAvvWqv1u4HkWb2IDwvQNv6ZIiVBvdxGaCCLLVr2w728LmVt9SEOIvOBOCTa1t4YvjH38x1zjZXm9KhNehEAW/biR0p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887471; c=relaxed/simple;
	bh=b5T8w0cEMi5RkJ73x3+2rqv0o4VB9b249w35/48vZcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbEfF7IBtqdj5srYb19iMHgcrHBNabrCvcEGq3x2X87QzgxgQP3gFsbi2IpQ3J5S9gQIOMGzs1+uKDQZLP25zy2DaoJ2V40m23PiTSnxBgDSNudfAXhpDlJdu+4KI75OUgRDCrhZjX+UQxsPO8yIgUKsO821aUkn58ENhEusqNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl7RuQJj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl7RuQJj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d91ff7d9acso41529325ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887469; x=1789492269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0Q7JOapEKemMn1ZeidqeX9LteZhFdWNHcdSif7FK/c=;
        b=cl7RuQJjX3K3+5T0Uyhd4vaZzXMAxcrjxTw6YVHPOOmkBCiyACa78VsK2RKvHQFKNT
         ZZxmM4Nj0kSfzPM59kgHOphzznYL/tTYcF51Ulu/Bdo4oEJ+2qIIbTAih3WyFtaR0G/u
         oXCiCsP/KrizyRjpMhdK+ifc2nJ+qcFqpS6pI6+KIpEvf7ey+WcQGhXwfEN67pUnJi/9
         9dIFaeurhcjRshPKuEJCO3rFYaveFqcvzdHywcyieP0/Q1U0pRZBGAWl0ElNpxdnBaVv
         wMhDhWqkVI+V0pfMW1DwS+lgBxga/Ch3yco3aOilEHZXxqs6UlB1bkpdkZF6TN2KPRXc
         IDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887469; x=1789492269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0Q7JOapEKemMn1ZeidqeX9LteZhFdWNHcdSif7FK/c=;
        b=p9GxX7T9/WeFSWbULaXXZzPocfp+YMzYh8me8PNAkKlgX2SsxSbC5XEyjiEf7E04J9
         6MBhEv4UDw28PMzWslGfT1rI9706BGkLTlmrlWPuUV9LJ4jGzTeu2MqikBFvCbD+vyQH
         /i5kVsqHS8SXdnWhWlhQ10FKD/4dyywq3bukZhU3x66zTtyBk+DCgkimELxrb+0G7KXv
         U0KDhWPG8b7fOeDVBmU/HjbeD+aYMIYuQPpNs+/HjgukaIFym2ohvyr42y3YL1EeOZty
         +CWs2YvZLVAOlgEABkT/xprZgm1ItNU3q5DK01NAdjQN7BHtkMfbaBrNR8s2urUHj5cK
         CecA==
X-Forwarded-Encrypted: i=1; AKwUvBz1YqHhSTK00e3ekiRUAADDMBRUFAEWXWkUT6BJjaXBA9nBqXyHcopttO1iEP9P0WNbDMIUQ5bjRkUgixBZ@lists.linux.dev
X-Gm-Message-State: AFuF++lVRVtRWpGmiygsKBeRdqEHaLolzrMfIV2uwayrnO9k4FP+3ZBl
	VtHk1gCQOvIihH1x2YwwCgkfvwV0kVylcEy+OUBkENLh41GBtmbUIJ4i
X-Gm-Gg: AYBFou0/JQYKGwUodMzi1EHs2++SKHhiqydvGrATpgJYQ/daDscAPt38UlJhoLtjW0p
	mqTTVyg3hepD+qCPjcWH+50B6ycMcC/y+BO1IfKVPaAH7l51cYD3KU69uC6OKHA0dMhPIlL12Se
	vu5LEl0JCI55zvWs/IPKvqa3X7hGYc01lH6KmfcTKILSXp1hMF4WHjfkwyCND/Ku0yFRttyp+iB
	hiLuLs6zU5DuV25fZolPy8U6vVVX1yB4wo/0mZgUEEcX2N0TIK3Dbi/xzpdXf9abu0EMwXO2LdV
	iNg1dufo98skaRZnKq1uSrB2Db3ei5H8DDiGead34+ye58WGjp/CWM0EI+4ZRZvyzTD603+eQHY
	k4Mw3ji38UzdAwBEFY2Q9JS2YaK+NtwWx/TY11+512lCB+V8CwitbOIzRwUYMEZKBp3TXjLBi2o
	1Te8ItjVgMrDy2OlJlBAnSv6oO8VNvvqbpHii1vcqUPNZ3bijKVyAG5+Gw017SWEmjzWNMkI7vX
	wbz3p7yOQ==
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr48752029a91.11.1788887468550;
        Tue, 08 Sep 2026 10:11:08 -0700 (PDT)
Received: from tarun-lywait.mydebianvm ([49.205.203.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm34852512c88.11.2026.09.08.10.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:11:07 -0700 (PDT)
From: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Subject: [PATCH] staging: greybus: camera: Fix function declaration alignment
Date: Tue,  8 Sep 2026 22:40:11 +0530
Message-ID: <20260908171011.4122-1-tarun.k.lywait@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style. Reported by checkpatch:
CHECK: Alignment should match open parenthesis

Signed-off-by: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
---
 drivers/staging/greybus/camera.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..9853bd60ff27 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		unsigned int nstreams)
+static const int gb_camera_configure_streams_validate_response
+	(struct gb_camera *gcam,
+	 struct gb_camera_configure_streams_response *resp,
+	 unsigned int nstreams)
 {
 	unsigned int i;
 
-- 
2.47.3

