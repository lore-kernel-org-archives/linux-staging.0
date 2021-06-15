Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401F6D0F
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 22:36:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a11so282089wrt.13
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RaOTK3g0zqpY6FTUa07hoHHI34NBW0k+fGFJWzcItbc=;
        b=BP7lOTgCOWk8v9ayR47eJY05HepsREWjZMn3ffnZu2M8F0EZvxmEGPOeR9AXNTlMFl
         dExSp+xbOQ0hWFsgARQFneVvxO7P5eqBg6gme5GE6CaizLsAaWAFusgN1VDUfcK8TY9v
         Of+yQu0EHWdNN7Nsdyxv6fs/D4HTqOIHFkJxCbscnk5tvGIx0rbqsOloprb6xG8tZjTT
         ZhHzcFpRFBXosYJqBrmQlSwxATZgYdMvbOabsNvHY21wKxL0K+d0aaKrBpT2TtZ+Qe0F
         CHEkwMdkMfV/+E+e1kcKJpdV+o05HNZt7vf5msyxgpHvrI2MSE5lwKO34gSvSrcjGUlb
         HB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RaOTK3g0zqpY6FTUa07hoHHI34NBW0k+fGFJWzcItbc=;
        b=h9YkrBswDyMQOKyzIXWZhU+xSoutjIMCKk6T4A6BKT9lof5FfntOosxp71BYdA1trg
         LhC1AGUobtErtKX+5qK4Erezpx7IfbfbmKXor9Le7/ocX4Tp2nKmyz+jhyNsvPQG2joR
         3VeuPmQPONpLt+JJtcfpu1cIhbssX6vGQ10zqrwiZJ51LVyKMFbpujsmN08t6Y56mh1n
         LoTPVf+CanFOL2u8DtK9IylvekTRG4NWl2xQZL0LZYdel7swGH2dcscG5GhydArAwlfL
         gm9mVvQ1r5CBk/EtdZ/PydEtc3x10gKxR/MMWFTQwFhepk8VjO41iCAnXneH+YYqahut
         gKSA==
X-Gm-Message-State: AOAM530ytr7LLsM4JO5mjPWh87t0foEpdnujal2LVaXreULakb9tepkt
	2UUqhnUmY7TzhX52lnWqkgdrvZM+Ajpu1xCO
X-Google-Smtp-Source: ABdhPJzpUl1ww9fwb+x4SxKrpOKWY5YdEbXAEQvz8d5+e0BDszytx40NjOb71vbJbSCID08FKQMtUg==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr1508776wrf.420.1623796577597;
        Tue, 15 Jun 2021 15:36:17 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id m23sm3934791wml.27.2021.06.15.15.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:36:17 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 6/7] staging: rtl8188eu: remove unused variables from hal/rtl8188e_cmd.c
Date: Tue, 15 Jun 2021 23:36:06 +0100
Message-Id: <20210615223607.13863-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615223607.13863-1-phil@philpotter.co.uk>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused variables from within the file hal/rtl8188e_cmd.c
in the function rtl8188e_set_FwMediaStatus_cmd, as they are triggering
kernel test robot warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
index 19c8976c2e01..f2969e160ac3 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
@@ -177,12 +177,8 @@ void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
 
 void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
 {
-	u8 opmode, macid;
 	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
 
-	opmode = (u8)mst_rpt;
-	macid = (u8)(mst_rpt >> 8);
-
 	FillH2CCmd_88E(adapt, H2C_COM_MEDIA_STATUS_RPT, sizeof(mst_rpt), (u8 *)&mst_rpt);
 }
 
-- 
2.30.2

