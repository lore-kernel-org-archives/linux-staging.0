Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F002570
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 20:45:04 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x7so3471190wrw.10
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 13:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=I2uf88F1MX0D+/ieSTh4Dwgs5iH5yDVfXlgdaFvgyLY=;
        b=iLQaYA9ii9lu78nfawnJ1j3EnThTkKbwXfmYWnlD+/U7jNg54IkiZ2oafwoqsiPQmB
         bXDztdUBIbPdz5o99zGzRw2KZg9vbtjRnPgftRp7TxyTz68PKMUmaVXcESMvNVgZ3ZmZ
         HG8DIPq7a0/4u8whVHwTVPV9uWHiPbjXlVwmhL73FaQrNIl/ewoMrsl97+Whcye4jTHt
         VN0tFRDETneCHToNWF+aw74HYgtgTuVOTcnkgetKzSSygR8nGdp19G2somF84BBIG8/I
         wgv8MqKba/7QQcLvTD2aPcE9UkePb1cmOJ/E/qdNatzSXo01WtcE2A2O4nUHAXSRNUZW
         3odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=I2uf88F1MX0D+/ieSTh4Dwgs5iH5yDVfXlgdaFvgyLY=;
        b=aC55Sk+jhX+UxwBSoiwJH9HtsJM6gEwuPydNu0DEO1N9P1BvETNpKZhcDjw/s9hJ43
         eE3As5aLVyDTBod6BRUBofvmPwU0VOioezutnYhy/WothLVzMukDzOjSxdxb3s5toaow
         /I53UC69Ce4X/gk/rdiR7jHSfNHIDp02gNouuvMWN2ScaHGGbzGQLIb66sMjPr4MQhqP
         nHtEFTlcWPE+5T2qGg8RSKiVtLV04F++tMZq+fxU5dCssmlrh9HXXp5V8FFGN6HVh/wk
         TK8yCoStoX1SOcbH+Sp8/FvrszMggsKlKyHSsJaVLDBAebp7kgjPZ1RzIAaLbyqBgnWI
         usVg==
X-Gm-Message-State: AOAM531rxO2zx03pjU9EhJNN3m5nDt4JG7pa+VvkH+Relt1wA/uIh7pY
	oPkY/HA+nHrdLiKVqTyuEUE=
X-Google-Smtp-Source: ABdhPJz9eH5hl3abnAet2ReLpQ9AF0Zt0z0vKdm5nhpwAuyLX7xec5aYXlictvG+iAmXJIvosyDaWg==
X-Received: by 2002:a5d:4686:: with SMTP id u6mr14043266wrq.60.1617914703550;
        Thu, 08 Apr 2021 13:45:03 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id w9sm519597wmg.21.2021.04.08.13.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:45:03 -0700 (PDT)
Date: Fri, 9 Apr 2021 01:44:57 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Cc: musamaanjum@gmail.com, kernel-janitors@vger.kernel.org,
	colin.king@canonical.com, dan.carpenter@oracle.com
Subject: [PATCH] staging: rtl8723bs: Remove unnecessary code
Message-ID: <20210408204457.GA3079308@LEGION>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The same code is executed when the condition "!show_errors" is true or
false. Remove the if condition from here. The original intension of this
condition was to not to report any error logs if condition was true. But
this driver doesn't has those logs added. So this if condition can be
removed.

Addresses-Coverity: ("Same code execution")
Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 1b60252545b3..2af66a18200d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1000,8 +1000,6 @@ enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
 			break;
 		default:
 			unknown++;
-			if (!show_errors)
-				break;
 			break;
 		}
 
-- 
2.25.1

