Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5740A70
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 09:45:59 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id a17-20020a17090abe11b0290173ce472b8aso8139689pjs.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mfGDF3uxVEu2CK16/T6WliIzRL7c2dB7pkWJyLpg0nw=;
        b=BYo5Bf7lGW+EKFn81RdiFPwr46xq3jY8JZ8beejibvqEBlFHayDdp55l5Zaa3PiSCy
         rseLyb/6g1GH/bj7g+Akk4QqHOb47PFQMRKtH7LB5v15nYO8cP7bWngHvCPriBJq6PdO
         dIwyrMsXS4QrEHcEpGyP01zA7CGiIdT7QUzIeAjWywoxycJNI9REexJx147i8w3H3ub8
         On7dprLZeVUkvOVo2pXD9tQ3kKvBagQRZW0bccqsj+ftIpyRLb6Ncs0bOdJpbzETG/yW
         FO1uf+r5fJpDKxplLYr2pJVkztvlsFS14jV1N8in4X0j00VnhP2E2Yy38qYz6WaJSjrf
         ikfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mfGDF3uxVEu2CK16/T6WliIzRL7c2dB7pkWJyLpg0nw=;
        b=cWu33MUUnmHLPVYNtFbgfWaCBymyqIKrlI2nEEqqOrrQCp7oKY1z9VaFnMVF8SEnCI
         j0KZmLvh0tMojxVNRfJtFZWRAAO92eAtbP3PYfGYaVnaJpapzg88uJOvVpXuLvd3Y31j
         AKwKaS22C0VKb72W/m8/Q1jDCFbUKDSWf85i6mgu+K+be18v6+IxKiyJofPqSJM6cURQ
         nnk/LZEFI+fzNkBl2fFKzTTdaV0UpJcZSFWVB0yBPWuSQZicOORj4XbvRCZFzgPvjeFu
         fhSzKe9LBHaoJ30XeHwEWeOyS2Ts+gZ3wxT0wJaA+vT6NRyzsy90Xuq1W6F6bd4mIywD
         IIHw==
X-Gm-Message-State: AOAM5308v9K5BrmTmBLDdGQBI1nByPSdjWMQ2l2VpQ7aT9o90OGewHYS
	rUCfKf5CS9g5zLLp7GA+Ro4=
X-Google-Smtp-Source: ABdhPJwKB+9hf7uTGd/AXV++CixDQBYO/uEV3OiauvR67rJcKIGNogdhXncl+HYbDsCYlogJaxW0qg==
X-Received: by 2002:a65:6118:: with SMTP id z24mr4016232pgu.325.1627033558809;
        Fri, 23 Jul 2021 02:45:58 -0700 (PDT)
Received: from localhost.localdomain ([103.238.106.236])
        by smtp.gmail.com with ESMTPSA id r128sm5178461pfc.155.2021.07.23.02.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 02:45:57 -0700 (PDT)
From: Jignesh Patel <jigs0101@gmail.com>
To: 
Cc: jigs0101@gmail.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Paul McQuade <paulmcquad@gmail.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: Line over 100 characters
Date: Fri, 23 Jul 2021 15:15:16 +0530
Message-Id: <20210723094524.8811-1-jigs0101@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break lines into multiple lines to respect 100 character width limit.
Reported by checkpatch.pl

Signed-off-by: Jignesh Patel <jigs0101@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_ap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index b817aa8b9de4..a6e756720214 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -254,9 +254,12 @@ void expire_timeout_chk(struct adapter *padapter)
 			updated = ap_free_sta(padapter, psta, true,
 					      WLAN_REASON_DEAUTH_LEAVING);
 		} else {
-			/* TODO: Aging mechanism to digest frames in sleep_q to avoid running out of xmitframe */
+			/* TODO: Aging mechanism to digest frames in
+			 * sleep_q to avoid running out of xmitframe
+			 */
 			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
-			    padapter->xmitpriv.free_xmitframe_cnt < (NR_XMITFRAME / pstapriv->asoc_list_cnt / 2))
+			    padapter->xmitpriv.free_xmitframe_cnt <
+			    (NR_XMITFRAME / pstapriv->asoc_list_cnt / 2))
 				wakeup_sta_to_xmit(padapter, psta);
 		}
 	}
-- 
2.25.1

