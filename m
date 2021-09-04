Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886C72
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 12:50:26 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so1369299pjb.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hWdLCsJwPXe5S+PDhMU75473QN73+wYuiuXu5T3CTIc=;
        b=qesyA4Cbsvrn1UJfP5GeveoMwAdqJ7Bl6Xe4QZaJoC+bSH+gjY0uDnbZNM1bYldQDX
         mLzolZyOcamwdGinpRkfWrN+ekTVLRhIMjaKb8fv+VtSJUtL242FDaGsH6GJIHbiGh97
         dvajymDDOIzETw2aB+IrrIA5VwtIzcZZYlzfxrdMdfFwQFRQxkOQU4Z7jEMWuk0OzRIn
         TChRUATegYoJBYbdeasDErJhCMpBhHIMD1B/KyrkCwvBbkDcBEBT4/wONIjyfe3L7WSU
         LOxegMOf84uUcjhOuQV3ce67OC9BWgxiAkkUPf2qYLP5O1xR/6FxTaDDI+DwleaYmT89
         IN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hWdLCsJwPXe5S+PDhMU75473QN73+wYuiuXu5T3CTIc=;
        b=Oeve4OPZCzNsdFwbBUE1LO96cKS7TRwX97/NxSPalR5d50LaPsdhyRktQkrG3MlmXg
         6e2VgcOMGWdpBDsL4qb0eAlX08PtZQSDFmd9Y5K3H4ntvt3XBIjnVBVVkjUuO0TodYJE
         pL8/BaMIbHsuApiNj9ELD79d9NuQ6DSCJ3SOnX2iP5mu4LHHgbSoxyIpGMmx4OlxPIB/
         clQJqrUFYH/5ETvk6ouCY5yRF0tg5QBQlUhkdzMNhkVfqPl3WRRCTuz/Cr7jDogO0lWP
         YpUGElMv8U2gBV6fTwuU/5MrpOP33tr79RXpXqQOii9xGPxK/o4SjMg4/t66X/1g+B3Q
         7IVQ==
X-Gm-Message-State: AOAM531tT9skt9C6w0V/c2n6QLcm7LcMfgMks4yrOq8eXW1rpe/mPCcu
	9NSKrRTqzqWd/KGMQRjzch8=
X-Google-Smtp-Source: ABdhPJzanTEFb4WGTwtpCyV+7oYQG2dwo75cUhClbBqLcoHIHQACiVXN1sZhDc/0Ad+hCccv0z4ujg==
X-Received: by 2002:a17:902:b7c8:b0:138:c28f:a775 with SMTP id v8-20020a170902b7c800b00138c28fa775mr3033168plz.11.1630759826388;
        Sat, 04 Sep 2021 05:50:26 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id x3sm690764pfu.164.2021.09.04.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 05:50:25 -0700 (PDT)
Date: Sat, 4 Sep 2021 18:20:20 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove condition never execute
Message-ID: <YTNrjG1y05ByN54+@user>
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
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 4178b3c1ff57..f314f55997bf 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5669,9 +5669,6 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);

-	if (pattrib->mdata)
-		SetMData(fctrl);
-
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);

 	SetPriority(qc, tid);
--
2.32.0

