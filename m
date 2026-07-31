Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C24B42DFF5
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513172; cv=none; b=rLWvbrAPpfeRCJgOOCSoCUYclFsRnhNIbkbbFJsUoBQ6qbKiYTCGM/U82MCFzZbqc0xpAxpzbC9g6G7Shs8YLgu4iIu6UtTrxzjMk01GIr/RIcRA6N6PLBZedmEO+zDqaT20LnQtMh/MepbIOQJOE3/Kn5PTdyY3KKWaGO1wqRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513172; c=relaxed/simple;
	bh=iMZuld2kpAyODNuLbxkBUtaVso/tA68c+VTKC3pE0JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ye2gGdCeQ+0vUTVJwL2/niold87jR7Bw/1053oW/HIt3hmnue5LUd1falmSq0Cp2o1InoX13dGXhhRJRoL4zge+xKjZ3XMucT459b0Gv3PcmWdT99YcenAyzsAnPp1C9UxY6p0ZqYb556SCWVO/njAN2RQn3lIrezuL9uENoY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AviZP1/F; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AviZP1/F"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-381072761d4so720380a91.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785513169; x=1786117969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=96bgMsXq3QaQ696yPEl0nZr9fyrOIbNR0fiV+Tvpm8E=;
        b=AviZP1/FgHMxruOF08st5VJQEBaJV6sf0HdBAnQP0qPQb4f/M1IJht15K2lzYGM2Oj
         XIDXJ/5vyULv3vLuTa3+TCfxPxwRUg1WiBU36Q0b9ydnWMPYP5cTm7ZjCQfHpFvokoUp
         x1UY+yS3+WUCx7VvHRzIRDvWl4iC2FhR3MEGwkIuXx+LAeIadcKRou0MH5jR77G16cTF
         1WX8z11TV51wYH9viJ/1qi5Cg9NWU8iGrEjd9vCH8K3hFL6MMibnPwqGtfImd+PbLpv5
         HFPq2rEGVPppgqkkOqjvQz3M8GBSX2HJ5ld3Bmf9RZp80kabDW/7dk5Zj/Rfldtfimo/
         30Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513169; x=1786117969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96bgMsXq3QaQ696yPEl0nZr9fyrOIbNR0fiV+Tvpm8E=;
        b=eZeTJrXb2spmyozbthk9WKYgeBMhala37sPCiX5T3EASSlgl6lh3wOtDv8gEHjksEZ
         HD8o8QMpuP+IZqIRAa9X6pUXur8iz9AlsnMh+0otnCGzeajGOfOrvrPACN6xLJX0/XEC
         U8fW3dYlCiW/GDtbv/iIgF/a1GqO1CWTSwUFXLRCo/SFAxO1PNBGwQSpmMkTHxxy6hvJ
         RePoE5RzZZM4Utzvg4mLglgHiZ3jYv+1OiEWRl1qa8U4VZkCZd2McM+nZsKRMOiztNJ/
         1JWfywpbdG5530syP8l2ADJTzkAMRsZbsprunVEocuELFdaUvOJn0gD65rmGFgJ5Q67m
         IUow==
X-Gm-Message-State: AOJu0YyR4yHqrfd4eFXzWbJb2rlD4THQf7bJDW0jLbfNR/QaOaOgHAxL
	vIsR1zNdP6HLk+ooWUbfGr3HdQZ/hwQqcm9GsV5MEEnjwbvW3205fsoP
X-Gm-Gg: AR+sD10RyaDx24qWhd3UbeWr4vZAgbATBs541sNqdLeIVbSayfssaH6ftvC92VaRFzA
	Az4iw7olGdkG/iZHDS1OaLFcOtlU1JU82RUhbt05gnQdCuqCSQSM+fjHy2JpKf/ubxOES6611Op
	+ED5syMjO5YgIvt3lm4PiGIloeHxI1UxgiblHwX1SG9uJ1jnlRnlLkeWORxs6byt92VVZSrqcaa
	khvBjfm4yrgV6GaOhTsDKiQaYVQs9uttyhrBr0VD2BOSwfWdXva8IrxUv1Ud5rJ9QHnzFiJa6k0
	VIlQuCiX8mqlOvv7C66PvUgwPmfHj0C1y5c3ZUCdrNmN9CxVeZ0du7N2ndALIU7Ad9hgBjyNbJ3
	yZRUXfEynjZIuZ7ngLTQ8KHilGEUnW7ba184wb6uE69Wu3d91oX2sEAR68bbffGjXnoTCSslsh3
	AOOr9X1rjt445C5hj2u9YfiuNvvpPON7PRaDDFSwSrvrwLD+IYlwrrp/1LhmjUUKwMdv4hMspld
	SyKIPKBDdzYmpm47IQ+
X-Received: by 2002:a17:90b:534e:b0:38e:2aa8:60d0 with SMTP id 98e67ed59e1d1-38fbc598d19mr452619a91.37.1785513169532;
        Fri, 31 Jul 2026 08:52:49 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm7669604eec.7.2026.07.31.08.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:52:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: clean up management transmit return values
Date: Fri, 31 Jul 2026 15:52:25 +0000
Message-ID: <20260731155228.22526-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series continues the cleanup of management transmit return values
in the rtl8723bs driver.

Patch 1 converts rtw_mgmt_xmitframe_coalesce() to return kernel-style
errno values.

Patch 2 propagates the new return value convention through
rtw_hal_mgnt_xmit().

Patch 3 makes dump_mgntframe_and_wait() return void, since none of its
current callers use its return value. It still uses the return value
from rtw_hal_mgnt_xmit() internally to determine whether to wait for
completion.

Changes in v2:
 - Clarify commit messages based on review feedback.
 - Make dump_mgntframe_and_wait() return void instead of converting it
   to errno values.

Hungyu Lin (3):
  staging: rtl8723bs: convert mgmt xmit coalesce to errno
  staging: rtl8723bs: propagate errno handling for mgmt xmit
  staging: rtl8723bs: make dump_mgntframe_and_wait() return void

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 13 ++++---------
 drivers/staging/rtl8723bs/core/rtw_xmit.c        |  8 ++++----
 drivers/staging/rtl8723bs/hal/hal_intf.c         |  9 +++++++--
 drivers/staging/rtl8723bs/include/hal_intf.h     |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h     |  2 +-
 6 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.43.0

