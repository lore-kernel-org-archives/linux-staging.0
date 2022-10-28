Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C846D50E;
	Fri, 28 Oct 2022 18:39:24 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id u6so5553328plq.12;
        Fri, 28 Oct 2022 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ds8fIMyaNA48AptZtnD7lRg8k6tUlPBhxOTWMASKHUs=;
        b=lUEI5WN7vVAo0vJruFg2Ec2nTRmNeG7C630IN0qUPxyNQRHjk0JBpAF5gnfd1IEpn5
         +rT3YPCjISfTgbLpN4UpbGjFzTzK2KsPGhepkTYDrz8iPCu/Sada01cZ0kroNyLiXsqR
         Qor3Zlynf1oZbwN8Lkxr2X9uUODEKHq5dr4f8uRHnQmTL/EfUqOwGLFM8oamFLVo7kmR
         DynpwoxQ8hWCxSCN9xBP2tRmQcqBImZ9Ka6wFE/tkWvyebxTwx5TOVEAS1oYvGNvAGlP
         dKWujbm9NERzYXf4FFkksQl24S4hsi9hEw8h7dvyLhs/AgbrqCKE9V3AkNjQubZMkk8E
         EGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds8fIMyaNA48AptZtnD7lRg8k6tUlPBhxOTWMASKHUs=;
        b=Bcwl23dwL9iYIC+xmWWslWGSSgI5FQNJ+oBaAkISv/H/FNYU7fnuKWuCm/2CN5Stvc
         sPvW8Fgq261EEcuFnAFFma9onmUkeayAXZ7oM8dioTUGRJgot7ttQlOPzjudb2QyFlEy
         OMPGlnLnmhFqvmNX98r6vIRcntkUB2wvBK1qj41PIfGsBFQrlIxc/MQC/cw3ZKVyhuDv
         ja1LmUQtglsQtGvGzdoWUpdIdIInCTcDLB/60ZmTTfHXyBXcPmRecPjSpm80yNuHe86Z
         0IqEr76jtPRR3JISiKQXBIlfQK/PNPV4zNenMj+7L6FgetC769190NHtkG4Zj2AaNoOy
         nLGw==
X-Gm-Message-State: ACrzQf2m5gqduWmOSsZ5vm9d2YSYACMrqfAC/l7VR52DZFsZ7zWRkSEE
	7D1IW2uMesw55AGJVP6XYls=
X-Google-Smtp-Source: AMsMyM4YHS+3+8yTNHdCc+lWtJQfRJfbt7nlOQrZf75uUDtOtq22MUDNdEpjqozqWE/nk5cIyY6e1g==
X-Received: by 2002:a17:903:41c7:b0:182:a32f:4db5 with SMTP id u7-20020a17090341c700b00182a32f4db5mr389153ple.22.1666982363604;
        Fri, 28 Oct 2022 11:39:23 -0700 (PDT)
Received: from marshmallow (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id b12-20020a170903228c00b0018696c5d61esm3418137plh.151.2022.10.28.11.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 11:39:22 -0700 (PDT)
Date: Fri, 28 Oct 2022 11:39:19 -0700
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: replace ternary statement with min_t
 macro
Message-ID: <Y1wh1zYMAbbKSrGB@marshmallow>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ternary statements that pick the min of two values can be replaced by
the macro min_t(). This improves readability, since its quicker to
understand min_t(type, x, y) than x < y ? x : y. Issue found by
coccicheck.

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
Changes in v2:
  - Use min_t() intead of min(). Feedback from Dan Carpenter.
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6aeb169c6ebf..54004f846cf0 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1551,7 +1551,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 		wps_ie = rtw_get_wps_ie(buf, ielen, NULL, &wps_ielen);
 		if (wps_ie && wps_ielen > 0) {
-			padapter->securitypriv.wps_ie_len = wps_ielen < MAX_WPS_IE_LEN ? wps_ielen : MAX_WPS_IE_LEN;
+			padapter->securitypriv.wps_ie_len = min_t(uint, wps_ielen, MAX_WPS_IE_LEN);
 			memcpy(padapter->securitypriv.wps_ie, wps_ie, padapter->securitypriv.wps_ie_len);
 			set_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS);
 		} else {
-- 
2.34.1

