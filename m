Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882F471
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:30:02 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id t11so2278868pjm.0
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG3vPr7jTrZWJiot95jPYHU2QyOXWk1phufGNJD2xZI=;
        b=V3RGkfHJyAKNttBRs2ZB9e2X2di/5AI8Fn9ZsnPjqhfBwRFgo2GYZKZY9uUCX3c95Z
         6odMZIGiOvl5adcoBnz57aSGgNutvwkLdbe6y1vBj65SY4o06lad5cZhXyrcF49UGz/N
         ugjrryLmomOpVA+tCMuxxAEMT2tZ0uxcZRMogCMPwkvlZOFsDbjltywQGJcXnLJMjeV7
         t9Cva5qVoD/ui5GxLv4M0Zcib/BeBWLYten2D2bhtqHawqBjMewBIkivp6AGfnqzYwlb
         uMFyF1nr+ZxVUb7ucwMgsxdlBIFwO8lQghEvF5VJCmZjUYMLE86nhpbH+WoRlNFA7qiP
         8w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG3vPr7jTrZWJiot95jPYHU2QyOXWk1phufGNJD2xZI=;
        b=awbyR05kyabybAa1iHGE4tzrl604M3BicdUCEbvRA6KKeTRl9LjTTAZ8u/0hcBv6KE
         SaIn0TfBrLAavRmolya67CE6Fyzsorve/I+tbI5x6RGhlONtNaV+Jrxr63pYsVAbGhDo
         qyhDKu3SjM3rCHZ/A4qSJ3s4NovSn/s8lf2OjhP+dVC/Wgp36fts8qdTX+9Rb/XHFkzu
         1BAcB8EP/B4pLglEp3luecD07xnu0zE1JkueKoLBeJ/mMMWU/b7y7Vl1xFjePsVxkkpW
         eanyUp1JpGRxVfhqSuFL1EkX/O2bDdBVq19Ulh2qUXISsqw7o72gIN38nUhYdaiODh0S
         gl9g==
X-Gm-Message-State: AOAM533yX90htOprYCl3zpuXdsrfBRnIZtAwu/HOeh1gkL1Qz5xBY5KN
	sNVa70Jrfj5ehDD4iltQDnI=
X-Google-Smtp-Source: ABdhPJz9HzuN+RORcmcoIvkv93+pVKdpSAysrxX7o5ANQJDnTKBK7nhLOY0A+n2+atJI4ufmFMcKVg==
X-Received: by 2002:a17:90a:94c5:: with SMTP id j5mr12062466pjw.121.1621168202092;
        Sun, 16 May 2021 05:30:02 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
        by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 05:30:01 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	fabioaiuto83@gmail.com,
	fmdefrancesco@gmail.com,
	eantoranz@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH 0/7] Staging: rtl8723bs: fix warnings in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:20 -0400
Message-Id: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set fixes 134 checkpatch.pl warnings in the file drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c

Although checkpatch.pl reports a large number of checks, these are for issues that were present in the original code. In fact, in the process of fixing warnings, the total number of checks decreased from 548 to 546.

All patches are syntax fixes and no logic is changed. As there are a lot of different warnings, to make things easier to review, each patch addresses a different set of warnings in the following order:

- braces {} are not necessary for any arm of this statement
- please, no space before tabs
- suspect code indent for conditional statements
- Statements should start on a tabstop (this type of warning is solved alongside the previous warning type in the same patch because the fix for one warning addresses the other)
- Comparisons should place the constant on the right side of the test
- Missing a blank line after declarations
- Avoid unnecessary line continuations
- Block comments use * on subsequent lines

Desmond Cheong Zhi Xi (7):
  Staging: rtl8723bs: remove unnecessary braces in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix spaces in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix indentation in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix comparison formatting in HalBtc8723b1Ant.c
  Staging: rtl8723bs: add missing blank line in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix line continuations in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix block comment in HalBtc8723b1Ant.c

 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 335 +++++++++---------
 1 file changed, 158 insertions(+), 177 deletions(-)

-- 
2.25.1

