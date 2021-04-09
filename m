Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D196D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:01:50 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id w3so7741926ejc.4
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QcNI82rCMeXgGwcR22vG+oCInfi5++z99L+5L1TkCVs=;
        b=vcVaSBJug+0P7UtjNbujQXQSgpOq4w+MPspd8A0AGaHWhbhGFnOfPrriEgkDHATEpe
         2g/zhPDJT6452PkRfVS0lGpBV9i5KwLa89Dwj44BqybqfTCHSegkpjumq7mV7lMmph9x
         nBjQ928F8CTDVM1q4grGSVOcnXpOxazpnWwUj7bI7tXoNp8agLsSILwCjAbSt4J/utgY
         LmwZpvQDWdoFmY+w5rhUR2I3iNm99UpfTI2Qx/AEa0NxBLP4weLWPbvVZWHU9x9jc6EQ
         +d+NyK4OdqCdvoLlc3+lV2QZdsjYUeO3PfxCviYg61l1fFMDZmWHdgMja4QhyPJgiizw
         X7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QcNI82rCMeXgGwcR22vG+oCInfi5++z99L+5L1TkCVs=;
        b=DYxPjBG9F5DrwIM0ESixDxS7PnGt/QpxNRm54ULFYy+F5DiYDPY/O5gdUuOj88kvjI
         ONatBXCsAP9exJmAC3MBvSrPOjaeKVlXYG1tGzABC19cK8JeDUB/8ldsRvDqTEgr+20R
         dZBS7QdxkfMpeSmmsaxeVB4J4u8qjrtu//6gpwq6a1K/bzuIeoneU4PbQRRSITh8f7TE
         PgmN1UKwDDmZEln7qam+Ey1xhMmLGAJJguoEsZ5MiTXwIJqHWxQfmP7CHoko0JFr7XeE
         B9o7klRVAR5PBa4k4u6ERSDp2Bwo5z4D5w8wOhYZviIdhDDgaWFCm7QkAuNmkHoiaZfT
         P4/g==
X-Gm-Message-State: AOAM530Zw2Xfm4fx0T+sdFWhMpYfrCEpXINXNSp3WJalCpkWdofBzMGv
	HG/i2mhH0MJS9Tz/Pf13urI=
X-Google-Smtp-Source: ABdhPJzLAqJwjB6L6RerairFq05LNKr1UIpIpGMQLLCkvWyeNyfh0HRr+Dn/B39QWmI4lm0IL1ALDg==
X-Received: by 2002:a17:906:d555:: with SMTP id cr21mr8759440ejc.66.1617962508613;
        Fri, 09 Apr 2021 03:01:48 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id yr16sm63761ejb.63.2021.04.09.03.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:01:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 01/11] staging: rtl8723bs: remove unused variable in core/rtw_cmd.c
Date: Fri,  9 Apr 2021 12:01:29 +0200
Message-Id: <509eeb1c4a7fcfc37b69cb8578ea146b95b50864.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617962215.git.fabioaiuto83@gmail.com>
References: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following kernel test robot warning:

   drivers/staging/rtl8723bs/core/rtw_cmd.c:
	In function 'rtw_cmd_thread':
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:390:16:
warning: variable 'cmd_start_time' set
	but not used [-Wunused-but-set-variable]
     390 |  unsigned long cmd_start_time;
         |                ^~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index baf8b1e0f43c..e94eb1138cf1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -387,7 +387,6 @@ int rtw_cmd_thread(void *context)
 	u8 ret;
 	struct cmd_obj *pcmd;
 	u8 *pcmdbuf;
-	unsigned long cmd_start_time;
 	u8 (*cmd_hdl)(struct adapter *padapter, u8 *pbuf);
 	void (*pcmd_callback)(struct adapter *dev, struct cmd_obj *pcmd);
 	struct adapter *padapter = context;
@@ -438,8 +437,6 @@ int rtw_cmd_thread(void *context)
 			continue;
 		}
 
-		cmd_start_time = jiffies;
-
 		if (rtw_cmd_filter(pcmdpriv, pcmd) == _FAIL) {
 			pcmd->res = H2C_DROPPED;
 			goto post_process;
-- 
2.20.1

