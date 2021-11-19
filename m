Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875B42C87
	for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 12:26:45 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w1so42024307edc.6
        for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 04:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uuvO/6huRHErRBfX6Opsxwgn6NenzRt+7b8WseBiimA=;
        b=YQxCcKbmMcCr98FzdsSf2v3TCLd0h9QkM5VKZlfY7ub5a7zP3ZQMCCpcUT9NCNm/26
         HEZKWrpfSbgGRf0K0DrQfx3seB4tM8yT9OCkQisMIDdmhsZdvMog6ZQ/kuaqIwXitw3W
         9bu9k/BHTWI6F1YI7KucIGpsro55rI2Yw1iZYo6r1gCVfL+IzLXwqeHmV7k0kwh914o+
         bZ2X9YDATIdLG35oWnEe/JClGtV7sd7t/bU6l5mEJPtJjt7+aJ9EabBCny5fyOTkRPU9
         U075/f6GChk/NRgFDkMlQHSU7PXC7n4mGZAq/ps60s9um+KVeLMaXRYi7drOV1IilGbq
         EDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uuvO/6huRHErRBfX6Opsxwgn6NenzRt+7b8WseBiimA=;
        b=YZCrELSRFVRMlofufbXs4v1EA89Qs5TcqWeArpp90XWdBkpFwA8SRpJC1+TmIoma9W
         zNzje5+Ihy2ZG6MM3q3qlrANoLvrJDFNIOynzbr+qRl/jybtDAfxYb7MeQTtasl7asHq
         5Yo5/x9o/IWUnCpBV+bV2hxOLqCntG2mtRSSYCRNbKj2F+vJeLIBH9Di35CpVHN+Ed63
         ORy+LhE4H/Btppp5tWRu8H1Mi8LvyqiZzWd8hehxXao5L7eyepmjkAdIyWTF3OE3VOud
         7YoDmEJEAz0CaU8nzIrRUxeeSAAN8qT4F7mypqmLyqI+25Tc4WF6y82fWPEnvmScdxLV
         CHAA==
X-Gm-Message-State: AOAM532k1pFWyb7Z/Es51FkjAKwdKdcECUlqzsyUc3pDT306Yjl179YD
	DEVGvo9caHiSrh79WCK0IKI=
X-Google-Smtp-Source: ABdhPJz0Mq60L4kH1ZmQwx5FfA4MZETakdK3lv2FcQD7Z/yqkd+wwrfdQkxIi9aWC2wxjKkuY1LMkA==
X-Received: by 2002:a17:906:b01:: with SMTP id u1mr7191042ejg.504.1637324803937;
        Fri, 19 Nov 2021 04:26:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::79b5])
        by smtp.gmail.com with ESMTPSA id v10sm1374994edt.24.2021.11.19.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 04:26:43 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove rf_type from HT_caps_handler()
Date: Fri, 19 Nov 2021 13:26:35 +0100
Message-Id: <20211119122635.28435-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119122635.28435-1-straube.linux@gmail.com>
References: <20211119122635.28435-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rf_type is always RF_1T1R. Remove it from HT_caps_handler() and
remove related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 6d4e21a16783..3c8876822602 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -695,7 +695,6 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_802_11_var
 void HT_caps_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
 {
 	unsigned int	i;
-	u8	rf_type;
 	u8	max_AMPDU_len, min_MPDU_spacing;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
@@ -730,15 +729,9 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
 		}
 	}
 
-	GetHwReg8188EU(padapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
-
 	/* update the MCS rates */
-	for (i = 0; i < 16; i++) {
-		if ((rf_type == RF_1T1R) || (rf_type == RF_1T2R))
-			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= MCS_rate_1R[i];
-		else
-			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= MCS_rate_2R[i];
-	}
+	for (i = 0; i < 16; i++)
+		pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &= MCS_rate_1R[i];
 }
 
 void HT_info_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
-- 
2.33.1

