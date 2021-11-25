Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC3029CA
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 19:59:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o29so6442598wms.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 11:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N5VMnQudqygsHa96G93xYFbkIJoqADuSCWc5dxeQhpA=;
        b=JwD2L0dq8UUCbXoIt3GEmIFwD1zz1nMVDjDK/MXrBWQmauIZ+6ujvWYgxBWYqVMUEL
         FZYN4kjeWfq6yLyfQ567/xbCn2JeCj1veVumhtI23xjTkyNbvHT11PrK+++ZSftm2Hhm
         6EZeIujA0i57A/BIt/gUB9wZ6NlMDpLe3RsTAhRQIBWWZKXfvnatlePlp/syL/eQ8p6p
         C/TbJKM6Q2EZaiGNY/lE397NGMMBpGkUALB9y9rBsgCf1KeH50hjRhgJSvSRxLVlOS9P
         aRtUOT1sKbxiinUCXidIJOVfoqhYRezUf+Tqc/ansZW7MKy+oCiAQ/SAziQ9OXy0YaCR
         wdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5VMnQudqygsHa96G93xYFbkIJoqADuSCWc5dxeQhpA=;
        b=Vc2o9ZwUQYTyUZE0JgN6G/fEaARAuEKc7pp8fVQIPFfZUHMP5k+9sL2HeVOOTKB+z+
         WfJ3cHld0AP43+WF55aSAHG28yCDZA08Y15egPbwhed2pNRIXHEYG3v76fXMCqGCiO2I
         Iueg0bDuUTz7yzEsbCexZsnyEoXm/2DA3VPqBTGK65VXL2Q5v2n3ntgCCAw4sabEx/H8
         9zVfcrpfQ332ZtdbAI1VTG0fy60IUOquJmmcVxNGkbEGmfTyCEh91I2raWFKCu3WfVzH
         LooujLH6Iodw5Fxgg/pyYAhJ/2ScdWGquhIW45WwxXrMAEDrtwfH4eHVZj3zQz+pRgGW
         8wkQ==
X-Gm-Message-State: AOAM533kSQTzgwBbzHbU76yKspip6BC7VdvQembGuV/NNfsPRE5Xzj6p
	8qFbRMpqvnBLnB4nPvlg8tg=
X-Google-Smtp-Source: ABdhPJzW0Wil5JAIpg/7HWMMHX+VRGXYKM1wUbLHd03c9QQB1VAjoWt0qJYUmfJpJNtliky8Hb5cdw==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr10445965wme.116.1637870388901;
        Thu, 25 Nov 2021 11:59:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id h13sm3762721wrx.82.2021.11.25.11.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 11:59:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: remove rf_type from rtw_update_ht_cap()
Date: Thu, 25 Nov 2021 20:59:32 +0100
Message-Id: <20211125195936.10060-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211125195936.10060-1-straube.linux@gmail.com>
References: <20211125195936.10060-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rf_type is always RF_1T1R. Remove it from rtw_update_ht_cap() and
remove related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 8d14aff32f61..a3996a7ee814 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1999,17 +1999,11 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len)
 	    (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) & BIT(1)) &&
 	    (pmlmeinfo->HT_info.infos[0] & BIT(2))) {
 		int i;
-		u8	rf_type;
-
-		GetHwReg8188EU(padapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
 
 		/* update the MCS rates */
-		for (i = 0; i < 16; i++) {
-			if ((rf_type == RF_1T1R) || (rf_type == RF_1T2R))
-				pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= MCS_rate_1R[i];
-			else
-				pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= MCS_rate_2R[i];
-		}
+		for (i = 0; i < 16; i++)
+			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= MCS_rate_1R[i];
+
 		/* switch to the 40M Hz mode according to the AP */
 		pmlmeext->cur_bwmode = HT_CHANNEL_WIDTH_40;
 		switch ((pmlmeinfo->HT_info.infos[0] & 0x3)) {
-- 
2.33.1

