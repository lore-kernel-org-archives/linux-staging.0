Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470AB3FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w29so10355040wra.8
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E93OQWyEHg9H2K50AEqcZaCXK+BXZHFSzWYopoW3wW0=;
        b=piXj9hzWyjsLam9T89Ot5AUgueWh5IIcGDQ/KIDAkhm/Gp9zwM91hm0TZi+RJxGr+0
         YZMaC3PZyTkWJl3WxIwtBNxtVIhbfg1TOSzcVb+/7rrxQQ/AgWB+/piGUCwE8Ce5O84h
         NxE88Wf8XtVZBxBaKW27ea8ShuZcFfI5ZopW8Ltz7GdjSxBgLW92cOEI+CPc/EA0roW7
         r2GZ7rd26rjV6kzHNRMZLZHwovpr8e+Lf8x5ZOhomC2gqPA9pWAKNW6ySwZI3TEkclgz
         a0d5z1xAz/mZ53grvxyu2rZVKisxi+1gXcS3lQHUq0GPs1FotB+3Gqgg4dmWp5St2CTx
         947w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E93OQWyEHg9H2K50AEqcZaCXK+BXZHFSzWYopoW3wW0=;
        b=1gYVAbc6VpQZtuZCWaCaoBs7SQA4JpIcRS1QPOOT02HsBlJyRCmDlRD2J1rrEgGZ88
         UAAp707owp2QAL4CeCBlHzZDVbcw8YPXkvkN2fr3i0WRJBsIDd3s6k7i5oFW76/Fhnfv
         gU4CfgxxuR6MbvMPWEhMK9cSRZjtYLbsceLs+MCeDOmuaf6kBjresdpFopyGuczbn46z
         h/y2SoVn0IdSHOXldax9C8Htn+2UvbImKbmIoyUtNCwRJKtQwiYz072J5XBHj3FfLI0P
         NM4dvDgY1kNmNkc/7RKXA7Hp7sSRhCUX5wNht94HIp47yFDfHT81EMFlx8MgMtDvM1Xj
         94qw==
X-Gm-Message-State: AOAM533YKOoBFjOCbItW4ksr6OM85ZHITbGOpREXjWZu7P8emTlzbe9u
	cAabx6NhsoxF6YlpoXuf/68=
X-Google-Smtp-Source: ABdhPJz7vHWTzNxXUIK31VyFinzzJ2kozUww9uS3Wd9C++Z0GmUu8K68+BlN6Nu9qJFRocsbtUKLcA==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr848370wmj.33.1632341141783;
        Wed, 22 Sep 2021 13:05:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 16/47] staging: r8188eu: remove build_deauth_p2p_ie()
Date: Wed, 22 Sep 2021 22:03:49 +0200
Message-Id: <20210922200420.9693-17-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function build_deauth_p2p_ie() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c    | 7 -------
 drivers/staging/r8188eu/include/rtw_p2p.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index f942f8f9e3f6..dbcf8bd24e6a 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -733,13 +733,6 @@ u32 build_assoc_resp_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pbuf, u8 status
 	return len;
 }
 
-u32 build_deauth_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pbuf)
-{
-	u32 len = 0;
-
-	return len;
-}
-
 u32 process_probe_req_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pframe, uint len)
 {
 	u8 *p;
diff --git a/drivers/staging/r8188eu/include/rtw_p2p.h b/drivers/staging/r8188eu/include/rtw_p2p.h
index 92b9bfe3ea0b..b91322a1fe10 100644
--- a/drivers/staging/r8188eu/include/rtw_p2p.h
+++ b/drivers/staging/r8188eu/include/rtw_p2p.h
@@ -13,7 +13,6 @@ u32 build_prov_disc_request_p2p_ie(struct wifidirect_info *pwdinfo,
 				   u8 *pdev_raddr);
 u32 build_assoc_resp_p2p_ie(struct wifidirect_info *pwdinfo,
 			    u8 *pbuf, u8 status_code);
-u32 build_deauth_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pbuf);
 u32 process_probe_req_p2p_ie(struct wifidirect_info *pwdinfo,
 			     u8 *pframe, uint len);
 u32 process_assoc_req_p2p_ie(struct wifidirect_info *pwdinfo,
-- 
2.33.0

