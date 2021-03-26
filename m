Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E36170
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 05:45:47 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id o5so4262521qkb.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Mar 2021 22:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H0nKKN94g3rEpQ8UJAWbnPHo1zuRCqzXoAQHyyq3QlQ=;
        b=cEWJ/SIeapNso5pKH9Q2aYpL12RrP9MrsKFp3ziuSgwdwmwOp72ediBpmsbw09n/Ii
         X+0HWsztbEC3fNldp8zJrpSO8Fs7NvIaB0Qk/3l7zwZuMVlcAeKJ4c0K1ztcRM0zRdm4
         j4DTBTUHUqmqkzqP3lMGCN6+JfjEY/pMZR4WWG+u17t33ciz+A+doDxnv2l7CrSffKY8
         JQ1DmNFvALbaQju5wjcuzWXTnkg7vwVrjoVRCjch/tc91yMiT9zrfWITuqwgUgo560vu
         LtlM/XBcmrNfF+Xyx8x5ea6r3jqVdnPMpu9L/iHoTg66MjMhVTdCgMMRGbHQ0BK+BSM/
         WYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=H0nKKN94g3rEpQ8UJAWbnPHo1zuRCqzXoAQHyyq3QlQ=;
        b=rtFnf5KeZyvbfoa71VrKi3kJhDbFDC6cZi1u8tCERKdGw/5ofgC5UtvHt0woGgjQLk
         3P/kD/LNkbfYU8OYQpi0trNPFWfunw6AyAcw8Csl1vTqJT3iqI04lf3AeHCTGe4zQhkQ
         ZFspphQMp2kkoBTHvR8DGTVs51GlTXC2Wf15Y53yXc/UBmmlN/C26/46AB2Bwp0CIPEI
         l4ubqLO+XndOKAwC+yK+3jwkMVFXRF3+tvqz0VvlTqIfhMaV7chaaNERavW6PGBykcte
         bST/HUJ13D6lcXhfIXcIy/s4L9CplimBncUpjsr21ZqF4ue5HKPiTlAlsX2FwLMFrt9j
         fVJA==
X-Gm-Message-State: AOAM531Igww3R0xtZ6IEVcjXG1PRH2s+cjt17LahpSUilYxU4vvNeshw
	QdVepfAnC/euRas6jsl8CfY=
X-Google-Smtp-Source: ABdhPJzfl7bYQlAzbCwNGaX9TnzFrX7G4r4KcPhWEUX2BBmWcK0DckBJWZGV5TUfnpRz4TfIyB2hCg==
X-Received: by 2002:a37:78b:: with SMTP id 133mr11452198qkh.109.1616737546500;
        Thu, 25 Mar 2021 22:45:46 -0700 (PDT)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id d23sm5827566qka.125.2021.03.25.22.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 22:45:46 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	fazilyildiran@gmail.com
Subject: [PATCH] drivers: staging: netlogic: fix unmet dependency for PHYLIB
Date: Fri, 26 Mar 2021 01:45:33 -0400
Message-Id: <20210326054533.48751-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When NETLOGIC_XLR_NET is enabled, and NETDEVICES is
disabled, Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for PHYLIB
  Depends on [n]: NETDEVICES [=n]
  Selected by [y]:
  - NETLOGIC_XLR_NET [=y] && STAGING [=y] && CPU_XLR [=y]

This is because NETLOGIC_XLR_NET selects PHYLIB
without selecting or depending on NETDEVICES,
despite PHYLIB depending on NETDEVICES.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/staging/netlogic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/netlogic/Kconfig b/drivers/staging/netlogic/Kconfig
index b2a4d4586697..e1712606ee3c 100644
--- a/drivers/staging/netlogic/Kconfig
+++ b/drivers/staging/netlogic/Kconfig
@@ -2,6 +2,7 @@
 config NETLOGIC_XLR_NET
 	tristate "Netlogic XLR/XLS network device"
 	depends on CPU_XLR
+	depends on NETDEVICES
 	select PHYLIB
 	help
 	This driver support Netlogic XLR/XLS on chip gigabit
-- 
2.25.1

