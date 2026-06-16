Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EB421D596
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 23:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653980; cv=none; b=EUmHhGs7D1iLoJog5gDnq2gkVzwi4uOXvX8BCLTbGDRrx0Hwu7PI0zPQUW3AaUvCi6UT3yqVpNz0c4O1hKyb9MJTuoV6saxP/apc5a5uZkMqMxl+p45XsqkzDV0aeSKmttqVzZmOX/yxZcNnwMYyMsejjQ5Imhx48fvg8X2rQGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653980; c=relaxed/simple;
	bh=gTyXTQUpEpMt5+p7hTxckW9t05N383tWwh+e1isccFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FE9e6X7PaVGj1CHfOAk1ZwbQvZflhYo4KGisIg0LLNpLb0FBZ8K66zAvUb1ERz69GITg3smoDu3MoHjjsBN4vrUweIBZDKSafigpH+n9MDWqxF0zgFFkXN4SOEx6JaCxT9RfiFMxee4GmZ5ptbE74F8qGHCvQ8djx5HhThoGNCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrTQYCoq; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrTQYCoq"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-30bcdf8232fso675719eec.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 16:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781653979; x=1782258779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2Y5hFlg1Q63UkOtbBytvGSnD7oYUmWUhqg29Zc9dSg=;
        b=XrTQYCoqjXLSSc8MKxTI2Y1Tm6BZYVlots0dUIhD+yraQhWRPwZcUP7Ez1tsZz1j6u
         8czDqxKzrSKEjB6qhpjvRCBekcqbmRq3oxXKoEVxVsv7cQ2jqHQaKz73AKh0xF6riECf
         IzW/KeFOiu0xoyka/1KSQJrWlSLCcGOqtVlM7Lu8E/4kTelkmr1+pspOiBg8NCQCNVpo
         FarHq8hNEAYg3t7GwNyTJMuk/uM3t/fU6j3I/YhuFKwfZxG+H9FL8nUZmNI6hmiwHiFz
         bi0tHDgU7sb+nULfvdX+8ZI5cpZPaPETR2k4TfGghLiAn/PriXYcswvSoTwocbMA9b/P
         rIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653979; x=1782258779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2Y5hFlg1Q63UkOtbBytvGSnD7oYUmWUhqg29Zc9dSg=;
        b=e9KMAFTg0mgD3y+tzC7jfjtbLvL9jYy9e4JQLjTJdwaM6At39Gp3P6UvdygD8yf3ty
         hlGByI4gtjaMvG0EmlzW6yEMs6gEDMA50WzVpYYfTIo23FxKtoKpvzyYfFjCHTzlMv+X
         L9IvatVdJ1yVDQJarlu1gnsvxkWiWu36YYhpHvuHP0jczDAgh3d6IfxtqKdk9XmXmlth
         v8jYuP3tOe0sMCNOiaGo8bgvsWU/SNWbgZHqKfONGSme4rgho4ZCE7LkJeYgSDbh3XNL
         EWckuNIc7HpdEZUIPApBo/NpEBIobkAFuMZIOM2vDg+8tmyVARLduXMD7g6w7o4jaDF+
         n3Sg==
X-Forwarded-Encrypted: i=1; AFNElJ8DIiMTHYo+8Y7RtJy5FHmdV0DRRfsjYJGXLkPeyzhWm8WASobRimNe71mV7UQ0g3J0u8ao9o8l+Zkk8G3O@lists.linux.dev
X-Gm-Message-State: AOJu0YwBXrGKV01FbeSN9aIwcuk8xLsE6kaXIZtZRLXxOWL18sqArWFP
	OOETueF3pqE7ePVLW2j/4kruGUpzthYhbbLIRixb/oRN4F0xIjTaKH4f
X-Gm-Gg: AfdE7clRKETIb2m+Fujhq9mwaQLhst4SJoR3UsXsRtZRuT6rl+dGIar8lbvDosagKVv
	FM08RSMJAJMFk5lKRkS3MzKhD9HXG1erfat/aja5bJMuP2Jcfszpdz1/mNYzc2CNf8c0SHWlyrN
	gl0SP7KA9IuEh79DfK2/Tno2PMUrZj3bVIcAEy6a/fVumEJqu1vwmXrCxRK5VPpesWi5FfqFZS2
	CUX3pCVrVhnAVrltIiFK/PW1gB6Iu9lCReafNQaQI6ZE2ambvAsRtxVXfPJVVdg0vOoWGuPvnQv
	lZtwBAxc1pXLYeEMtfKlpK1MYP9qMBl1nX6cEdDGe/Y2deV0vpora0Mg1yS4AeXduVbUVoZSCY8
	X7a5ldB6gAeV7VE/GNFiu8eJ11zvorjhmPJzLKajQ3c9v4mrylQLbYqe18JllRnZaJw11uBy8oo
	bK9E8qRQoitzvBihks/wblNX6lfFA4DLjwKx6D8Jve2oelKe9VfIkmnHc=
X-Received: by 2002:a05:7300:2211:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30bc9ab2f4bmr876673eec.10.1781653978508;
        Tue, 16 Jun 2026 16:52:58 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d3f20sm20208153eec.9.2026.06.16.16.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:52:58 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/4] staging: rtl8723bs: convert update_attrib path to errno
Date: Tue, 16 Jun 2026 23:52:37 +0000
Message-Id: <20260616235241.99076-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series first simplifies control flow in update_attrib_sec_info()
and update_attrib() by replacing goto-based error handling with
direct returns. It then converts both functions to return errno
values and propagates the returned error codes through the caller
chain.

Changes in v3:
 - Split update_attrib_sec_info() errno conversion from caller changes
 - Keep update_attrib() using _FAIL in the intermediate step
 - Convert update_attrib() and rtw_xmit() to propagate errno

Changes in v2:
 - Keep braces around the multi-line if statement in update_attrib()
 - Split errno conversion and propagation as suggested by Dan Carpenter
 - Change update_attrib_sec_info() and update_attrib() return types to int

Hungyu Lin (4):
  staging: rtl8723bs: simplify update_attrib_sec_info control flow
  staging: rtl8723bs: simplify update_attrib control flow
  staging: rtl8723bs: convert update_attrib_sec_info to return errno
  staging: rtl8723bs: convert update_attrib to return errno

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 55 +++++++++--------------
 1 file changed, 20 insertions(+), 35 deletions(-)

-- 
2.34.1

