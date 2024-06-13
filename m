Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1C144D12
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718285388; cv=none; b=Qlo586X3ae9t3avd2GPw0q9m8zbduDzPOT4fHmFe6Xl3j7SbHAyTxdnMFy7MKEXEa2aPlkHY0n5jna+C345fadqVC+Wly1e3EAn7zb80eMCn732duIMV1G35+toSn5wnNFWv5uzFOJWnBJ8iApQ6p7bL1WroGZ5lov4a+smlBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718285388; c=relaxed/simple;
	bh=9YjZ0mNxtiI0w3TDnF6tuEkwNoMXfJVq5u/FUSPFA1I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qZWEfrk7OifXEFxMo2VE/sN0vJpgMyM8WETbIT+nVzr1M5LYsRNlj/xqGwuPqDhSTmtWHJsIU2t9ox9MZNOyRHE/WRQJcA+1Cfdvd/1MsGsNwDmCGKkV6peE5nGFzH43aKrOYBZQ42yoM1XE/OPWSd1PpMwtzbiDsAL4ikdA4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnJldZcA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnJldZcA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42198492353so8554345e9.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718285385; x=1718890185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aj73urKvgW9wZChdKp/grUo5S7WR7EBtNMzzOYz9T24=;
        b=PnJldZcASrymMwRbI7afzdn+LHR+HICI1yu3rreus7hXJxCnC7XK54CcWCWdOh4hPH
         B1M7brFG7aCkDPFa4RR5VpL1SqmWUSLwAUMWNyGD2qyHdEuiQhD2iOBGH3PStxrcL9sR
         N7ES1PNkmDLb6/74Z2OuDUSL6PX8ds0r2M/eyScLE0/FryQg2jznPwD/uAIIeVdkzWFa
         zDUjhOia/s0IrrEgO9ViDVMviX815YIBVgSzKXzIw3N5b3m2nXo/zg37UM/jxQoosN0I
         Er79q1F6cGb4wgr4y/b6EGlA62YZoHZl6dYXbnXeDJGu5Im8VKOqKdvdmx8uMrR2gqIF
         ojXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718285385; x=1718890185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj73urKvgW9wZChdKp/grUo5S7WR7EBtNMzzOYz9T24=;
        b=n5D8SAhd+ZmPWNVoHDNUNxZORjDVezIqGLpUGd5sqqFSzqLFQpsHnMGeA0j1cl27xb
         3Pk3HPdRtrKc72++8ekHPGcnXbo2OTzgkObdRjK+lnxkPyD74fKelUvMea3vJ1wa2U/E
         9JCmnBQTfWEHCNinLkplJ5gr8M/8GACXp8vjw3r5kGJ65qtjVtqWRZQ+rlDLe651VNjA
         EmxrkjI3lpjDRfnfZSSB3pOseGcXr3BFRWn1uO8g+fOZiONcTTSXPAI1Vwp0n+i7BNCa
         P2V3sKfOPxc7IA9oXSegtMAQoiqJ1QCTz1E+EEEhOXOTPpeWhyg3H6vCyagNwNCRNlch
         n9vg==
X-Forwarded-Encrypted: i=1; AJvYcCUAZn5tCpH48zxNxK0C3HYGnmuhtW+QBSNMynpTylJ4ZRtkkRVgkDuA5NRO1WdSq5XdlGNI+ITR/77YQO5Qv5cSI3ZfYB4ZWYBCEsekbw==
X-Gm-Message-State: AOJu0YzJbTUpbfpRi8Ic9VFF0DngePvE9BOpfdeZ1x7kgounnShlh4OC
	8/of9s0Uv9yR6fgABZNU6WQMOEDwKZGK9yirLYqHhv5LCpfyBUn7EyP5nsXv0bA=
X-Google-Smtp-Source: AGHT+IGN3ewMVPxG6hTEa9MKx/jd9wdA02rG/0ezuJmL2oalAxDGMCY9OKmvZ+w1oQsMikOP8XdAZA==
X-Received: by 2002:a05:600c:1c83:b0:422:1609:a7db with SMTP id 5b1f17b1804b1-422861ae833mr42397645e9.8.1718285385168;
        Thu, 13 Jun 2024 06:29:45 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422d0be1424sm29981455e9.12.2024.06.13.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 06:29:44 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH v3] staging: vt6656: Remove line from TODO
Date: Thu, 13 Jun 2024 14:28:53 +0100
Message-Id: <20240613132853.2249-1-engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove checkpatch.pl line from TODO as no valid checkpatch recommendations
still present.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
v3: Bump version number + add version history changes.
v2: Revert the parentheses removal changes.
---
 drivers/staging/vt6656/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6656/TODO b/drivers/staging/vt6656/TODO
index e154b2f3b247..876cdccb6948 100644
--- a/drivers/staging/vt6656/TODO
+++ b/drivers/staging/vt6656/TODO
@@ -11,7 +11,6 @@ TODO:
 - switch to use LIB80211
 - switch to use MAC80211
 - use kernel coding style
-- checkpatch.pl fixes
 - sparse fixes
 - integrate with drivers/net/wireless
 
-- 
2.39.2

