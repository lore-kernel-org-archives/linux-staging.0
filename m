Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A4934EEEE
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394968; cv=none; b=PpDPr6sxiOqyIa254g2FXA+PgNod0+RiCz5SVxEwUaMgJ0hGs0j9w+kw5K4VZynmElePH3X89l/fnJ7bbgYaZgMDukmA0OJNxjtwNlx829FHisBQeaL8EFB3KAxsX8m4B+Avheqj7AB6u1LS/JGHdJuAz2DjbZMTHnBuhfleuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394968; c=relaxed/simple;
	bh=+aSkfcuIjVSvk/tb/QdCgJX5VS1QAhakWqAzEua2/lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qq7gto97Rnur7xjzugUvy6t/hEcVld6JuJ2XT6WSV/aDePewbO9Z48wMxxaIUbSrKCEoafUcKuz0rr+146ElLN4Vr+g01jbsvNO8ow+QCKqSsQHhStNoDiW2L4Lr43rgzmsxiuiG5zacrg2IrNF4y7snwWJc+8QafsD4tIliPKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeZDSQE6; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeZDSQE6"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56efdc96b05so166236e0c.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776394965; x=1776999765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVJw3Uf7eb5I7g48M7g9HFFPwSMs2PN92kKQtKwpSKw=;
        b=AeZDSQE6UgATNhtapaYHhVAqgwA31ikJY+fhyV+apei5osJmKfPyMiuydiEQYNTjZ4
         6mfwUYMM6WCB9Sjfl/cYgr+ubA5F4oDYrB5O/Y4IO4Y0Je/gstXj33vEMYMI9bh5vZBr
         3WOWniegBuIP9hCof2OQuJNWXFh1ztxgGPtd3bRW6WL4vHmcdwMaQaDVHMfLk8b9yZsC
         sfzpOanLln+riUL1B5RzuNzX+6kglmq1yrS+GNK9LC9Cnj3DCrwjUilrKeUpIiH+Chal
         KVSyWVp7X8/C83Y5EV60c2fkTA0BtkL4YI1DPqGm9kCIQXEZAoZ0x/M7XThRplqvdbBU
         emzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776394965; x=1776999765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVJw3Uf7eb5I7g48M7g9HFFPwSMs2PN92kKQtKwpSKw=;
        b=kW9ttzPCySEXryvsULfUDQv0Wk43xOmuaA8QcJTRow+eyhsPlh3mYWWNd8QjM8Ux+N
         qcoOvi8T4bV+cUkA28p7WH1BY+4qWbhvPfhyjEFE6l/zC4Jo4ffqpi4BMYfAhRVjB1Pm
         Ob+y10QarXZm5Px86gvSihf4dxdPf/TVej6Lk3M9/kbN31En0N3HB5zmQCkKUTNPBSLX
         Fu/9kdXzp+LdS7+qdTKMecgJ62WWyBzlc/lirqUMo15Uj8OQ3evIeg1HnFGKmHBpQalg
         BnEcN/HPZ+4Muy+CApqaG8/atC2Ah+nvRJZnSf4LuHbTGZFmGXPWZe2SNP2Brfbypzpz
         E9yA==
X-Forwarded-Encrypted: i=1; AFNElJ+cPIN3LdfyYRkXZig+i/TRjZrB548Vo6FE1Ie4/pgbTOsNh6WNdHrQpp3fs6lBX2zsX1z50Q0d069d8VJu@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtv5pJklhSQ5+B3DLXHemeOJ+DNZvH80gjWuysO7k6PtFw/VGq
	f6FBbcZUxSZgWcg/NIUiNyYc/yNGk96VrNBd21/ITwOIEuDUkYkrgnGJ
