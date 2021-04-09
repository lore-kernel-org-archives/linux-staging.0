Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855C6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:01:55 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id g5so1037335ejx.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkNYgYU1YHKm0Z1UO5d8nPKM2/cFIDGkUiKsAmSRBPY=;
        b=TV0jDUjCAXJbookaohbCurQF9VNP01/WzG8EccM2hVtczfDwv6/ukoDBMFsWx0KryF
         ajApL7I2yEzMYEQQ2I5w2T41cDRKbMqY/fBUknMJc5uEmm8kdAFrtKUcaTwdqRCQfXAM
         6SppRFElfkfPRi7JcyDU4WIN0gy1XU8N7WtlPFbXgNhI46I/PvYYZsNNOy9IyWlvHKcT
         ko+amq1hpPpjsvVcfH5dqF1EH8xx7+uQD+jovIbXLeBGrjMgcNj+Z5dKPPImzWk/RbQo
         8qxvC4gQ27CEgmmsumxrTo3iyJWIws1yQU/uuHSgDq1Q92qlqe5tAM7lbdXe+X22Cz+x
         mvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkNYgYU1YHKm0Z1UO5d8nPKM2/cFIDGkUiKsAmSRBPY=;
        b=ZOW+d89KDW9xaGCvAxoyzuyLdbTyBRl4uH65PvOrypdIhYSYMbQGNzZqS6IPl6MK1h
         7IW3iq41sDxvCHKPMHELP0vNKqIqsBvW6efQura3XMXxQ3nr25xIXLD6Py98BIRTrWO0
         FkZSDyzz1yU8JIgmNe5gDrDJj60cLHkD8rw2ZtMpMvrfY0bE41UiaBZTROpQwI4LnqiS
         BFgHEkAMT154+xxIawzxCn69foM6kKPI3qNQ2cL27lSiCyGbL8iUou90SczKBC0QKuUC
         VwahrDvYwv+PIZDtJ8FcPJ5stFENgN3cfujBVnD8qvmCzn4hrGrg64gr8B4KWf5Dj91P
         lpNQ==
X-Gm-Message-State: AOAM533f7NorFHJotLofJgL9t8lTU3X3LKeefMun6IDdfvaxFV7AxCnf
	3jVMrAbeIfaipte5c0vsIcM=
X-Google-Smtp-Source: ABdhPJy0z2z0G+TjWtsbFGQ5lvpYowidNQ14fpUwQaDnwsB3KcMV/lyXUfmcHNHNtkAzUOT3HFwilg==
X-Received: by 2002:a17:906:2e8f:: with SMTP id o15mr14995995eji.171.1617962514008;
        Fri, 09 Apr 2021 03:01:54 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id g11sm1136531edw.37.2021.04.09.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:01:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 04/11] staging: rtl8723bs: remove unused variables and code block left unused in os_dep/ioctl_linux.c
Date: Fri,  9 Apr 2021 12:01:32 +0200
Message-Id: <0e950e74565b573a98b851092cc2078045d5ac3d.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617962215.git.fabioaiuto83@gmail.com>
References: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix following kernel test robot warnings:

drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:
In function ‘rtw_dbg_port’:
drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2548:33:
warning: variable ‘preorder_ctrl’ set but
	not used [-Wunused-but-set-variable]
       struct recv_reorder_ctrl *preorder_ctrl;
                                 ^~~~~~~~~~~~~

remove also unnecessary conditional code block.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 9735522f9cc8..d70e2d5d51e7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2543,14 +2543,6 @@ static int rtw_dbg_port(struct net_device *dev,
 					break;
 				case 0x05:
 					psta = rtw_get_stainfo(pstapriv, cur_network->network.MacAddress);
-					if (psta) {
-						int i;
-						struct recv_reorder_ctrl *preorder_ctrl;
-
-						for (i = 0; i < 16; i++)
-							preorder_ctrl = &psta->recvreorder_ctrl[i];
-
-					}
 					break;
 				case 0x06:
 					{
-- 
2.20.1

