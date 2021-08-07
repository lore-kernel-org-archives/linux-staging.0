Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3765F29D6
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 10:24:04 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id l19so20543965pjz.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 03:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n0WYjDn/Hk7WnWbcRBK4RMrec6sKgFH/C1TYM3Ko0Rs=;
        b=YQu96Z3cdLcwtD5NV1Whhw/XHd03p2upsUo6L2om93ajP/gv0cY40pyphLgnNsYEkN
         Qa4K0eDk5mL00leLuZP5kPbciZABvr4RAVj1PhOUqqh40hGn2lDUk+g2dJY8tONl9B4p
         E1xchr588myR1z//LqrY2jNwaMtWxnO9/fK9uObVEITHgER5yw6Xb16m4Meqn32Auwcv
         gg0DiwqSh2op0XeYJivNpAiIXAixdRsYIXecJne/KUVRMN5AZlFfEvybGpC/JQBQsEL0
         zeihF3ZMAmWwfLdf5B5TEnzrPxvChuEM8O1zowDn9amlDD3uEXDzW5nHilrMg8bd2pcn
         RjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n0WYjDn/Hk7WnWbcRBK4RMrec6sKgFH/C1TYM3Ko0Rs=;
        b=SXFf+4Kpxp6LUvXZeQL+ISRfpz4RFtjd1BevsWZqWRDVWVW159L5OJ5TLmcmQCofo1
         K+SEaDwvW+prezQ/tDSf+5jHOhzJhP1GQXXYKUCtXkxx53KDsFqnmJ4aBNLkdiAjrrTf
         h6N1F6NSW7p51Bkkr6X/kzGtofeT2HLpd1zqsOgtbNWedR8prqqYXEuKd7WABjXcDZZW
         F8S28Iih1Gckp/yhEzd0Ceg8BbCcYdMQ7u7sbo9gV+MVnWgn9ZTTHGYYFH75LfaZFjuR
         Iz2RCZtFVPVzDRPmRp7ZqzKU3d50PlA8a/BIV4FLGxJQnWppbFFrkq4FO+hyHm3G38bO
         lu6A==
X-Gm-Message-State: AOAM5326SmUVCu0XrO9HCEQ9qM8yu+qXzWJ4ARWWjQZQJgzB5b/0cJg/
	SvH7Dwljpbjfc0T0y1u8KLE=
X-Google-Smtp-Source: ABdhPJwRlehCl6FzdeBvXbmFqv96ruoIj62UME0I6LJA6sSDLywjo2ywXjD4Moo2VCAClsMAvbl7uA==
X-Received: by 2002:a17:903:181:b029:12c:e578:5a4e with SMTP id z1-20020a1709030181b029012ce5785a4emr10570478plg.12.1628331843823;
        Sat, 07 Aug 2021 03:24:03 -0700 (PDT)
Received: from user.. ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id d17sm13290717pfn.110.2021.08.07.03.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 03:24:03 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	saurav.girepunje@gmail.com,
	insafonov@gmail.com,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	will+git@drnd.me,
	dan.carpenter@oracle.com,
	apais@linux.microsoft.com,
	yashsri421@gmail.com,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8723bs: os_dep: remove unused variable
Date: Sat,  7 Aug 2021 15:52:32 +0530
Message-Id: <20210807102232.6674-5-saurav.girepunje@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210807102232.6674-1-saurav.girepunje@gmail.com>
References: <20210807102232.6674-1-saurav.girepunje@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove below unused static variable from os_intfs.c
rtw_enusbss
rtw_hwpdn_mode
rtw_hwpwrp_detect

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 724909078d80..71c9e7eec206 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -109,11 +109,6 @@ static int rtw_antdiv_cfg = 1; /*  0:OFF , 1:ON, 2:decide by Efuse config */
 static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
 
 
-static int rtw_enusbss;/* 0:disable, 1:enable */
-
-static int rtw_hwpdn_mode = 2;/* 0:disable, 1:enable, 2: by EFUSE config */
-
-static int rtw_hwpwrp_detect; /* HW power  ping detect 0:disable , 1:enable */
 
 static int rtw_hw_wps_pbc;
 
@@ -159,9 +154,6 @@ module_param(rtw_wifi_spec, int, 0644);
 module_param(rtw_antdiv_cfg, int, 0644);
 module_param(rtw_antdiv_type, int, 0644);
 
-module_param(rtw_enusbss, int, 0644);
-module_param(rtw_hwpdn_mode, int, 0644);
-module_param(rtw_hwpwrp_detect, int, 0644);
 
 module_param(rtw_hw_wps_pbc, int, 0644);
 
-- 
2.30.2

