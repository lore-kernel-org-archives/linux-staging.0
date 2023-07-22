Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA2FEBC
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:58:12 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-78374596182so163167939f.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690063091; x=1690667891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPT/AaCv1OdblmY1sVuziMvUrHf6Fzs9xst1BQLTFpI=;
        b=gLDIOy0ohXK9vHvraqSrnUynmZTIZUhN13Q1jXSlL9o9+gqiPYDRq8Th/tnKe+eKSr
         y26Y+SLlCCOi3yT6/hzl7oVlUn3VlKC1I3LURBAXMh3alueBoROpiQydgomkdefEbaAg
         BqiF72KG8tCfKTQHV1GJu1DR5cQPrbD39eWEp6RhNC94WNp494vyNmucf2hvDpDHyuGK
         fdHq9foANdxDy3nFRxj9J6d8xXvfbZDd3Hqv45xD7KMjgQQjdgsO9g22b57RCXq9TsOW
         i1bAjp0mmhd/sFBbjpB3sgSxEAKy7zlgZ+MAwBY4hxYuGttf4twoX+moE0E+Pcdzg8Q3
         OW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690063091; x=1690667891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPT/AaCv1OdblmY1sVuziMvUrHf6Fzs9xst1BQLTFpI=;
        b=UoBB1/dVBTwmxEKXq74pjVuyZ2/61vWsM2d6rF+dFPPo73doh2mOfmIRva2aDdf47q
         dSr+G8zNRETF1NgsbWcZTI5G5QEg/aIN8YFQb1DQmITApBw3B0RYnbdz2fe9QflS3szb
         5PZrbX9O//M/j5qcf4ZsfI+6Fvsldr635Y8aXCWfJ44/RpKju63Rmbym6EdixvpdcvO8
         aLJHXoMytwYvEZ20sDpqoiAerC8LWZNOlsEvWiEj6RkjRNxT/Od7WPtM+2rUcQnjxm96
         ytORGnicm/yWft7oUl2FWGwMiQI49Hd08wGzrM2hOC+w7aSlj/t58hdwL+cuXuBlHCWS
         t8lw==
X-Gm-Message-State: ABy/qLYmdaNk/bOg/ykUyYFiX98gnhar6XGO4VU3ycUuSUyIVej6bVQN
	vSqUoLCB96Q6kvXN1PBOImk=
X-Google-Smtp-Source: APBJJlFt3oHdVC28SHz3N2Mh7uQSWrDQ0BdAogp9lEEEWYgXszD5grDUOkI8fc6+R95dvQYp36wHFg==
X-Received: by 2002:a5d:9c95:0:b0:78b:b892:e334 with SMTP id p21-20020a5d9c95000000b0078bb892e334mr150927iop.11.1690063091537;
        Sat, 22 Jul 2023 14:58:11 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id z25-20020a02ceb9000000b0042b3e86dfd8sm1932511jaq.141.2023.07.22.14.58.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:58:11 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/9] staging: rtl8723bs: ioctl_linux: Fix block comment alignment
Date: Sat, 22 Jul 2023 23:58:08 +0200
Message-Id: <20230722215808.4246-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
References: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch issue:
- WARNING: Block comments should align the * on each line

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 20c296d88c8d..088d29b9ea03 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -1204,9 +1204,9 @@ static int rtw_hostapd_ioctl(struct net_device *dev, struct iw_point *p)
 	struct adapter *padapter = rtw_netdev_priv(dev);
 
 	/*
-	* this function is expect to call in master mode, which allows no power saving
-	* so, we just check hw_init_completed
-	*/
+	 * this function is expect to call in master mode, which allows no power saving
+	 * so, we just check hw_init_completed
+	 */
 
 	if (!padapter->hw_init_completed)
 		return -EPERM;
-- 
2.39.2 (Apple Git-143)

