Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF32C80
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 20:36:06 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id y4so671383uad.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Jan 2022 12:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txVFt3WvA59FUvh3yZRbarAP5GlLro21/acEq3o60II=;
        b=fb3iexS+tRtn7D63WdqlZpSd2R5xoLO6DahaWHhDUhtVpqWZg69nIqwFN1DOqvpE91
         kIEHHNa291k7kX2ELX/H/qFPbpgCKdQR4afU1fnx2eNydkIeJ4etnA3cxuQkC1UlNC5q
         LDiAG6koxNgdCCW4vzWNPWBFzxFNMDEOSUGSHumriaQhWYnMWJBA36fAjZoZgh1CpKPQ
         uSGn6wGiezElYSjDR6+71eaPiygc0bH2uUJjFUhh+4NZGnm42u4Grc0Q6djSmPoQwzss
         e2eVUZI6bhuo57u7LMIxb3/P00ge3c1unfq5xauE1EYRurEyy3CZUDpJg6j9bXf68vUj
         59bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txVFt3WvA59FUvh3yZRbarAP5GlLro21/acEq3o60II=;
        b=UM0XjFBfNPdDBdOr7pKqLMyPwWNb+GlbhNf/sUnpgm6bcOuJqN4TQiXNCLylnZFLjn
         6wTjHJ8NCF/pYQW+FwMqhkg1rnQy4P6KngddiK5cjnGmItDTVOKPyH7GvIoNDToMpwzi
         RNnAByds6iW19d+b1mnBkaPKMmSzfTMfkfA/7cRgAS5CRo9wd5ajcH1MTOfQI1AxplrV
         hiApdwjWgk3gYb0FA98YkHd6eeRrS+Di6Tyc7B0E7UAig/ZfQBb/o4B4NOmBO1XZme0z
         YSgkWMgzfqcSTQffoMK2kAZ30L79B0LV6aYsPaponMxWn7BLM5COtez3xH6U4Bi+WwHJ
         iAZQ==
X-Gm-Message-State: AOAM532nIjk1/W2aG9AbgfKssOkadXhBqd56iJ1DG6VTDJPj0rTDCmcH
	UozZ2LthbetQXq8MiUuSAtIAgSftbYJJGw==
X-Google-Smtp-Source: ABdhPJzLwCcp0CEqaRVb5IewVUA3D5s31K2+JNLgZ9FRX141o/fKe/iSPr+kNMiBO45GdkSo+EeXyQ==
X-Received: by 2002:a67:d014:: with SMTP id r20mr11978651vsi.40.1641414965118;
        Wed, 05 Jan 2022 12:36:05 -0800 (PST)
Received: from localhost.localdomain ([181.22.170.52])
        by smtp.gmail.com with ESMTPSA id t130sm7860vkc.32.2022.01.05.12.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 12:36:04 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	f.fainelli@gmail.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	juerg.haefliger@canonical.com,
	rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com,
	stefan.wahren@i2se.com,
	unixbhaskar@gmail.com,
	mitaliborkar810@gmail.com,
	phil@raspberrypi.com,
	len.baker@gmx.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 0/6] staging: vc04_services: rename ocurrences of 'bm2835*' to 'bcm2835*'
Date: Wed,  5 Jan 2022 17:35:41 -0300
Message-Id: <cover.1641414449.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set renames ocurrences of 'bm2835*' to 'bcm2835*'.

Gaston Gonzalez (6):
  staging: vc04_services: rename structures bm2835_mmal_dev and
    bm2835_mmal_v4l2_ctrl
  staging: vc04_services: rename functions containing bm2835_* to
    bcm2835_*
  staging: vc04_services: rename variables containing bm2835_* to
    bcm2835_*
  staging: vc04_services: rename string literal containing bm2835_* to
    bcm2835*_
  staging: vc04_services: rename macros BM2835_MMAL_VERSION and
    BM2835_MMAL_MODULE_NAME
  staging: vc04_services: rename BM2835 to BCM2835 in headers comments

 .../bcm2835-camera/bcm2835-camera.c           | 103 +++++++------
 .../bcm2835-camera/bcm2835-camera.h           |  12 +-
 .../vc04_services/bcm2835-camera/controls.c   | 137 ++++++++----------
 .../vc04_services/vchiq-mmal/mmal-common.h    |   2 +-
 .../vc04_services/vchiq-mmal/mmal-encodings.h |   2 +-
 .../vchiq-mmal/mmal-msg-common.h              |   2 +-
 .../vchiq-mmal/mmal-msg-format.h              |   2 +-
 .../vc04_services/vchiq-mmal/mmal-msg-port.h  |   2 +-
 .../vc04_services/vchiq-mmal/mmal-msg.h       |   2 +-
 .../vchiq-mmal/mmal-parameters.h              |   2 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |   2 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |   2 +-
 12 files changed, 127 insertions(+), 143 deletions(-)

-- 
2.34.1

