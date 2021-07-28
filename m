Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8DC70
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 18:37:33 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ca5so6466330pjb.5
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HKHgCMwSYNJz7C9WSRJXjjx/3uDyYNDVr+Uqu/p/O0=;
        b=K+H4NOT7UUHHWFYAg9yiWvijMB3jBRhq9RKDe4Sw0tUVoBlNSi31/H8Vx5dXnoGdtD
         qTfvdqJSIdoTA+uIpWBTyChw86bjNLBD8CY8bTwBdCBVVnmkpvtwic4uxWxvvNmokmG4
         R+3J1v2qdBo9Wih4Cp4IAEU1TWGWIiaVdwLuyGrKZVWXr/DI+qdhRdeTIpfkXeOpcKPj
         b8SUUdghvlOlQPfzOgtvoCXNdMaz228nPiS/W8GAQJVC7KIz7SNw7Fvo+IvZWSfrghiZ
         s6JPVgpHlOREY5njZkFHuaURhMfo/SUJdgsLQON692tb14wxm3YvntBHFJIF9JvGphJh
         y5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HKHgCMwSYNJz7C9WSRJXjjx/3uDyYNDVr+Uqu/p/O0=;
        b=awctrMfvBlF0T8vzN0jT4eT78baSfOUyJvmPB3nYV1krYXoBVvw37qGgWNCR5GxrEw
         xJjbRODnNG1rmYVstbeYqD773MmAJcgGC+4NP4uY00hab4PvZnRBOEd8MUYP/e9wcLNi
         RdR1USPvZ2Xfd91pamZgVtFAwHxvg8iG0Fsm26VTYZEdnGfE0ebjIhLRXMRjH2SveQXS
         LNnST6/iestbaI/ON2Hs+aJyNq5za2qM1M3w+oyUAGOMpHnQoBHeihq3tVrwdEYPSGdK
         344sP57sbOT+BRJ5rZFxdsVP7vm8QQZCNZrekhMYWHuebtqJMWNKkzyt6sCrCBR0HdHh
         qJxQ==
X-Gm-Message-State: AOAM530sxns0PMuQSL0TF/AmaGMXD9OCknPnD0r+p/tyX0DZ+mYF22EB
	mOFf0rzrge6q8sFRTwlXKEHcr2pUplM=
X-Google-Smtp-Source: ABdhPJxO/VUIURLhsLeGRJkKZNHkyUMtKDGzQDbiP1kpXCHURdEVsbtOYulN+6SiojOs3ii1soumqA==
X-Received: by 2002:a17:90a:4306:: with SMTP id q6mr10667054pjg.202.1627497453542;
        Wed, 28 Jul 2021 11:37:33 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.5])
        by smtp.googlemail.com with ESMTPSA id t71sm559021pgd.7.2021.07.28.11.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 11:37:33 -0700 (PDT)
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com
Cc: dan.carpenter@oracle.com,
	phil@raspberrypi.com,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: vchiq: Set $CONFIG_VCHIQ_CDEV to be enabled by default
Date: Thu, 29 Jul 2021 00:07:16 +0530
Message-Id: <70d91b0482e19d7551d3258ea54c970c1b996317.1627495116.git.ojaswin98@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627495116.git.ojaswin98@gmail.com>
References: <cover.1627495116.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before this config was defined, the cdev used to be created
unconditionally. When an earlier commit introduced this config, the
default behavior was set to disabled, which might surprise some
unsuspecting users.  Hence, make this config default to 'Y' to be more
backward consistent.

Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
---
 drivers/staging/vc04_services/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index 63caa6818d37..2b70c37cdd09 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -23,6 +23,7 @@ if BCM2835_VCHIQ
 
 config VCHIQ_CDEV
 	bool "VCHIQ Character Driver"
+	default y
 	help
 		Enable the creation of VCHIQ character driver to help
 		communicate with the Videocore platform.
-- 
2.25.1

