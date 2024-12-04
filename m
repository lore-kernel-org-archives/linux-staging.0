Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017A20ADFE
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324249; cv=none; b=UDVh6K1XP9oQLHoY6G1SO8a2kmU7IA1BcBQSZD4skK0cvqAnL8xFyPtmFFUw8vGReXDRPept/6rXjmwkb+UxyYdWWXLABXReebOB4DMgGAijwbuzHtU9/kEo4qS+HhJEvrhAmKR5yuMszS+6SHgHSVoUuT6z0NYfyKfm/prnhX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324249; c=relaxed/simple;
	bh=GEuCylRtOd7Usloo0EEytk0DH26Xelwxn0h3r0Wwvvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsrlBHYvCmW8sybKvVFyyitOS4BkG2CXDWqDzv7ZBm48D0egKbSCccnGIDS0Mne9ROiAiYj/whwgu25qsckJq1l355BG7h61+7/N87DBGDp6FGIovxhUN/JX0E1GgR1Qq87TaKfv2//yPM7ly4cUYgl7AOzL7NqYm4Jfe/4apho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vqf8DLUl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vqf8DLUl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a8640763so56825655e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733324246; x=1733929046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JvEa9vsa9JdRBPOAnu7Fa25rHqzBln2moKCPZNdENU=;
        b=Vqf8DLUl7iAo6IZ3TEjdIauBebVY/wMrQY9yaYRfYYGMqk0W9fqQ4EwiAUpTCrY94k
         XnOe9H8/hBIfOmc/A3eadUGd5l1jkrKuBbXT/BTomiHcMSnmHaQ0XABMT8wbOfuGF1Gc
         TMbTAP7WwL3DzuBx8KWP/6YarcctnA5uMVUCP26AiVIxIQJIyTyXLzTRlwvvQAQqMBF3
         OVHmMb7iw5bnIph5o7wWHfTVCOk+ttGaAF/Q5NDpzUryNgmXNfwjorJAKGFbipt6WKQ7
         lcOMpYAepcO3WLlQFgPsIyAGCC9iFdV9aaxXRNlxTFQPR4ebtwDkYMFI/CDN4kXRxKEP
         uIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733324246; x=1733929046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JvEa9vsa9JdRBPOAnu7Fa25rHqzBln2moKCPZNdENU=;
        b=tkM5eiUeHXLJ/s1xjI/4g7ymOtXMVzdprk7mSuMIm4xqlU8kCJcFqLXlOmZ9sDQzNL
         KRDWBhmululpYKF0TvIENob0s6ZcQkiM56LMMpCEkkwcGnSMmn1x/ZGTLa6edF9fk4kC
         LW1SFYbxGcQwpq+P/JkEGkyOgaBp2aORuET29cLl8MAd8VEAl4w29vq2kCfXZEobABze
         NqZ0I6sVjsAgi0+MvYDiJ286/SOtsL0zlcJNDlkt5seKykMSwrai4fZzyLofEXLM/Dla
         OZ/qEKAo2w/B7xsp72QkjBea6SS4HbaWaFoSTmOD4IeiDRCLeZ1vGLL/l+LG60uFHqRm
         itiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGgr/LFcRMIXG5PqBrJuuJWz8P7JPI3UcN28OR1Twc5+Z8KFvk4FwNYwi824NnDd66dKZ3E87sVJ5dlCI1@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb6xkPuaJO879c+uI1FuldCNYCqM7eRsShdj2iG+NZWslGKERT
	CkLcFF3dgWT1O9M7MbEK1bfoXZI8HQKBktetC7Yh2N/1yR3jw5pNl/FfaFPr
X-Gm-Gg: ASbGncsAzPMs5BDm9bc9mkqDYR5ko/GPzueuSieOODqhBaOHtPnzGpFo2yOh8ArZbCt
	7Yx9xeJCZvnavrwZJF0WVzBC7TrtN7o6prvHRNijli3x7ORrZJcTMvSXVRYYnZoZtcEA+XwyqOb
	xr+ckczsq66IAro51d8OKHh+1jAL0Qt/UXdItdP8xP/JYS+yOd5O3nbWYM8DxCPUn7GvhFAJa1c
	7WLwG6BeWMwaihR5+PrUGZs4wVuVzBMK8Zk+qusA0n4QHwEKKZfnVjPYVaIaQbxTphdFem4kXyb
	j5uSfKUaAQ==
X-Google-Smtp-Source: AGHT+IG6VCtwNN3Dh0zaDip5JgDiDs9TxLrgWM0X8H3c3JbWn35BWZOqF67YBwEV0ftj2+qLhx96uw==
X-Received: by 2002:a05:600c:3ca1:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-434d09ce1c7mr63470375e9.18.1733324246421;
        Wed, 04 Dec 2024 06:57:26 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527e8besm26678955e9.13.2024.12.04.06.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:57:25 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/4] staging: gpib: Cleanup and fixes for lpvo driver
Date: Wed,  4 Dec 2024 15:57:09 +0100
Message-ID: <20241204145713.11889-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the accumulated patches for the lpvo driver
Patches 1 & 2: Remove redundant includes
Patch 3: Fix protocol constants
Patch 4: Fix unreachable code

Dave Penkler (4):
  staging: gpib: Remove useless include
  staging: gpib: Remove duplicate include
  staging: gpib: Fix erroneous removal of blank before newline
  staging: gpib: Fix faulty workaround for assignment in if

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.47.1

