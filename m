Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99612DCC08
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246819; cv=none; b=WGawP7DxODSi8Gm0Q6ME42oRaU1hvDkqwExtOUk4m0/ahe2ACO1JiJ1v1VNFikocZqR8EqjQljeusU7/TJdjgx57tB+Um1+b+UWwN/D+VzXPHN1WMpmZ3Z7L473fCMlEKCRT33xQlqqMKM6vmu0VTdSJk8KealI/NStfb+0hHsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246819; c=relaxed/simple;
	bh=YP3m8PU9SApxd+2sh1RGj8CeDqI3NvgOsoWu7wYwbZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUJQlWzqopigS6QpwR/s8Ox+G7jCRTwUu4NOYpRFRFB5yryrUbFywo/cgWiwNwhLRWzcxZKUw7tp+SgZxdhH1BgGLM3zw/tLnvjWeH60epxmuUrvAy/dvUuFufLhfsbUAxqjGSofwKTWnNIzUPXqMPNCL3IJSPsQ2PUe+wDzn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqRa4UuQ; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqRa4UuQ"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-68c32f3c6d6so2539693a12.3
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246816; x=1780851616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s8GQEECAMtg1yxY5F/vz66s4RPjes3uqRFsaqGsjjRY=;
        b=EqRa4UuQXeWDiOGQSILv9tHNlfUFWbUPrBn2RLJuYaT2H5ZXB6Y6Sc/vmjSQlZHcAB
         nP9vi9nF0fDV2AhVP5I1+Ak9NrDM+Hk7x5iZ2ExglCBP+3XDz0kfB1nmDyvJyrrFiJjD
         ucUybEbjKZO7pZVqpoLJT1GwdYYYUZO59v7CEpWhxvjrfd0neWsgLS+17JCeqBiYWU8/
         yYLT/z2pNqNbyzfpVz62zqmhLwJHwID13561y6+RIiUqp+WUWMP1A+We3vTO5/O/Sbwr
         pVqq2RNV03qohAwlvvi8q/4OEbAuaigJNJ1wpE/VzAkPp6iDJ+39tkw7jLs+R+yfKaoG
         bZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246816; x=1780851616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8GQEECAMtg1yxY5F/vz66s4RPjes3uqRFsaqGsjjRY=;
        b=dElqu4WB/P6tSQrrtV+2y2gn1k1Dwq6DanTWOHWny8Yb5xaloPCvrSE2DRsx16IhEr
         676P+QwuXVQkWLu8Vk0XxeWpWHcQbLenNOVddLdCXjFUgS2HNFzjvh3YHwBlo8KSuqPw
         U5s9eLPO4CWaSsiVtqcgRgnU9fJQ0bx4ZrKUhGgOb5N6Z7DQ+L80ReUmMgOPukjITaoB
         89CTV/XDCqPsbpZmm7IPZEJusjh1RhWsAVG0gTJdT16CWmZX7p1phWs1x78LwjzAusdZ
         TDYHiQsGSYuMQX7oHfhQFpYpxVpUv5ElWumAtE2nP8X283+34agC4GOOcqwJix4T+gp/
         Bi4Q==
X-Gm-Message-State: AOJu0YxyWD6s0mJGiqbxXZJJek3l5NSLrF70+GIr/Dv8ozJNwnGAfNi0
	lWpWmKSHqbjyg24REdZG3Ht7/qrTqlSlApfy/3mbWq3Jv3EAWBUF614=
X-Gm-Gg: Acq92OFM54IDyGv82Huqn/+2wP4GtEMiEBVR1AztNswusB6kOEvSP0Ik1OEFWO8yvJM
	KdwT3G8idyg/dmrwoPuZtFdpllvLQLk0vs8EN4n0gWQx75ssQpCA5gES7Q+i0Qo1iFaGB5hN+P7
	f9XvHAyAZSHhDpb3ONNzHZU54nsBzeW/CUrZkMIMDPfBcbkgib0jgHRbqLWmd484hHyqufsN2mh
	6opg1Lbnvs9UxT8HtJac9KBN9G7DClbuJzAXxTK5j5wJmWazoatkMwGgh5RtuZIrOfJKW75hADT
	2vTLzou4LfO16GTZ9ltURCCr1Zo+aPrSrQRG6SOeAdwaE76fxiopZbJ0/OyRVj0UxkZ7Hg4xuZp
	OF317VhuyQePAmt5ySIgZpvAgLyfkQguELOLeZz8GKkQ5lgRIodrfqXp9UIORjLvkQxgaWP82md
	W8iVGlDvgxcCM3ZZ6p0k6fXfe0rWsBDyrgs1Bmv2k9OOCKajcDZqVreuaHBR8=
X-Received: by 2002:aa7:d053:0:b0:68b:d10a:a490 with SMTP id 4fb4d7f45d1cf-68c8c56008cmr2868274a12.13.1780246815987;
        Sun, 31 May 2026 10:00:15 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb869dfdsm1184310a12.29.2026.05.31.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:14 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v3 0/3] staging: rtl8723bs: clean up coding style in sdio_intf.c
Date: Sun, 31 May 2026 19:58:46 +0300
Message-ID: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes several coding style issues in sdio_intf.c
reported by checkpatch.pl, including unnecessary braces, spacing
around conditional operators, and formatting of function declarations.

Changes in v3:
- Split the changes into three separate patches as requested.
- Fixed the sentinel entry in the sdio_ids array.

Vitaliy Slivinskiy (3):
  staging: rtl8723bs: remove unnecessary braces and comments
  staging: rtl8723bs: fix spacing around conditional operators
  staging: rtl8723bs: clean up blank lines and function formatting

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.53.0

