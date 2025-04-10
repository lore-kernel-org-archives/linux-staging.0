Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87661283CB7;
	Thu, 10 Apr 2025 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290384; cv=none; b=BBIBRzjffavP0vqRKiOYx0a1UAQBKz0n9lW6JNRxhfQ5tD8Ag0wvffY5nQJ6QoeCKB0pP49oM6/uswEsnfRLXUljLo3OFHwjyCZq9WpJ5WGDjDcRDUOQQpoAd9uvfuCd5zG/o8cWJmO7duZ8Pspt5MaTvi6sR4xhyl0+na8Txhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290384; c=relaxed/simple;
	bh=UEBGq2hN5wuyKESgk2qgoOZe9WblBnLEGKHOMjBPOuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ag2GwI8nfUqNQowkMxxG/Oy8MMRjuYaup/9Qn2BgfiHSJdCQscAc/ru5T3W8hun92Vt8NEu4ArLlYGUAkkSfHkbrNsxHG6s3lWNKREfiWXW5DrZX0kdy8znsGnDDAmDECYQyJaOFFg0QBnzg1sP9hm20Fk+YZKI7bp5jHLcZQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtUN6OC/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtUN6OC/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efc457bso439751f8f.2;
        Thu, 10 Apr 2025 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290381; x=1744895181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYrkXMhVp27P99Ekcj0WCJBHRLqLKPjr4SvWz6cnHC4=;
        b=LtUN6OC/M4Rj1X8TVQ2AI1R2LH2527mrgA4AOm4Vno5tZlvEMDNkXvfHX1OUCGpX+U
         vKULygbciz9ZAHuPoY9iew1e0eAWJ2epNlQox0aMxEKfcB2WmzXOtrTXk9ZkwCrx2e0Q
         tjfa1UNG7xCSWIlI3eoCwODs2n9PzxeZE17AH9Me2x0DvFLfFESZfmCJri7XNQz9VHMq
         OFaSqR6nWKl0zLBXXIr5WpbwPQNOQjahSRwV4TbTUa30aHuFYeg+Gk6IREl0Et9q0Lrf
         ubmoo26rT4ogVNnLHiWvsyeFLDBQkYk4Nw1Eok8rbusWIyqQGt56aHRHWovdwt+cIhkG
         mQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290381; x=1744895181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYrkXMhVp27P99Ekcj0WCJBHRLqLKPjr4SvWz6cnHC4=;
        b=jRrVDizlZ67Wy9b7Ueopr9Z6VbHeB0zFc9i13+u6ptu1pJCnyGuBdXi1ux2ThDAgfY
         l3ReGHPM8Jdng+jNesehpPh8ZsT2EY55/A06/U39nyBxgtV28y17lBKuZgj7R5o3TqfZ
         ARCF+v1eiDCf5sT9qeA5JUOIQU58l01bUK061P5mc2mCBZvtfMVLkpo+ul5TwDzHnWrh
         HjOyJlYesI2ch7Syrt/LVuBGlykISY3rUzQGAstEb1eJI+AgvbS6Xk3JYign8PWa1Uck
         aJ+5ips9Gl38YMbgvtyNlDbpVVZHBHmmmLEAG0zW5M1PFfecGU5P681/PHn9yuLKnWAg
         eB8w==
X-Forwarded-Encrypted: i=1; AJvYcCW76myUsBUDen/l89JLjvv947AvK8LmEJjvESqLpwtvCOpamuzDT7NozPw8t5h6zPARGTgphhWqEasf/jL7@lists.linux.dev, AJvYcCWWebj81WkQS95fDyOJyjnDVufqwQTJYYaGtrgNu9+xCE0MGa6G4Vgc8P+RNtBLShGBwPL5UhF+c1Ge@lists.linux.dev
X-Gm-Message-State: AOJu0Yy763PTM54MIln9XYAr6SHLaJqyLU1Sdj6EldFvw4+JryIiXx2N
	sBEhGn3t2TrLg16CYSMEiVoqOlNH/RFEl0ipB0hA0BsPZdXMqDRDxKdNA/ge
X-Gm-Gg: ASbGncudsccrwDQpnuQ0LrPr6fYF4aVQiYDatTDN286yWVbLOn0+JpO+aYopSTUvHvU
	jV6OEQqc/lTRbIbtG3G+3Cv10rakA0jjNv+LwGTn2BAHvl4uhob7mqCLG58mECrD5hbffLG+dMd
	yPggQpOQct3s1PFWKoW0DUbfSQWRT7E1Yj3GjJHsczP0fKz62zSbiekbZ9UscOchgxhjit7RzAI
	ruNO77zhzb0vqTwU3JzOrWS3FseLEVVvStf7d28NVqEP1Xp75MFSil9etiEf84yvyqs/fT9G0/d
	hTuhq3cM4DqJqud+j4fiIsg3xvJIaVctW7b/OozzDT3dD2mF
X-Google-Smtp-Source: AGHT+IFnxvs0neXn/HotI7cfUpQWPwUidvB7rcaPFjsSEOWbq0mwTAGjvs6LC5eBHoLyoc+WimQakg==
X-Received: by 2002:a05:6000:381:b0:39c:2665:2ce7 with SMTP id ffacd0b85a97d-39d8f4f3461mr1949213f8f.53.1744290380290;
        Thu, 10 Apr 2025 06:06:20 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:19 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Improve code readability in rtl8723bs module
Date: Thu, 10 Apr 2025 16:06:05 +0300
Message-ID: <cover.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset aims at improving code readability by initializing
variables at declaration.
The patches can be applied in any sequence.
found by coccinelle.

Erick Karanja (6):
  staging: rtl8723bs: Improve code readability in sdio_ops.c
  staging: rtl8723bs: Initialize variables at declaration in
    odm_HWConfig.c
  staging: rtl8723bs: Initialize variables at declaration in hal_com.c
  staging: rtl8723bs: Initialize variables at declaration in
    sdio_halinit.c
  staging: rtl8723bs: Initialize variables at declaration in
    hal_btcoex.c
  staging: rtl8723bs: Initialize variables at declaration in
    rtl8723bs_recv.c

 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 174 +++++-------------
 drivers/staging/rtl8723bs/hal/hal_com.c       |   6 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |   3 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  11 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  11 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  59 ++----
 6 files changed, 71 insertions(+), 193 deletions(-)

-- 
2.43.0

