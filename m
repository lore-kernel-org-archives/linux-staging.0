Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83776168
	for <linux-staging@lists.linux.dev>; Sat, 10 Jul 2021 22:08:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id h18-20020a05600c3512b029020e4ceb9588so11453363wmq.5
        for <linux-staging@lists.linux.dev>; Sat, 10 Jul 2021 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=o8XLWvLfLieNELF1M0DS0d6X+htDnd1bnaWzmXo8vbg=;
        b=I+wR7SgJHOmOJRpJZ8EZDAGde+mW7Sv8Gs19PaFlqzTvnbowhU7mXM35hoMRlj3mec
         cl3+Bj663jqtz8EXw9+uT1gR94cY3uyvQlip0r7faBFuARSmIxhjiYc+SJUFmPuUyM4O
         mFzdkLuzG6Fbio/J4Xm1fMZhTerRN4TVlJQNxZ3AzoJmiuYjR5g72mbRlkvwpahlHWm0
         IG2n2F243ORPZkHUaAuIocAvz7KzgoR2rzVntWpvdDBGht8uFM3JyUnyhZ1tPiQuo8yp
         7LxF1MrLas//Y7iSu/HIQxE8WxDZncB0J7Ie7q4tCVsdnGyORxZPS09nozDMuSZjXdC/
         3BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition;
        bh=o8XLWvLfLieNELF1M0DS0d6X+htDnd1bnaWzmXo8vbg=;
        b=YCqJJpJBgd4XhJzJTXwmDtXq5Rber2uM1bRoXmzJFEJ31dF2LSRNemD6mv7F6gFQM1
         suOT+2/IVs4A61sIGMZYHS4SHMyOe1ta1wWny5ds29ukWP0YpUFGslh4MrHunB6OFeFQ
         1qYNO0bbKoanESe2Ry/3OVj9o2DlQIsdDB1q0YtvXa7ESI/QOJEz5c0CANAnzLMD60cr
         TyHy6iCrrvUs1OnXmk1nQ4MSti0WVLmu2StEqUQIUz8wxoScmp3r7NjgGIhvS7HiSmHo
         ct22j/Jc7tb74pKo7igQhC14bJZHwuHyAz+ktlla/GudIvKNjTaQhlvc0TkOTi2LLXXB
         gJEg==
X-Gm-Message-State: AOAM531t1KYVrgc7cwxUqHY4f0PSfhepdSwvuK9jYgIPd1/wZmI+VMMM
	n3VH1EMXp+lveEC9c8zw83U=
X-Google-Smtp-Source: ABdhPJxq7oGqGgccr5nDua4JzQjAWDF8kGwQbSNjmZkJrDi8QKA0NHu/CFxDtMPdOuTJ+lcDLL6k8A==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr47451939wmp.165.1625954898932;
        Sat, 10 Jul 2021 15:08:18 -0700 (PDT)
Received: from alexlaptop ([102.182.144.99])
        by smtp.gmail.com with ESMTPSA id q19sm15244987wmq.38.2021.07.10.15.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:08:18 -0700 (PDT)
Date: Sun, 11 Jul 2021 00:08:15 +0200
From: Alexander Greyling <alexandergreyling5@gmail.com>
To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Fix alignment
Message-ID: <20210710220815.GA1654486@alexlaptop>
Mail-Followup-To: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the checkpatch.pl issue:

CHECK: Alignment should match open parenthesis.

Signed-off-by: Alexander Greyling <alexandergreyling5@gmail.com>
---
 drivers/staging/rtl8712/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/osdep_service.h b/drivers/staging/rtl8712/osdep_service.h
index e939c4a954b3..d33ddffb7ad9 100644
--- a/drivers/staging/rtl8712/osdep_service.h
+++ b/drivers/staging/rtl8712/osdep_service.h
@@ -46,7 +46,7 @@ struct	__queue	{
 	} while (0)
 
 static inline u32 end_of_queue_search(struct list_head *head,
-		struct list_head *plist)
+				      struct list_head *plist)
 {
 	return (head == plist);
 }
-- 
2.25.1

