Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEEA3BFE33
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496862; cv=none; b=pDg9ldDOAi8eGlp8DqdoKc9vZT+Ay4ZrwANapOFBQtNHmYTiemjHTOXPDmig/E6rkhpU1GN4W9QpQRJbcHYFvEzOB/Baa0cj/ToTBgBSh2GZFOCbrdYiAY4yV/x/RJP2Mxl4uoMLIevVswQY/cvSFNq8JHc1/r8b798QYouCR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496862; c=relaxed/simple;
	bh=PwfY0i3BFfV9KUXe7iT2+DB8xtqjImxj6JXUepkb7VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQTzGN8RfhhDgrp2I/D3Ctr/pASVfCgq9IzDr+dayrOnl1Pg2HF1nIbbFcomaw8RbR+kvLlcsFH7oKOqwukS3YzON6AKEnuaWwjozcdQT0jyWV9wteTIF+ZZyg14Gc8S5Ubpc78pbcJsq0XN+6VbsO4M3xB2P3w+ZWq/YRMUV3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctDYDNdf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctDYDNdf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-365eecc5885so4009542a91.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496858; x=1779101658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PwfY0i3BFfV9KUXe7iT2+DB8xtqjImxj6JXUepkb7VQ=;
        b=ctDYDNdfkWEJllvkCgRia//FT8oR9m+EzIEeo2zBFyih9NKzKpzw6hNPkZ3MP79Nrz
         Zgqrt1Faubm8cwTCVdiWj9Q2mX3EPO4s8TdsASlBsk3H62mPBuNUSkNhYhhoSUjNriKu
         HVZxiuojlM28mT4lEelx7MFJ8i6VQ2eOQCnMpayW9HQDgXbZkzJYspjWB7UYRUBQ9Zj7
         5s5/o4bd6L7+ANWmFbSfvdHt+KcGbyGRD5AMIzBOXlpI2/hIaHfU/PD1jEIgn9VjbSRO
         EjdI+q1yMyYZkl5RdHWEISMhUHHiKwwJDCVzDq77UcuGGVef3EcQVS43PCGjahkhMeR5
         F2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496858; x=1779101658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwfY0i3BFfV9KUXe7iT2+DB8xtqjImxj6JXUepkb7VQ=;
        b=HtBnmp11MJMVMAWdgf+0GxIUqeCIvkvRbfuScXWxeuaYkIX/QJcwJV4sUEp2YAKdXP
         64JCwKZTzvM5GZJ+XnV07tuhtasoTGMT1nX2k7hLNTYTTqv/wOhjyjIs2abfU44exqfP
         4eO8EmRtSKZT3PtlYn3oxOJGm3uzfaayMvcURPN2TWCSgIsuIxglCu3E63K2/nM4lx4Z
         JBgtS0N+XVUfDicc1SvIpYdjMLYt4nWSbnSmZZ7JBA5ZFCby7qRrVLqLnyhiOjljDK5Q
         FiwzfnSI/q5iKGIbnJMSbUR6jWd5EbLVHfHZEp8nvwR8j74l64CsTK0fhQFousmwkMJt
         pdxA==
X-Forwarded-Encrypted: i=1; AFNElJ/qfWRFh8e3chU4mi5/DeD705oKbNpT/N6fL6HbcsKsB7Jxm8dutSFhdAH6vOdaHIdHWltqus6X8V8282c5@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj1feo5MA3VKQSy1KAv6k7DJPRjOvq9+O3gcSzkAWJO5hDZE5R
	xjJPT0rsGlpUTdZW1gStYEhqGoo0goamlOwXNyvkSSX0bNE7HZWFE/40
X-Gm-Gg: Acq92OFcWAu7FTlldscVhDNl0O10mKUcr0xyHHy9Uj/KRjFRGOSW55r8fag+EYh8ob+
	oue4V++lOiEOANMarDpKJZUufS9/U6bMDfLpBPllWwvqve5NJ7R2ncodbaOLEKntEtC7SNHxDRL
	TMA+3JNJI7bnwsrjAFJMqTn012JDdybCxZDEc6l7w58r50KAW0H2Yq+TQzSlvtClgZaoiOqb+6l
	l7i8XqAHLicXW3tF2mndA+7KmsTIudGiCLxOLcen1sbcHDjBR6or2+M71L2zhM2nMetHK0X6BBg
	t/i8sdEHXjEuFaftGdUXuXaF0au4CbUoQB9pXE8B+rlaJ9OYwOPjgzQ//z6bz9ia9k6fCQK16d1
	7aePyYcDdjlMAYZQX4u+hiMkMCuOiY+1dzGiHnzFGMyFN0+a9XjHZVdfFcNDsrgopEdNGhwYn1A
	VD0qnC6YK7Xs0GzIm07Mr6cdFTl1n4nI720R9BbyLgvcpnf3RZUz07N/NqKh/vt0WyNB9ajtoLY
	WVZP8qnlSW40ZA=
X-Received: by 2002:a17:902:d382:b0:2bc:dca9:f0ef with SMTP id d9443c01a7336-2bcdcaa055amr14395945ad.36.1778496858131;
        Mon, 11 May 2026 03:54:18 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm105696375ad.5.2026.05.11.03.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:54:17 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Add const to g_fbmode array
Date: Mon, 11 May 2026 16:37:55 +0545
Message-ID: <20260511105255.99641-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for catching that! I've now properly configured the kernel:

CONFIG_FB_SM750=m
CONFIG_STAGING=y
CONFIG_FB=y

Ran: make oldconfig
Verified configuration with: cat .config | grep CONFIG_FB_SM750

The patch should compile with these settings enabled. The changes are
minimal (adding const to g_fbmode array) and don't require additional
setup beyond proper kernel configuration.

Thanks for the guidance!

Chhabilal Dangal
