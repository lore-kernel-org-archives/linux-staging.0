Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265420E1
	for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 14:22:42 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b57c49c4cso3114843b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682259762; x=1684851762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MWqry1uK5LVCjEgXH9L4PAjElN6F5sdZSqjhQcA8nBE=;
        b=UzK09Cs3ortJKHuj70LOoVCm3lfOLhP1UUQ5PW4J3q4xjiunCyUh/c4aPtJ+VpScCa
         vSmMiu4S01S3OPdXu+z/4ddXQ7D5mjT6SBJWixri3jOEPwmj2FSugmr0ppGo1Diu7scd
         7fAIvHiSEtPuaSWWMtppqVXloxrg+UcpNdL4mAZ1GCAl7kaXDQd4powXAPs5K/iR278y
         4CuPhvENPi4kzuc31Q5g7f4BboeT0s/2eaHu70ciiBA+G7vlYajp/J91xomoVCXdYrL7
         XbXfI3lr4+s7kb8qmkh0vSm3PbCZ2wow3pX0l1CT/3RIYJ3oGVMfw3p3uwF1bRyYyYtg
         FUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682259762; x=1684851762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWqry1uK5LVCjEgXH9L4PAjElN6F5sdZSqjhQcA8nBE=;
        b=TNdIaLcfK8LEfNQWKvip3UaRs789VmNcxS+TEWExG+OQh+RA6hVxHlZn4tKcLQdrX+
         +D4KrEaA55UI4Rse/TXcFLdEuAkkdo/+WUpDG3IosGeVUFiaVtFUHHezxL2pZGvMdIR4
         dOct7W8ZJJi9HLs74hIkrxoIm8rHEAz68DtcYz1cK1GFB+bBcVXPgyCG9+UUu+NgKGyU
         9wdv27GJbgFBI0rzPkHhohe8IsAyg1fiOufQ8ou5keX1FQkMcz/dQk+0z0JZhIwsqGfK
         LAi0L44lnlurJ01sPjIRjvvLNZdL+DZ0VzSTbpH27MNdRQwIWIBTmNijlcOLfvvFwr5T
         znWw==
X-Gm-Message-State: AAQBX9fSIUTxmoVDbtJxjwyKNJ/tyaH2z5wOWVdLDEowD3OKjC/xMnbi
	Ua2JHWH/xvQMaun4mfTB2h8F9uDU7lg=
X-Google-Smtp-Source: AKy350aEvIF94VC8cLH+ksIt8qfZ186NI+2IntZEk4EM6cTlNfuw/z1jV3fiprjq8I+sKfLeuXUSng==
X-Received: by 2002:a17:902:d2cf:b0:1a8:1798:11d0 with SMTP id n15-20020a170902d2cf00b001a8179811d0mr13622915plc.18.1682259762294;
        Sun, 23 Apr 2023 07:22:42 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709026b8400b001a51f75ed5fsm5154307plk.242.2023.04.23.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 07:22:42 -0700 (PDT)
Date: Sun, 23 Apr 2023 19:52:37 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] staging: rtl8192e: Remove unused _rtl92e_wx_get_sens
 function
Message-ID: <095f311454f36622211293d862c8c7391b09f476.1682257566.git.yogi.kernel@gmail.com>
References: <cover.1682257566.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682257566.git.yogi.kernel@gmail.com>

After removal of rf_set_sens variable, the _rtl92e_wx_get_sens function
always returns an error code.
This commit removes the unused function and the respective ioctl.

Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>

Changes in v4:
    1. Split changes into patch series per feedback from
       gregkh@linuxfoundation.org

Changes in v3:
    -- None

Changes in v2:
    -- None

Changes in v1:
    -- None
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 06730d3ca6bb..e4a726cd0b31 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -803,15 +803,6 @@ static int _rtl92e_wx_get_retry(struct net_device *dev,
 	return 0;
 }
 
-static int _rtl92e_wx_get_sens(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	return -1;
-}
-
 static int _rtl92e_wx_set_sens(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
@@ -1052,7 +1043,6 @@ static iw_handler r8192_wx_handlers[] = {
 	[IW_IOCTL(SIOCSIWMODE)] = _rtl92e_wx_set_mode,
 	[IW_IOCTL(SIOCGIWMODE)] = _rtl92e_wx_get_mode,
 	[IW_IOCTL(SIOCSIWSENS)] = _rtl92e_wx_set_sens,
-	[IW_IOCTL(SIOCGIWSENS)] = _rtl92e_wx_get_sens,
 	[IW_IOCTL(SIOCGIWRANGE)] = _rtl92e_wx_get_range,
 	[IW_IOCTL(SIOCSIWAP)] = _rtl92e_wx_set_wap,
 	[IW_IOCTL(SIOCGIWAP)] = _rtl92e_wx_get_wap,
-- 
2.34.1

