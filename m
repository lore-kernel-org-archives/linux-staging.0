Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF971
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:08 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e18so8382267wrt.6
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WjJIP2mmOfuCNKbmP73PxrS477KUtYuiPk1joF4xAYA=;
        b=snLP2RnS+6FUfcvDLGrEENeHji9M6ibXacSDsWLc5IBbPW6RCxxK1Ap1LcxAZMVjWa
         11RqN6Cms97py7XO8yXbrLnd2H1cLqcItjNd1v4eNyubSVLqBPqPFbWPLNb1vlXtow8m
         GvDqDrHTBJZKI9KBimw+xsABkLGYLuEUONqwSU0SBoY07JSqvP9yEhsfaIusXCkvwBSC
         or4kWje6+lS0Ot1OOxOBIPmHWgOwx0xg7a40dH7odg6dpH0AlHwXbzEhSIMT+ZD16IoR
         x1+pSODmqsWyOJFJTdeX3ORZPg4jVm5thyq9bX1UjlsmN8O3Y10O7TgFeX73fdULEHST
         i68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjJIP2mmOfuCNKbmP73PxrS477KUtYuiPk1joF4xAYA=;
        b=U536ibGwzMDRJ+bakMUnZXVuxvzcwgfMws+rhwMl0WaCahUQMtv/92HC1vwwygG9Au
         30uxGqqvaoBd5NlgAphqbCsdlIDj6PD1UbtOnTYfDI8b/pHMBlhmEX4qf30ZBtczN1I8
         5mE6sTbNvHPNwDpodxyVGB9uZGVXELWfw7rSYElDl1fSwJH8qWN0jv6XpO8FqV+iC5QZ
         yktN0G6g8y4veo4s9QJX4O2zxbJfun0LejsCc+LUAJUp9es2UvzLuRK2m4f8V0SU4sDS
         /hSp94nE2hAiQBFfhvXUa3kWV/jpPm3cqFxobVMqk9aK8LQkHomVHnrWDvOGTuJx5Rc2
         0xlw==
X-Gm-Message-State: AOAM532Mz0Rnwr5TB4NofdRptRuHTuNawd4zBDKThURUPnfL4aJkAxuz
	zUILIQehMsESsmDMlVXC0C/t1x2V8LHSkA==
X-Google-Smtp-Source: ABdhPJwZkVeWI3myA8nHPwVLzD4EHHtxvJdJLDCzpPcyEXnTOusg5ZRaEkyIUTexSLU/1L8x5iISvA==
X-Received: by 2002:adf:f908:: with SMTP id b8mr19095662wrr.184.1616855106844;
        Sat, 27 Mar 2021 07:25:06 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id j14sm18687830wrw.69.2021.03.27.07.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 12/20] staging: rtl8723bs: remove commented code line in os_dep/ioctl_linux.c
Date: Sat, 27 Mar 2021 15:24:11 +0100
Message-Id: <ed9cab77a9a7dc1bcae4b6a42e16108e7833ac4b.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented code line using obsolete definitions

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index eac98e455413..354441e6a667 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2618,7 +2618,6 @@ static int rtw_rereg_nd_name(struct net_device *dev,
 		rtw_free_network_queue(padapter, true);
 
 		/*  the interface is being "disabled", we can do deeper IPS */
-		/* rereg_priv->old_ips_mode = rtw_get_ips_mode_req(&padapter->pwrctrlpriv); */
 		/* rtw_ips_mode_req(&padapter->pwrctrlpriv, IPS_NORMAL); */
 	}
 exit:
-- 
2.20.1

