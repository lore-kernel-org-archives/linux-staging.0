Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84B37D116
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933142; cv=none; b=tjgxHaSottRmBXyx+XwNXFAFAHaCjHXyAYs8F62JQQAzDbHGdJRPi/yT8NxH+9vL6YPIEWb3a1LYnFLPWeledI76HuDcE5CG4ADXhadBwBq/afs3Hb/aP2ggi8/0craDsty+EbgToKK/+X6RX6Q7ZevhFRaDlut7QpcFMOxe5Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933142; c=relaxed/simple;
	bh=Hco/dkh0BzM5oxpOLCzPRKLzfemvGFTZE8ZoJ4YPgGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvg8M5bCp19P5cJkPXNWGAwOqYpKdZgnAQWgC3mxHMDp4Y95peuxjjen6cLBBoq6c1dpktQfOTzPXAJcgtgkEXtF/dfZ8amXbb7van4HUqUNJpg8xDnHpoj58ceBrqwOKQ1swqSSsezToV0Hf7khYibhmLt95tigtoQHuIo8Fpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2k7gRbm; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2k7gRbm"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48375f10628so35077175e9.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 03:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771933140; x=1772537940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x43XPvqqlnrM3KnXK56AU57E+0X5L9bB6uY/Ah+u6rA=;
        b=F2k7gRbm8+VUZ0u5cc3DYRkBDtgtiJ9HbmViDHkVN6LzH/ejg2lLZ3GVlJoHE4kvQA
         1rzwLSzXAe/NPnpH37Q1IG5JgXYPfwrv9sD6cmjPrjaNLPyYj9W6Dz/pqsxEXZSCWFUH
         qzLjndIhegdBIgihe88NCMfI78hjSFCrkpDxHrY8zl/07JPmbHfiqyvDaOWk5n8ToKhj
         jqHurGJBj2V9Sw2iZkStJwOs58rUz3nEeKAmzR0MkwIcIlfq8ABgPFZIEjnYRJBSzEes
         ofK+1FdOzDrzUphCmB+g1L6tEP1flwx9hQTFbZMfmGTV9yHF399MRpdN+moEP53aQpaF
         RgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933140; x=1772537940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x43XPvqqlnrM3KnXK56AU57E+0X5L9bB6uY/Ah+u6rA=;
        b=ETm/s0qwjS2Wuu2KH2JplQGUjnfC8L4719/FfepeQyTsKZ7RXxcbUSbxGroKgPpHSv
         KhK4oZTub3FeyjrRT7/a/96bNxVfSM1J74kImJ7hh32hrG4CPUdPSKD42lEK9QdNQubG
         j7OsSztfn7teEl4La2FYMbmxE9ptBUaBJV6/qbl0igptEYs0NbmJ7Q/9VLNyXljWG6uC
         fBOz80ZpH1vu0BFL0ucDgQGKfe/ZbBWHrPloKbPy9vxjibMsvidCY7hvbxdc0F/vXxMm
         cD3eF/jCf2bHxFDSKyvsM1oV6inzUnMxmzLBwPFbb+lCXQCkRHPylGrYPc2NKaBa0UFU
         xJNg==
X-Forwarded-Encrypted: i=1; AJvYcCWF5tUslTNpkEWN0HMXvR8cvyDzKlY2B5Q5aheACc9208fOWOqbXuQ53L6wixvvK7RklmNGDkGT8/GRZzaD@lists.linux.dev
X-Gm-Message-State: AOJu0YzSu/auueGXFsH1VxZTb81K0FiQ71QMALXI1GWHzzSzZlFItLPo
	rH0IJts8QqWESsGRkiTvM5moLsbt5sj8/d2KUKqh8EtlYonnB1FUbqIUo9g8vA==
X-Gm-Gg: AZuq6aL0gHWRqJLZaHjm4ApRWtShfplkopV1eHTSinQQlWlhgRbUMwFyu+kJAgPECk0
	tVOmsjzSDm/k2bAfQ9LIsCx1aE+yQ/xXeFGcejHGv8pEiD2nqGGoN59HlI0wg+dxBkw9EU8YdSM
	eSPVROaeOI72VXYU5jXdjPlFy1xtxWdwoOGk9IG7GpUhzjiEIJSJ4vi/WNQvnXQs60vShY6BrHM
	elMi8aSgiVOWs09skkTZ+8xbYiepJ5PaWiVvmKTqOIgmkXMZWxgXdbRvBZQBJAkr41G4tUZOIyQ
	oY20ZQ0jy0gIgpvUVkZDEEyyWPGzZ845Fc5fj3q5FXVz09XHRW76j8ScPHH/h/nkzrSxDtFXGEA
	ToTbn8SLOF6yIf0JkKZvWl35y41i9HwQ8+d3hn49T/LUpTIEzAKYVyDEACt9nZUMuSGy2T80hq6
	98C7WprDKOyvXJcEkcIKOO3/5IElqI
X-Received: by 2002:a05:600c:8a16:10b0:47e:e4ff:e2ac with SMTP id 5b1f17b1804b1-483a9603c2dmr137785735e9.33.1771933139705;
        Tue, 24 Feb 2026 03:38:59 -0800 (PST)
Received: from fedora ([176.40.225.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm25791902f8f.13.2026.02.24.03.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:38:59 -0800 (PST)
From: Ahmet Ramazan Capoglu <ahmetramazancapoglu@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: Ahmet Ramazan Capoglu <ahmetramazancapoglu@gmail.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Fix "varios" typo in ddk750_swi2c.c
Date: Tue, 24 Feb 2026 14:37:23 +0300
Message-ID: <20260224113806.1506361-1-ahmetramazancapoglu@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling of "varios" to "various".

Signed-off-by: Ahmet Ramazan Capoglu <ahmetramazancapoglu@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..e63f3b00ec4c 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -27,7 +27,7 @@
  *
  * I.e. the SCL may only be changed in section 1. and section 3. while
  * the SDA may only be changed in section 2. and section 4. The table
- * below gives the changes for these 2 lines in the varios sections.
+ * below gives the changes for these 2 lines in the various sections.
  *
  * Section changes Table:
  * ======================
-- 
2.52.0

