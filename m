Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A922CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:32 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c71so8910362edf.6
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5pSW3hRcrV+Z6wh6HvDd1CC/dQnx1u7CDbyFU+eKxg8=;
        b=cG8EPtNJR3zq9Q5ac5occ4Sj0VhjDWietYW0eAveMd9pcTiOiLLyVdusPifc7lfSGK
         pMksCycMoebv/254W4Hmc7QGNxDAZhZBw6NFjr85VpmliTkr+hzy3cAciFDmQClneJhB
         hVdmIJSalshJTe7+OpsMHJEmzQn1ua0UUvQYfwCWk7x+agkvIsaUfhq1ZEJOZ3DjmpwS
         Y6cVDboQRw+1nBrwBTWufAWu0t5vfzfniz+ROLRM7kazRW7IL74zR6Tha3R5sHaap/iZ
         fad89LrfUqEUups957JHSOI2ohQe1WCTuBGVYSGeDBQ/+dr7/0fybkVsnIyQrtJPTtaC
         xaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5pSW3hRcrV+Z6wh6HvDd1CC/dQnx1u7CDbyFU+eKxg8=;
        b=dnGef4Qwxd9ZsGMUGFRtObO1URmy2NnZezR+LOaK1oYl4MMMZXi004yl8o2y2StuOs
         9s6A1lJk5x+Ez56BN4A1cLYTEe5Tulty0rf+xSxsm/dEjnwYn39hwIc93EDWHY1PJ3xu
         17S/NsqYyHjNZyJLuqjGhF8iJGo2kdVPfhC0pZwk8A4fjuAIk4Q3npnnyUQa8ukekPeq
         l0zV5lelhVEQQDiZ6uwVt069hy45q5YEIO/HOyFJytzZsvMtr9gQnaUN1iOLaQXCJ/kg
         TvCDfh19BjbosMUTcEop43ZiSK4otiseaqpCQGC2a2JrbuHernSZWyZj0++meCVeGzaN
         1DDQ==
X-Gm-Message-State: AOAM531/KAnb0XdnCTvrV/6GfK8B6QYApGvKRxZTvjZim39tK1RRfBWV
	6e0KzBbntcQjTK+9h65a0T8=
X-Google-Smtp-Source: ABdhPJysidbNQdigLEzlx5bk5+x0+6fMl9r6hSyG/83UMW5DDTXR5S12lPkmbu/PfQGyRVNOSv+8ZQ==
X-Received: by 2002:a05:6402:50cf:: with SMTP id h15mr62340897edb.177.1641551790607;
        Fri, 07 Jan 2022 02:36:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:30 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/19] staging: r8188eu: release_firmware is not called if allocation fails
Date: Fri,  7 Jan 2022 11:36:04 +0100
Message-Id: <20220107103620.15648-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107103620.15648-1-straube.linux@gmail.com>
References: <20220107103620.15648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function load_firmware() release_firmware() is not called if the
allocation of pFirmware->szFwBuffer fails or if fw->size is greater
than FW_8188E_SIZE.

Move the call to release_firmware() to the exit label at the end of
the function to fix this.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index dc41682fd8d6..cfafbb6c42f7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -538,10 +538,10 @@ static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
 	}
 	memcpy(pFirmware->szFwBuffer, fw->data, fw->size);
 	pFirmware->ulFwLength = fw->size;
-	release_firmware(fw);
 	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", pFirmware->ulFwLength);
 
 Exit:
+	release_firmware(fw);
 	return rtStatus;
 }
 
-- 
2.34.1

