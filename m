Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D938D009
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489375; cv=none; b=I6QnBlHP/UnPTxDq5b9M+uGJHZIRbFO/a7+u2PPzG8um8ziLbQL+JPASY/5hljQSiJGrVDilE53kFm1Y2NI+fXLudO4/Wn+mOhTaqLqQGGUaNSLA9eLOG+TZAIbgZ9s/Geg6vJRwFGQBAiKAWEZ8/+IIiKtI221oAacaQOIORiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489375; c=relaxed/simple;
	bh=5Kou27DsZhZ3yckKREPuq4tfuHa8nD+bXFFmKjN/rYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGc5evPXue/gHV//QIC/VaNqURgZiiOidCeV2RUDn0F8W28RmWfca+g9gQ5wxA01TcCEEobuWJt+0cB6WhUmEwxNYdIgxnZe3vNBu+rrjLUByfESewv/+9zfxvbUNwhhZQkCJ9Euq9WTD5v65Ja9Iqdbec5oSKpCiHa0t7ZFRV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0CfUSa2; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0CfUSa2"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-604de452750so65949137.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489372; x=1775094172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=617HnN4ouLQg6uYIHc8KeKor488oFo4lUkqG8p2pOLg=;
        b=d0CfUSa2HG6zpMUPWRmAJTsILhkVeHtEwfdvn4OftyJo94GC10Fl88CDHCwKZjQXCv
         F52UsnV1iLNvBHNccNPK+DUsilOjtwnS56nHXaMslkoGD01vcmZJy9z/ROA8GKf47aZt
         W48ctOz9NjZPgIhzrlFlxR3lrX+WS35kSVJu+lSRmXRM48viclVCOM5HAhvr2IF4S9Ed
         FPEADJ40RikAWsOtNF7jIiQN11s2xqZ7XCthNt5khFiu1KSiLisODd/p9aGBHEKHyqUq
         ZyGlO4zMsL+Qs4l9CVT0gr80amhF+ZJ++kMVlGh5yxwXfdkOaYcqT8tSKrt4M+q0N5WQ
         z/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489372; x=1775094172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=617HnN4ouLQg6uYIHc8KeKor488oFo4lUkqG8p2pOLg=;
        b=qnLVfgjgZOkOlEOdCNlR/n0aP2wuReOR8Z8e9nBhKF2EVaXTabzB8mFhtMBM2IR5MB
         Wrl+6TQ+g6TeD+u6weiVpysCD6wwg0AYwLAgN+RuvIOwzqUt510P7l9gEjKllCOwajld
         Nggdc1yszOTKwJayiQ8tI4ZAbb4nGMGjfcL/vi6HLhHE6DKeXkH3djpa53X95s0Kk4ZI
         3pCdIL7zKlj5eavGwFb15mGfJLX01NRrg2CydB8gzpjXprztClq1wN1n2HjkQzkz/M85
         McP3BvnrgddYzGUa5oElbF8pz+khoAbKot7ejjd8BFfUwTtt9KjMvf/Hgt6p9Q4sISLc
         AAog==
X-Gm-Message-State: AOJu0Yz81tnC9/39Udm/jgoDr3/K8ZTCsa69IQyBZjsjJOk77FoRUakn
	mB+nXFKiHMYr3GfsxdKpRVp5WQR9xiQFuKPlDRe36tYK6+T6+Uoqu0a7
X-Gm-Gg: ATEYQzzZ6bioXTy2R+OYDPcSwgBgjKoSnX1J7Q9reO04e/2Z1boJ0TNi4v1+//KDK5B
	pf7fWHRxUo3OdH2V475lyZEXBPe/II2jnEGq2dGQZxy0jkz+GOPmG6RMcqqwiyY/TfbsupgNLio
	j/VfdzIWeoi599d2YHf7r5DyoYhFuYlFn5fHsc65UwuwzHo6EEIP4R5yhSgm9PaiHMWxrea9Ice
	wAb9Zl4EhWnd59QUKdJGfrjzTaxVUTkplCRJuCvjjJpG1CmAvmqESfAajynCnhxHoowqoVmlLLs
	fwSv05QPe0UoZDpK+nEO1mKZDb5uB6nuIfShmxuFgwZZ37bIOTO3qyDTVfyyfBIFyTb1rk0QBmc
	6i4vef6AnNvWl6ABYNoY3tFGY0+HdnI3pn2yJ7zZh5Mk63t4/sY8FdpH8zRZqJzkhVTD65UeVHk
	pEpsZhZ6Q5JeB/ddwTX3ga8pPpWVLbb/OIefYXFV+x5zgoV1ioIdwYrSz6Kcae9lD2mSCkCnf20
	9RaJ10R
X-Received: by 2002:a05:6102:5a8f:b0:5ff:b8d8:b40b with SMTP id ada2fe7eead31-603870cb3fbmr3136926137.11.1774489372482;
        Wed, 25 Mar 2026 18:42:52 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.187])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm1661643137.5.2026.03.25.18.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:42:51 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: fix boolean logic and clean up coding style
Date: Thu, 26 Mar 2026 01:42:19 +0000
Message-ID: <20260326014221.525368-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a potential logical bug and performs various
formatting cleanups in the rtl8723bs driver, specifically within
rtw_wlan_util.c.

Patch 1 fixes an error-prone boolean comparison. A u8 parameter was
explicitly compared to 'true' (1). The condition is now evaluated
implicitly to ensure that any non-zero value correctly triggers the
intended hardware register set operation.

Patch 2 focuses strictly on coding style improvements to align the code
with the Linux kernel formatting standards. It resolves lines exceeding
the 80-column limit, fixes parenthesis alignment, and removes outdated
commented-out dead code.

Both patches resolve issues highlighted by checkpatch.pl. No functional
changes are introduced in the second patch.

Marcos Andrade (2):
  staging: rtl8723bs: fix coding style issues in core:rtw_wlan_util.c
  staging: rtl8723bs: fix coding style and remove dead code

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 130 +++++++++++-------
 1 file changed, 83 insertions(+), 47 deletions(-)

-- 
2.53.0

