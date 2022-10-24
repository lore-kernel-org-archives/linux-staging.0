Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393067ED
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:49:46 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id w74so10215841oie.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 01:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dikvD5+bFGXRs81xXMLBNykCJfKHBwW8mLASTTcU7RI=;
        b=Eyb1XzP245evTp1QRz4N5vez7+pwTB8t0DRShOyMY8LQOTZrVNt36tLRMwwU3Vm1KJ
         mcEDAMNV3LTJzC3XHcK4KvzmLLg2Pem3T6vzJxdfK7b1Qu4mhtpHlh+c+lfDLO/GcpnU
         pJ6zUcoqq4Ed5pf7l3WrEXfbGurZHkcgMxXtfg1LPJ6SHp39C3erHSTEskXfxfn8lARA
         pyzPirhfCxKF3kplc2xAD4rgJoX8LpeMG1v+t15LegwG+q7Iau408lyfXqi0fswOzGpX
         565KECnxNzF1mp0fgngifBUWFltsFatVYHI6/Yhh+o24eVXl616jqcUyNRNWG0BBguO7
         QT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dikvD5+bFGXRs81xXMLBNykCJfKHBwW8mLASTTcU7RI=;
        b=y32ndIWg5KcdDDlna0FIkUapPJCAoxghOgCA9FP4nzNx46W06/ww7ihFljQbdww6hZ
         LCx0V2B74mtmJ0vly7h4Hs1RVREe3X8ydLL81pCV4My+R/p2lx+zKGSQAfn3jR8p8o/7
         tix5dL7SZgPpC8hWpI01PtG7DZYgps+yQ23T7nFlTC/9ULEoWiweBK++yYX8gDF3i9g7
         xR70NXh9o83/vzIvcA1KzDAX+qct0Cx+izmcH7Zef5pY4zHzE+zfvEe1z9oppGOZ/Pbr
         o7toThva3HagQcWJRm+30nrTIgBurtbjxi3dEGqwlFzx2Lji2nK7b2yxtEt2KxZWROH4
         VekA==
X-Gm-Message-State: ACrzQf1NjOscFvi4jKhVY9emjPEaZlHFOyVw+ziLhLg+7vDhoGb6STKJ
	/MnlQIsa5HF8O6wPg3nQmGFp7rIn/KpPRUyP
X-Google-Smtp-Source: AMsMyM4+1oC9yP2SuFdweGgP7rQZsd/xjzk/U2nzMAcrDmUkwtFQBY/825AEFbphUE6jPrYYkxOvyw==
X-Received: by 2002:a17:90b:4c52:b0:20d:7917:4cb3 with SMTP id np18-20020a17090b4c5200b0020d79174cb3mr73052031pjb.6.1666601374768;
        Mon, 24 Oct 2022 01:49:34 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id r2-20020a63a542000000b00434e1d3b2ecsm17245124pgu.79.2022.10.24.01.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 01:49:34 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v2 1/4] staging: r8188eu: remove unnecessary variable in ioctl_linux
Date: Mon, 24 Oct 2022 17:49:22 +0900
Message-Id: <20221024084925.262289-2-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024084925.262289-1-tegongkang@gmail.com>
References: <20221024084925.262289-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Returning value 0 directly instead of storing it in variable ret.
This commit can prevent cocci warning as follows:

  Unneeded variable: "ret". Return "0" on line 3030

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 2de2e1e32738..5e1ad7733127 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2979,8 +2979,6 @@ static int rtw_p2p_set(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
-
 	if (!memcmp(extra, "enable =", 7)) {
 		rtw_wext_p2p_enable(dev, info, wrqu, &extra[7]);
 	} else if (!memcmp(extra, "setDN =", 6)) {
@@ -3027,7 +3025,7 @@ static int rtw_p2p_set(struct net_device *dev,
 		rtw_p2p_set_persistent(dev, info, wrqu, &extra[11]);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_get2(struct net_device *dev,
-- 
2.34.1

