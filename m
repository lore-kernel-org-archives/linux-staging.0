Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D116173
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:11:55 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t26so64871591wrb.4
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cCv3/4S676AukfYIbru4mtd3r9le2+vzDRrV/TkyaUs=;
        b=pMQNTkNsPdF/It39Ma5CAfiJNDv/u03OfdvRfivEuJc5pYo24+GuVZcl9jhyw4U60z
         NWZTqBlRO01PneusDnOndm8kZQvOv4nlgHgiqLAJBrch+lnhn/MXOPCXkkCv0BBEtK1U
         9RJyAtko/jE6IMeovyzrSXFK1OApIlSuJZpBqaW9OTyxXBQOFPn40gTeAjjQGDQWBUNf
         QkWGyZ1p8SLwLlyXTFjspdJxjWKurUsef1lLum6pQwaxoYwPJOq/bauKFja/Hd5u49Ud
         1/gXrhKMXJz5SrtUfuBMAUT5spPNTGgjM8Xo6zaxW160YFFuyAclUzimIpZdl3yV590N
         fPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cCv3/4S676AukfYIbru4mtd3r9le2+vzDRrV/TkyaUs=;
        b=6mKPjo8/TSl+gntjtIZ+bnEwumOiIZEvP5H7h23vz59Gt0mSStGeCr9Wy2T92GDTL4
         lWlBJwTLobw75lLFofS/bmyL5vt5yHsiFiI9A5VnsKeROMcOm53X5JLC91ezm+fqHcAs
         F+MLDORkGM+Kv69diPcSDLC1SBvVkReq3sfxd3yVBgXJc5vf0jEpAA6QaKh2o008qkK8
         X0Hz/1Pu1K1a6gPLt5Ht3DVEp2DJAiIKkI2+DjcZNTXvXwE5dOz4QL0NZo2CjcoIR+lL
         rnPpOKAphKJ1S+qaRpxZywyGaPwD8QLtwib0isbEE1ipHVLaSUqnB1AKvFXr4VIiv7bk
         qHXg==
X-Gm-Message-State: AOAM530qDZqdwOJ1xNT5QHlfEE0rFFEsqwHHeW8eOqbXPAcOBJ6DuTRS
	lTuLO1wNiOVXb+iWIp07tHM=
X-Google-Smtp-Source: ABdhPJwMDfiuMdz/Z4S26uhP7ra1mIFGpRr58c+Augk5DKQwmrqXHPam3/r0IVHkazPxFP/DznumIw==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr36632559wrd.198.1641129113844;
        Sun, 02 Jan 2022 05:11:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:11:53 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/11] staging: r8188eu: the next set of cleanups
Date: Sun,  2 Jan 2022 14:11:30 +0100
Message-Id: <20220102131141.12310-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set
 - removes some unused structs, enums and defines
 - removes set but not used fields from some structures

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (11):
  staging: r8188eu: remove MAX_CHANNEL_NUM_2G
  staging: r8188eu: remove struct rt_channel_plan_2g
  staging: r8188eu: remove unused enum and defines
  staging: r8188eu: struct rx_hpc is not used
  staging: r8188eu: clean up struct rtw_dig
  staging: r8188eu: clean up struct sw_ant_switch
  staging: r8188eu: struct odm_sta_info is not used
  staging: r8188eu: enum hw90_block is not used
  staging: r8188eu: remove unneeded comments from Hal8188EPhyCfg.h
  staging: r8188eu: remove unused defines from Hal8188EPhyCfg.h
  staging: r8188eu: remove unused defines from rtw_eeprom.h

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 +-
 drivers/staging/r8188eu/hal/odm.c             | 11 ---
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  | 34 +------
 drivers/staging/r8188eu/include/odm.h         | 90 +------------------
 drivers/staging/r8188eu/include/rtw_eeprom.h  | 31 -------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  5 --
 drivers/staging/r8188eu/include/rtw_rf.h      | 24 -----
 7 files changed, 3 insertions(+), 194 deletions(-)

-- 
2.34.1

