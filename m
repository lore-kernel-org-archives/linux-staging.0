Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBB670
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:53 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id 14so1077363wrz.12
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5m2MQYa7fOtBOi3k70jxTZgCgp/ParpQbAIZnehua/g=;
        b=IMtYLdDWhJZQq/hyr2P2Ut3hjz3VArux2cL43lV7XCUmTsPTBMxPM2oOetxC2c+iVd
         ZrY+WM5SqbiCFp87x/LJNEihWQk3xZIxgDIMQ6NkHtZUun4a/j4kf8SIVFdTr9ePC6xO
         W15/u7ViQ3Rd/gsCRdWF8nqS7evxW9lRR435/dPzJHB/3Q7FuYlgzdIwHEiHFsuWq6Jc
         JDYD6PShITHJLvr0tsD3P3p63Oq5xxsUMVRQCNq7VMYzWb/JMUZnrQlCX2CqDSAhUPU7
         e46CSA6ZpKOiQX2RY3ElSMEtphsiYtFt4UHXj3tTWa2godKmPAiPhxNJuTWbKMamiFkC
         GZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5m2MQYa7fOtBOi3k70jxTZgCgp/ParpQbAIZnehua/g=;
        b=gxVXjriAwXLuOifnDXWK+QStK8e2jdHOLDongikoD23UVlvIG92jJYqhL6wLaj+Phr
         2zXLjuxDifHBFwm2xw+pGNbQf1JnPOSduNseBsvvfvumdf4RmEutKpxw7TreMLrCk2aF
         4Bi5MXC1lMysoNkUKkFhUAm6W0ZXx7Ciw2HRH14RNM+YOtjaeBxGtwSUDhh5HBYLfBYV
         VXAlv4XJe2i/Joskziisz+wI4RPk0ouDTWT7njFAHIotqrMPtTvmZF5NWaiDfJpe/+wW
         Ib/4tagXkcpDLDXJYo+/auyf96q72Jv62EX+dgX96pf1I9GXmw+VooxZrEg9y2TGqg4K
         WNVg==
X-Gm-Message-State: AOAM531Bmjc2PH4+81GzW8zvcLlpBzoCMZB+g2kcjcq+5clFk/qfZc44
	jIXLrNzSgs1njbWmf0s3Q7c=
X-Google-Smtp-Source: ABdhPJw9NARlAFcqNoqFngJ89kTem9VYP73kcqLNiKHeyEc1vDQZA249CyGVrmH6YO4Qk93nudDGTw==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr3264525wrt.133.1616589891986;
        Wed, 24 Mar 2021 05:44:51 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:51 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 05/33] Staging: rtl8723bs: remove named enums in rtw_recv.h
Date: Wed, 24 Mar 2021 13:44:28 +0100
Message-Id: <20210324124456.25221-6-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum name in
include/rtw_recv.h:

	enum rx_packet_type

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 2709c9413dbc..d007f90d02c3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -349,7 +349,7 @@ union recv_frame {
 
 };
 
-enum rx_packet_type {
+enum {
 	NORMAL_RX,/* Normal rx packet */
 	TX_REPORT1,/* CCX */
 	TX_REPORT2,/* TX RPT */
-- 
2.30.2

