Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1300B1386DD
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309786; cv=none; b=qId/Mdg7kGOLQuis6p3NJDpq29xUPfdu3t9DPyTTKYsxVj+TvQa3iGKXbrYQeomiYb156R0t8kQvyJGbrykOpV+WlWYHzrEXEeHCoWJUfYvmxIoSXei0XA+RCYNli5kaBw29T/TGpgeYz3eWG2KMOuCaNnE0/yMezrhQ19Y0s6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309786; c=relaxed/simple;
	bh=GUcMC36tpdSJjeu3d8N7xG6wpiIC/XoAMNEzmVdie0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=anppF3t++BVc2LG3Im7kMCYJzzS+zzjuZq+OiNTA258A/ARpwpMYlAvAA4oFlwGzr+woe2jYgNZIgg3zlHfu1GjkFHYTXjaL2hcvilvNrot6UCzXB9wJ2yC1OoHM5dAPuXxz1z7xAe+nXzOSneQC6f6/lGNS9snFPj0qNehy9jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7mV+njK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7mV+njK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42172ed3487so11594755e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718309783; x=1718914583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=73Ywxe+wInveR8HhNyBX0TlhPQP+xFRquIiA5gYW96M=;
        b=P7mV+njKvqOfgn/qL9tILes5cPYQt+4YzGy9FH1942IlttG2ts2nqv+TDG6Xh9IUg5
         xRYDp72UBb2cGt1vgx/7UXhEjt6j5ocSSF0TYux7iu8NS8K87wRt43xkcXxFc2N+v0Yh
         n6XoA2qb7xhwH3asgk1kA796x6lRVHi/IZCQ9oYTND8WiHapdCaRiaIWIwHASBl80DIz
         hjxz2Gvf1OjzT4QloEvbwnu+CIvvQcD8ZMnIToS+DLy2o0HsC5k1BUzQ752ocGVe5qYw
         JddpCrb3H9BvIkDSU9ZdPAmWj0k6EniX64sC2L8Bodee2AW9cD13NLF1f0iweZvGXJJK
         Y08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718309783; x=1718914583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73Ywxe+wInveR8HhNyBX0TlhPQP+xFRquIiA5gYW96M=;
        b=gpB59mtOgrljelvFXurE6Vn27rgHY2mW+iZu2U4WZVHFdnR10T8wGmopxTmmiJPa2G
         TSyFPohQrGLDevicZyhKymx9Fv4g6gvCjlRJZyjzoIMlle1ieB9cYREvm8WAI6m8W2Sf
         C94JvNwNk+IolnUa+JZg2FR2ftGhR5Hsde8aPeAtTsullwjIUV9mHKaqnheMNoiIrTgy
         fT+c891Y5LCwjsjYrMU4RrrUTy+ZxpPQ9MCzh5mR/2yDPmdG77UeqQuEb998SqmLAS7Z
         ApbVVyzJLLkMgASvy9ObEOvlCNSQefmoJU/Eu85DpkrWQbtEgNyUb8Psuj/XkKdfXo1y
         qQmg==
X-Forwarded-Encrypted: i=1; AJvYcCVRXFQ9fbNbeMGcWi84xwIXpIeqGoYM41fNhCsrLdLY8mh6Y1dOYL0cLWqeeJbRae9SjXsOSPsQFC4GPJY4FBXQtj5oJ261RQskbon0nQ==
X-Gm-Message-State: AOJu0YyB0rxP+bRfxKAi33TxYFpEeszchBfhCcKRmJr/mXhMoYd4jU65
	xNtJG/A+nY/OfO6nCgzUgdtd99SKaEQGTOHLPBPVnCiAt/LuPDpx
X-Google-Smtp-Source: AGHT+IE4lcWxBpQZAwuJHavl84PM9M87lK2v8B8FjG0I0G3OWtZcW98MRppDqmbvm9i6wNgeE8QJQA==
X-Received: by 2002:a05:600c:1f8d:b0:422:70d4:7e96 with SMTP id 5b1f17b1804b1-4230481fac0mr6907645e9.15.1718309783274;
        Thu, 13 Jun 2024 13:16:23 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de618sm73817195e9.37.2024.06.13.13.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:16:22 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH v2 0/5] staging: rtl8192e: Cleanup multiple issues
Date: Thu, 13 Jun 2024 21:15:06 +0100
Message-Id: <cover.1718309120.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused constants, macros, and structs. 
Capitalize a constant.

The patch order matters - please apply in order.

Teddy Engel (5):
  staging: rtl8192e: Remove unused constants
  staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
  staging: rtl8192e: Capitalize constant RegC38_TH
  staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
  staging: rtl8192e: Remove unnecessary pre-declaration of struct
    net_device

 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 9 ---------
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h    | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     | 6 +-----
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.h    | 1 -
 5 files changed, 3 insertions(+), 18 deletions(-)

-- 
2.39.2

