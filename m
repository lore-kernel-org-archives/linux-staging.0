Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549727479
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:06:33 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so5446410pjk.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dikvD5+bFGXRs81xXMLBNykCJfKHBwW8mLASTTcU7RI=;
        b=CP3R2VhtIikUhX0CQe63EEcuRzJ05+zBsyTaRfWVdRBk7wtsCdIuihqashVO2NtBz/
         N3a0L8frBYFIVcNbhdAEaQQOQwMJGJREBXiGzBijaWfti6fgC+l/nIbknU4I6PAyio/f
         95uR6K0cVqO4SgDrwkG83t8D8YFRI8qhfr1LuwB7M6RdlR7tWee1Y1OTn2aWEEmZNZ30
         ArIdMgygY7iCcK8h8eecjlO1UgUFTS3C5yA9G8mVzGgw0nFVJQ36qzvXPQ8yKaBKq8yC
         eotE1K4MTp2NIC58s+dhNagJz/I3aQ0nrUCStYVMTqmbug33r7NS9JU6MZCLVI6TWpqB
         HMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dikvD5+bFGXRs81xXMLBNykCJfKHBwW8mLASTTcU7RI=;
        b=g0zu3/vFdHfmVVytclqI7moFuabS/xOhrbjYz9jWPEfpqhBAaNucfZgFftwafvDPJm
         eBhMIs3q//oHGCI+i1BA32+l7qfy4Ae61yhHjsLwrcDYJkyLMWgpJBNUeK0LFD9qKXk2
         kz50L2+eJtT620Kr4JB4qe+7Irr+SlnO4nNmItWzTGQ17Sf53NlXBh6EsUX7tVTEAiKK
         low+m/VzYjzyMGlx3pUi06OSF6OaqgGKinpbHbvJerhZ/3EM/vnfmstgaYRZ3nkxMY+9
         SbaHMh1AvOqqfUkD9U50ifPLjhe5/qHbsTB9NUj+EmodmAtG2zwAUEeAQRxwg9y+n+QQ
         bulg==
X-Gm-Message-State: ACrzQf2cXXfBSNbkImFnZRf5edHZZiZddzekOSpGLEHnBggyd6Vfdrkb
	VHSfsbIa+8LuLMYq7wemOb4=
X-Google-Smtp-Source: AMsMyM7azrtevbNSyQZJ1HE83lAAulbHxkECoTgmm2tQi0dVtAB36ixfYvUpgrenOok+o1TEJaCusQ==
X-Received: by 2002:a17:902:7296:b0:180:1330:b3c0 with SMTP id d22-20020a170902729600b001801330b3c0mr38689617pll.170.1666717592599;
        Tue, 25 Oct 2022 10:06:32 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id a1-20020aa794a1000000b0056bcf0dd175sm1592373pfl.215.2022.10.25.10.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 10:06:32 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v3 1/4] staging: r8188eu: remove unnecessary variable in ioctl_linux
Date: Wed, 26 Oct 2022 02:06:18 +0900
Message-Id: <20221025170621.271903-2-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025170621.271903-1-tegongkang@gmail.com>
References: <20221025170621.271903-1-tegongkang@gmail.com>
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

