Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEDB173
	for <linux-staging@lists.linux.dev>; Sat, 25 Dec 2021 17:35:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id bm14so44721071edb.5
        for <linux-staging@lists.linux.dev>; Sat, 25 Dec 2021 09:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YgTnPIC9YP7wdodBdY0fSo9j7jZM6/evdbFzplwCYO0=;
        b=genMatVYTiM84x5h3vOTjUgU3vXcIy8B17eW2WodptBO5iex7nBrazzcfUuK+p+r2H
         PPs0xI/tZCm7uUehlhsuWpYSP1dzPZr3EANIoodRd8ZG6HDohYu+cZeFLqoKdXRi8IS8
         wyA1nCpVgOlG5MC421Uxxjp1J5iOmPfksENNYS2HHnbPrkXT2C7clO7aUNr+p/27a6lI
         7HpopZnrUvlCW/c1lrlHKg6L1Hv9EH7B/ALnL2YTeTf4PXWp1SAI/9I9jOmF/n8MFgfa
         SbzOkno7Y932J5tm2v4QbeWXS+cBqaPD9AqQe93DyiN2AT6BQ/wR5TsBpZ9Kn2rvTQF1
         YP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YgTnPIC9YP7wdodBdY0fSo9j7jZM6/evdbFzplwCYO0=;
        b=FnH5y8RtwIbimCxr8PIWiy4hryHNkPGrQaKYV2+sEyrH+kFQIgUCEkDuwqz16wjEya
         F00uRmLnhCm4ALw1MS5jIfkdeuNOqV7NiITL1t7bztqsiDln0YAAW/8PpAqQEcMEmC4/
         XZtvdqCfillMlDnAA6ofR1YFLmTy1TXShQhs6rVp92Yry+uX663kvJwnk4FlXyNPO111
         A35zfWshE01+Ixb68W/KAg9Xf3CarLGbNJ9G+7n1ZBIsjyFtx9nYzCdFPQ5pG5U2Pk9F
         xE0xEd/yC1Fj2pB2oOjT6T3CMsnaUCFgQKWKTKXHEa6WvMpZH5BdaihlyCw82x84Ir/q
         jaTg==
X-Gm-Message-State: AOAM533+v93s/qKcxnYmmE5Cd6NulBRKMAxTwZ1nlfBud83VQzgJkmET
	cVHZ6C8+34xPbyPqE7oY38A=
X-Google-Smtp-Source: ABdhPJy7+K89Yfy2APO+P/Soru9MTPkun8qF5b+pJCTKsObTEow/pIRzpUnqiJXunbDcTa/4ut+p0w==
X-Received: by 2002:a05:6402:5112:: with SMTP id m18mr6085207edd.191.1640453704659;
        Sat, 25 Dec 2021 09:35:04 -0800 (PST)
Received: from tom-desktop.station (net-93-71-218-227.cust.vodafonedsl.it. [93.71.218.227])
        by smtp.gmail.com with ESMTPSA id j5sm3596102ejo.177.2021.12.25.09.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Dec 2021 09:35:03 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	linuxfancy@googlegroups.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: drop off byRxMode var in device.h
Date: Sat, 25 Dec 2021 18:34:57 +0100
Message-Id: <20211225173500.5459-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop off unused variable byRxMode in device.h

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v1:
 - Remove trailing whitespace in changelog as suggested by gregkh

Changes since v2:
 - Fix commit body as suggested by gregkh

 drivers/staging/vt6655/device.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 4706bde1ec1d..84b1dcf80e47 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -128,8 +128,6 @@ struct vnt_private {
 	u32                         memaddr;
 	u32                         ioaddr;
 
-	unsigned char byRxMode;
-
 	spinlock_t                  lock;
 
 	volatile int                iTDUsed[TYPE_MAXTD];
-- 
2.25.1

