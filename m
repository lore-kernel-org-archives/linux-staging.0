Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE213A27E
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725098924; cv=none; b=m3gW4L6h5tUtm2IG8ZU8gkItAQvDFjqTub2vlVtIss5EuzRSNh9CMN/kgLQPa66t6gdsCRYF56PjQZr+O1C6/MA6C6vopFT+YOARAjxAqvV7//EJEN/CYsyFw9Bg6F1mokKwX31mwurkgskhLUEg0GqXJPhPZ9FgnVO/4OU9TrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725098924; c=relaxed/simple;
	bh=lRt8QXBAEMDEHudWZcs6l/mS4eKC8igXg3gXJoGRItY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwnOibQvLuhS6/s5NFBedoAR15MhDaxUbztiKa9cRnNPiOe94h/R8kS7oGZmrtsJj1XIoSMW7MI3wcX5DkJHwipKDuSL4Lyk/QYU5RwUJ4ms4j61ZthDI6w1ViWrv493NtRWyhk8aKwIPaXf3xwGmFexeqTCCrN4OgyYHzrbLpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N40ZVkFC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N40ZVkFC"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86933829dcso319939866b.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725098921; x=1725703721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ACjwtThAqKgLa7HyubbEeDyJr1LzZplkXNL6wUC0YY=;
        b=N40ZVkFCvXhpYL0uSdGrNf3RjD7Xk3KrzMPKXhInKkYSMgixFuGUGfbrK8fnLZvrVC
         e5ESEGAGUHAWHEh1NcEBx97SPJ3lRnihv9O7xVkl+z4bKJkVxiSUT7S+7mNyhnhDZNzx
         Pl49mpPuozQ1vfnTZdSSN0wU4Ozt6kfIpeLo/cMF8gVwzyTP0pr2VkaAoiIgL2eYHfvK
         my9ezOKEDHGw3g1Y1/9LmP0xGA8ONyD7L8KNJZxF6rpkyHzCCOMfvyR+jS5Xi8xTyuqG
         UQIXosIUDexbHvgGVb7x4DIObuPkRv1oQM0Q76fRvHPx8ww86gyk/Jv7g0m06XX9SskW
         YJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725098921; x=1725703721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ACjwtThAqKgLa7HyubbEeDyJr1LzZplkXNL6wUC0YY=;
        b=J/QvL+e7uY+pudKNUc+f2dbxf+CXMwLmMRwAc2zrFVtLCxuyXRxs9vLrO/PD0NruvU
         t0izQ0aW3FPQfCrlFPup/ZxY2T9fGMHbCnLBASoAvMDLSP1qc0mgJEKxpFrQVvZ8oQWy
         Tj9KBqoeNX7wXq2Fq+FE7gLpjYFQNEY7eTzs9LcIzi1ZLEhoS8JnW88VktjPXcIFAnYb
         cFBLzlygVGzqTXkaGnmYmF6MC+X406zsYrxSeW4cB0q7+1EklfxEdnAc4ppIY59ri+/S
         J19Ipow8bGWQWTgWWQrxpPEDSfNRW6YLDvF+gvJ+dPHpmkpmd+Ol/OFxmRW5uh3ct/a4
         qKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Vi7dIX/xha82LD98ehxLd9OCZJxWzgyS5Ba/JezXchPbL+Qf7JhGJ2ZsQjXHsyBNQxcrVR6OuGrFMnEo@lists.linux.dev
X-Gm-Message-State: AOJu0YwFrMiJTda5WkfULOBL6iU2ruf1QSCzWv9KckNiXCcggs6duDgQ
	9/OtYncgUOnztQLHE25GmeU5/6/5ZDp82t/rDI+a0HH1Ox1+qrPD
X-Google-Smtp-Source: AGHT+IHuwwsZPbZeLM2KykUtGIG0bkb6V/bzneibw2uMu1Ny0nAV+YxFoJsYSTwR0eab8RDGY36vVA==
X-Received: by 2002:a17:907:2d12:b0:a86:938f:e84c with SMTP id a640c23a62f3a-a897face2f4mr580232066b.66.1725098920183;
        Sat, 31 Aug 2024 03:08:40 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aba11.dynamic.kabel-deutschland.de. [95.90.186.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989021973sm307444966b.82.2024.08.31.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:08:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: rtl8192e: remove RF90_PATH_{C,D}
Date: Sat, 31 Aug 2024 12:08:04 +0200
Message-ID: <20240831100809.29173-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unsed RF90_PATH_C and RF90_PATH_D from the
enum rf90_radio_path and adjusts the size of arrays that are indexed
by values from rf90_radio_path.

Compile-tested only.

Michael Straube (5):
  staging: rtl8192e: remove RF90_PATH_{C,D} from enum rf90_radio_path
  staging: rtl8192e: adjust size of rx_pwr for new RF90_PATH_MAX
  staging: rtl8192e: adjust size of trsw_gain_X for new RF90_PATH_MAX
  staging: rtl8192e: adjust size of brfpath_rxenable for new
    RF90_PATH_MAX
  staging: rtl8192e: adjust size of RxMIMOSignalStrength

 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 3 ++-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.46.0

