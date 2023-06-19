Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D848C2C5
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 17:57:39 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-987341238aeso435812266b.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687197457; x=1689789457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91ya57sBghq3g7zgKLiTtn0v+IyDnYxUjv4qrxeCvmY=;
        b=qCgGxfZGGUDTq8y218bOMBxMHfghmE+40/FS+XHNOrQ6bDXIzOXaGc3K+U3rim5Mzs
         mqbUcyLVy465st22BiXCyl1ttiGydkBOphM4SCT4+U3IJWgWbNpxfJwV9Cl7H+YqZjOt
         T+heN1Rzrqo9QtHxXJZCgUXZqAoDU+thbTp4QV5C4Oti8q8rDaens4YAHYHhy9Rs3/4h
         vrnCbUkpc9Ppy9wySKEYCpIwX+0Pwo1L0eohpCLZZag4Lz0hSZNc91fwE159S1oxGkiP
         eruUlWwxn53ddn+R540EbaEkhE9f+bJ/oMikHWm548MlIpc1lP43ecoMVV4Z8xeUCw2y
         vAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687197457; x=1689789457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91ya57sBghq3g7zgKLiTtn0v+IyDnYxUjv4qrxeCvmY=;
        b=T2eDYm5a5tuRaNUmqKAuYH72vaOp4pOzs76FgAsryosLKcI/qybkO/qxMHdCpCFImW
         zeM3FP3vl++M2yU546TQHuOiZq1nsTmTl1mApIN73VB9OuVdj3inWp4VC7KBPdqCgevJ
         jbATg9KNjDVslKmq+MzBHhHEKza92TMxH41jnkKWlVdJKRwWW9Sie1TjKedP+vCS4YjG
         O3CVd5k6K0R8L13eAwLHYH6EeY2/pT37QSehAE1m1QpiHp8SUm4DGmzGCDrt596jZJtU
         Yvk7Q5nnAS9wXncUbFIZsIhEJyQfoCony0O+dO6WH6nc2dQMeGnT3vYzoE4X0jS7hjhv
         J4aw==
X-Gm-Message-State: AC+VfDzuTJQkShSVFLdmawOf4XipeXmtO8tGHzknIjYN6q34uR4G25SO
	Dysz5FKsa8QJdYewjkPc60ZydEQQfEimBg==
X-Google-Smtp-Source: ACHHUZ48OeFtLT4mS1Z/ABnCYeFsOL8xaJk3NajO43nO0+eZCexBqnnfhnemhJ+YejJg+rJ+akVKKA==
X-Received: by 2002:a17:907:1609:b0:986:4789:1029 with SMTP id hb9-20020a170907160900b0098647891029mr10134421ejc.23.1687197457026;
        Mon, 19 Jun 2023 10:57:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:dcda:2154:7873:34])
        by smtp.gmail.com with ESMTPSA id q25-20020a170906145900b0098503ba0db4sm9146ejc.149.2023.06.19.10.57.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Jun 2023 10:57:36 -0700 (PDT)
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
Subject: [PATCH 0/5] Fix some checkpatch issues
Date: Mon, 19 Jun 2023 19:57:03 +0200
Message-Id: <20230619175703.18826-1-franziska.naepelt@gmail.com>
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

