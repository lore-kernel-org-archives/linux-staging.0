Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488CB405F7
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752627360; cv=none; b=n1fj+Y23wDvtX9qeYKvPAtUUXhAVmnOuUCRbcAVK9g8naopSAPUVABGR4DWU6nSq1F0RTAMhqJIUXTrHQTdBAQDB+79nYaY6RnmVbJkb5P7VxI8i+KGg6xFbLjzepSbo3C3ztgXmO/20OMQPYhY813rjOh9E7BXRSIk8gL1qLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752627360; c=relaxed/simple;
	bh=T3fgAhGPlvqDMh9Jw5IWDpv8Ko7kjyzgVgZFq/qJh64=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=SWA/j3ZWHImzbobT8HhBoRiXW4Ffa0qQtYF+RdEFVVIFJCCnfFSxr1TNL9vruJSufbYP5ubQcWZV0IZVpO17uFDIMUSazfZ6A3IOGlY2ewvWWCBUsQKsHkC9h1+T3xDhXACq8sZL6Ek/sEGiRaE/5lKrW3XBksCsMIWQmoeKsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNXCD9aq; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNXCD9aq"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73e58d5108dso767901a34.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 17:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752627358; x=1753232158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QP8PckmLEVbu7IC5hLeQq1qAn3hWWpqaT94I16i3aeQ=;
        b=CNXCD9aqZG9UiwsDmIOUvGYwxoPRuDOxhqosX+H+/8Qa6vQThVwKjTvjK+QOtgSTGy
         lyIAOmds8ihq3jFXvFUcURJ0VPlTokCXkAVQ0OqVbOK3D4Uu21tLS2QXEXIlkWr1FNHf
         5w7f5sj555sxwyy9W+PsGIb9IeVcxNcVgrz+1LFp5HOJHpK3KpZGCzMkTsbm63R9hCqU
         zIjERAFJvkv9il4D3tWC7iZk8wowE6Cletr8asoAzf1MzK6RRmRNSaHKnJkSdpyq0i57
         IbXAsS8AttslkFkGF+m2zSnVSgZH0ffv++AoUjbbEwY0Rtr85EF216htkKA3Jw3noyoi
         O+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752627358; x=1753232158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QP8PckmLEVbu7IC5hLeQq1qAn3hWWpqaT94I16i3aeQ=;
        b=WtRP9lTd3YWwKOlnW3SVCas2WJWvr8lrS5HSCZaEYiMuL/qxxPaC2H+LJv4UVmcWl8
         UEkiVZ5ONm9ZstgJiVIfGDRrP66mYuQ1YxnRXJ5BmZdrofmS/TGixHuCU2pji0x5vGzX
         ijz5zAurBkP/1P+DzTh7lvJKRVSY5pwtVmHgpLHqc1LBEv9YErwi/NKRDgUedyv8/fYM
         Lca10JxZ5BQUTGCyKD/nLzK3LzLoFJrSTAT4ty6hP7bm59P5IcWzLRHF/laihvTUbs/H
         X6uX158hw8vfOUoUqP/5NoIVGmCtoB17nlaq22RcpYIV6U6XjZJAowrPm40pxfzA4rco
         tSEg==
X-Forwarded-Encrypted: i=1; AJvYcCVzYD9lXAe0Zpy/ZibGy5LGGNPOi3Ey7eHAHpsJucnYbcU0znj0GvJ++YhYG8KxiVtfv0zvSWo64HHOKar+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5BiqzyIeElIDa9KesOucjQGNmmKZWIPc3l2mXeKePyw4xY3QU
	cLpNQ7ukJSK06SUt8mYlOQARpslpdk8UoNQMqOzesBJZ7axEg6MiVQ/L
X-Gm-Gg: ASbGncsKMmBLXKUdIm9mu2abxZ5d243+QeeXujTKOgWF3d5ZQDjIDAtOCFHJi1HzqSZ
	hmOYMJQmSOWXHRZHQRHRivhWKTmz1u5ZLT8Z5HJB2NDMVRwSis0a8HLVZCW/mTHiYTJvSWCuZat
	WrECEa0kZIs4ZdtktG0Q1P2lLbLg1pWL+LSHzgvh58E6QeI4nnD/t2CR8vHam59V0/pK5yj/et2
	DQPyid1dc3dX7GKtWq1wbodMrqWkREa+5aqSzQmqDY6s+Uma1JbXChAy/Y+wbUhk/XUxtYA4USq
	yEe19/TlIIDvAcm9U9qX2UTuBC6i0SSdAfXZthSe+tJ3+T6sY/2GuG8whviQPD/mNmQzFcukxlc
	bGJ7/k10yGpk98L6Quw3s2a5qxpPwMvNXhtFQbNlWEetXrTvawFdH
X-Google-Smtp-Source: AGHT+IGMZ9RtAkyD4qiFEocxU3QaoJWhrg0amNcLxCCMZ1WjXZjhbkAyLXZh8zuYkIxsAahZMgR9YA==
X-Received: by 2002:a05:6830:3494:b0:727:3303:7ea8 with SMTP id 46e09a7af769-73e64b12bb2mr1331643a34.25.1752627358266;
        Tue, 15 Jul 2025 17:55:58 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e56024edasm1035047a34.34.2025.07.15.17.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 17:55:57 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH v2 0/3] staging: sm750fb: Fix checkpatch warnings in sm750.c
Date: Tue, 15 Jul 2025 20:55:50 -0400
Message-Id: <20250716005553.52369-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series addresses the checkpatch.pl warnings identified
by Dan Carpenter's review. The changes have been split into three
separate patches as requested:

1. Fix const declaration for g_fbmode array
2. Fix function parameter alignment  
3. Fix CamelCase variable naming

Each patch addresses a specific type of checkpatch warning and
can be applied independently. The changes are purely stylistic
and do not affect functionality.

Ignacio Peña (3):
  staging: sm750fb: Fix const declaration for g_fbmode array
  staging: sm750fb: Fix function parameter alignment
  staging: sm750fb: Fix CamelCase variable naming

 drivers/staging/sm750fb/sm750.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

-- 
2.39.5 (Apple Git-154)

