Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF8570
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 22:43:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j25so72233pfe.2
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 15:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=FGiGH5+ml2VgPHsxZs7b2NPl4+G+lB9mceSj+p7XzF8=;
        b=U26e19lwfmllaO35ttkmS5Q9GUoXvorxglHB11m/WKuLNdhFDwEtcfJzEY5n14zAix
         680wmmGXS3n5yDrhmR90ygfciS5Ntimh6D701yPq13FRDikCpUu3xUQ3/juATCLkj+hO
         NTujkaeoGtFZc91cOpZBzPHUVlzlYJ2vBD2RytvBtjVkWdqoTMiuOMk2J/E9ZXuFpIdH
         ImXVxydqcCoTqTL2l1jSHwFZfmYMxKnO53ecqZ3JCLabBVWJAJFZUQZdVdbQqQs234U1
         chK/EpN71lmh2ZB3pnLUdij4oYmtsRASbHG0g5a94Mj4S7Ns6DlnPwuzPmaGbjOZ6xXl
         Nf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=FGiGH5+ml2VgPHsxZs7b2NPl4+G+lB9mceSj+p7XzF8=;
        b=GKiCWAAneObHlMJI0hShygSONivVd2j4h/8bLe7VZe44T9p2aBCx8ZwPehMD+6mKaw
         Fk9wiMUTpWp4vjA9gdX8FfuMvvPYpgCxoYQr3zlcnmDnaUrkKR357FPldjZPX1aeOa12
         eMNoqqGnWteAXnprFcZXjHk2GFtLgLIORCwLkhjnIAOvdSly2P6DFvQQ1T+f6WKovcWq
         31WLslfo3DlVI27Cb+a4SliVlNRdlIZQQAGdalzhTAPjWw959VMbHV0xCySS1XAr4Lrw
         kQ2uw85/noDtHTtG14TPY874vuExZoCUbDkjPmyOw7jCSQc/HqboxC88wfXMhCgj77vN
         xTGA==
X-Gm-Message-State: AOAM532ym09uI8Wb9leUe6gw0fQuFr9PPFE6E+wLuEa0KZosvx3GN6oY
	P19HqTflhRheQIDRsOhTHDs=
X-Google-Smtp-Source: ABdhPJyVOksN7qTo5ZX/8ggaGWoUjeQRjKfHd/mNDBghRzJ/kAj76voWenrwwe4oaKRUHd3J+5xDFQ==
X-Received: by 2002:a62:76c5:0:b029:1f2:e6af:e2ab with SMTP id r188-20020a6276c50000b02901f2e6afe2abmr5159679pfc.10.1617230621174;
        Wed, 31 Mar 2021 15:43:41 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id h19sm3338830pfc.172.2021.03.31.15.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:43:40 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: core: remove empty comment
Date: Wed, 31 Mar 2021 15:42:31 -0700
Message-Id: <2362c76457b94895f0b62b59889e80349bb69d8f.1617229359.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
References: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
References: <cover.1617229359.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Remove empty comment because it provides no information.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index cb8d19e4dd3c..3fc4ea02bf15 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -876,8 +876,6 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 					*(payload+curfragnum), *(payload+curfragnum+1), *(payload+curfragnum+2), *(payload+curfragnum+3),
 					*(payload+curfragnum+4), *(payload+curfragnum+5), *(payload+curfragnum+6), *(payload+curfragnum+7)));
 			}
-/*
-*/
 	}
 	return _SUCCESS;
 }
-- 
2.17.1

