Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE81FC4
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 12:44:40 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c18so17922939ple.11
        for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680180279;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJN/Czq4gYPwe47Url11H0QkQkrvpH2S48xhzpmgh0M=;
        b=oy5EPRj7onZ8lPl0E69pmc+/2Uz97BuS1LCeUF7gZ1LO/8fpZHrSwz16g8MGaTDpSj
         Dl56Ra9ROguJqNVmAjQDe6O9zjnbwmbX/A3QG8rDtarWRjxfS0qqaoNYOEoB4zdBsDN/
         FijyOjXyNP54KM80KU8bqYmLUiYrdUGCCopX0LQQwTJD0/lqHM0SlHqOkFk+1GfeUPyr
         ftywNTHAHXUwTFAeGFEzjYyUri0ztYctsl3QnUUA0M961JvK3DMK9WraBz1LDS+gWZ0d
         UiX3JHRkLCiLBjQO1yt9Z+16WAEkZn8L3C9CFKA/gcEmlTDdsWrYgI/wz2xmf+jgJ+Jl
         eRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680180279;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJN/Czq4gYPwe47Url11H0QkQkrvpH2S48xhzpmgh0M=;
        b=0TPOmbw4y/y0idF4SQJ+vmIIMw0v05e+9VN14U5gCanxtLrxnzV/Uy5GEqF2F7t/r9
         PjfP2BlfMqPvVMDIaxeUmBBisLcACWiaMSoe7qX4BF0pb6LlLdzxVt2VKR2jiQOhEmMR
         EgTnpgD/ES7idjUl4ZYG4DO4avf03vwdSx3/Ib8nuX6/6ruZOUPcmdmDYXwk38/SmMp+
         pSvTFuAcNUaLqu1TDSYzdvZhN/hrA1piRBkP5VPNkrc+gAXpDYXixw2yxKuYnbRj1f8g
         ioSk1YK5DEhmoRRlu4xTucW4O29x3yC2xLJ9if+8rIwcyuyhn8N39UgZbEtNzcUyPUfe
         3SRA==
X-Gm-Message-State: AAQBX9etxJ+xtWrhf9AQEhNI++x8WpzylWEW/4J2HZpp15h+AQ+A0mbT
	46oD6DPKIh/ObN18eqEla1Y=
X-Google-Smtp-Source: AKy350bNVzDzsIHREfK/YfG42x10isYhyaN4ls1usD7rcr0b9VfFVeS9y/mCLbOmrUi/GbjY1WYWJA==
X-Received: by 2002:a17:90a:86c3:b0:231:248c:6ac4 with SMTP id y3-20020a17090a86c300b00231248c6ac4mr25441511pjv.7.1680180279387;
        Thu, 30 Mar 2023 05:44:39 -0700 (PDT)
Received: from joel-ubuntu-desktop ([2407:4d00:2c02:823f:14a7:49e0:2d87:e0ad])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090ad90300b002405499b729sm3158613pjv.38.2023.03.30.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:44:38 -0700 (PDT)
Received: by joel-ubuntu-desktop (sSMTP sendmail emulation); Thu, 30 Mar 2023 20:44:35 +0800
Date: Thu, 30 Mar 2023 20:44:35 +0800
From: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
To: driverdev-devel@linuxdriverproject.org, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Subject: [PATCH] staging: ks7010: remove unnecesary parentheses
Message-ID: <ZCWEM7DCDUEOzBe9@joel-ubuntu-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove parentheses not needed in if statement

Signed-off-by: Joel Camilo Chang Gonzalez <jcchangg3@gmail.com>
---
 drivers/staging/ks7010/ks_hostif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index af3825578d85..8bded7e88ce7 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -129,7 +129,7 @@ int get_current_ap(struct ks_wlan_private *priv, struct link_ap_info *ap_info)
 	size = (ap_info->rsn.size <= RSN_IE_BODY_MAX) ?
 		ap_info->rsn.size : RSN_IE_BODY_MAX;
 	if ((ap_info->rsn_mode & RSN_MODE_WPA2) &&
-	    (priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2)) {
+	    priv->wpa.version == IW_AUTH_WPA_VERSION_WPA2) {
 		ap->rsn_ie.id = RSN_INFO_ELEM_ID;
 		ap->rsn_ie.size = size;
 		memcpy(ap->rsn_ie.body, ap_info->rsn.body, size);
-- 
2.37.2

