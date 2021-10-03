Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ACE3FD1
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 12:15:33 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id r201so8005191pgr.4
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=GISa/5YWim1dL4gwKmc0fTZB94/Tkhhvffj3A4gtCN4=;
        b=YtuExd2hljo/eVPf5MDPEXB9sfmS1N0rJz9fbit3XIyKWwBHvpKC/Mbna6CIZtdAzJ
         loZ55T5I1hqsXuWVEsLOhBXPvAazBQUTe5IxKTm8P/c0ZH+yiyHHUEESz34gcF0Aar+l
         ZwHvdhh9S5qa8QtPFQkhJuM4CAf9Us4wu7udZpCwTrmXgZuo1mXjxuylNKYce01hLkAD
         cQiNw665YcuEI6fFKJY6IL7+cZnGv0FqwABYxo0tV7xEegv2GdqaSsIqhsx4+csxeL7K
         s4f8nXHP3ipC7KGvqaPLezIqfQPIwfquIZNmJTftoI9qhfg2IeaSo2u7X1LBLpZohyYp
         e6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GISa/5YWim1dL4gwKmc0fTZB94/Tkhhvffj3A4gtCN4=;
        b=G/kppCPR7QU/ZgGfsz39t1+TAAQXh0GbQ66n2QtqvOhuqnf5Yh7zVvHJTQzamrAsiX
         3Sg/sxclmtalnSVEGVdvbPLFJdvTIgn8HkxkZIqNBqO7ZNDVw5vfYpdL18l2F9QcOLWn
         SGg944VFlL7CEwFwV0wVZxWCULmBUscl3DmISzWu9gzbVgn/qDqe6dCEDze53MLVCUCw
         2ue1n45wVBlqa/Zl/Kqxbpi6e59ssbyYa6JOPtXJZjGuVJaOUQFKKPYYFvN18pvUAuKE
         PZzluG7/DWden5WBT73zzIlesSsWUUzol20P/DPlm6nqdt6n4akKL3X75PncfkS4bI5g
         /DEg==
X-Gm-Message-State: AOAM531KJn0jPwTmVvdNAsIYbqADJ/UYhCjx9AwulIKu8qb8R3d5sfcS
	khZYGVU1AWY/+fZsBpnSjIQ=
X-Google-Smtp-Source: ABdhPJyZwLdjjb7qfu6aCgCoxk/5yYeqIjvYnhu03K8VaD8JxNm41YGMBAosllXfs9qOQ07497+I6g==
X-Received: by 2002:a05:6a00:c8c:b0:447:bddb:c83 with SMTP id a12-20020a056a000c8c00b00447bddb0c83mr20853105pfv.1.1633263333250;
        Sun, 03 Oct 2021 05:15:33 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id g22sm13519394pfj.15.2021.10.03.05.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 05:15:32 -0700 (PDT)
Date: Sun, 3 Oct 2021 17:45:27 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	nathan@kernel.org, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove duplicate condition check
Message-ID: <YVme3xtnCHN/hOjS@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the same expression (!memcmp(pIE->data, BROADCOM_OUI2, 3))
on both the side of "||" .

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 3d1d8c198e53..8db68cf1e11c 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1271,7 +1271,6 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 				DBG_88E("link to Artheros AP\n");
 				return HT_IOT_PEER_ATHEROS;
 			} else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
-				   (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
 				   (!memcmp(pIE->data, BROADCOM_OUI2, 3))) {
 				DBG_88E("link to Broadcom AP\n");
 				return HT_IOT_PEER_BROADCOM;
--
2.32.0

