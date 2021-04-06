Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D21259E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 02:32:35 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p10so1523170pld.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 19:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oEU1R+GF3fw05zjoYhUSVLkVYZLjVhoWO8rK7v+0G2o=;
        b=XiZ4k2eTKFHwCIJxrkbELoBfxWNyn5gvUHVBSM2CKl9/CYF7769JNBUmgHW8BboKha
         DczoKC/869C6ctOlkfsDWfIEBw95lv/xpii1Fi/yhTHSNQS0SWmlfxEhUrXeOd3oN2HY
         uFm6VRRWNfIifvsiGRaKud1d735nrcIJ5m9clUlZ0O30VZiMxE6mPe24h2nOlZUxoZBV
         EasL7jqpoOpoYcT+U+IH/HdPs2OA2VluupxcsLDToq4vCYYRcKC8ADQ/L36AOMPQpYtI
         FxKXO34NxqifCGZ+kuBYlxnzgCYonSPWvPphVRENnbMuKLaGtldDIlMgm+UV+2wmJXG5
         vYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oEU1R+GF3fw05zjoYhUSVLkVYZLjVhoWO8rK7v+0G2o=;
        b=MCz0NmMzyrXil7jLoI+Ce+V1QkklX9X8cPgR7T+g/g2/TA2gNFa/Y17ZzQ5T3Jwy5e
         YUghrWw+PENeDrjc72o9D/ZCzEoym99tVRv0XFJsWGVzhQqyLQhQH7GnhPZ9rjRNz6zd
         u3733bg2dGGjMKLKeLS52s0oyuJbaLSm4gAWwhuCwypaMIltf8A1h7OEzwgKUpIMOvVh
         ihY06v0kiyjCMdtco1dLohqMiQSpbCJFiaTs7ck9uyaispAe9QokMWMqSwKxfl+yzfKb
         tbVCaYfuex7aIwO+i7wbzBh0O2hYx5WGUF4SCHYhI1MmvvbeJNKQfFFSVm8bJhpCgpi5
         i6jA==
X-Gm-Message-State: AOAM533QftSTqtGEeU/0BOpQyBhBqkdete02nIm9t/moq34ywo7P8yeG
	kAF4SzrS4iWi32ZePKEhyzI=
X-Google-Smtp-Source: ABdhPJwAY4Om0AcFDGaDHZrp/MOxr3YYhRb6dhZcjcHzd9SfVCAGitQlJwOVYqq9kqXXLJqp+ecSNQ==
X-Received: by 2002:a17:90a:7bce:: with SMTP id d14mr2165977pjl.139.1617676355125;
        Mon, 05 Apr 2021 19:32:35 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id e7sm281196pfv.107.2021.04.05.19.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 19:32:34 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 0/4] staging: rtl8712: clean up style issues
Date: Mon,  5 Apr 2021 19:32:16 -0700
Message-Id: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

These patches make changes to clean up style issues identified
by checkpatch.

Deborah Brouwer (4):
  staging: rtl8712: add period within a comment
  staging: rtl8712: remove a blank line
  staging: rtl8712: remove space after cast
  staging: rtl8712: add space before binary operator

 drivers/staging/rtl8712/rtl8712_xmit.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

--
2.17.1

