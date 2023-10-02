Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CF1DA38
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:05 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9ae3d7eb7e0so517711666b.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269184; x=1696873984; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YMNM0aRdpEfcCNVG8Zt3kh8xBFlOSvcHGJleVt42moA=;
        b=lbqVNWQ3h+g+hvQBqhd2uDM85l5yTnNhs9LKR+MDAEs/nYXKx4L59eQKa8bsZO0uax
         BlMjV4h8ugDDamga3bMZNCxCI7vV+0Tn9RjMxBeEee5/vnKo/RxHSd+pr9s3wyM0xUSN
         hdsvb1RQWr9qIGOq4i6T19+vyP+Uf3SwRXu2GMDhk2dc48gbvRFTr8DkznvYgPMTRpSz
         ackeGYxjF36xQo+Rc8FdVFoLFf3HerJYgAkgzRvr+FHZG2tI5uS222lRhvmHfy/1HUtx
         JfIXNh638Y+85RYYOJNrPVplOq9XcSN2n5bj75lFLUdm1GLMB0qn6N69iw14/KiGgLAg
         a0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269184; x=1696873984;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMNM0aRdpEfcCNVG8Zt3kh8xBFlOSvcHGJleVt42moA=;
        b=FbFTwDYvWlhlYfU7omZfx/g0rFQ/dJf3bmYQ9oOnTDoke+1NMgPosjT5zAVPRGg40U
         LPRsi46Y5DCHmdTTOFm5sRlji6Z2Z5WMX8GR32WxczNolTL5DUnWmpyHLsPSy3UjRsz4
         iJzrod9cHVoTV6he3Dzm+lg4f6UNrzUwKhx66iuZ5+PwV2aqdSCKrEn9k1EZHLAP5aTH
         KlTWXQYINNYOMpzC3L1sfM1/0dz0Ug6+JsOoyy5QRXIKfzxaDoxkcTfYWJHUkXSc22WY
         r5e0ajnh/3eUhTitprJtGjXCr5CrVwu7Rmc0WQMS0hTwzTNIsmDipkyrvRBbuZRXvhz7
         gU/Q==
X-Gm-Message-State: AOJu0YzfjeIXSAAVw/MaouqenBZ1khArjFpSxZTkDdGrjZrIDWSJmA6Z
	+MTnBxSK2nIjtjw15tjSjHk=
X-Google-Smtp-Source: AGHT+IFWFHOoILjj1gCnBsboKkDjpRRge8iCCyKPGdNXYWEcYyYGtOooNZfCWIUE/yjtLRDDQTbrfw==
X-Received: by 2002:a17:906:5352:b0:9a1:d79a:4190 with SMTP id j18-20020a170906535200b009a1d79a4190mr10128359ejo.2.1696269183580;
        Mon, 02 Oct 2023 10:53:03 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906374800b0099cf840527csm17364467ejc.153.2023.10.02.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:03 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:01 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: rtl8192e: Remove unused functions related to
 removed reset
Message-ID: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused functions rtl92e_dm_backup_state(), 
rtl92e_dm_restore_state() and rtl92e_cam_restore(). Remove unused
variables. Most parts are leftover from the previous patch series.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (8):
  staging: rtl8192e: Remove unused function rtl92e_dm_backup_state()
  staging: rtl8192e: Remove unused function rtl92e_dm_restore_state()
  staging: rtl8192e: Remove unused function rtl92e_cam_restore()
  staging: rtl8192e: Remove unused variable last_ratr
  staging: rtl8192e: Remove unused variable rate_adaptive_disabled
  staging: rtl8192e: Remove unused variable rfc_txpowertrackingindex
  staging: rtl8192e: Remove unused/constant parameter mesh_flag and
    shutdown
  staging: rtl8192e: Remove constant parameter from
    rtllib_stop_protocol()

 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c  | 63 ---------------
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h  |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  5 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 83 --------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h   |  2 -
 drivers/staging/rtl8192e/rtllib.h            |  7 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 22 +++---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  6 +-
 9 files changed, 16 insertions(+), 174 deletions(-)

-- 
2.42.0

