Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5636071
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so2254351wma.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fuMF6VsqpQHGen6pDrwB6pK2wNwSSnPLXzA/6UmoJDM=;
        b=cVRNcNxcRVo5T+DoeWhyCiRRA3z3PEjBhzLYvJ1jZ6P+LVqmWs78fIVwX/ulXHf/ZS
         6e03N/vW16j/8WlStIcqTXXOnmkD6AVue7p98aPoK2AZx86Hm09GvsL5p7+oPD6w2a9A
         45OnrtWiv9WUXNecqPI+/VkpXtum8p8DuoYCK7fIOtk2y+PRdyDhuDeLq5M52xSfxHoV
         kp3Oo3mKTkDrkNuWbkhCDFbl9u9LGvEZsbjnuensGMV+J4CW/kb6zZPeYHNamQTg+BrM
         fCKgElRezX0uAhqemFncNqgIPfnXPdRn2t9/6nzqXSr4P1NMzCPR82cZbujqT8Yl4qH+
         t23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fuMF6VsqpQHGen6pDrwB6pK2wNwSSnPLXzA/6UmoJDM=;
        b=lm6WWEXTKx30dMlzbaFCfrKzZEwkKc3wbBrdW8bPT6H9QNtG47+CO81fDGvxzPjaGw
         ra+05yCbMabmpAsZmFDjnt8L2CE0sF24pyYo0cjAXZLoR6Ka73c7ojigeNqoRyYyRZcZ
         ycm196S203yA+VgQJY/Siy+WXAafG1u4HrPup2SVXwEZRf2GBIFOtPjEw5hHYbY2Pkfo
         6FZxVjTvcr+rOJcQgpTMMZURDbcBYhhp6ztGVQay6E9e/4E8qEGD+c5nQDg79JzpxeMX
         w8+EA3hUwoGqedhxVDLAcQRstSaZZO5ecUO+XHZrwmXuxNizPABEL6ox6oNq7ipoXGev
         Na0g==
X-Gm-Message-State: AOAM530rs+EOB5cV1F0qZ/PpDX1P5v8XQTcfmuRMyx4VRYA0+Mm4PFRq
	dkZM2hKud44Ido9XuqVzrK8=
X-Google-Smtp-Source: ABdhPJw8ba7sJWeYoQx8T8EpJQDCegVPgoG9LDaxB6IBb4cKoNcYmkhnSKdvmFiLK61hnCOBabjj9Q==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr4275068wmp.165.1624367410803;
        Tue, 22 Jun 2021 06:10:10 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id d12sm9655083wrn.69.2021.06.22.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/17] staging: rtl8723bs: remove 5Ghz field in struct registry_priv
Date: Tue, 22 Jun 2021 15:09:49 +0200
Message-Id: <3a58fae5330a321dd570d1a7931a5b17bb3996a8.1624367071.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused 5Ghz field in struct registry_priv.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 02df5bd8f575..895c41526164 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -171,9 +171,7 @@ struct registry_priv {
 	u8 RegPowerBase;
 	u8 RegPwrTblSel;
 	s8	TxBBSwing_2G;
-	s8	TxBBSwing_5G;
 	u8 AmplifierType_2G;
-	u8 AmplifierType_5G;
 	u8 bEn_RFE;
 	u8 RFE_Type;
 	u8  check_fw_ps;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index a06c8b1beb01..648456b992bb 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -289,7 +289,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->RegPowerBase = 14;
 	registry_par->TxBBSwing_2G = 0xFF;
-	registry_par->TxBBSwing_5G = 0xFF;
 	registry_par->bEn_RFE = 1;
 	registry_par->RFE_Type = 64;
 
-- 
2.20.1

