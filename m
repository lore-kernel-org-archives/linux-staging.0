Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D86D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:03 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id w3so32851063ejc.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eyv+iRJLEcjbZd/LhEPn8OpiX7PAY3puKqYKPby0/Lk=;
        b=bzPA/e5rxcRDwYB4W/RKUS7MdXft/jZBjQHvDR4BNbzy2iIfbD4C++piw+mlIe4vCZ
         2Xi434xHZRLkWYl2lTtcA6zRdWHTa6y48dCBmapVWZeC74b9BJR9ixLW2sqI3Pi12IBE
         CVYxRIvN5s4KxplTxNMCG+ajW9+h6wRpDvTKnrZsw5/78mJ4FWmmrMuYrGFV7Giuk+SG
         HbE4y0cA9qoPRB10UP/b4FzikEEHIVRzSkJyPIix4/ZJKeErxLAXYkr4WX4nDa+MPNxA
         y5PQKFBar4Zrfq1aqPm2fquDF2fX+qPZhf1llbXGiNvvKc+apRvVEGEHNNR+xcBp1jyM
         rWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eyv+iRJLEcjbZd/LhEPn8OpiX7PAY3puKqYKPby0/Lk=;
        b=I7YVDWmOADtKILb+n06bPH0emCb1wWPZjrlug5bFNwPW1lm51NmSk4doyiBEjQ2fCB
         WGoZnUiUg7FddRLcYYEk9GXrwbsqsLhodj6AsgZm4RQBlo1erQIOouK/J/8TV0jpBm7P
         aa/33ikpw8c2LW+E589ZdtSEDAALPpu0/dKLEV+012QRzpQ0GFvCABX1r4kpjpB3x2QW
         oGVr9niE6uFe50JxJFEPmwmYFlNQjrb1k1QFHU3XEDwFvm4yqZQNVyAxQCiKsQjddi+v
         ZRzyuezy7v6eoJqjL56mRfjPzFBPo9oIQhRWPS8xwciapSmeyFHbARE/Okut3p+PJsG5
         /9ZQ==
X-Gm-Message-State: AOAM530HlQYgkKtxCHQK91/1ijb2C64enojJZ7tiGOQn9rPUEb3hrWV1
	gUUxIJdB4B+bqDY9TyvWYTlDFxXXzjDAPg==
X-Google-Smtp-Source: ABdhPJzWU45QwP6Lt+RjOuvBVG+9W1IN10pzBUcN2fub7X8rSe7o0vKyauEjD+VDKsua3PTkjKwBgg==
X-Received: by 2002:a17:906:d555:: with SMTP id cr21mr189857ejc.66.1618423921972;
        Wed, 14 Apr 2021 11:12:01 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Shvetsov <andrey.shvetsov@k2l.de>,
	linux-staging@lists.linux.dev
Subject: [PATCH 26/57] staging: most: net: Fix some kernel-doc formatting issues
Date: Wed, 14 Apr 2021 19:10:58 +0100
Message-Id: <20210414181129.1628598-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/most/net/net.c:548: warning: Function parameter or member 'iface' not described in 'on_netinfo'
 drivers/staging/most/net/net.c:548: warning: Function parameter or member 'link_stat' not described in 'on_netinfo'
 drivers/staging/most/net/net.c:548: warning: Function parameter or member 'mac_addr' not described in 'on_netinfo'

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Shvetsov <andrey.shvetsov@k2l.de>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/most/net/net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index f125bb6da406f..a5fd14246046e 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -539,9 +539,9 @@ static void __exit most_net_exit(void)
 
 /**
  * on_netinfo - callback for HDM to be informed about HW's MAC
- * @param iface - most interface instance
- * @param link_stat - link status
- * @param mac_addr - MAC address
+ * @iface: most interface instance
+ * @link_stat: link status
+ * @mac_addr: MAC address
  */
 static void on_netinfo(struct most_interface *iface,
 		       unsigned char link_stat, unsigned char *mac_addr)
-- 
2.27.0

