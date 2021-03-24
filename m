Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FFF71
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v11so24290839wro.7
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwInxrmBjauHKgFMKl6cGvynGthoUXNpQgoA6tTwGSM=;
        b=cA0jXN7iLYF/2mElheZ6NGi0EbTx6rn4ITtH6WnivRy8uD4oc3RKb/jl1zDyAipJQm
         Hg+l2L1Tc86c+jOmMDyuIbrE140P49Mp+xHHB9mCkYhqr63WCatNeGG1oNAXLaG7nPcA
         th7XHsqSu6RF8eFKYWSWbnXBzlEMmy0Oo+tPOJG5mbFhaedqI6mfhGqrvnitXld1ndEA
         FlXKG7k2MpxgpP9LolA+EfdILOinK15Ztk3x9BgC6aR3QnEJUbWbOX0ACJTK4BQgNa3H
         cLgAKFPjhLyMwXYdPlkSk5i16Bqw9vUmwlM48jcdpBqeYLN8jTwC2f/jpErDx5c9crz+
         +0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwInxrmBjauHKgFMKl6cGvynGthoUXNpQgoA6tTwGSM=;
        b=iAHVmVq/yCkU7Hwexub7FdRTcBWhLBa/6+C/0s/Qi00sotwK69vuEFFiQaDRs5Bez2
         SRawzdBUhkMN5IPLO35zhcf11N+elrFyPCWCvXWWSRcsIPoeWUU6bBhnPuY6oNzuP3VZ
         NxLVUJRHW/nbRSXg1EKl3+X6+T46avrvJrzM0zUjjroPzQyuSSmey4gQwKQiNfn89NY4
         7mvK9HpJAp9Uk4s/tRCmrjlHMfiyDwbefa+2ltD2ziN0WrTHvSTtfBpH0X+yPpS/TR++
         O1ULiXjEBAueKteMUT2bnxsUsNh2J3WlOWSqMoIzSxmVBuJRYpY0w2B57jaWquRPPsCh
         UrHw==
X-Gm-Message-State: AOAM532+ydsic01hj1DTxfBD1+oXT6ANemEm+NqVHxnOFj5DQDqYD+CR
	Sn437/pGCVQrtc49jtkadQ8=
X-Google-Smtp-Source: ABdhPJxf2Rk6kFuVnSrQIoBe5NB3P7F1R/k46btYuvPr48/0ouaZndd7CEHF9e/CgMg9JrRB6/y7Ng==
X-Received: by 2002:a5d:664e:: with SMTP id f14mr3475803wrw.382.1616589907975;
        Wed, 24 Mar 2021 05:45:07 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:07 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 23/33] Staging: rtl8723bs: remove named enums in hal_com_phycfg.h
Date: Wed, 24 Mar 2021 13:44:46 +0100
Message-Id: <20210324124456.25221-24-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names in
include/hal_com_phycfg.h:

	enum rf_tx_num
	enum _regulation_txpwr_lmt

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index 51eef4d5c861..73f6cadb5c79 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -25,7 +25,7 @@ enum rate_section {
 	VHT_4SSMCS0_4SSMCS9,
 };
 
-enum rf_tx_num {
+enum {
 	RF_1TX = 0,
 	RF_2TX,
 	RF_3TX,
@@ -36,7 +36,7 @@ enum rf_tx_num {
 
 #define MAX_POWER_INDEX			0x3F
 
-enum _regulation_txpwr_lmt {
+enum {
 	TXPWR_LMT_FCC = 0,
 	TXPWR_LMT_MKK,
 	TXPWR_LMT_ETSI,
-- 
2.30.2

