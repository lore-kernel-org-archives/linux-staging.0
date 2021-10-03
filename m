Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3513FED
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 15:58:34 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so975762pjc.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=zpKWH0o273AwWKOQiai2l6VJtqelQ9CIZR7+0FF4a/Q=;
        b=KoxV3SM2WFC7MOiOemAi9dqB9EG6YCOd0bOVfTS51nI2G+//Y/5y8N/TpQekZzciVu
         9JGi0znDIAUg00JXJN7PG3PrHpDFR58Uawa1c6CVGVo5uxh0WOizeZJRDcxm6ufkeJ2g
         KPky2EPZurhMRJkLoyyw96p6Yk/F4PcfKuF2nzsRYJef74xH17o+viHB/mEy54iOx4vb
         2YFl0meg9gyzN0d/g72UfH3pa/SRLh1zKky1GfUPSAcZhSmoIY4hV1diiFuZQHU6uG7S
         t/xQUVkQkTFwJmiEES5SdlroWZZ4Kt8g7msCBlALXq34K2Acr0nRnhtkP8NyCa3aoMCn
         CkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zpKWH0o273AwWKOQiai2l6VJtqelQ9CIZR7+0FF4a/Q=;
        b=NYb80BQy8fFDcysJosQUYUT6Ke9rMpLmDIyZDVudJpJNNiT1ycXugwkqFdmSElcY29
         gKo/6VYTxJ4LgdSjhWrQfk0Zn8ZrKIFGV/Q5aorcuK5nIPAJBMAdhGtLSGtRFm4DAwAe
         /aQ2DFESteeF7VPXyetwyRoB7u4hpmBD4XVrokESP1AtooZSmH7x5dtfL+BXkAWb/7C2
         9i9S6UFKMvSIWkfULAW1Wx1FSIoSwNK0ordYKuePqvwA9LAsVkoeW0PH8wZUOo8c0r25
         ljSu0BtGXghT+McFES6KNhjbYf4D0qsUTEqal+QDWHj79tKBO0Ua8qRoiZX+KdiFe7eJ
         b3lA==
X-Gm-Message-State: AOAM531gfTEhCbpoTpOsSUPyln+LBaiPOE2F8k2bnVVxqpRgTty9FAnJ
	1vxpMXUqPlMdyLBYUGhVFE8=
X-Google-Smtp-Source: ABdhPJxRlha2CtuW7W9Z3ZD1BKYKzrLOHNcuEHdyN5zmLYQIwc3tbGW3dq5S34VzpT9TkQ/I4iOyVw==
X-Received: by 2002:a17:903:31c2:b0:13c:9de8:d314 with SMTP id v2-20020a17090331c200b0013c9de8d314mr18954554ple.1.1633276714407;
        Sun, 03 Oct 2021 08:58:34 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id u17sm10423421pjn.30.2021.10.03.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 08:58:33 -0700 (PDT)
Date: Sun, 3 Oct 2021 21:28:28 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, hdegoede@redhat.com, marcocesati@gmail.com,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: core: remove condition never execute
Message-ID: <YVnTJCoz2qsXDXGc@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove condition which never get execute.
as pattrib->mdata is always zero before if condition check.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b2c042c36777..3ee4d35ca8d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3222,9 +3222,6 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);

-	if (pattrib->mdata)
-		SetMData(fctrl);
-
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);

 	SetPriority(qc, tid);
--
2.32.0

