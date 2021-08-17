Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAC6D19
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 10:54:08 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u16so10808899wrn.5
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6aKZ3mStglJ8KXopXqTnAueM8I8iIX9uDZNRcE4ZkQ=;
        b=XvkhlW57JehYDlkQR+aFLFe55cOvPWo7ekebsd6AoR54n43kZXdV104IKDDsNzEAlX
         FGJwTHbKr6v4BiFe0TGkhf/AMlY5bnRCO62vCb5kyIVy6f5qbJxnDvH5H1YnZfvw26xc
         TWBAwlyuNtuEqJb5WvaV5zb7SXpiqjGQq2yhU8HFQpNLwXNE8KB+Yskjl+G0fH2ZJr4Q
         nGQYlAYZmqS1axjGpUAMvab6XF5DXHB5aavBsmsyuyA0dJVldGOYVeDdxZ2AGgWJqpHd
         N93nOi9YM569vvIRirqN+xZczOk2S65eGO8oc9++07+389++n31xWtE7bQdpaXFFLIig
         5y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r6aKZ3mStglJ8KXopXqTnAueM8I8iIX9uDZNRcE4ZkQ=;
        b=gKuayPzC/ug3ITER9j6drXsMMApRoZGGNehhQraUwkVRGofKbCnwa3dnag4Qt4FV+9
         MznMGewzDIK8GHUyJy1LwRDTpxvAr2arEZuf3mnop/sZLXMcmeoXfaP/OugiXvKrTfal
         JljWXBYy/FAwlWJmWNGXiD62bOqQQzIMjMHTObXHHJvooTxNNyChQmWEXLiN3XyA5Ni7
         mcM68yidD8Wx2fxVLKJiX5EzWtOHANDxYs8+DtpiBLXqdN6YWW+nqheRwpnPbxGk0l0+
         74qDFl1fEFVPPXZXp1pDVPFwMswmXXqfbWDHIlXdTP0LLmCuZ82ofH7hpvwpznNmR+m/
         EdlQ==
X-Gm-Message-State: AOAM533c10fJZ4HL8NtoemDZh8H+OadA6VZP7FYjOFQ+xYNqTG/wL/Ko
	KHs1ERdEQnkGQHVA5rk8Kso=
X-Google-Smtp-Source: ABdhPJxt71/S0VMg7VpAnRd1AlHxkO+lFHesTMJDu0H/ALoSAr0RfvRLaVxRttmPZ6sz0oDM4aZMJw==
X-Received: by 2002:adf:ab0e:: with SMTP id q14mr3270642wrc.171.1629197646878;
        Tue, 17 Aug 2021 03:54:06 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id i21sm2029840wrb.62.2021.08.17.03.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:54:06 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Gow <davidgow@google.com>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] clk: staging: correct reference to config IOMEM to config HAS_IOMEM
Date: Tue, 17 Aug 2021 12:54:04 +0200
Message-Id: <20210817105404.13146-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0a0a66c984b3 ("clk: staging: Specify IOMEM dependency for Xilinx
Clocking Wizard driver") introduces a dependency on the non-existing config
IOMEM, which basically makes it impossible to include this driver into any
build. Fortunately, ./scripts/checkkconfigsymbols.py warns:

IOMEM
Referencing files: drivers/staging/clocking-wizard/Kconfig

The config for IOMEM support is called HAS_IOMEM. Correct this reference to
the intended config.

Fixes: 0a0a66c984b3 ("clk: staging: Specify IOMEM dependency for Xilinx Clocking Wizard driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/staging/clocking-wizard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/clocking-wizard/Kconfig b/drivers/staging/clocking-wizard/Kconfig
index 69cf51445f08..2324b5d73788 100644
--- a/drivers/staging/clocking-wizard/Kconfig
+++ b/drivers/staging/clocking-wizard/Kconfig
@@ -5,6 +5,6 @@
 
 config COMMON_CLK_XLNX_CLKWZRD
 	tristate "Xilinx Clocking Wizard"
-	depends on COMMON_CLK && OF && IOMEM
+	depends on COMMON_CLK && OF && HAS_IOMEM
 	help
 	  Support for the Xilinx Clocking Wizard IP core clock generator.
-- 
2.26.2

