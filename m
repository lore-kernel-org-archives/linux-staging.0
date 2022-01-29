Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6C2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:55 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id l24-20020a17090aec1800b001b55738f633so9212325pjy.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mb5XVHLKhEOk/yXbWKnvcJOWOr308i/Z4c3YSiAFsaE=;
        b=IGwznrlFjCc7Dg4W52xaVzurlktI52HRfbLK9uZGBriiRCmHwDjyrTIDngntLnD5Wy
         tQJ8fV+eI9rQcWg41pGN1UMiCcoStZ1eRc4GTXIpll7qSdAvju7car9E8iM6GJJ9jBMx
         NrHJOPPbjM6qziCidMobsW890nVXnH/O264sHOm77x2BhQe95LlePPsST4coKgPn8C8e
         1tVXZd1zIGOGR1HogxjBn8Ka3u9rVK3Uj7V0bpgSvFyDrgJ+YU+0M8xoa4956KkSMwr+
         p2hxd00y+O/7Vz8lrIM3VfP6iUnxab3uT45rkASZz2i2NIkLt0wVKBM5uFDzq1k7ihWG
         Vdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mb5XVHLKhEOk/yXbWKnvcJOWOr308i/Z4c3YSiAFsaE=;
        b=3GvdM1NUPTpZboKgyIXC2zP4Hy4fY7NhSSdu9vL3RUFDVPhg6CcGDDxU2DI+l7DgBt
         U/IiQKE37TvOPL7ZPOvXYBZWftZQc3q5xzsxXAy4NJ1X9/mC60V1SSf3a05tspSIkkbj
         45ezM2vQ2xIUJNe8kyfdINc2xjI4ojIwEGBMG8Btceu9OC5OkUSkpOjfQO4+YtEB39RK
         IVHjJxWtJq8ARxEvYArud6lIj48yi65xxKr5V7FeDLlL5coQC7DvuFRj0WSBvJ8KfNTD
         +AH7EJsHxFB+IAOO2E/55dzLCnulM36qb+rgYXlrvTHmLPQ8Pzo8BlUYlxZMtyi0RMf4
         kktA==
X-Gm-Message-State: AOAM531XtxVUlpruTke6USonPURb5sgwx1/CqwvUPKqG4F6S2E7gcDW9
	uoHvie5wJX5WH+8Ckb92HRQ=
X-Google-Smtp-Source: ABdhPJw2IiTmH5NvdXBTOeBunxNR1XG9f7yxZXqajR8wJRRPTbz0cOcO+ge+HIZF+vnHreJxnQMFtQ==
X-Received: by 2002:a17:90b:4b52:: with SMTP id mi18mr15810316pjb.74.1643473915390;
        Sat, 29 Jan 2022 08:31:55 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:54 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/23] staging: r8188eu: convert rtw_p2p_get_status to return void
Date: Sat, 29 Jan 2022 21:58:04 +0530
Message-Id: <832c53cc201111449fccb40326084d20f676e722.1643466748.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_p2p_get_status always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index daaf808ca23e..d2db2117abc3 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2466,11 +2466,10 @@ static void rtw_p2p_setDN(struct net_device *dev,
 	pwdinfo->device_name_len = wrqu->data.length - 1;
 }
 
-static int rtw_p2p_get_status(struct net_device *dev,
+static void rtw_p2p_get_status(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2484,8 +2483,6 @@ static int rtw_p2p_get_status(struct net_device *dev,
 	/*	About the "Role" information, we will use the new private IOCTL to get the "Role" information. */
 	sprintf(extra, "\n\nStatus =%.2d\n", rtw_p2p_state(pwdinfo));
 	wrqu->data.length = strlen(extra);
-
-	return ret;
 }
 
 /*	Commented by Albert 20110520 */
-- 
2.34.1

