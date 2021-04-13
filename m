Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD171
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:25:09 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id p16so3499473plf.12
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 20:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=SRXvRUJitDAL3LVBcxgMSN2+Nyo+g/E1R/YUuhMK3zY=;
        b=NT5wxcrMIElDPZAIwOHzPA+cCkYYmfN0PcrXjLMovuafkLeOokhyvZDn2+qKo1JRMw
         yfifmdoDp0w2m5Lq8veWu5rKtEumpKNmqr5PHwjWEM9M+FvcakfBMLmH5HMQ5mVP+Y+m
         Xc6qu+v5+bA4mn4ApziWUp4d9NSZ7y7kojwd/lKea4W7FW4qdJbG6GwkCemLFG241fRU
         2LOd1mtDMhFJdW6M88KvI8PSK+ZpgeDOPmQ60KIxOUuea6gtP7WojxZbAjsV4dUTCPa9
         WGSxnkmoixLKk4UHZqJul0iqUf0VQNm+Cuv3hxFjsj0qN9e8/NrkHF/Ve38cU4JU80PD
         0Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SRXvRUJitDAL3LVBcxgMSN2+Nyo+g/E1R/YUuhMK3zY=;
        b=rv6WPtVH87xtTDX6sLxkeScS2F9egkhIMteS/EZk/mnJtK5pZQS8aOM+c1JB3O0w/O
         p9/R8l25mQKp17+vFHtRRP7tOL9qDi51MeZWJBOgZwbctcOosYmlj3QqX1xTbaXqODj5
         oyCN+Q4IqYcuq8j9i9ZGUt9CIz/c8LgWhLu1dUMT2iGWoQ04eDD9GN9HRYsKHO/2/0UG
         ftt1qHrKaMLhAsrAar9MY0IX9ygJ/KLWrw7tdPKAhLh9kXvYBWn3kGZHG5qCD6fXxRKy
         fVwOKZ+X6c4jUlydeYBr5JZDfEnglFZCbIWj8uzaYaXSYhHOSV0SixHILVv5xsfunAEN
         n1ww==
X-Gm-Message-State: AOAM530/KPXNe2HPQnJ1Qfm7ak2ggZ3m9n7F+bUrkeOqmSqe5iO09VZK
	xV2YrvSyyHom8Dvmdd6u8Go=
X-Google-Smtp-Source: ABdhPJz3w+bs8FKEbZQO5/VCoWcYR59uE27wBIEKt7H5yflDTqlYWDg0XRJIdjOaTQbyPflIpgtrDg==
X-Received: by 2002:a17:902:aa8a:b029:e6:64bd:e29d with SMTP id d10-20020a170902aa8ab02900e664bde29dmr30083774plr.24.1618284309436;
        Mon, 12 Apr 2021 20:25:09 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id s20sm8993891pfh.144.2021.04.12.20.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:25:09 -0700 (PDT)
Date: Tue, 13 Apr 2021 08:55:03 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v5 0/3] staging: rtl8192e: Cleanup patchset for style issues
 in rtl819x_HTProc.c
Message-ID: <cover.1618283232.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes from v4:-
[PATCH v4 1/3]:- No changes.
[PATCH v4 2/3]:- No changes.
[PATCH V4 3/3]:- Removed casts and parentheses.

Changes from v3:- Changed subject line to match prefix on the patches.
[PATCH v3 1/3]:- No changes.
[PATCH v3 2/3]:- No changes.
[PATCH V3 3/3]:- No changes.

Changes from v2:-
[PATCH v2 1/3]:- Modified subject description. Changes has been made in
v3.
[PATCH v2 2/3]:- No changes.
[PATCH v2 3/3]:- Rectified spelling mistake in subject description.
Changes has been made in v3.

Changes from v1:-
[PATCH 1/3]:- Removed unnecessary parentheses around boolean expression.
Changes has been made in v2.
[PATCH 2/3]:- No changes.
[PATCH 3/3]:- No changes.

Mitali Borkar (3):
  staging: rtl8192e: remove parentheses around boolean expression
  staging: rtl8192e: remove unnecessary ftrace-like logging
  staging: rtl8192e: remove casts and parentheses

 drivers/staging/rtl8192e/rtl819x_HTProc.c     |  18 ++--
 1 file changed, 5 insertions(+), 13 deletions(-)


-- 
2.30.2

