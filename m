Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F812475CB
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769544280; cv=none; b=BZSuH0Q4Ql2XptQuc9qB7AxKZX1AEoIGgXAz6Q5aHXJ/LIb2mursh0h99m4KfhcWMBjxiOTttEvDde6SpHUjYal49J1x6Wdw4vlRI4rmzuFt3NAQ+dFVreCuOJ+ZQWbEascJYLzB4kXXcCtOOHiSC6etE5QOFo+0JlFcbz6NDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769544280; c=relaxed/simple;
	bh=cABAUpWqkhKxpUQmcGzVDSVFYQLaQB/34a9mPbPvXWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asvh2NiCFSl59mfA+Hge4QJUSLaF0s98Co/WUYnfZQcbvv4qOY36IViL40dnOYyeV35q/116DitgilRholN8N1NN0OiZVzCvfb7os3uJs04H5Y1JAI3fToUtvxDrcl3s88XjyY+uZZnJZwDxDvGIyyCbMQV0Toe+w8xP7ICMbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2h8lWqJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2h8lWqJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82318b640beso2555966b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 12:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769544279; x=1770149079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEDKHXtQjNo3lJVFWQxTLS3gqpCyuyy6TaUTb6O7oA8=;
        b=J2h8lWqJLnVQ5z4nrsGLXYEyQTw3rSPTgEk/ts/9wTp+NgbyyF4taG0kY0Wf1A3Ctk
         phZ26P6tEWdmB5vKbPajOCPWC8+HHNVevgeVHDJAAFfsB+jRiJEMYeHesUMESl5BPid8
         +GUuAYWff+YXt9vJcG1BnhwQL726a+gcjmNa9KB3ehvPBCTkbD0A0HUcqJFm57AX44ic
         uD3dQuCdU7VRgFo+cFO9Ly0dKB0TvbdEp0TkzRA5FBE4mUx9bsFmr0VitSZI4MAfmWcg
         KZ3mK6FZ3TE3ZVIe14SU3fGXy6JJIei8QEj1rYW+nmEKfH8RaC5ucpBJehWqFnft0cvi
         Vx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769544279; x=1770149079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEDKHXtQjNo3lJVFWQxTLS3gqpCyuyy6TaUTb6O7oA8=;
        b=a8a04TjWuSkUQWm2WmArL/clFTav+NMTb4TPriLf3SpPaNz6lwGpz5DcBirnOseBiM
         pWSD7OpZzpWQJbHx+tU09Gpgd7No55bvPmVIy2SoKAv2kOkXKHhCISVZqcDBAK2Q3egv
         EdA3n0nYyneduPeyF4oU/AowHTt1unxjMIz0gOpnmid1bBbkXYydLMH2Bhdd6uM49V6b
         d2znRjWT2OjXlXHN0fAeGa7MqV/iQBB/+7kSEQrxHLeNXL88Ewd65ZAnNVf+Umj189gz
         oMET1SIrQeL/Vz8u05uO+ui/adT9v8k/3X8PA4FGYipsAYzJDrqdezEn7+661umhvFb7
         FQAw==
X-Forwarded-Encrypted: i=1; AJvYcCW68ZeabcI4h70YKcdi5DdfjgRsy1My+YT1JzZlOTTVnoxNTUUHZCZit7kbo+zexF4fOUiXUdMapTQmlaUv@lists.linux.dev
X-Gm-Message-State: AOJu0YwhidDKQXB9gSxzSHPCEh11k2HUQFF7y63yNzobayjj7rPqTXtD
	NGrF9ZUTpsg9BwuaGeWHwjTOvvpSgwMKQ04OH9v5nmc+cT/Zhmp2E5BY
X-Gm-Gg: AZuq6aIOeSyJHQ+Gw9DTsAILEscJxpzyNpit/q1Q6XYi17K7GWQdunsGcz3Dw3xMM9U
	iLjS544s0c9rZ3B1aLHUKH1S73SiXTdNver14DhRu3szOCIsPrP5GFNXWmWHkXCkS8DzOfAKoNs
	EC+K9i5ftZP91BlRhLH3RQkW7j72BLjpMYyvPTwMW1/5wZhL9xNGlzsRm+UExMan+ue1MWrClNn
	0KP9oIqpyUrEjx50ijZQHu9YvIPtcN8vslQPyoLS3TTSbeshi3FergDamV0rfX/22js1xacx3i9
	WfVUhKpg07UKF4D0csSKZelfjVJbfV468V5m+vusxpqrcpsI7cBD6QuJ/H9x7+RHUXIh3W72+CT
	2t2CrNv4Q5KBZJ67O5kPZIoffqT2LoNcgsPqiEfyPkEL/8HZH9GWlXDBNrsF3z264hR3UfqU8dv
	jd4+ZFcm0KuIb9UtHD
X-Received: by 2002:a05:6a00:3e03:b0:81f:3c92:1699 with SMTP id d2e1a72fcca58-823692e6c09mr3027186b3a.59.1769544278570;
        Tue, 27 Jan 2026 12:04:38 -0800 (PST)
Received: from snowman ([2401:4900:646d:9a6e:84d0:c92:d353:cd21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b59e10sm377771b3a.25.2026.01.27.12.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:04:38 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v5 0/3] staging: rtl8723bs: coding style and refactoring cleanups
Date: Wed, 28 Jan 2026 01:34:24 +0530
Message-ID: <20260127200427.3669-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs minor refactoring and coding style cleanups in
the rtl8723bs driver, focusing on rtw_xmit.c and addressing checkpatch.pl
warnings.

---
Changelog:
v4 -> v5: Rebased onto current staging-testing.
v3 -> v4: Updated rename scope, cleaned up formatting, comments, and
parentheses.
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Fixed incorrect commit messages.

Khushal Chitturi (3):
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: rename LinkDetectInfo and clean up related code
  staging: rtl8723bs: fix line length and alignment issues

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 103 ++++++------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  15 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  10 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 149 +++++++++++-------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  31 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   8 +-
 12 files changed, 195 insertions(+), 155 deletions(-)

-- 
2.52.0

