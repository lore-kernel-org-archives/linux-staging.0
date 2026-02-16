Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5392BEFE7
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273164; cv=none; b=J1YS6go25Cx4pHCV8Nct1vUvCR+HYWFdpQIHyJKWc1upmOKLz02gnXGH4J1gXMUvb9cwXpOJtiqf3oiftr8uzcupdSaiSsublrjlgg6Ye3CMx7hfh9AuYq5v+eqkJ8AA/P1z0Ddu/upFRvWQU/+JezTbIL9gjSCduq4wVB0pxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273164; c=relaxed/simple;
	bh=7zrzHR/3jklDwBQV0NGOCssUcxb3uR9vN99YLQJFfes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcOJF8CZP+sQ9rNDyDEu+67ockE3T5FXIPf+HfdN5lAkG8A8Z6c3G/ByRPQhA+4Ne2Agye6xIlXfsWADoq5hWgPbzlehmjIb50S/3Z48dpjP7X4afB5LRq58/LpYpfxOPGkuqjePNBoimc0p9e6jeiFMSsSrhrNH5N+xhf6KP3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAosd2EK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAosd2EK"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b884a84e622so12565966b.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 12:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273162; x=1771877962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rGn9tZOyGICi34ZbxtCHQBzIhQacC1mL5kumR9RERU0=;
        b=DAosd2EKSdsGJfiTu7cDqecm7I9PrmY4yfjFNs8ocV0ZcEJUwtX9XR5B1ILm+z2nYm
         YUzqd/p86+qNGtT/idJBVPug8jEuyZicKMzbSElkiZ7tUHzbcqjUcz0cEl4DYd1JwMvf
         RtZ02G51jh9p8Asac3P3yYnnMEdNYB9T9COvVijDGPaVRRyD9LyqSUDv3aMWmawtnW1d
         e+fxNNv6kqaclsoljQncFw3L42yRlxCFt8Ko9JO+/wZxHDMZHSOx4gFeCxD0zDhCANhq
         fos2sZgvcxLiz+sVRP1BmPHS163nYMPh+85hvjXEepMvUZaROohfuqxeGvtp7YlySE/p
         MQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273162; x=1771877962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGn9tZOyGICi34ZbxtCHQBzIhQacC1mL5kumR9RERU0=;
        b=MHAEDhWGsigW5FWeh+v15yPCwslqA6iH+2fqDuelcFCcGuw8kYWQ0JRKblnizoLUu4
         G/PC7hn7NrG+YT07aj+6+eG3xX+KMEMIBWNTXmGuVaRXZNhA34jmDAmHZ7ftc76N8RJ1
         Jq/eGgRK9PWFao7FBPtNpkV6ZNk2mRe0cQBWkek1KrvYZZ99lMsLt9UTp4+IwZr722de
         Aab82p2lOJ1mC7jwZtguoejkKrFeGusHy96oOPzH0KywuSou07sFA1dm2TkgYfMdJ2P0
         GdpjU9gEPPSwrIOV04ryeUrZmWg6sMxaRf4mqbplI+1dCHPaOmWoaxrRQshm3CvHJEdH
         J53g==
X-Gm-Message-State: AOJu0Yzn/QF8+JX82fo5+bARG6WNLhxTFvwxlNPx4uOJDYKgNcH9TPMe
	/yn+LUngPC4hxGCoYB0ac3cIPggEeli3H5P7OVyCyrvNxogvdWv+6PnmI+4efLXNdTbxhw==
X-Gm-Gg: AZuq6aLmVmJ24LAg7SQ2NsP22YH6SQYf3V4ypFOXajtcGQGVMeJbC2PH4ATI7giIkna
	/BMbGo/2p/6Ww5n8rnhxEIj3hNPFcMScVa+6jvHU6h6FaP4hFwLKnD51VzAdY3tTMvqomGV5XNB
	y36NnpRtL+iX6JcLsF9dfnwdzCqjFwBPsbYseT+PcafhJHX1IqssKY8MtnJIZfpJrmMAFZYA6mO
	ZoJlSENxFVd9+fO+JfZvQ0UJ1mYZuhH1KTPHLbePqygE1e7hN8QUQFTq6pRiO7bwBhRaJX4mG/w
	rbco0QyXcBC8fQclSfa4I1+DK4MPTG634dwzPnF+Np7IdRzu+YLNhfNnOIq2DVh6kLmXliT/Qs/
	ibzByoX05RrXVq4fqfFCIrq7oDITpG8LOT5M+NkM/yN0D3l8LYudkVY1/i5THlT5ik3359nRlwp
	J9RmXClRCMDQ0gJE3JbgaL+ey7duai28jDD/8GvQqAEya+aCAyKtZiTvS5JicMCc9oDZANm17Wq
	aR57ANMY54f2ywK7e2E99nMVLOU8EIgoi00Tqb/XKpdP0uyjtYK4wLvrcX6SW2vA4JQJ/fdkWyb
	5g==
X-Received: by 2002:a17:907:c27:b0:b87:15a7:8603 with SMTP id a640c23a62f3a-b8face4c826mr756401166b.43.1771273161789;
        Mon, 16 Feb 2026 12:19:21 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e4cbsm293498466b.13.2026.02.16.12.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:19:21 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH 0/2] staging: most: dim2: fix error handling in fsl_mx6_enable
Date: Mon, 16 Feb 2026 20:19:19 +0000
Message-ID: <20260216201921.1788-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix error handling issues in fsl_mx6_enable() in the DIM2 driver.

Patch 1 fixes a real bug: the return value of clk_prepare_enable()
for the PLL clock is not checked, while the same call for the MLB
clock is properly checked earlier in the function.

Patch 2 addresses review feedback from Dan Carpenter on an earlier
attempt to fix this function [1]: replace IS_ERR_OR_NULL() with
IS_ERR(), use dev_err_probe() to propagate actual error codes and
handle probe deferral correctly.

[1] https://lore.kernel.org/linux-staging/ZLUnW2CrhFMBCCa1@moroto/

Artem Lytkin (2):
  staging: most: dim2: check return value of clk_prepare_enable for PLL
  staging: most: dim2: fix error handling in fsl_mx6_enable

 drivers/staging/most/dim2/dim2.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.43.0

