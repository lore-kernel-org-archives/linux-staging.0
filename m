Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8B5263F5E
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523644; cv=none; b=Y0bDoYxGjwmzT/I0pqNbU6MffD7Ipwf05C2aTSYPcojwYEITV/YYBmuNTJAHaVIdrLx4Ahgsyr1Lo2BRHAG8svIJgBhmcs4Nj81AJQGaqVUCelQrrPOya3ykWH9JRzyR4qLrwOu0HF64nlek0Pf8pjLm3U5cWQC/xGRMTIh6y5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523644; c=relaxed/simple;
	bh=EqotieaKg1Lgjbm99e2XcwBZ2S34SVP41Ixht0VgAJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YVCnAmNilcFoEPPLX4WQ5Sv4bGfr62qPhQIei6fE1dxinKEjITgcszoZp55MKTyBNYtPzHSMShBsy7pCvdc/CA6eVM+RcLZMmf3MauEOYWRO0QpADPnYaRFyJncM2KYCWgpw6yUP+yGucg1o7iu+TK9bf44HWnJJIdF4ZuFULlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdXlEuh8; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdXlEuh8"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f0ad52830cso6757956eec.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523642; x=1779128442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofKw5t3K6vpLhqRH0Eujjr8ma+wm0aAV87/KoAPPXIw=;
        b=pdXlEuh8pYQrzcegUJichjREqDeMUQCJlmqa5JLT0Is2SaCUG8zhhs5pDf/537mRxJ
         bY+Po1PxieMW4LtqSVHJ+3Qtn9/wuwsSNuM24XdCEBTZpVaQ2dz+Dlap9oqFjdMAokwU
         +yuQuANK61H/kVe61RhHQN5hDYL1ujWVT/3mql9d/zRf52054s5g5OlD8RGxtE622/9E
         tozwY2hGVOzty4ikAUeuPHBs7DBYyO4tHigqE02T9m/e5gkkW9kiYILDsbpaPS6tRSAo
         g+aEJq3prwBXuU2ur66ua8JMN6FZGT3/Je1k+bayOzK1CLsThPipD60bYMDN/JEkqriy
         6FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523642; x=1779128442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofKw5t3K6vpLhqRH0Eujjr8ma+wm0aAV87/KoAPPXIw=;
        b=HxiMIYnqjyfjPhUhu5fCFzkTzUjnuyl1jjUoVK+QabTRhibEfUFSVN0qBEUH5xPZ88
         4qIr0LnfR351TRr1p6etUVldgTDOb6682g1WeasZ/9/NitLLpzkeNfyJed5VpAtH5ICv
         S9141jzRJOIBgBovlBlMuu5lSPFvQI1qROwTMJR1e7+G0/0rXApUPhUE7oX+CjoLdryQ
         InXsPvOy1aArYzp9HLVcDqXfKU9KutowHVIsubS5C8AgifZnWZ/lC3ODRkOx6jngbKz5
         7EYvmAcITu1i2GuSxc3EtoQA1kHUq0PJNziNV2wSiENVdUycbv77gHsX4/TurRgf8haX
         AEsg==
X-Gm-Message-State: AOJu0YzVvGi8rv0iTCSWK9N1kDRuysm7lBe8VqsDZ8/0LIpV8TgQmmVq
	l+PKNMR3tJ/+INkeUuwrolpKQ2+si79kYsiSOjIXP/lzibdP/yAzgdYx7T2+hQ==
X-Gm-Gg: Acq92OG0Quh5GXjLst9TG9Cdl3XcIp80BPAsd9xWnMAB737lmjO+UXdosKx4ie8feWv
	8ygvOLwNIuVkQqt19pA4snw8ZHzTXH8eptlP2uyXWikSowi0snnnEodFkIh/Har1r8ydAZQyN5i
	8NWuI2vMZkck6km/AxCJY8COA+VLnRevMXisNoZxbBDARYPcm49xMg/AlDw8R1cyecXt5PBCwg9
	J6vX8H/l2N5MK4dnDnodkmE/v9XDDvEvK1dBX0haD0pXie2Czbfp72FtNWRRWWiPZY0ih1n05/a
	vVPL0LhnP3hgzyqhQlJi4VK08eum15CBRrplcs61hjzZ+QXR3fsd7sYtYExRqfU9LKcda6KZN3d
	jCrrjEfTBLAM0/3PuyBeMNVg9iMd7/1LfsppNhAdTQAjlbiHVNe3DzagxQoJ4AjG7YQr34OycuM
	rANRhIrb61YqgW8Zn94aQCzE/mP1QRAHNs
X-Received: by 2002:a05:693c:3016:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-2fb4befcc35mr4212610eec.11.1778523642194;
        Mon, 11 May 2026 11:20:42 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm17951816eec.23.2026.05.11.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:20:41 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: remove unnecessary blank lines in two files.
Date: Mon, 11 May 2026 11:20:36 -0700
Message-Id: <20260511182038.6625-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes unnecessary blank lines around braces in files:
- rtw_mlme_ext.c
- rtw_security.c

After this patchset these specific 2 checks should be fixed for all
source files in rtl8723bs/core/

- CHECK: Blank lines aren't necessary after an open brace '{'
- CHECK: Blank lines aren't necessary before a close brace '}'

Jennifer Guo (2):
  staging: rtl8723bs: remove unnecessary blank lines in rtw_mlme_ext.c
  staging: rtl8723bs: remove unnecessary blank lines in rtw_security.c

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 54 -------------------
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 -
 2 files changed, 56 deletions(-)

-- 
2.34.1

