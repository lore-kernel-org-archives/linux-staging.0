Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680957B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 12:14:07 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so12472138pjg.4
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 04:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678536847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX8RTWxAvabifNZUJPcnMcGrQjU2yF4SQkpqYulWMxQ=;
        b=eTcWRfPFyNbSMnYem0fedkyahVUensaFgbBczmh4gAsbNrYdqFM3crhFTWlQYM9Rgd
         Za+fKez1N8bY6M3hzRZMZ7jYF7qpfLIRBYBdy5xVs/Sh3OljHvxh5qjfuUOnDCQOjVxy
         DJdp+1gygvkkvftRzCqvZMhqkrYnWlbRRLMMAQGT76nrloM17YBnQKcDyvFQ9v6IJhhh
         NLNg/kLtswDJRykHlhjxg28SrGkGgV06gQ7orDU9lDt3K122b+fNXLa4609AGFGLwPh5
         KdI6d/SMU08iqZCb/oFGpZC4CdH31zgkzIj4jjXS6CWnx5THXZUvJXY74QAnJM3094QX
         tDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678536847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX8RTWxAvabifNZUJPcnMcGrQjU2yF4SQkpqYulWMxQ=;
        b=Cua586OVBoooho+N0HkWII3U5b1K1lv4Uf0i6Y2xb6aryhfUrkuubPRH+/xKmVCbNV
         uUUhWW7r5pXR3qlzbs69KZZFhLayuQCWbcqHxjcRY3+RwOI7vzlTVS7e2eyi+dP47+zg
         ivjXfIlStMAcYmNyLYpjzrACfzl20NUYOSfDS9F+8HoUo3Sqrp5Algl9/ge9JRHJ3GyJ
         j/NETollIN88RBo8lrEIj3w60UBBlDB2H6fYi1PvNSmFZM/9dvM3tjIbtud3/Fb/p5MF
         I/sKc/DIL3hIaFnn69jWDyxUc4JVV0NoW0bFJ68Mn7dPZJghVcPm3RZrJSGYeGoGp/3X
         Fqsg==
X-Gm-Message-State: AO0yUKXLmDCBONPxlhj4pO0x7W3ivpxlsABl0J8o+IpnjUGVIVVe/oux
	XIb6tTdt9EZORV9ka3KcSNk=
X-Google-Smtp-Source: AK7set8EfJwKgUbIa+rLeBsopuhdW5Hl1fyjiudJ31IVEqixczK8YIpJdslbjgaeE/wEtsw0pPW7rQ==
X-Received: by 2002:a05:6a20:394c:b0:d0:61ff:8534 with SMTP id r12-20020a056a20394c00b000d061ff8534mr16284913pzg.1.1678536846718;
        Sat, 11 Mar 2023 04:14:06 -0800 (PST)
Received: from craechal ([20.230.228.239])
        by smtp.gmail.com with ESMTPSA id u20-20020aa78494000000b005d3399efd80sm1363555pfn.136.2023.03.11.04.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 04:14:06 -0800 (PST)
Received: by craechal (Postfix, from userid 1000)
	id A7EBCC62; Sat, 11 Mar 2023 12:14:05 +0000 (UTC)
From: Archana <craechal@gmail.com>
To: gregkh@linuxfoundation.org,
	drv@mailo.com,
	linux-staging@lists.linux.dev,
	error27@gmail.com
Cc: Archana <craechal@gmail.com>
Subject: [PATCH v2 1/2] staging: wlan-ng: small cleanup in writeimage()
Date: Sat, 11 Mar 2023 12:12:52 +0000
Message-Id: <20230311121253.10225-1-craechal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZAwwRnthlPFta9oL@kroah.com>
References: <ZAwwRnthlPFta9oL@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is cleaner to use "goto free_result;" as is being followed
in rest of the implementation of writeimage function, and
remove unnecessary kfree statements.

Signed-off-by: Archana <craechal@gmail.com>
---
Changes in v2:
  - Make the commit message more clearer.

 drivers/staging/wlan-ng/prism2fw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 02a2191d5c4d..98ed9bb9192c 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -1008,12 +1008,11 @@ static int writeimage(struct wlandevice *wlandev, struct imgchunk *fchunk,
 	rstmsg = kzalloc(sizeof(*rstmsg), GFP_KERNEL);
 	rwrmsg = kzalloc(sizeof(*rwrmsg), GFP_KERNEL);
 	if (!rstmsg || !rwrmsg) {
-		kfree(rstmsg);
-		kfree(rwrmsg);
 		netdev_err(wlandev->netdev,
 			   "%s: no memory for firmware download, aborting download\n",
 			   __func__);
-		return -ENOMEM;
+		result = -ENOMEM;
+		goto free_result;
 	}
 
 	/* Initialize the messages */
-- 
2.34.1

