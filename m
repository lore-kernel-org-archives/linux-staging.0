Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262B4370ADA
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481591; cv=none; b=rooAqsOPxKGLOn8Hu4d709JEUTYWVNGMy6dUQabM7/q5NjDYewdm7UcS87ifamAfJKwODwrGDz7Bg5PNr0ESr7wNg8Q5aAL54QhVJuOQk2bFvYIDp9FiN9JS52DSF6zbPDnqkxeB+x1XX3cuIeUc7LP4lliojmSwfMmIICxeKgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481591; c=relaxed/simple;
	bh=phPVBiwHZod7hyduH8g6bjOeid2wg50GdIIFJmDqy1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rUXGPKmcShoGdguzYB0zTzBcC31HE97klhF44subyN6uZpQ5adERCeECs6mpHEC2/qPUKWZTA0lNNOuINqgMHcacoz7EmAv4sBJk2zvAejl/udyC+gTV13WfuVhb8dQILlxqSNRWHL6oiKVYQHqmwOJhz0ftxcH17+35RuptgDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MewzfqPQ; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MewzfqPQ"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38dbe53179bso220078a91.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 00:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785481589; x=1786086389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yuPEw+/yMsfR86rFFsx1cPDv5mxAINevJOoGjlqpDNY=;
        b=MewzfqPQtS8/5iciUnupcOBQQ8i7pSDlfuHwMswipOXCXGDYsp1uBcB3pGQzD8scih
         NLv077JfAisFpqnasHUIfh5QkONE67I1Qw0PxWojB+WVrJUOlwjqTjdbOxAx3jRbHQf8
         PbkZMfFpHBwxBe78Htyd2xVneHd8eQMr5C954tygmpVHAc8mJmvWOdZGIM38hALJcffB
         8kyZnzTbZVkGyhVDahEzoi7gniGKae0hWF5oTKDWxiM4UEFCzlHtntSghB0j2H8L8Unu
         oENvGkm5j/Vb9+zR2hV8oU9Rl249g3UnapSpJNdyfWtsmZKYLBveHtba2vAOYnjzklWE
         xI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481589; x=1786086389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuPEw+/yMsfR86rFFsx1cPDv5mxAINevJOoGjlqpDNY=;
        b=I0r4ADP5BvfL+Gg0MxBP2sjR5RZhToQy+nNVsBHf18b1vGpz7+s/5ipGpyOvTOuUhr
         btKbeZs9o8IWEaoCxFygT4ibM5iqhTz0ceifbOjW2PbmoHLbh8X4Cd11o28cFuKHL8GX
         rVJiHroJaMHWLrBH97UoXFGQi5fbY82TBrqidjz0TRF/z5dQo49OQ7yuTxFOdw3NFtP9
         19/zamzyFUmx+sZAQuIqJ+kuKyC0p+DSSiEYHd/n/3TB6OismRmTtngmVdS1+3DlOC5l
         dzX9jEy61l2QLwqEDHSLEnsVP0LApVN9ZuZTMi3rB+4Lsitn15wvhcqNX9i9MkGFA2/6
         IFUw==
X-Forwarded-Encrypted: i=1; AHgh+Rrmrv+nnzHNkBwBNL4IIh1qv120hB3mxdLIhXdBxc6wsYwKrJZ8317gk5IqgPcP2Qp1Er2x0I15Cy+oXNsy@lists.linux.dev
X-Gm-Message-State: AOJu0YyQv8aVjxS635/vHM2ARM+nqy0CeSGaRuhtZVSOs8F80qK2MMoX
	y+SlSY5cTyWVfA1G+b8/65fzbk7Z0Vn0cFmki/p+wQgIgNwDfwc6WEKA
X-Gm-Gg: AR+sD13N7h0uLHal+dhjE5keXWkZUgJRbpWIfttd6DpFPn8eXgyAsFa+GRwMccbuhoI
	QepU4m4ott2cXBYW1FMKEvhiRrjSGKjrV0ercRL+FhLT5lmg4WNeFVP4BO4ePFLS86bPF2DcziJ
	X8h3WUTLB7Jzet9n8dshpyqeXatHr8dRzG5jiwEXzuH36LR509yzwHI0sYKj2Fxgr1I2VOgm9Nd
	mDCQ6wUuhtOOj9O8lKcQPuuQuGHgOWDDo2c2JOkPzoor5o/sVRhmSe1PI7kCQH0SCalLZUPYadd
	KEuFpaF+m0v19YKow819xhvJzS+Ri6WWb3m/gEwuJIt1Bvk4ieQeG4AAV6vooCm5QClDpR1u0OL
	IuZDVCoIeVLCSK3u/YJE7sJ33xAN44U0G2NLp9BCIm1laG3cg1sfKmX6uAEsRwwU+0IGW6Qx6S4
	af0FfekBYuT3ONe23H+Sk6/Xu0MOdcn8UzpiFdciGbYEX2Cw/88X/5uJSROT91ZDLx9HsD+KtYr
	/Yq/S/muP5MFarmj3V2
X-Received: by 2002:a17:90b:2e0f:b0:38e:69ae:7148 with SMTP id 98e67ed59e1d1-38fb146aa2fmr953185a91.24.1785481589401;
        Fri, 31 Jul 2026 00:06:29 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm2589587eec.7.2026.07.31.00.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:06:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: convert management transmit path to errno
Date: Fri, 31 Jul 2026 07:05:43 +0000
Message-ID: <20260731070546.20959-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the rtl8723bs management transmit path to use
kernel-style errno return values.

Patch 1 converts rtw_mgmt_xmitframe_coalesce() to return 0 on success
and negative errno on failure.
Patch 2 updates rtw_hal_mgnt_xmit() to propagate the coalesce result,
and updates the intermediate dump_mgntframe_and_wait() flow to match.
Patch 3 converts dump_mgntframe_and_wait() itself to return errno-style
values and updates its declaration accordingly.

Hungyu Lin (3):
  staging: rtl8723bs: convert mgmt xmit coalesce to errno
  staging: rtl8723bs: propagate errno handling for mgmt xmit
  staging: rtl8723bs: convert dump mgnt path to errno

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ++++-----
 drivers/staging/rtl8723bs/core/rtw_xmit.c        | 8 ++++----
 drivers/staging/rtl8723bs/hal/hal_intf.c         | 9 +++++++--
 drivers/staging/rtl8723bs/include/hal_intf.h     | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h     | 2 +-
 6 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.43.0

