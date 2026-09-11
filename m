Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DFB53FD54
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 19:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155237; cv=none; b=Dl6BwbRSoI/GzAQvzuAIz3OljCkvdJt0nno/P0ehUfR7t6ChBgVw/mfu8UGtUaNjE+LEjUsn2jDZRjXUoDtbFWLPYGOtHiGawKZPv+/xvBHIrGYh47HPkv/uiH16qt+gHRTQEZ/xVcBRTTpfuYN43TwCzqS4T2iIpwIHPIg5VDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155237; c=relaxed/simple;
	bh=NnAHiacLuo6EZf5GbDE7xzFWHq0e1Knqz2lnuEutjCg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MckHC6MoZFsYe4oxPMfVJuqB7gJlLoaSLbmiUw0J7vxTFMxA7IMqjKhf1ZJDdWKIJqOKY6MwKYWnyFFClLC38DbxPcOcE+K141tfG+pqN3IfcXKUiVTSB70jAIGt3I3q15BOhjZNToQNXK24VUKv2yDjrtFpUI+GRMxK53riilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXDO2Qrm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXDO2Qrm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd05e8b98cso12848435ad.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789155223; x=1789760023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/5Ro7Uz+OsEVlMMnlWpp4aqZLh/jn1K1p1pedRyGpA=;
        b=OXDO2QrmjpsYho028+ug/g6kuHuBTGQKEuCflJovc1V2VucDqs/cbNsgxN8hVvxkrq
         ugZoHBPgXdyW9OERgPeZH6DFeEpUpvDQXjOfJDpoToncPWxn+Fp4abtJzDLEFAZqVMY1
         8/EPqcIwkxHksXl1R1IL6IzlGjEBPh5crJ5q+ZjfFvxvsQA8EIR+9jw1vaCwFV/tSRUy
         fXOSJuUjrCsAOc+hVdgb0gcULnn/UBALmDRJOmKlE4TX0tbccoidPWFU5zN9t+fzIbXA
         UZzFMel01oS0xzQmQ42K06TWEmI+WTZL+3ATxHmnzometHCSYCzxjrWX0Yl8ijVGAKgi
         GfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155223; x=1789760023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/5Ro7Uz+OsEVlMMnlWpp4aqZLh/jn1K1p1pedRyGpA=;
        b=HQi9e8SRvxsDwy3BjpLUof9a71XQ6sxZeC1/WzNLBtz4wxhotK74Go8waBe0ucFYcM
         cj9Qs+ZK3/GraWkEpRQyTwZnZAAfdXuNr89E8wTVfWisEnOGwJGK/D7AQ4yEDo+CRM2M
         uJvDvMlBK+pW4030RDSWznaKK1yusAJ+LEj5kPEHys8Xw8UO4ofojRdyTqybZaR0jSWE
         PboTEnpVeWEa6OmEH1ufvOZQY0w/il/+GiRiCraG8rnpoHsYW0pjWS0r41DID2+n7NL+
         V44gFHq9YwoO34ja4k+5tlJvUynrimB00RM+hGg+UEubPK7lqhhj5V/TKvrc1SS0UtSE
         QChw==
X-Gm-Message-State: AFuF++nDGO7a0L0lAro0vAkKUNvwej3PsJKe1N8s+/cBH9++RG2dXZsh
	aWHF5XcY2jiY+a4uexgQB3rT7URT5Tt8axCRiWKRzfhNNlWN4dbJfLJnMyDrjQ==
X-Gm-Gg: AYBFou3CE5MjYbMkEIj67v2b1fk+ANWNY8ok8to280E4zCA3IvnEZ7xABNHrF+PgSfX
	97Krxuqe22qiSgro7pnQfjfkBUuOm/1bJEBLype8bS2i3HzORJcr9N0ZV/tpGwRdUhYYVNSjbfb
	qsW8LHRlM7hwhQAd6qWrmQec4EITiKsbQBfhjKjjl8jV7aOmW72v8QUAi/ICD7DAWDcLwfF3y57
	gH9csXPKczbwb4ZhPSWWhbAgkUxsdQykb55O1hN50ymE9b9tyPFP2yF9RrvznG6fI/xDliiPhr5
	Nb2ZAoQXQF8WlZ62Gewxdb/mbB2iQIrIo5hiPhZnwiaAHl88/7Lo8QDm+4Q7gtiyrBDyLwNLqkr
	CNQCgtNZH3wOeLzw3690mtYSVHNnzsrvasTXV8E1hdV0zdms5a5e1v5fpu1boue7aeIhNFiZh5i
	KeWwUsdjwz4vhB3Kb88uos+GxK9ASzuxRvIYwYEI2PI0yUiPQJ0Bo0LYSxF3asvt2rMQ7ydvREM
	rXQVo/1Sw==
X-Received: by 2002:a17:902:dac3:b0:2db:8406:db91 with SMTP id d9443c01a7336-2dd2a3325b4mr100053005ad.10.1789155223414;
        Fri, 11 Sep 2026 12:33:43 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4cf015csm9426927eec.4.2026.09.11.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:33:42 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 0/2] staging: rtl8723bs: delete more empty comment lines
Date: Fri, 11 Sep 2026 12:33:33 -0700
Message-Id: <20260911193335.6908-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset deletes all empty comment lines /*  */ from hal/ and
os_dep/ files, and adds a newline back in where appropriate.

Jennifer Guo (2):
  staging: rtl8723bs: delete empty comment lines in hal/ header files
  staging: rtl8723bs: delete empty comment lines in source files

 drivers/staging/rtl8723bs/hal/Hal8723BReg.h   | 17 +-------
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 16 -------
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.h   |  2 -
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  8 ----
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.h   |  2 -
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  2 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  6 +--
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  2 -
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.h    |  6 +--
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c  |  6 ---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 13 ------
 drivers/staging/rtl8723bs/hal/odm.c           | 26 ------------
 drivers/staging/rtl8723bs/hal/odm.h           | 42 ++-----------------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  7 ----
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  2 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  6 ---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 30 -------------
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 21 +---------
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  2 -
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  4 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 33 ---------------
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 17 --------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  6 +--
 24 files changed, 14 insertions(+), 266 deletions(-)

-- 
2.34.1

