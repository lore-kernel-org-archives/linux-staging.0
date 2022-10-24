Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F77ED;
	Mon, 24 Oct 2022 10:02:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id b1so15841140lfs.7;
        Mon, 24 Oct 2022 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbc9+ZJrZvJ0IrLyQ89n+PqwdOcGQExwOrzYsD/fuLY=;
        b=kQrqxJlWe+DlZbyTxFm/764ugetvgYDPWKrAOqJ287D/lQAQg7teJsFfY0om+S2R1j
         +1kx+HBEJxybLZGOHbyDFRd0tfcFwFjmPYbVWxkmgqm0Sz7YGknr+Mn00azS2vgrV604
         8e6ZGWeU2wf4ZFGv2IaP7YiVNUeXiZK7vRYryuO9KYeEqG9sx8IOf8owGM5gEiYA1N0k
         qv0/cgfZJaky95YcTpjJM+V3j7YZS+8hs98IE9IjCdgpLiq9Wc+1wvepA/dNl7gsUbZw
         UYIlrTFthrlKi5epCEghUjezeTl1IFU6FfuMkwGMrrlMinNw5Sbkp2RjGQ38557vCDbS
         q7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbc9+ZJrZvJ0IrLyQ89n+PqwdOcGQExwOrzYsD/fuLY=;
        b=o/Df69Rp4s/I17axqR0nKc6WtWbVK0KKNCzSeP77EZ5m0BCnIfu2grDmg51AjGFDEx
         A3kZPI1z1/AHBSMQZI5iba5DMpN7EIF3MdVVHx+5R6BhnKImaf9CCwuwD7F54sxeX/Uf
         bGgZCTeyyvOdHJp6e6a465+Z0lKOqvr6aaewy0zZ/MVlyEXkywZ8gfrp6egAzDoMpWPx
         G4AKT72vQeFcaQy6B+yn1FoSI73+ACbsjEr7GSNz2g1kI5JmuzYK12vyvmDN+bS5kW42
         aVTQZ/rDd6z39umNOqMSgJF1Ch6HxVNRFVHVBJccrIpCR/cTDVxLMbaiRGolthN8MhEZ
         /XkQ==
X-Gm-Message-State: ACrzQf23Vm8BKBN5/YctnnkWwl+5E1MfPgvJsMlJUsHvsc961yWehGwH
	d3+SRV1nC/fH2j+V3+qevaw=
X-Google-Smtp-Source: AMsMyM7x7awehaAYAW35nFwgrGYz2wy/DYOyRlwiTLVMVcYsL5TPOx0o4Bd7JqMAZHmmE19fH/hgSQ==
X-Received: by 2002:a05:6512:1156:b0:4a2:7e73:1f28 with SMTP id m22-20020a056512115600b004a27e731f28mr12837855lfg.38.1666605720226;
        Mon, 24 Oct 2022 03:02:00 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s9-20020a2eb629000000b0026dfbdfc1ddsm4896832ljn.11.2022.10.24.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 03:01:59 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v4 0/6] staging: vt6655: a series of checkpatch fixes on the file: rxtx.c
Date: Mon, 24 Oct 2022 10:01:46 +0000
Message-Id: <cover.1666605225.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixes are similar, mostly long lines splitting. I had to make
serveral patches to ease the work of inspectors

v2: fixed a compilation error found by the kernel test robot and
recompiled the code

v3: tends out the error persisted in the second version. this version is
a correction of that

v4: did some corrections as recommended by Greg KH

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
  staging: vt6655: refactor long lines of code in s_uFillDataHead
  staging: vt6655: refactor long lines of code in s_vGenerateTxParamete
  staging: vt6655: refactor long lines of code in the rest of the file
  staging: vt6655: refactor code to avoid a line ending in '('

 drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
 1 file changed, 324 insertions(+), 218 deletions(-)

-- 
2.34.1