X-Gm-Gg: AeBDiesAGDKTrWCauXhrIamvoJPHf4QDhnrUtuX/XDceVLotbCoHnLGVnVmpFHxYWU6
	ZOYLkV7dmexwqgOBNSyDkOdLmzHcV8Q1HbxD5oLgF3UkEasjhgYjMXm8AwIRn0KpHxHz6Er6VqN
	I0sruMAMZl0JGSU9V/y7MN4/mRTiYZW84qPlTmuJE4mWgXaACcx4+V9b8+ZsYAPzJQjdUqgBbgm
	Vxb8KURYObGeZVADLEQ8Xde7A1rMvAt8zsQ3CRj3yx37ouYRkqYP+VwXGRLgOv2Rm1kzzk+MbeB
	/R8YHxzXVYB5z47mGh+gLoIYfRM4K6XKzy0HHj/lazSICpH6f6Dtf/zi058qnxvEIEtSkOMnFj6
	c0t060+uqHo2LTI3usXY/uMc2iU2Y/Nqs+HiecYPhBf9ihLgU05ejvT6QDpS5i9PR3YV1vQ8DkA
	RbgLKiOTF8MS38ZotbWYu1AKKFK4X8loSFKimfZiXIhTid1yuvr+CfCr1/7WKz7+c=
X-Received: by 2002:a05:6122:247:b0:56c:e871:31a8 with SMTP id 71dfb90a1353d-56fa58cb67fmr608412e0c.7.1776394965430;
        Thu, 16 Apr 2026 20:02:45 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm131275e0c.13.2026.04.16.20.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 20:02:44 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v5 0/5] staging: rtl8723bs: fix multiple security vulnerabilities
Date: Fri, 17 Apr 2026 04:01:05 +0100
Message-ID: <20260417030110.42991-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes five remotely-triggerable memory safety issues in
the rtl8723bs driver. All of them are reachable from the air by an
attacker within WiFi radio range, without authentication, via
crafted management or data frames:

  1. Heap buffer overflow in recvframe_defrag() when reassembling
     fragmented frames whose total payload exceeds the receive
     buffer capacity.
  2. Integer underflow in TKIP MIC verification when a frame is
     shorter than the sum of header, IV, ICV and MIC sizes.
  3. Out-of-bounds read in portctrl() when a non-EAPOL frame is
     shorter than the 802.11 header + IV + LLC + ether_type.
  4. Out-of-bounds reads in three IE walkers (rtw_get_wapi_ie(),
     rtw_get_sec_ie(), rtw_get_wps_ie()) due to missing validation
     of the TLV length byte and of the byte ranges touched by the
     subsequent memcmp() calls.
  5. Integer underflow in rtw_wep_decrypt() when a WEP frame is
     shorter than the header + IV + ICV.

Each patch was found by code review and is not tested on hardware.

Changes since v4:
 - Patch 1/5: collapse the five identical cleanup sites in
   recvframe_defrag() into a single out_err label (Dan Carpenter).
 - Patch 3/5: return NULL directly on the short-frame and
   non-EAPOL error paths instead of staging the result through
   prtnframe (Dan Carpenter).
 - Patch 4/5: in addition to the outer TLV length check, add an
   inner bound check before each memcmp() so that the OUI read at
   offset 6 (WAPI) or offset 2 (WPA/WPS) stays inside the declared
   element (Dan Carpenter).
 - Patch 5/5: tighten the length check to also cover the 4-byte
   ICV, so that the subsequent crc32_le(payload, length - 4) call
   cannot underflow length - 4.
 - Patches 1/5, 3/5, 4/5 and 5/5 lost Luka Gejak's Reviewed-by
   because the code changed; patch 2/5 carries it unchanged.

Changes since v3:
 - All patches: add Fixes: tag pointing at the driver import and
   add Cc: stable per Dan Carpenter.

Changes since v2:
 - Sent as numbered series with cover letter.

Changes since v1:
 - Rebased on staging-next.

Delene Tchio Romuald (5):
  staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
  staging: rtl8723bs: fix integer underflow in TKIP MIC verification
  staging: rtl8723bs: fix out-of-bounds read in portctrl()
  staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
  staging: rtl8723bs: fix negative length in WEP decryption

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 70 +++++++++++++------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 65 ++++++++++-------
 drivers/staging/rtl8723bs/core/rtw_security.c |  6 ++
 3 files changed, 92 insertions(+), 49 deletions(-)


base-commit: bf9c95f3eeefb7fc4b4a6380cc23f1dca744e379
--
2.43.0

