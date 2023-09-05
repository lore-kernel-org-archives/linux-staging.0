Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD27E
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 03:47:41 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-76f2843260bso129947185a.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Sep 2023 20:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693885660; x=1694490460; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3kqOBQ4SWwtmqJaVKiTK8RTKEn/bkc8/7Nm3cWOW8M=;
        b=Jyn6bPPBxavQIsFwkoWMImt6lo6kMKBT3N7oRG0Uh/gaHCCmIanDZ1dCvbN1PYaXQP
         l4ViCimLVy5cWfZd1JicUzHvRbZnpBWmcbNNXa8WqhJuv741irUUXdgdsHkg8EiW5al8
         UK5vi+chC7c3Up/c/CAFLRCujBGAR6OEobkYnv02J19/WF6t+NWLUMVzb/WZd36QW6uv
         k/dRVldQnhPzjfGtSq73kgUSwsz6G3rMApmoQQG5XAP5avh7F3XA+6BFGVFJz4yhXivj
         TNglsuyy8rDUKfPmQqviw7uZ+if8kgREpcPrxNf4bh/tyqiSo6kwt2QaiHxubmn8N6WK
         2VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693885660; x=1694490460;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3kqOBQ4SWwtmqJaVKiTK8RTKEn/bkc8/7Nm3cWOW8M=;
        b=dbxDG/5AdF3LIYt3lQt4Dzkt79ptf9GBkPmDS8DwsVEz6n7BRyYKo6ozV0KU9TBml8
         K4ZzRwe7kzyER9TC/Rkqxq60l7TpmeqVVigdvca/Yp+fDvqCtxZYlwx6aa1GINf2A0Gk
         2Bsgl4PxEadI7eiBlYG0Lv2D8o7tEs423F+Gxpsyw1estYlOacnXST+q/ZmKxOTIS7Ec
         CVcc0olT6jDOh62uuhnZqAVFChY1HHd4KOPrS2PcBJvwCYbXxA3D//BdPZrPHJ2b1vDa
         gPWZk5eJvxi810uM8wZ00v/nbvK4+m0YK7lw+B8QYw/M9p5IyKvTSFU+jcUWcJm3nues
         066w==
X-Gm-Message-State: AOJu0Yynv+g6Miz85oYjWY8Di0Ka485zN7SjzsuOMs8Ux69peHUXo+R2
	r6gI7yQf9W6n2Q0XP5MNIB8=
X-Google-Smtp-Source: AGHT+IGDY1gvVPRRgh0SuAQ7QVmCzNsri1r/n/759svhqiET99omlzUAbIV+g5tu9e9ZCWDFMBq4Hw==
X-Received: by 2002:a05:620a:4509:b0:76f:272f:46ad with SMTP id t9-20020a05620a450900b0076f272f46admr14964942qkp.49.1693885660224;
        Mon, 04 Sep 2023 20:47:40 -0700 (PDT)
Received: from midnight ([2001:8003:6434:b000:c30f:d88d:412c:6e9a])
        by smtp.gmail.com with ESMTPSA id d22-20020aa78696000000b00686bf824b3bsm8022513pfo.136.2023.09.04.20.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 20:47:39 -0700 (PDT)
Date: Tue, 5 Sep 2023 13:47:36 +1000
From: Angus Gardner <angusg778@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng
Message-ID: <ZPak2AD8lKfcqEXG@midnight>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unnecessary parentheses identified by checkpatch.pl removed.

Signed-off-by: Angus Gardner <angusg778@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 471bb310176f..948db2433463 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -351,7 +351,7 @@ static int prism2_scan(struct wiphy *wiphy,
 		msg2->bssindex.data = i;
 
 		result = p80211req_dorequest(wlandev, (u8 *)&msg2);
-		if ((result != 0) ||
+		if (result != 0 ||
 		    (msg2->resultcode.data != P80211ENUM_resultcode_success)) {
 			break;
 		}
-- 
2.40.1

