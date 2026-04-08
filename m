Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D383B960B
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645119; cv=none; b=dbBO2M1SlDACn7C5Atgof6QBSMevPxHvoPyGZxw0JCzhXmEg/DC71L03RzJDwqAoRppq/i5g7OD48R4rytfBBRZoQBDwVz1beFbwApKTpvt8XD3iAg3wcqHWDY/KFu7ydmHOlhBW6FXvJMSfC4/txt/sNxFVhr6IB9YZ0x2oM7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645119; c=relaxed/simple;
	bh=4wh+x2eLwodENhw62MeDkphPHbsEUxgzqtLtvKsRBL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uN0SU7vaMXHq8Tdz/RZJL0m6k4llNMiwbV53oNBA9wy6fg5zKPoWbHLqlNiWvoociJV7FfeAw+jvHpUHea1pJv66QcG0HMq39eYynGnCyqkIk443AkgGbZ+xUrTEViknXOVMZugeLeGaqndhIyU5If3W+kXxQpv4/+NstxOExRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVZxRnv5; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVZxRnv5"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12c19d23b19so1652962c88.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775645118; x=1776249918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVLohcLw2czX7vhFZmwjRjFd9S+RQsSrUtRS+thu1qE=;
        b=QVZxRnv5p6/Mh8XAbCWVp/TA4E282RpOI1OW4VbBVdWue845yLj+Y4C4fhtK1tJoAv
         n/XLO3f4M5cpM1ZIiqDADT8o79SadJvyzfdfuOJnc9kSUVo8dvXUyjOTspYlJkQZov8Z
         di87yZn6I95qNYnxHfPgVaaDRW5a5mnxuXSd83w4pO9aboEeBtmnIFwKYZxfNvKguVWt
         4e5XmJiNroUURhVVQ8HAAZLQZCkjnRsP8xZHgJGBmXzdlz5BnkVCkR6TUrsjl9M9pPhx
         VJpX2F3vpuu3AaARtiKlfDMYbDXwcvCTP7AAOkIUYROjElJE19Y6p9b0DhV8SNFmBFcb
         2uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645118; x=1776249918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVLohcLw2czX7vhFZmwjRjFd9S+RQsSrUtRS+thu1qE=;
        b=RDQOoh4Nz/SeCQuGB9I0jHws+O+7CXsBABOjvu044P43j88bRFTs7ACXmdlAJrCGEe
         U/VEEWaLoe81X2AXjjFg3qrFqj+nL84Ycmy+rLrEi2ZxcImZZfprNCdkb2BAFkHcsLI8
         wyDXcpL9djrbDqHHB1wkBHPTGBhvBJRmeOLQ+qikxkcdGPUYfZUeTutiEeYDIk+L23n4
         kDnJ27E+Ih/oXRDzNuSa0cjjml6gEFbyHnPQk/f5INiEIbCwO1eBCpfVXkvDVlrtMrYp
         PFQ+lE7FGhQEcOtXlONN3Ul3CGuIAsbYdtpb/0W2wM88SEkQZnr3VSOfSUocKFxIdr6n
         tB0g==
X-Forwarded-Encrypted: i=1; AJvYcCV6N6OczYoByQG67NvwyAl8RSuoMGi3nA/MoxCzIpZ2CxTFMZ3ocb94Jfw6tiBt4jqRhDRh5DSx2wuPJh0H@lists.linux.dev
X-Gm-Message-State: AOJu0YycPLENCDbFpoKsgdy1yrSIrVdICBWfwAJmCJOVjq60p4Jc2IpG
	FaAb7suYIBcym2DKI+KHcRnpX2stdKavjVLDCnecta6g0J2f+PuQ8Q0a
X-Gm-Gg: AeBDietm8Tf/WDK1TveJV3LWDznbiDPbNMj4n998JgFdZgTPr+iRRGQWJIj/BSkoCuh
	g1rMdxfGIdDruXXydwB2mOohZxmaBeVudb8KzqYtLRjWeMdnPWjbteCj07Jl2wkhAOZYEwhkIO0
	KEeCXBbbeSzS2Rfu1r9hlY+nfLMlr2L2N4V4ePDSaEJ92NDR0vUT4vzLi0yfy2vggkDVSBVaO/e
	gNpaT8c3Dr7/scBiQdcuOfPJZIRPQ+4cpmMEIwPdBAI+2O0BI6mcsL0fj5aUxDirzemMMltSP1i
	RdQ80cFNBMwm1YbiJ3Wls3WN5WztR4j4R703g4ZK+0iGPtna444Uyj5IHYUc/8dzCLh6G0+UfVp
	SYLrE1RrCEKwL8J9r8z4DqiWEuCG/Mo0tQqmmVVe9KkIg3xSqkMvpaXaLKBixpz+QcxjX1QP2Mv
	mVp4wCXJoJw9rTVl6ZJ5/WbSTE1jCtZq1e4l7S/GRdWgucRlXnkM6tkn8=
X-Received: by 2002:a05:7022:6199:b0:11d:c22e:a131 with SMTP id a92af1059eb24-12bfb6edfbbmr9823569c88.3.1775645117556;
        Wed, 08 Apr 2026 03:45:17 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm24417783c88.0.2026.04.08.03.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:45:16 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 0/6] staging: rtl8723bs: convert xmit init path to standard error codes
Date: Wed,  8 Apr 2026 10:44:18 +0000
Message-Id: <20260408104424.18952-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the xmit initialization path to use standard kernel
return conventions (0 on success, negative errno on failure).

This replaces the use of _SUCCESS/_FAIL with proper error
codes and improves error propagation.

The changes are split into smaller patches following review
feedback from Dan Carpenter, converting one function at a time
to make the series easier to review.

v4:
- Split into a series of smaller patches as suggested by Dan Carpenter
- Convert functions step by step to improve reviewability
- Ensure each patch builds independently

v3:
- Rebase onto latest staging-next to resolve conflicts.

v2:
- Rework xmit init path to remove _SUCCESS/_FAIL usage
- Convert allocation helpers to return standard error codes
- Update caller to use direct failure checks
- Address review feedback from Ethan Tidmore

Hungyu Lin (6):
  staging: rtl8723bs: simplify _rtw_init_xmit_priv control flow
  staging: rtl8723bs: make rtw_alloc_hwxmits static
  staging: rtl8723bs: convert rtw_alloc_hwxmits to return errno
  staging: rtl8723bs: move rtw_os_xmit_resource_alloc to rtw_xmit.c
  staging: rtl8723bs: convert rtw_os_xmit_resource_alloc to return errno
  staging: rtl8723bs: convert _rtw_init_xmit_priv to return errno

 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 138 +++++++++---------
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   1 -
 .../staging/rtl8723bs/include/xmit_osdep.h    |   1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   5 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  13 --
 5 files changed, 74 insertions(+), 84 deletions(-)

-- 
2.34.1

