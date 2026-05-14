Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA738B142
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753246; cv=none; b=VKsrYK+FLbfJVP3vpYQigTvfPrKgD/bwkpHde0HDDHULADVGZ0OonPLhHR3Qmr/g2F3+T8Ar7SpMlLbu5qQxxSHKzyJpzBBtsov+VJ+bTRBtCI9zopHIqjsPDOUgBY0V+FuT+1pXiVDn2fhrfjhVGfk8SaOau2niu/BmEp2Nv0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753246; c=relaxed/simple;
	bh=2vmXRrytz4iGXlltNXIB2UjK/hXLhHP7qHHyy0ZoQuE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I6lz6aZEm63DQ1/5O1Yu4TiiyzvWKpPuSi0XheKXtsp6Qnx4BPp1yle2HJIzxtgqkQmYWRfJOP/Mu03PuKTEsmiPCubzDtVFkftRlp2q5jBhtxSX8GfH8igGbdmvfXLdO5Q80RykSBAFf+hvPmDxW9k/VSYdDUhQsNP0MbKDNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3Te6iem; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3Te6iem"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1309f4ee97fso9799795c88.1
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778753243; x=1779358043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s98BsH3cPoX1V+Aa4Eby+V0MBo1kkzt5yyryucGMezc=;
        b=i3Te6iem4vJUHfltoJwDQ71hnc7hTO+isJUfeIRo8x6+ShPD+aCVV2+aOUGfrn++W+
         ixKPVotbPuXTq455um+Hw2OzQAIfChNK3yl7MktUhJl3Jzlc8tLWoRqauE5QdeLA0Nwn
         NGbv6lzDLS6gTTqcX3yTf7l4Hy7JY+ICDB8taGF4Ffnunnlt9lcimxTFvP/ojfu0sl5U
         7Gw0+j7WOieah3AGwxoLswTCIRjBznpRhTymSAgRMfHJyti7N2UE1sY2s5VInL++GQ/4
         3eNtrT8sMB854ds6gDldKBunlWqDo7wS+ybdWlcHpZ/bPlLvZd393KX5UgjThYiPLzgm
         KAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753243; x=1779358043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s98BsH3cPoX1V+Aa4Eby+V0MBo1kkzt5yyryucGMezc=;
        b=PLMHuHssYUFbnX9NhPuR95IYHf/Z4+52W0wzdZxZbxZM00Vn9tTG5bHXkkGTVYcXtC
         G+yt0ivthErLn3HJIad6Qb2frLDPdTHF1fTN3ScrZIJE1zjRvPUmOMDUa8E6owzNV+J5
         6k/U0g+19ZzeeoZ8GOF1UsMfj76naoBDkbQspgQ5CuZbtJPb6i50TJ5rPitI71yyMZ/S
         bG71rl+3HNdKr0GLcPHaAmQGBzLHiyhUOx//yKT9s0QP8KBdXiCNNM3IWumjJp5Cn10R
         drJtkaiOpCg2kZsSfBr/VCMOlgjrIiliUfJQ3PAgXrxyAdd7DRQJVBY7Ab76M0jMMaQe
         /EjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9j4769u3TacGUyecQTLX3g1+HgBJb15Os7NdUrgnfEdXiLgO+/IuBvTurNOF5wbqZtUn3NUiY4OcTVAwsj@lists.linux.dev
X-Gm-Message-State: AOJu0YzyNmA3Tfl3O+DzEqTOu2Lu5G+JnFkETsyr6i7oNfime95ituXh
	/zL3HnLfAdvsZb5NPdURMTVDXW4CrhstLX/d2L/59h9/gNMV/HzQbC1+c/Dx2J1NAhI=
X-Gm-Gg: Acq92OGXK+1k4AXsvTozVMFMVC7nP9daWkSlRAiZrh9tAXNx+ZL1W2o0YRFjnizZCbJ
	kr1C3sJs6V5j9XiXPeZ1hGil0ex4fuNUuzGm3qCU93arcRbDLek7bcgYGTQ1wDUN7W5hWZcN1Qs
	QI6Yk0Z/XpmzVCY9jY97y+LlraBbzsSfXeeLdjmvNeH3rFqJVnsN9gEf8RofW2spPQMTjFK8fXH
	qfs3zjr/o+wtduSJ6wAhue4/ksVZt0/yOkrW2o1nBcHFLZkNofcird0leSetGxNITGiPjBU/rKy
	9ZyPzDxoNA2rBEfde9kxyE38eMoxYaVburaQYWWm0eDquiFZ/5KkMb22IZbf3SMDWAC4pOPETP6
	uSht/SbmvTZ612jgm2OJb4INVSbiRniqeMe3kuub6u6muQt1pPjuc2sqAE9NACIYDLape5NHi3/
	xvQRmPCO+TBuCufWGAvIovwdfXRzgr6qFo7au8VNdHrmxHadBRC+fd0LtSU9mxfKk2fw==
X-Received: by 2002:a05:7022:b88:b0:130:a4aa:e4d1 with SMTP id a92af1059eb24-1349ac6e323mr4161582c88.34.1778753242826;
        Thu, 14 May 2026 03:07:22 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm3757921c88.3.2026.05.14.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:07:22 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/5] staging: rtl8723bs: clean up xmit classifier and propagate errno
Date: Thu, 14 May 2026 10:07:03 +0000
Message-Id: <20260514100708.25031-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Clarify commit message for hal xmit path as suggested by Dan Carpenter
- None of the callers of rtw_hal_xmitframe_enqueue() check the
  return value, so they do not need to be updated

This series cleans up the xmit classifier path in rtl8723bs and
converts the enqueue path to use standard errno-style return values.

The changes are split into small steps:
- simplify control flow
- make the helper static
- convert the helper to return errno
- propagate errno through the enqueue path
- propagate errno through the HAL layer

Hungyu Lin (5):
  staging: rtl8723bs: simplify rtw_xmit_classifier control flow
  staging: rtl8723bs: make rtw_xmit_classifier static
  staging: rtl8723bs: convert rtw_xmit_classifier to return errno
  staging: rtl8723bs: propagate errno through xmit enqueue path
  staging: rtl8723bs: propagate errno through hal xmit path

 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 84 +++++++++----------
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  7 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
 drivers/staging/rtl8723bs/include/hal_intf.h  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |  3 +-
 5 files changed, 52 insertions(+), 52 deletions(-)

-- 
2.34.1

