Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AE2595
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 18:47:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f9b0f139feso42946515e9.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 11:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687373218; x=1689965218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYo99lmmTewHzSLHz5rZ/owoeDw2oYPDOJzFHz9WxPs=;
        b=nCRuccDv25kfuyULNBKdSpL9aM+m2Mn7rhrWi+z+JBCQNZYAvOtmrgdh1IHBAFN/kR
         RVk9NUIC4+oBheflOcP0mNjY9Du9hIcLRu70BrSuydrkWehrJVwPP5ivFHLQu4NlT/cL
         gpQii0X9o0ivswTFxI9eRss4/FgeeltDKxTAsnXU9bMnx2q0rqhrgCIiZe8YD81nmBu9
         W6Y8ubOK2we44UmxQE73QOdF9DZxc0W4hC03Agc2rTUkd/8vd7LcFRzpXaNsZmD8te2i
         XT5ZaXtvAtssEMF81KCurh48P6nrIOL3SIoxKZ+cjIClzDsIquSylRdt/jR+VFziAIsi
         1qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687373218; x=1689965218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYo99lmmTewHzSLHz5rZ/owoeDw2oYPDOJzFHz9WxPs=;
        b=TkCmYYxcbQIYO7vrtpwKtetPpRsNKi+qZfq2e+oEkrX2Q6pUAE3BoM9KqgMI/WQn/P
         kmAbGGZcFzdmg3RuAx81UTJzekILDAbvIbJBAc2uG7V2wwTRQpDyaaUZ1qafJB0QbV5d
         HhoEAJSJvbZ5HwJLJacePLGku5FxWdGvn7xTNmUyPC4YYgpom3a+IHAMtU8fwDrx5+n1
         5zxW0KLoy7sgPQgUEbc+ebQUsxsgBqNSuPr83xftWomDfInTdg/bfl2BhummP7nWbJmX
         0MdCi/69Qxgqi5Nyh6hS6g4Gj3CfMT8z+6WASrS5NlEoDiUMEOuThlGeUyxGD6MV/0KC
         WoGw==
X-Gm-Message-State: AC+VfDy+35w1BuH0N2Qe2AAvuC0pmpVYipfO0S9YisL8dtimCrgodmrm
	mHqDH6NT5PEXrChaPv71w4p59R67skwd1g==
X-Google-Smtp-Source: ACHHUZ608OrPrCRicmKNuMNldpASeZXTDjZECtB94U+gfRTro8UWQpAH2WmLLZkHAY2xvsLLAvWW6Q==
X-Received: by 2002:a1c:721a:0:b0:3f9:c1b:83cb with SMTP id n26-20020a1c721a000000b003f90c1b83cbmr9271747wmc.38.1687373218293;
        Wed, 21 Jun 2023 11:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:5d4c:afae:7fa:7038])
        by smtp.gmail.com with ESMTPSA id n20-20020a1c7214000000b003f8d85b481esm16736774wmc.21.2023.06.21.11.46.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Jun 2023 11:46:57 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
X-Google-Original-From: Franziska Naepelt <franziska.naepelt@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	eperi1024@gmail.com,
	hdegoede@redhat.com,
	quic_vjakkam@quicinc.com,
	johannes.berg@intel.com,
	tegongkang@gmail.com,
	gregkh@linuxfoundation.org,
	Franziska Naepelt <franziska.naepelt@gmail.com>
Subject: [PATCH v2 0/5] Fix some checkpatch issues
Date: Wed, 21 Jun 2023 20:46:35 +0200
Message-Id: <20230621184635.25064-1-franziska.naepelt@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of patches to fix some trivial checkpatch issues. Not all
issues have been fixed. I intend to submit another series to fix more stuff.

Testing:
* Build the kernel with `CONFIG_RTL8723BS=m`
* Boot the kernel with busybox in initramfs
* Load the module
-> No errors or warnings

---
v2: Move blank line change from commit 2 to commit 4

Franziska Naepelt (5):
  staging: rtl8723bs: Fix indentation issues
  staging: rtl8723bs: Fix space issues
  staging: rtl8723bs: Fix block comment issue
  staging: rtl8723bs: Fix blank line issues
  staging: rtl8723bs: Fix alignment open parenthesis

 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 224 +++++++-----------
 1 file changed, 92 insertions(+), 132 deletions(-)


base-commit: 45a3e24f65e90a047bef86f927ebdc4c710edaa1
--
2.39.2 (Apple Git-143)

