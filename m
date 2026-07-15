Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A5C2E738D
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135907; cv=none; b=bqysl9zqFJnkP7QGJXXU6IJFRPtYTwPqx/9ZuBd27/+i9dN0uowZpS4tYLanTarud0qD/xBf4+8o6YtUvRYqq3/G9c8BcsEHnXCp5v9wt2U7AqLiy+THbb3DLg02oQSSL/AVjYSgSDOYCzyvQbqLv9qpBQDZaGC9ByC6nHsZdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135907; c=relaxed/simple;
	bh=ntbuQPISXiJZkstfOSlXebGeKHm5szCGMN35jwLpcA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8qU9kTOBTms9kIZpDc7Yj/pD/7uGPewUxtLxiu4zIT3Mzw/3CpW0yQdCxKrOwe2s+qds7LVB6CQCLm2ABEGxQ0Nn4iwdphbyokdoweaGiOkf/4dNwsyBtGjFmvKQuZQu0mtalIVQAKEuCW9CBzS2+l6Sj6NH7BThvfP4jVwMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tM76LBmt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tM76LBmt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so4702056f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784135902; x=1784740702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdXJpsd7dqyd/dQpMFwnBl2dtQpT8nctB03VrqhPQBw=;
        b=tM76LBmtxUQ9E4rwp0eyX9O2nb8cxDBIg0hJb+LtGHKnhP1hBHJiLZJ6O4Uo6ufdfW
         zRfknZoQOzQbHwn/SQhAAWr3QfXdIYkZjn7C+UQTH/gR61x+ZVCAYGCgjNeh2rHtJXQr
         MiJweWgYOz2+RPIb1Eii5SFDYo6/CnCV71kD9UkhLcM678uC6RXCxgcckKyn2ZqOxMLf
         z6EJw01yIeDZ51Gpi21/4e3lOaVDjvNK8SqXJgX595XfBSIZhkOZ/NuYujRHvCWjsvP8
         UL77O73M0FNCLmctofCyWIyIZJNNxpTOd1K02sLmrwrs8Rx5QPWSC3LRUCbi47S0Agbx
         sp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784135902; x=1784740702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdXJpsd7dqyd/dQpMFwnBl2dtQpT8nctB03VrqhPQBw=;
        b=eQNCfc4JyZs5qux4T/+49w3O5Q91uLFNzm9hAFPncOPUpDtCENcc1Bw7aFHJlPSNZm
         vvenTQ9/Z8ClnKNwHZULbX4hPDftBHjBkIrVujTig6af4fOI4ZH16roFDGZvz5FLx6b6
         5EqAUBPrbu7SiCShELfH0Gw2TkCDi8v22KWmiOc7H22SUEWdPyDI+SB3sZtW2Alz12tX
         sh0iKWcIwQFQakNsdG0thQKI3/KintkoxnpSOmhOuh7d0PnrsbTm/3wz5EkaXcb/ugbu
         AQ3P+RyX2IXF9oCjptMHpO1Tbp0xA5bhhYH552+dWc9BHC5+wizp4YayzrkY9mkEt9HD
         s3MA==
X-Gm-Message-State: AOJu0YzOs2LzTa+I0LE59DCiSwWR3cgOlWF5MJZiUSeVOmt8wlEhqlYH
	mFpZZ5XTSkkcQ+c6UAOaGFLJCPL8e+5CASAAUgcVbZuVKvNRXXPgulUw2nydo88b
X-Gm-Gg: AfdE7cnBCopPsQU1YiHK3t/iCjpWIPpORveCBZmsiyKBbzVHp8QJMT5hi4l7D//t97k
	68N6gkCWT+bweWLn3ghsNw2hci/Wo+q8nwbW3bE+QaTDM/5Buah12Cin/kaZj5iAhKa/CqNjsJo
	hpxCs9K4eXKA0jSmP6RITKSJgIFdPjwQc0gKrbjaENqJuOOiTTLNBDycVxKAWeYidY4OjNcjjjE
	TraQ6kUnV0FPtg09c0iZ6rigj+LdPXAr5QOBNY7N+nCvXXVaLVpR2EKuhN2pjta8F33wQt0Jtod
	uqAPfJzrBFrIbWS9pCwEqikD5nPthBsGT9vru+txdxuN3UeEw+y2fIFA3BIeDpmlCiaYL40WEtu
	hic8598QeVpjFgWoNZxKyaPRud8ASJkLX/bJfOAwGxpIUuM5KG1eyeZVKeQiWpvk80Ci70K2ou0
	HSXACipyLX7x7/qRZEvI4e5pri5IJQapzvx1qSFZgz/1lPxyH+tfDhLKRpUbl+m1ZGh9dv22KVM
	WvKcQ==
X-Received: by 2002:adf:f043:0:b0:46b:cab9:f697 with SMTP id ffacd0b85a97d-47f46340f12mr8272645f8f.24.1784135902178;
        Wed, 15 Jul 2026 10:18:22 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm17123032f8f.27.2026.07.15.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:18:21 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: Changing two struct members
Date: Wed, 15 Jul 2026 17:16:30 +0000
Message-ID: <20260715171634.1550-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch changes two members of the struct adapter.
Two additional patches ar made to fix some checkpatch warnings.

Regards,
Dalvin

Dalvin-Ehinoma Noah Aiguobas (4):
  staging: rtl8723bs: change struct member bDriverStopped
  staging: rtl8723bs: wrap line over 100 characters
  staging: rtl8723bs: change struct member bSurpriseRemoved
  staging: rtl8723bs: fix Alignment should match open parenthesis in
    rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 12 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 85 ++++++++++---------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 16 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 16 ++--
 drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 16 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 +--
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 14 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h | 14 +--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 16 ++--
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  8 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 +++----
 16 files changed, 132 insertions(+), 126 deletions(-)

-- 
2.54.0

