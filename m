Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B728FD
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 08:21:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id i27so11099146ejd.9
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jX6tr4s5zNKGS53pIVnQhyNOwLeKDR+GeeFQvf7Au+o=;
        b=mWS21PoX6y9UlgHUcVRBpDl2E5Y3z9dxssg3gEOcujRzixIiezjGZ9Kcu6rimu1ec2
         UCmJ1IvrDfVhFIWgpt4tfw/8hWdnj+cXuNN4LNqcmt2hP5qqYW1xwK6dSRyEv3suiDiP
         OVTdWfc0ZE5+Yir8uRtCE9NqgomodNFt9HGU9K2xu2nNXMhde1QA9wKNmCE6XD3BMR3U
         Z9r75G3ambOkKC+8AOBDZA7ucJYjeYaQeduErtkmiir3Sf0sfkJqQKrFJ4tO+KK7uPom
         h848qTOUAE0Chhd7BF8sEVnU6jHMHAj4qMtMhn28Gfh5sATq+blZv4/s+P5yhklW0HVz
         1BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jX6tr4s5zNKGS53pIVnQhyNOwLeKDR+GeeFQvf7Au+o=;
        b=42sFbdF00PKUJ9kuaGInCsovHydQ8uLeQTV8C831v/U6XRubXF4q/R6MeHKANmKgEm
         P7DFaOr8STxRb+AMg5TGK6xw5E2hJHZTzrVkPk0HBSHT8iofNvQw97BfLBpEYRDAQraM
         bZxH+QCDJsCwwuYErU8Nj5SjEv6+BBa1Jb6Hy5Nmmett3b34HfX2oTZeOG4tIV7ryO7u
         d/OjVJtwz9vZBJ29OAlKJB/nGmNtuXiDPL2SEVMQMJsKzFkV3cskB2E8+Oknq0ybyGfA
         LmdSCUrA0H2Q8i+Yx/aX+44NwnzIHT/ZbxhrP21KLiy/ZdK1E36Wk13jr+0Xf/ltR6i4
         sTfA==
X-Gm-Message-State: AOAM533yuXGOSovwq2Myq2WZbIcJTACf0ej+J1myS9MN2tHf4cC5puZh
	z96g9BLF8Kmk0pj5/zVHAso=
X-Google-Smtp-Source: ABdhPJxHJzdAUxF3gKV/nKbz79ohy+RLGfDCYPPdkrjcA5TMxYDm5niRhvzyhjI3M5flvDcnTOSGVA==
X-Received: by 2002:a17:907:c16:b0:6db:682:c8c9 with SMTP id ga22-20020a1709070c1600b006db0682c8c9mr9934011ejc.153.1649060507288;
        Mon, 04 Apr 2022 01:21:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b006da94efcc7esm4047336ejh.204.2022.04.04.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 01:21:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: remove unused fields from struct pwrctrl_priv
Date: Mon,  4 Apr 2022 10:21:38 +0200
Message-Id: <20220404082142.4639-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404082142.4639-1-straube.linux@gmail.com>
References: <20220404082142.4639-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some unused fields in the pwrctrl_priv structure.
Remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 4cc365aa3fa7..b0d48106fe56 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -47,16 +47,10 @@ struct pwrctrl_priv {
 	u8	smart_ps;
 	u8	bcn_ant_mode;
 
-	u32	alives;
-	struct work_struct cpwm_event;
 	bool	bpower_saving;
 
 	u8	reg_rfoff;
-	u8	reg_pdnmode; /* powerdown mode */
 
-	/* RF OFF Level */
-	u32	cur_ps_level;
-	u32	reg_rfps_level;
 	uint	ips_enter_cnts;
 	uint	ips_leave_cnts;
 
@@ -72,7 +66,6 @@ struct pwrctrl_priv {
 	u8	power_mgnt;
 	u8	bFwCurrentInPSMode;
 	u32	DelayLPSLastTimeStamp;
-	s32		pnp_current_pwr_state;
 	u8		pnp_bstop_trx;
 
 	u8		bInSuspend;
@@ -86,7 +79,6 @@ struct pwrctrl_priv {
 	enum rt_rf_power_state	rf_pwrstate;/* cur power state */
 	enum rt_rf_power_state	change_rfpwrstate;
 
-	u8		wepkeymask;
 	u8		bkeepfwalive;
 };
 
-- 
2.35.1

