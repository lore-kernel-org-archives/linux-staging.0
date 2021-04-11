Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0D770
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 19:46:16 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d124so7753119pfa.13
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ok7lysEHXRexS0y6XA+d9qp+BmlU7q6Xo4kMGxuikak=;
        b=lBJKRMJsZ6pfpN5zQnZutcwGBALnLihAJTTbHsEPrQa+VKOY5tO/XXmcFQXC4o2mSc
         ts0Z5jN3QK6VCje8DAc9B26ELAlZAgYyj6Fd+QQiS2yM/gYfDrjJpje84C80MtCanTPl
         8jtB7K+sW1UbPXgpmVik2h7134jhlsIuesIcosQ5rq9GK93+BjPGHpDyaCA3ON7/qOSr
         j9xg6rCsoiXcuLtqmr751dcNY6o/efoJzELbHTa5wD8hC+MBl9BAz+Sl0942+8cl1lSG
         nBZu0XcUAlaN+6ZjvBhNzPUphnMzceDIlp2QG60A/zdPNK9lcUycDVl3BbPHQE58Cbma
         8inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ok7lysEHXRexS0y6XA+d9qp+BmlU7q6Xo4kMGxuikak=;
        b=KkHmycTzR+PcQpiBxs2nlaMzt76YiBk0QmIZxYUCmf7VEPifnnun5SqMHI0JJ9zU1K
         9fk6bRMg15dI483gYru3i8+Xn478MalR17kMIrq9yAakIowL1/a6n6hRKrw03hlORpI5
         RKOsrFmzwYxSeoArHU9nKXX9vHjrNM+4IPDIQspBziu4c19Ecm73cAnTkq5P7gtmT3kQ
         Pgq/c6nZNkQV/Fpjkr3THOPJTPFSacgBmPaZLn9jJyvq+a4eGxhsDttSfmE12pZAWwEe
         n4rZi8y4m+9nQJ84s4PXvJC98e6xfkd5JASrBxmKsTLA0DNX9zMt9Mdyo02xupAewZQ5
         X5AQ==
X-Gm-Message-State: AOAM5328RKucRJoVtlY0ppmNxqnzlTDxAt8zLB06gY4xMIqmKeRjrk4m
	dH1wl/qTOVVrRqE5GppI+Ts=
X-Google-Smtp-Source: ABdhPJweiyFwOG7gqAVbeHFG5P16keb51c476iu3giGqmmPae+i1xEIJtGEV8zf0DjMeuNn8SJLUig==
X-Received: by 2002:a63:338e:: with SMTP id z136mr23349875pgz.115.1618170376210;
        Sun, 11 Apr 2021 12:46:16 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id 22sm8563328pjl.31.2021.04.11.12.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 12:46:15 -0700 (PDT)
Date: Mon, 12 Apr 2021 01:16:08 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: nsaenzjulienne@suse.de, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 1/2] staging: vc04_services: remove trailing whitespace
Message-ID: <5a54a06bae846f1f037165c0c7ba7ffe5a55a4a8.1618169920.git.mitaliborkar810@gmail.com>
References: <cover.1618169920.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618169920.git.mitaliborkar810@gmail.com>

Removed trailing whitespace to adhere to linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/vc04_services/interface/TODO | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 0bcb8f158afc..adb28f46ba67 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -27,8 +27,8 @@ unused.
 3) Make driver more portable
 
 Building this driver with arm/multi_v7_defconfig or arm64/defconfig
-leads to data corruption during the following command: 
-  
+leads to data corruption during the following command:
+
   vchiq_test -f 1
 
 This should be fixed.
-- 
2.30.2

