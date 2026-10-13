Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A5C4A8FEB
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918959; cv=none; b=scvZfYdqiCYBArwH9ktnfAo4RhKTCO1DZV6DQzNwtrR9nogzWp5lQ2Zxsqr62Dw8YoHOJDMVNnkJtbaHxMWBsQXa43gjwOHk2L49jUVW4rHlGmlL7teowNvRMJJJzpfIB2idEp9IYBgi4UKcBpj/sWciQOXEonRsVduD2KTZ1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918959; c=relaxed/simple;
	bh=YqIFBD0cMGaqBJVTPfg5GHhAEe9OSyYJzacDjggqHpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNwyz/AYyx/eZDfthCKRdiI0cuo2Xriv/0cD8iztBgWpOWjpjfX2hMZQIDon3bXrI+hM2WooDdid0U1e+laV8Z4zcp6KJeK9QCKhjAgMShdVxnZ/QvfRHVUtEWL7Qvv8oYWn9jhIYqGLX21g3T7059yYvfWMvdl2mT/DAgMYzMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1kVYsQP; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1kVYsQP"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a198438aacso5215385e9.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918956; x=1792523756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAiWr2qQ//z0iBACrzomuihaSPDdArLye5ron8Ml9Ro=;
        b=P1kVYsQP1AnY83SZEz6aAOVxz45HgVFVK+e0fUAcbQx91f9j5+vlC9ZD1+uHXFpqnB
         IQqz6yQrxc22LAvc2Az04+4Y5Eyobb0E4mYCv4VuCetv++DS1qPl0GW6D6oh8p3crl3M
         MqM1H7Xs64Vzfv93ewhz2GhLcM9rEw2JSrDPqDXzTKVssDjJYniipb2k604xaFA29o5Z
         dOLK/sW5NL/gXvNTe243ws/XothSi3l6ZrVPknf4e9RdABjjOmW5IfPpT8ZUrPLsG5PA
         ZautOP847rhqy0hOTtC3k4YRNE00zI2998MKAduDmS/cNt9MGTNnP7bNa4RcuJw358DA
         TwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918956; x=1792523756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAiWr2qQ//z0iBACrzomuihaSPDdArLye5ron8Ml9Ro=;
        b=j4xLYUSa6D1LBbPbAyhbgP/obtLGGqxmMVt3XPBOcPwXofiKTmpKozHbW0SJaChLUR
         ossWfgHmbQsvSnnUVA5BErWtR8a1A51hAs4PgYog89zj1ERaznvA/zTs24sQTwyI+PO8
         RJ6UToMtduGmhQlbq3/q1i2ArczLROE3jMkQDad5/ipveU/qCSn3CFom/jSYu7HA5frf
         hNPjod45TjBFQTPiDa1Cxg648yecbv4ET8iJHDRvAfB6f3hNJTB9Z9z0BK74+Nys8YY4
         JU18Jl3AnPa7sgcmEKmfPwt3AwI1Mg/lT0eSPnmyd7jf9yIv+5ro8B9TusvUBDYqHVn2
         8ZWg==
X-Gm-Message-State: AFq9FYJGPC/F9ZKaB0ONRisFfp5mWJWmoxd85cx0sbZBNQATPh6FXwxM
	/DBQ7HGfSy/mA/ugm20NMGNInBHFVnx13HobHhIcdnOWiKuI8cJtfXyl
X-Gm-Gg: AYBFou0aiReQMZM7NFOFVvsXNQ0l0fRmG+HkCPBCZ61hNJSlWZgTCqKXp0UxvTIgnUD
	mA+Gf6VrmYyHj82POSlzFgXzm/G8MR0y00G601hP2EvtQP4kC/7hxL8Q5L6+4tFOYFcs3/thUJE
	0gnsmZBNoiSHSZj4Upg7ubGJ4lVFMEzuBM2d3TsF2JzRrER+ye9LJd44YuOg6ubArzpFtJt7ir3
	Rk1ZKQDfmltG2bdi6M2uRoEo9Nt89SS2FCeHmbFLhrKk9iqRJbqSXRi82Jg7n9+nPYRpCNAeHIK
	TjfsntGSRWp9dS+4dmTfsXN4OJjBVyqCRQUqA+JWqgqj1Ob8SbqlYR0fdbqilVRBeWHQ+/JMdn0
	Tef5V31yNErWLZ5baij191woeEd5EXQW7IxM0sIXKybhrHeAWs17UYJQNCYdzRdXXQ+RYNYu8zG
	V9bP0Es07GqpuWlbcQKAZOLLaBEo+s2q5fOGYnNp3RUaj8FtNtj7qfB8FTBaHCUFW6bl4THwkRn
	QEqLt7G
X-Received: by 2002:a05:600c:c3cc:10b0:4a1:a7f8:c12b with SMTP id 5b1f17b1804b1-4a1a7f8c219mr58730485e9.19.1791918955848;
        Tue, 13 Oct 2026 12:15:55 -0700 (PDT)
Received: from fedora41 ([37.168.42.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2fc4724sm7229275e9.2.2026.10.13.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:15:55 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	guojy.bj@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v5 0/2] staging: rtl8723bs: clean up phy status structs and casts
Date: Tue, 13 Oct 2026 21:15:01 +0200
Message-ID: <20261013191503.152056-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Now,

This patch series splits the v3 patch into a 2-part series as requested,
separating the struct renaming from the cast mess unwinding.

Changes in v5:
- Rebased against the latest staging/staging-testing branch.
- Resolved minor merge conflicts in odm_HWConfig.c.

Changes in v4:
- Split monolithic patch into 2-part series.
- Removed dead struct phy_stat and unused prototype
rtl8723b_query_rx_phy_status().

Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through
the call chain to remove u8 * casting.

Regarding your question about the existence of struct phy_stat,
I discovered it was dead code; no function actually used it. Furthermore,
the rtl8723b_query_rx_phy_status() function prototype referencing
it was also unused, and was removed.

Patch 1 renames struct phy_status_rpt_8192cd_t
to rtl8723bs_phy_status_rpt.

Patch 2 unwinds the cast mess and propagates
the real struct type all the way through
the call chain, and removes the unused phy_stat struct
and ghost function prototype.

Timo Joannin (2):
  staging: rtl8723bs: rename struct phy_status_rpt_8192cd_t to
    rtl8723bs_phy_status_rpt.
  staging: rtl8723bs: unwind cast mess and remove phy_stat struct

 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  | 215 +++++++++++-------
 .../staging/rtl8723bs/include/rtl8192c_recv.h |  18 --
 .../staging/rtl8723bs/include/rtl8723b_recv.h |   1 -
 3 files changed, 134 insertions(+), 100 deletions(-)

-- 
2.56.0

