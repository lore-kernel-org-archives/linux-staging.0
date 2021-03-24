Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B570
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:51 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c8so11400680wrq.11
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BDMbhFEFTK5rwgbnj/l07FVScYcbA+pw8JikRumiP8A=;
        b=eIX8urfYl2n1CVhWJ0wyKPcpOvYalUN9XzoeWRWS95xTMpDYjZs8t7o0hFOBsjd0oA
         VH8w0TXS5scRThpnT3Mu3QiD0dtTBzRB+yVnCnvfaUvyw6zdXy/4kG6AhQDIxjqVTTGz
         mJSzeH7kukz9QnDV90PIO5uK6ry/KSwasj0+QlawLgwQWPGHkBBPrMKWFA/1NuWPXciy
         Z5I82H/YqFOXnMMPTAB5cH1HOmZnxkC5XdnMeHCIS8FTQb0Op2bHWTeBydf/kbT7GGbk
         k6suojSz5PTrf7mq3vil4vMKcHQ5MQBAvY7x3EMj81ICvgaCWFiZMRJTE8vziv/BhJmn
         vXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BDMbhFEFTK5rwgbnj/l07FVScYcbA+pw8JikRumiP8A=;
        b=BRh90R7W/8kKeJi9k/6GY6jFXT6+48aTXw6vjLKmgNPoULsHp0SySuIgku/7f93HzI
         6AcJ97MMG6V4/Hyyz6lhivRA1C3wY2ssQODFUnJQk1Sib4HvR12ap1xdF/CwTHNM9ycm
         /6IINIy2Z0Yey4uBfPdFiqlf8mRqH/JLXtU6oZzoa1F2KlKAXoYgHKs7PTE31USu1UWO
         0tRip0Zuq6PFDGz/8tEj88r35r900IITZipy3HGVsQhxrsowVLnWY6siqE2ComBi5z7c
         dHh9yh4Ybvx5WbXzXHmOMyLAZUH81UeMbNmB/6eSdIu6hQ+MIvw7CfZBr+H3gzSHoMfA
         tDgQ==
X-Gm-Message-State: AOAM530SmGZNixpZcRtfvoam56gUl0NRn2GbtYwuLn0W6Rfz7baRxIID
	mkxjX7/Kr+4wOCXfOjSM3b4=
X-Google-Smtp-Source: ABdhPJzO39iFULZvubgX3vWm9NppsBqhOIfFdV92w8ioOifo+u51Tb7n9h6myDiIP4hvFkbh8S/Kyg==
X-Received: by 2002:a05:6000:2af:: with SMTP id l15mr3327601wry.387.1616589890136;
        Wed, 24 Mar 2021 05:44:50 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:49 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 03/33] Staging: rtl8723bs: remove named enums in rtw_eeprom.h
Date: Wed, 24 Mar 2021 13:44:26 +0100
Message-Id: <20210324124456.25221-4-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum name
include/rtw_eeprom.h:

	enum rt_customer_id

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_eeprom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_eeprom.h b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
index da7f14aadaa0..9b84105af816 100644
--- a/drivers/staging/rtl8723bs/include/rtw_eeprom.h
+++ b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
@@ -42,7 +42,7 @@
 /*  Besides, CustomerID of registry has precedence of that of EEPROM. */
 /*  defined below. 060703, by rcnjko. */
 /*  */
-enum rt_customer_id {
+enum {
 	RT_CID_DEFAULT = 0,
 	RT_CID_8187_ALPHA0 = 1,
 	RT_CID_8187_SERCOMM_PS = 2,
-- 
2.30.2

