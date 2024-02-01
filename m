Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474BB158D76
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706775524; cv=none; b=rdshYY+LTu6I7OH0aCScpoHq1Y+ynzxd1cnvd4oWXmlU8cQTykslgvQKR0iQgdRGzMkCfXFglvUERrUP/mT7DGujgvxgbf/5CDoAGQAL5aBh8wlFIJwutxRd82w2hag4q6bu8NDg92YR9UW+6Xf24e0g5ANNhLEoYz6qurlJZ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706775524; c=relaxed/simple;
	bh=DIaKZBB4u7WsGLM+tjdwDqov0MpFb1q5HjpRcygEqeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCnx2qeTvK1Xwg1mhZvddG/e1Y2uE+6KT/wlo/8ihnqo5KpVamb8QWfE4bTZ3FmusfTEiRnHbjljokbk13evCAMxfWSiDRHhSuP4CigcVsMG/r62ZBPyjfIlnX1jO2f5FaoCNaFkH/HPFMvjwoVCvcmU8D8GHQ4SNejVcbUiNr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmrJfvZb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmrJfvZb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so769938a12.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706775521; x=1707380321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ifEstaCFW5dRBoYTuvt1sun4+9dM+F8qEM4C8Rq1z4=;
        b=MmrJfvZb/CsVRcIdhhQR4Eo7BLSvAH0umbVbLtNa8+EAGAytp5i5lfRuP2wP7A7R6Q
         3DWQ/2WlQ1ruYWdQiqq19upVONxEFfZ7s5qlowE6rKDRNAOlD3n6VrFcg2FYKdvjPIvI
         118z4v8XmIqHW1WP/gCSfY1pBkY0MqLgw3hdKaIA//7bxSzhlvZT8eSGhAHXAN6/uEoL
         +QQdm7LZFvp+24jaWuFi7Q/m6n7k4C+yZwZq6iwyT7/97z8BWczPV7AWCsbQ3wm0/Yo+
         6l2Qp6+t8NwKx14f4Wn6dkelMHVXmAcTiIVps0XxM856roiRv31oyu6TEU9s1N82SMdE
         dkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706775521; x=1707380321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ifEstaCFW5dRBoYTuvt1sun4+9dM+F8qEM4C8Rq1z4=;
        b=aZnlPAkSr7tInd6G9/fuZmcokX1ujnrPZX0fjzWSw03I6iZ3oLDUHxHy5O7Cpuryfq
         uZCDWatxgG+y3p7FC5fTNl7x8cfUbFij9ObzJQsZs6osWyBETxcbjP9L0LgOZBonCM2J
         Uqygi3qQDNskCuq6W014/keABF3/9HoOnetOrwklfl0yBWAjyDSKc2/NtVLGR3c9MrIy
         ACwYB+A2HgiOUdpmAIXHmtMwdIM25hKCgAMVXuO4+OlDI2+m+Vbne6YL/gRHeSHjsnul
         o9iSD2Whcq/k/Hswi+oP7nYPTHltIGZEOBf6vDpV11MZzFd9rlwiuQzBuPbzbGyyJjmj
         M+xA==
X-Gm-Message-State: AOJu0Yz+3J3DMoI1MJqRTPS9DqkBdEJzTiR/POoCLP4M3B0UOTFlXeCc
	OABSompn2SRU1oM1OJoVjL3CHqhsKagq/PdXlEeRps/r5zxl8n0Z
X-Google-Smtp-Source: AGHT+IHMZ0jzWGFDtRQQgsn44+OiI+Av+ADi9gmhMPUppeualZSHIB60NRp8bcasFd+Qgk9dcPdbTg==
X-Received: by 2002:a17:906:3b0d:b0:a36:9f72:2460 with SMTP id g13-20020a1709063b0d00b00a369f722460mr1746911ejf.0.1706775521201;
        Thu, 01 Feb 2024 00:18:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWVx0Nbo+uM+MZOJnTBy3ppnzAum+Do/fzLfRqjd6KsKPeT0iCnWgD+XZn5bd17BNAlxbXmwgkd5KEvNtqadLxGLxgebopsJnwoA7H0plCrnWPcdqdprxeK2w/am58jtstdAHVAo4ZxjYDlyc6FFma5tgJtSVxmRu7k/TVOk4Gx4FSdg5U=
Received: from localhost.localdomain (ip-77-25-34-59.web.vodafone.de. [77.25.34.59])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906784700b00a310f2b4b91sm6954069ejm.48.2024.02.01.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:18:40 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: rtl8192e: some coding style cleanups
Date: Thu,  1 Feb 2024 09:18:21 +0100
Message-ID: <20240201081824.6998-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some simple coding style cleanups to clear some
checkpatch warnings. Compile-tested only.

Michael Straube (3):
  staging: rtl8192e: remove braces from single statement blocks
  staging: rtl8192e: remove return from void function rtl92e_set_channel
  staging: rtl8192e: initialize variables at declaration

 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 5 ++---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 3 +--
 drivers/staging/rtl8192e/rtl819x_HTProc.c      | 4 ++--
 drivers/staging/rtl8192e/rtllib_rx.c           | 5 ++---
 5 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.43.0

