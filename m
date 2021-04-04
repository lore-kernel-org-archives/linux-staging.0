Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D595F
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 22:49:51 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso9792532ott.13
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=nOcn0vPLVXxEmV92y9dqyHeBVs9VlV3r+13+jQMCYTI=;
        b=nvvSZz75tIKCp29BJjqqS0GAGb9LZ/ElLCex9zGhJwb5c6BZl56Yt58akOSRSh4uFy
         bcbX7EuZpKWklE8y0NFfuXw5CNuUk+HTr0E8IJjY3milB6peJeh3ys70IVYbGcBmgVSu
         Wp6wjk0DollRYQUjotAUh7LWz5/kWyvJouiEqeCK7kUHxJqolCpWmn2IDsaLBJbEdZc6
         iILGI8i/O6KYSNZXErfzNF3gQKAgY3VP2013eSEYUs0QKl1Q2UqXXttDZb+ziAR6iHo+
         Dt/wVZDPohOiOIUhbY2+dAlivaGiRY6U4+hvREHMp3/9PHWPNiUiQkGE09ZuqOe/kZjJ
         K8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=nOcn0vPLVXxEmV92y9dqyHeBVs9VlV3r+13+jQMCYTI=;
        b=R1A0WADPMMo2h53IUvON621+KeSiPLpsdpTyuZb24WTjjYTd7/a+CpPrBrVIF6CtBv
         Y9Ks5DIMoXWCKmOoq1FD9qF8Jar5irQR08ZFaPCxbt43XLEf9LUF3j0DSslIX6MomhPQ
         w1JdZFWiPBxzc3le7YxfSrZOy+GiDo8SjX8IIhofMg8/6RCmRQrRYjb6HuhxX64Copra
         hufAY6vhhxCX2Mbcw3Mt4faCtgiolo3NHEy3FRfABVRpYXJ/w4Al3NgSij436/LAB6uC
         azSZjXFw5ZCrnTQ9k9vKrSnRzmT6IvC3ere2uZjP0AAn895fw/5vzIQfOeigMhVnvaJ5
         LcBA==
X-Gm-Message-State: AOAM531xXJ4/+iH4AgV6W3e05iw5a3CyFpbTDk3v8KzLpJoNa1PYg/qy
	lrfHV8ICrqexYo234Tih8k8=
X-Google-Smtp-Source: ABdhPJxTVePmUwcUaTU+jNkASTqfbyIavcc2QMhaILzTNPmc9hzMLtTIdKY6+A5OoZRiBf7lFa8lFg==
X-Received: by 2002:a9d:5a5:: with SMTP id 34mr20853977otd.353.1617576590968;
        Sun, 04 Apr 2021 15:49:50 -0700 (PDT)
Received: from fedora ([2806:2f0:7000:86b1:c1bc:6875:f962:d652])
        by smtp.gmail.com with ESMTPSA id d1sm3466977oth.13.2021.04.04.15.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 15:49:50 -0700 (PDT)
Date: Sun, 4 Apr 2021 17:49:46 -0500
From: David Villasana =?iso-8859-1?Q?Jim=E9nez?= <davidvillasana14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH] kpc2000: kpc2000: Removed extra blank line
Message-ID: <YGpCij8SVkJwO9AN@fedora>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Fix checkpatch warning:
CHECK: Please don't use multiple blank lines

Signed-off-by: David Villasana Jiménez <davidvillasana14@gmail.com>
---
 drivers/staging/kpc2000/kpc2000/pcie.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/kpc2000/kpc2000/pcie.h b/drivers/staging/kpc2000/kpc2000/pcie.h
index cb815c30faa4..f1fc91b4c704 100644
--- a/drivers/staging/kpc2000/kpc2000/pcie.h
+++ b/drivers/staging/kpc2000/kpc2000/pcie.h
@@ -6,7 +6,6 @@
 #include "../kpc.h"
 #include "dma_common_defs.h"
 
-
 /*      System Register Map (BAR 1, Start Addr 0)
  *
  *  BAR Size:
-- 
2.30.2

