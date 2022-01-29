Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE372CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:21 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id z14-20020a17090ab10e00b001b6175d4040so8155193pjq.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6zjHCA2mlhxhOhnGWQKP59mu6FW4vaokSvYIkJkIJG4=;
        b=NWXU90bGfAUDA6hnvcDB5yiOVHb+f9xHcauQTwA8xma4HVI6f85R1CSe5QwHGt93UF
         hYkCtOtC1zkTgqdFTuVkozOgwh/ZP/3xhmwWvEMRSqkGNMoxYWbmnyWajPXkzYEQPj+Y
         k5d8KOEDxUIQ+FyY+drr/o1eCPdqEoD0rgXDbPGjrm+VdfeXD3kvVlDifqKyYFmE2Hl3
         23cM3m3Q/Mb+VH4NxUWko8dDRsEpYFugSblIxuo76jWrNlZKe8TQEyzvW5/MTm1YDibx
         UcUDnSOfpuVTjXacv+0KPW8veRh6vqfPTIlhdtyuVEgE8p4gvStyP+3AiD0D9JGAEljl
         mL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6zjHCA2mlhxhOhnGWQKP59mu6FW4vaokSvYIkJkIJG4=;
        b=aEs0jhjaNISrCJXU4hT6NFZqjHKvVlvHC0jDyxYrdtyBkvc27qRC4giFRYOm8CvV6z
         L2WKxGaTVI0LuuzLVbAppUaWS1skHIfecWMJvGNc1RLzwedMVGxO/UWp2SYeamS7Gv07
         UQUXeIiHoj3fxusKoFzhKOqxroUZ2hihHPoyqbUZwdNOb9rWBqt4sTaQqb+DzS1+ZGp/
         nLy2N4048s3tDOvsRY+LprPDtQj788jyrLuD0kdz75I5dC9V4ZKcvieyFabtb1cj+mle
         T1o2tPqE59kM3th8dc3YXqP2e+A+MSkPMD7uhNuTabENKkZfixxqtSid0e0bwAb69AZY
         ug4w==
X-Gm-Message-State: AOAM533aXgtIwLQLZAC8GqfCPQsJA8W4Hez38+kt+RM5C27+Hi8tFCQI
	4Ttmg+E8KOqsQF+UKHAALi0=
X-Google-Smtp-Source: ABdhPJyQSOi4W71WzoPSJo03LOFHDk6YD4WNRlSITcWcGAElPRpQy9HNiRGkqU01AEMV+9nqf9YmNQ==
X-Received: by 2002:a17:902:e746:: with SMTP id p6mr13284175plf.78.1643473881469;
        Sat, 29 Jan 2022 08:31:21 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:20 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/23] staging: r8188eu: remove unneeded variable in rtw_p2p_get
Date: Sat, 29 Jan 2022 21:57:55 +0530
Message-Id: <6c992e9481c7481aa5931635e162dd7a4400a2e2.1643466748.git.abdun.nihaal@gmail.com>
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

Remove unneeded return variable that is initialized to 0 and not
assigned after.

Found using Coccinelle
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index f99942417a71..bc5c8454ebcf 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3422,8 +3422,6 @@ static int rtw_p2p_get(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
-
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 
 	if (padapter->bShowGetP2PState)
@@ -3447,7 +3445,7 @@ static int rtw_p2p_get(struct net_device *dev,
 	} else if (!memcmp(wrqu->data.pointer, "op_ch", 5)) {
 		rtw_p2p_get_op_ch(dev, info, wrqu, extra);
 	}
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_get2(struct net_device *dev,
-- 
2.34.1

