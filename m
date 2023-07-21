Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3A363
	for <linux-staging@lists.linux.dev>; Fri, 21 Jul 2023 02:06:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso2320627e87.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Jul 2023 19:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689905159; x=1690509959;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WpuRuD44V8tB1Z4DhstXdLxqQiDb9Sg+pb4Wlm/ll4=;
        b=rYb8gxiTQeC9GCW8j+UryB8sw0O51zGtvLmECHiHtO8Lt1YLTCTCiK6CRbTxot14Ha
         y6JsEDJgqyu/szBtAkJk0oUkY+cl4vRHche8UeyIEs8bPxa4ErYdKC5TkYgUpKlYMuAP
         clBtJHchLeh0HmYblzw6oxlGmiOc8zGy2lUsMBP57jEvvX0jzxEJ77E/Wk9D3dMWN2eA
         NNjf2bp5LoSkkF+t3aZEQjPVsCoKxxUlsViu23yZI/pNjnL7jIyn6iGc3j9mqYxnWN/L
         T1b4BtmQEH+uXFMsx76iu38lBVXbiGAU0iKiuUcaYZAbyq+Ge/DIDJonKoRQ+6qVQriG
         BdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689905159; x=1690509959;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WpuRuD44V8tB1Z4DhstXdLxqQiDb9Sg+pb4Wlm/ll4=;
        b=kOOCtVsdC++1chsz+J6RwtbsDZ4Kh7VpH0RUg7/9PJLxWaF/tOnffz7fHWmwJ9tvka
         3Pl+EDOMaPcnkdjrXwM4V5lYjlpKfrDH9xEyUmOfgi6lnqPj4ZHcmjg/Owvs5HVqt8C5
         snsoLIjPTx9sqhYb2+3t9kwRLt2mkdcZz2Tx5nrZ41xVvZE+p6p/YVY5ANt1BDaQ0x4M
         CiTXia7sfklStKeuc86vRc4ndIKqNkCqCY3y3QdbeicOO+HC14f52e8hK/Wy+M6VOyd+
         13yMZfAubYfuEac9cwSbGIMRWtIbukRNgA8smEtkXq1DVqCaFW0u5OoDXFn6ImnDF9re
         /hmQ==
X-Gm-Message-State: ABy/qLZ33FUdP2wMQMsKCJZfkDvD7EPsF3XYkbMm528RZDhrK1o3bKX9
	yL+xFRJs1LK0D8VVsIF+YrY=
X-Google-Smtp-Source: APBJJlHfjc2XWbQeOKHUOQzcP41EPdkwde+4BfJSFeygyfhhgi+IAPaLoPaPyPdWBR1S0sEhzbYfNQ==
X-Received: by 2002:a19:770a:0:b0:4f5:a181:97b8 with SMTP id s10-20020a19770a000000b004f5a18197b8mr275838lfc.25.1689905159139;
        Thu, 20 Jul 2023 19:05:59 -0700 (PDT)
Received: from terra ([46.0.16.157])
        by smtp.gmail.com with ESMTPSA id q4-20020ac25284000000b004fb75943aa0sm475924lfm.196.2023.07.20.19.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 19:05:58 -0700 (PDT)
Date: Fri, 21 Jul 2023 06:05:57 +0400
From: Sergey Rozhnov <rozhnov.sergey.89@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Remove redundant braces in if statements
Message-ID: <ZLnoBYlsTiLixTah@terra>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Extract masked value to improve readability, apply fix suggested by checkpatch.
---
 drivers/staging/rtl8712/ieee80211.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/ieee80211.c b/drivers/staging/rtl8712/ieee80211.c
index 7d8f1a29d18a..fe53453ab9a7 100644
--- a/drivers/staging/rtl8712/ieee80211.c
+++ b/drivers/staging/rtl8712/ieee80211.c
@@ -63,8 +63,9 @@ uint r8712_is_cckrates_included(u8 *rate)
 	u32 i = 0;
 
 	while (rate[i] != 0) {
-		if ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
-		    (((rate[i]) & 0x7f) == 11) || (((rate[i]) & 0x7f) == 22))
+		u8 val = rate[i] & 0x7f;
+
+		if (val == 2 || val == 4 || val == 11 || val == 22)
 			return true;
 		i++;
 	}
-- 
2.40.1

