Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7E2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:52 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id i186so6501994pfe.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=so3gw6VeXNqJCoBkFVd/9SWWTHocd9ttgxTU3TJ1cFo=;
        b=oRj7oImpt5kKgtkq/LCUN0tJ7NlEILepU9GYvZ5DFC5dRAQu6kJRcLlDWjrfV5/Ni0
         UJLuQoQEIqHVG88zLmWY1Fhi6ibc4strwuB3wH15IjXjbYSaJ0fBig0tQp2yhIIyiYT0
         hsRbIf7PbIsYwnjOenN/RRQKjWzeytRJxnXgjo2z/iYgTI6inEtoR/1Rvi2TRY75Q/78
         4fMtN8wzn47m5g2qpKOrAHl5D2B/cRK/ShFEiOXr1TFCo+9QJQbiZMEXKTPfzx9rn/3s
         VgP4lUoReDS5mwgkWHpo6Y5FEqfk+CxA4RtswHKEHWZVereHfeUAqRWLUb/5CHV3ZIeA
         B2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=so3gw6VeXNqJCoBkFVd/9SWWTHocd9ttgxTU3TJ1cFo=;
        b=NyGJVZdAW43wFj9rdbXeFrjWtLq8AADSB7qzVDWBeO+qJfSmCaGeP2lmM7M4QX3tPx
         UeKkfCsaJfsw14NtW8cN2vNGlrwqBiyfndlYgz5dMH8jbxPf+b8Ihh0WfbQu8CEyNxNJ
         RLVi+UR+05lAbr/rS2EMewYAyyfsQ9xJnyNq85sPOR1qADZmqyzL1kr6tLvXpAwwyj3f
         6IozyxomzSrlD+sPwoj0CRXuVzYtsb8aoKO0E6JSoQpltNxOgW+AENgVDooUjVZOZH7Z
         AbZ9gXdYMkkOBwW/iRROavNExqxFEMv2sFB3MgRVq8XYgoDglQagItZyTjyeK8o+atlb
         w6+g==
X-Gm-Message-State: AOAM532akoiQt0uZGTX487j1iLxatUmmAW+HueF+po/ateVvjd7HN1l4
	K6eizwKijnhrtXGLLr/20rs=
X-Google-Smtp-Source: ABdhPJywahgk5tKO254vtnIjqc/UN165qbWeHmM9qQZ35ol/dR9A8AnVb08DAERzjSIEU641plBRiA==
X-Received: by 2002:a63:8ac9:: with SMTP id y192mr10727739pgd.598.1643473912229;
        Sat, 29 Jan 2022 08:31:52 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:51 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/23] staging: r8188eu: convert rtw_p2p_setDN to return void
Date: Sat, 29 Jan 2022 21:58:03 +0530
Message-Id: <fe4a9f0176c96ec327342c793de1f55c89d16768.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_setDN always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index c761c06cf6e8..daaf808ca23e 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2453,11 +2453,10 @@ static int rtw_p2p_profilefound(struct net_device *dev,
 	return ret;
 }
 
-static int rtw_p2p_setDN(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_setDN(struct net_device *dev,
+			  struct iw_request_info *info,
+			  union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2465,8 +2464,6 @@ static int rtw_p2p_setDN(struct net_device *dev,
 	memset(pwdinfo->device_name, 0x00, WPS_MAX_DEVICE_NAME_LEN);
 	memcpy(pwdinfo->device_name, extra, wrqu->data.length - 1);
 	pwdinfo->device_name_len = wrqu->data.length - 1;
-
-	return ret;
 }
 
 static int rtw_p2p_get_status(struct net_device *dev,
-- 
2.34.1

