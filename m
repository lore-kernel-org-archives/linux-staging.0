Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B0B2FBF
	for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 00:11:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id a80-20020a1c98530000b0290245467f26a4so2612798wme.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 17:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJmJe0Btm66YtZpv5ep8XSIjEMC6uvZWpwP1fR08nIU=;
        b=HfSDuehpfa1encWBwxNWHVRgSFt3LVQUcrkdss8CHcDf/m9nv5wIbLVnkrssZrI1Cp
         j9Hj4N5+yajKDtTYRLE87kJHpEzZPhECDJbW0AduXSHxg2SG2hKsYXMIWHJMt/1g7TE6
         +nETCrIUZRRyHGAxb8zsWnCMYaa+V4LUPTloorYnJhgwbBXZU73ZsIhW28ImEPEtQ5CP
         2figZSr6/TWd9zElzI6z2IABQnT8eHaxCVvsirZ0MhwQGKLNBbHNL0QeJCH3czlPVB3T
         CF0h6A+mIqUzaI0qnP8w52OEvYV12qIk3ZrNCrmMXzFEAb+e1SOSMsyPq7Ap0wGcg+iT
         y0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJmJe0Btm66YtZpv5ep8XSIjEMC6uvZWpwP1fR08nIU=;
        b=MeHD0McD61DcUCLqKbP/IN5sfHnyQmji98rJCrTZiQd8RKZ8CMyDfd7R+66h/MnNRR
         BMu7ZFDwTeQcJbYfC/I+IWwKWbbUXN795mbJvy+IkkCzFg2mPPu8co7RM6kk+Ov3/4qy
         uG3s06FrsWPknYvMBNnjOO5W9QUdtjMEq8meFNo/lFgPcFoOr+WWtMVPieSAjCmxbxwP
         GYaCK+0YxOQT37Q/PPBOx5AlSrF4p3+a1xpLCp0t+AgWdHvxq9FaewVlCpN1SOilBpvw
         421/Dd8EB0jSCtU9+NWMtrqm3JTgkRV1CcRDgjrdkl7CiNwJ5HLAXG82yavo2sdacWv/
         /mYQ==
X-Gm-Message-State: AOAM531Yu0CakOntM0tw9Z+2aSexX54gnz+yXY7GU5huLOtnVtGChr29
	bS3+SHU6KaCaZyAkrGIKzOC5IA==
X-Google-Smtp-Source: ABdhPJx7RSQXiaJjpJ3REtNVetq+o3Ff5G1f4DDzkfj/TSScRz+Tx2LShSxU1wcaC6vBHZWyZGmZ7w==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id m13mr16544003wmq.31.1627085472988;
        Fri, 23 Jul 2021 17:11:12 -0700 (PDT)
Received: from localhost.localdomain (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id k24sm35491305wrh.30.2021.07.23.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 17:11:12 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	fabioaiuto83@gmail.com
Subject: [PATCH v3 7/7] staging: r8188eu: attach newly imported driver to build system
Date: Sat, 24 Jul 2021 01:10:55 +0100
Message-Id: <20210724001055.1613840-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001055.1613840-1-phil@philpotter.co.uk>
References: <20210724001055.1613840-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify Kconfig and Makefile to import new r8188eu driver into build
system.

Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/Kconfig  | 2 ++
 drivers/staging/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index f958f612829f..e03627ad4460 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -36,6 +36,8 @@ source "drivers/staging/rtl8723bs/Kconfig"
 
 source "drivers/staging/rtl8712/Kconfig"
 
+source "drivers/staging/r8188eu/Kconfig"
+
 source "drivers/staging/rts5208/Kconfig"
 
 source "drivers/staging/octeon/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 810afc8e63a6..c7f8d8d8dd11 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_RTL8192U)		+= rtl8192u/
 obj-$(CONFIG_RTL8192E)		+= rtl8192e/
 obj-$(CONFIG_RTL8723BS)		+= rtl8723bs/
 obj-$(CONFIG_R8712U)		+= rtl8712/
+obj-$(CONFIG_R8188EU)		+= r8188eu/
 obj-$(CONFIG_RTS5208)		+= rts5208/
 obj-$(CONFIG_NETLOGIC_XLR_NET)	+= netlogic/
 obj-$(CONFIG_OCTEON_ETHERNET)	+= octeon/
-- 
2.31.1

