Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CD259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 20:51:55 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id u4so10826198ljo.6
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nd2uOMxAh5X4a/nY+KPVcgXpJ+Zppj7YeUaSujV7w+E=;
        b=q42M4a3ki91Ecw3m+TFxNzm+HK46z6MYd8UeYQSI8qzPU0LKX8smzmYn+VS8qNXyBf
         MUJEV8WEXLgE/nz+QAotTlNh8ZeuqGtZWZ/hH9H0FX7ymD7ObTmxEJfgUVq8zdx/2mkG
         4BJjcWOIp5zch/A0CMVOHZOBw2YA6z0G/fmZd5mNSHOOUqlqHvGdr4ugNmDveee19SbY
         EueX+XYsk131jzy6+ZGMmsNPBxLky2kHeh0K3iKO6qJzt/7g1nVm7pEseSRleYCrTmou
         MGBGJm6d/tYCv77DuQt2KxIA9cacZb5DRHBVNYiqw55OJaFH8bbztOayhAMgxv4NflP7
         tviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nd2uOMxAh5X4a/nY+KPVcgXpJ+Zppj7YeUaSujV7w+E=;
        b=AasRKVNjFQ+9ezKp3TIqzKEFitxN2oQ2+3MFDpOAtEqcfMwrIga0TbiMyaBeyJf+5l
         HjObMaJp7d1EBy4DHDQaWShsNFM4iGe6WYSlpZbuUhETIheurH6vt3e66TQZst99eh02
         ekeLlJ0aF/Te7G6EROSwqPiC/vNNOwnRekeRMw47PsFrqoUWgyFOCktwPbJdtiWH8gc0
         TiiMVm1yMIFLgo92Hc3xpBZzglt0tHNh5fsxil2ZcWyfgBG/rQlbvqoqEHLfJHbzlNr2
         jy7bgOJZLPl3qvCrR0dnAuQ+8sYPZ9ZvwyUEGB0Cfx0KXxfC52sJ1slr5D3BOlGRHjKs
         5dMA==
X-Gm-Message-State: AOAM532W6WZ+j0FdTwDeLMr2rTrxi5m8bMS6AJ5+BOqGUQSmBQjHCXER
	GbWt2g4beqPXCM26c5ngkuM=
X-Google-Smtp-Source: ABdhPJwYjg/AbYdzaP6/dh2LxXbEpTxXmVOVDwF1+jNLsypxJTuaG6InH7aDkNMdMZmm3HHkY3cfcg==
X-Received: by 2002:a2e:b178:: with SMTP id a24mr14114441ljm.329.1617569513722;
        Sun, 04 Apr 2021 13:51:53 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id x17sm1546124lfg.164.2021.04.04.13.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 13:51:53 -0700 (PDT)
Date: Mon, 5 Apr 2021 02:51:51 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 0/2] staging: rtl8712: add blank lines after declarations and
 remove extra blank lines
Message-ID: <cover.1617568354.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds blank lines after function/struct/union/enum declarations and removes extra blank lines.
Reported by checkpatch.

Zhansaya Bagdauletkyzy (2):
  staging: rtl8712: add blank lines after declarations
  staging: rtl8712: remove extra blank lines

 drivers/staging/rtl8712/rtl8712_recv.h     |  2 +-
 drivers/staging/rtl8712/rtl871x_cmd.h      | 10 ++++++++++
 drivers/staging/rtl8712/rtl871x_event.h    |  1 +
 drivers/staging/rtl8712/rtl871x_mlme.c     |  3 ---
 drivers/staging/rtl8712/rtl871x_mp.c       |  1 +
 drivers/staging/rtl8712/rtl871x_mp.h       |  1 +
 drivers/staging/rtl8712/rtl871x_mp_ioctl.c |  3 +++
 drivers/staging/rtl8712/rtl871x_pwrctrl.h  |  3 ---
 drivers/staging/rtl8712/rtl871x_recv.c     |  1 +
 drivers/staging/rtl8712/rtl871x_recv.h     |  1 -
 10 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.25.1

