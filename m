Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2028C39A
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 20:05:45 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id jo13so3259681plb.13
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dikvD5+bFGXRs81xXMLBNykCJfKHBwW8mLASTTcU7RI=;
        b=X4PUWkNK4n5cSmNOGyD8vTdHmKfcZauPkHCbHfGV+Nl0zfx4vZ7cnd+oDJgjcBLzYk
         qJGASSSUnWtK5YM9ptAF27wAM7WlSNQg5Sdu7C2ALtGvBdfiO5sWtwgKkVm6runN99Eq
         qLIZFH98V0s8Ie+49BtQNMnzVCbOnCfZYaextdHe1tkx8Fe5gxFaE8mRTQbwevAF0gss
         gxl264F/JkhOrN6fxHMvwf12MKEzKVXhldzloLhFa19JIWAtgxFfOPuw3HQ+vHZ80YnM
         7vf4XdtSWM5lrR1MEGg7zGejes6obh/2AT+PDklrIYs8oxas6eQpAFAHRpQvMn9/tWRo
         zOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dikvD5+bFGXRs81xXMLBNykCJfKHBwW8mLASTTcU7RI=;
        b=OZRTPHFVuagcZY5Sp1lFgOQ6wRYynttwkJRIhRgl6jli2XqO9KcJTrcuoYrnEqOMSj
         GDnPOs+V2v87axYQmMcTVgSDsDPeyU4Px3X87eJ5JGA8YF29LTBIGYfcqZVkAmSsLZ5I
         0EiPgzzMuxmBLVtFVHypmW8ciaPNotDSnlYeEzmnKDtn14wR/o4wzgXiovnSoK9SS/OZ
         /ueSLzKhb6OOMNRQhAQuSEGWXLtjYXF83HItgrP/t6v1cuFz5YsadBHxU1bh854bn4x4
         3sctOi63Smc2W+TWw3vOq9bTWpwcWfSrVqdvR2mJ9rGDyjFsGQTnZEC/yvyDBWVLi9qf
         pKqw==
X-Gm-Message-State: ACrzQf32M0H732mRT6wnNGqse3aAPNHN6dVEADbA02dR+TCj4ismFrXY
	YM7bqASzcxA0B6jDDpUT8rk=
X-Google-Smtp-Source: AMsMyM780ZAlIMSV2rF8AFs2dr7+bvZW21x/juZGL35aSK+7PEhPQ3AxZQQK6RL5KTW2hVCMTiRMrA==
X-Received: by 2002:a17:90b:390c:b0:20d:a662:dac2 with SMTP id ob12-20020a17090b390c00b0020da662dac2mr62645821pjb.5.1666555544569;
        Sun, 23 Oct 2022 13:05:44 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id e13-20020aa798cd000000b0056bc0578c7dsm1130649pfm.110.2022.10.23.13.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 13:05:44 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: remove unnecessary variable in ioctl_linux
Date: Mon, 24 Oct 2022 05:05:29 +0900
Message-Id: <20221023200532.259276-2-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023200532.259276-1-tegongkang@gmail.com>
References: <20221023200532.259276-1-tegongkang@gmail.com>
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

