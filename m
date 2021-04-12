Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FAB72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 11:21:49 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so8647282pjh.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yFCTQ7PANP8vxmOvU5wLD2Qh5bIpwPlUD14vZ3d3jUE=;
        b=tMH9P9QwjcyO5zX9ktssrTVitZPAiaYYMrggHxfNArDTjcfL4XdY7CPu4PTIQvd8c6
         AHbwi5iSqBFEND1f9GiyiQw/QEK29GviiHFvq+OK90OSqsvWv8qrT1Uh4Qke7Y9GMJ5I
         O4EqzwzV41S88KsvPj8UWk/o6gY/4stw2N5k19qLBLeL4K43oU0qKnAPgbLTDP9LLjFG
         0wCgLhegkGtpPUo4vlkV6BMK5qntqd3wtzEzK88IBlsATFQl/K3MAR3HqYK6vO7RY9OE
         rYBiCVCtiKdSd7dbp8wr4AkYVBBGRLYMW2+opXg0Ge4YDt2lB7dN1zgPLTjj6Gh2GQWh
         /Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yFCTQ7PANP8vxmOvU5wLD2Qh5bIpwPlUD14vZ3d3jUE=;
        b=ENj9JDz+R91yVH7JAr2do6XfrLJ/Y6rghga2MW8tkjmg9tqdiUJcP7qCSIb0+sRa2L
         kLgEh7rQ8FYluHlS6ojO0rrHXT1WeF1Abb7grrBKpkDAjBBz9nBuQdZTRmplYSZp++q9
         92rlD779S7HsdQEvHu/lXlp+dgPXaQOGjyZL4Ul7dLIgoWQrMPgmip8BUYPkrwhdeLHC
         UVCRaTSjs+kLT/43cAJIPtambdJnx3kjWQNjaxk4IzVLlAzCYXtVZUXC6f03zE5fS491
         j+l+UIT0wSibrynFE9Z6RyVfMg9mG8hcuhH6dD1znTF9xWEjg8Vf+N8PEvDHSiTAdYNs
         ztqw==
X-Gm-Message-State: AOAM531tw/4ka7GV0tJB32QGU1iQb7uufZcOlpcXM8pFDAZP9KJh9zw6
	p4taBzusmoQpUTircVUN1KM=
X-Google-Smtp-Source: ABdhPJzb1vNFSs24X1lKcswhqA9q1ByK9t1DDRWeEsUwY+IQZ+b+dgX5Z6RS13ojOUVhpbOEwIibsg==
X-Received: by 2002:a17:90a:bf17:: with SMTP id c23mr18470563pjs.12.1618226509560;
        Mon, 12 Apr 2021 04:21:49 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id o8sm1859156pjh.20.2021.04.12.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 04:21:49 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:51:40 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4 1/3] staging: rtl8192e: remove parentheses around boolean
 expression
Message-ID: <596aa7e6d4e8ce80eaa98519001e17cf9d370f45.1618224838.git.mitaliborkar810@gmail.com>
References: <cover.1618224838.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618224838.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses around '!xyz' boolean expression as '!'
has higher precedance than '||'

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v3:- No changes.
Changes from v2:- Modified subject description. Changes has been made in
v3.
Changes from v1:- Removed unnecessary parentheses around boolean
expression. Changes has been made in v2.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b1fa8e9a4f28..431202927036 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_capab_ele *pCapELE = NULL;
 
-	if ((!posHTCap) || (!pHT)) {
+	if (!posHTCap || !pHT) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTCap and pHTInfo are null\n", __func__);
 		return;
-- 
2.30.2

