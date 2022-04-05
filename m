Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA37A;
	Tue,  5 Apr 2022 15:09:19 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id o15so10114100qtv.8;
        Tue, 05 Apr 2022 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=YZkbL+GyCYshGd2SxK7PvgiiaFokGhdvBjFhAiL3mJE=;
        b=ZJO9yRZp6P90RZT3XEvaUufFTHnVskvsXvvmkYd9SwzpPfgQ/EG7qq7XxWlnwiAWZo
         P87Oj4KT6pQfjRrCT+DpXN5an1xn0JKcq13+wFXorFDrN7JcfMlNb5TWDfnUUdJj1+am
         u/COgwXV/FL5IXcjkoE6ZJu8OXTt34vQyZjsGz7DWRMSrtnX1PJo/os3xrYpXg42KcBN
         rnZO8Lts3yrMffecZZBrIk1/RZKUlrubFkJjuldbUXB5gB1TdX70eAdcZucVRfiMem6K
         NbNXuSftzcBcc6NzXtkTRUFZo31VAtvKDKOAFFPu01z1GS0yn8EcAeqkhmn3robIPMwE
         rSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=YZkbL+GyCYshGd2SxK7PvgiiaFokGhdvBjFhAiL3mJE=;
        b=QyIbQNKrBKKLSjqivRwzxmCR+OVQc0BZS+/jLO0sFJ8SzdH2YwLviSh3gT08RXmF6l
         klFMJGrOzhuDqLkSsenWz+kbROLcAIJOOsC0WbiPhb/Uc8dlfIirZl4XDWrn35sQz/NZ
         r9Oic9gjtIemheNmtsY/VKXvB1AhpddzZyxiUGqH0y0uKfglmRI5N/PVz69eKBhhpjfE
         aNhF83CAvW+tFxW62kYsgiC55eXbbwErYPqgBqvFexXK7TTo8xqqR2ckburnrqolPjsQ
         ougUatWZ0jyM3uclyayU8dT+kAscksSUG0kFV5pUUJ4M0pEZStcxAvHLb+CwtyZJ4TSX
         z0AQ==
X-Gm-Message-State: AOAM533e4AQ/pUzNd4rYSDJVitJSKFUKywIaa2aZg9NTTZ/Bhva0fib/
	brTfGu6rngFa2l6eXGxdyZE=
X-Google-Smtp-Source: ABdhPJzBcKEnmfMxzO4pTwXmDLNbb647BPIfA5UOISMSbZI4aCTntBXAPD1cj/qU/bDGmO4X+wqKOQ==
X-Received: by 2002:a05:620a:4612:b0:67e:be08:b079 with SMTP id br18-20020a05620a461200b0067ebe08b079mr2633660qkb.422.1649171358837;
        Tue, 05 Apr 2022 08:09:18 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id n8-20020ac85a08000000b002e06aa02021sm11266239qta.49.2022.04.05.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 08:09:18 -0700 (PDT)
Date: Tue, 5 Apr 2022 11:09:12 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: fix indentation
Message-ID: <20220405150912.GA625670@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: suspect code indent for conditional statements

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---

v1 -> v2: Remove the comments that became irrelevant with proper indentation.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 04e29e228c1e..1bdbd0971f73 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5143,17 +5143,9 @@ void link_timer_hdl(struct timer_list *t)
 	} else if (pmlmeinfo->state & WIFI_FW_AUTH_STATE) {
 		/* re-auth timer */
 		if (++pmlmeinfo->reauth_count > REAUTH_LIMIT) {
-			/* if (pmlmeinfo->auth_algo != dot11AuthAlgrthm_Auto) */
-			/*  */
-				pmlmeinfo->state = 0;
-				report_join_res(padapter, -1);
-				return;
-			/*  */
-			/* else */
-			/*  */
-			/* 	pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared; */
-			/* 	pmlmeinfo->reauth_count = 0; */
-			/*  */
+			pmlmeinfo->state = 0;
+			report_join_res(padapter, -1);
+			return;
 		}
 
 		pmlmeinfo->auth_seq = 1;
-- 
2.25.1

