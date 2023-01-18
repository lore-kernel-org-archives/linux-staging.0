Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBA53A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:59:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso2416190wmq.5
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 11:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYfo4Xpw6lpycKMEhYHoVi36pIyA/1Ab3iBuTU5Cfmo=;
        b=OVXRq0MmA06K/0ZYWZm3e8LPfxuWQYN9ICf/jRJXE4zxyTOsHUBSrZ1vuBMso4YsHk
         FnogUQw0oLDCrhSdkrecrL5kofti5+mGTMFiqZ9D+sRp6dz+3knaF4E63Yp3Rs6GbMfg
         /wwmKWKYC0XH8xeRplMGLvl5kzDiKfqlkQuQeFdEL99V8btbGJTPJRKt54nP76XebRN/
         swK3kwT5GRWMBzXIyrCGzvxjlb8rjzDnqrq44lL1OrQfiRozVSnADBHcCJ9YWA68HLkZ
         dPujkWb3OVP/CO/0azHWZj8lrCSNrtxgz3o+m7NyvgRzCpDDtUP1TPvxBBvEuZEX3TPn
         CYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYfo4Xpw6lpycKMEhYHoVi36pIyA/1Ab3iBuTU5Cfmo=;
        b=v2gYC1zh0o/KFkdUM84h5C2nLzA1izNuf1bqAzbt82tCxqIiweFt75GI+17eG+R8o7
         zhFR2GjbTrf4yYShfklI3Q9cERj/lBOw9qi7W27blwhfhlnhLbBbVCmLQ3cZUO9lcJYU
         4G1QpjehNcy4BGo4jgBj72H0G15LLscbpm0HDXHpXHE/LTueAB3AqNxbHfJsE26i01U+
         IMnSFuwEemXIQFZV//zvNP+GsypS5Kf0poDHN+DyfJVDpctkRh6C/8spdJdWYUdsUKlh
         ZbgPU0zWsD0FptJWYVjaYq3Qquk4xNlV2BZLN1AZTbkhjGKgwOUY9n7EuLH1fTVJtpvp
         ZjOg==
X-Gm-Message-State: AFqh2krUS1KaFJ1yNcOZUeTUxdMVTcazGfBR4fZD7iRaeQ7w5jQMojPn
	CIMaZA2CZeTwXPqnba0bFc4=
X-Google-Smtp-Source: AMrXdXvHujm+t4eqyjK/849EKHpEzlO0ff+LRyvNKYQYAngMEyhG1C5J6C2tAAvpUuu3jCaenP5e3g==
X-Received: by 2002:a05:600c:3b29:b0:3da:f7a9:50ca with SMTP id m41-20020a05600c3b2900b003daf7a950camr2017219wms.0.1674071979519;
        Wed, 18 Jan 2023 11:59:39 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c350100b003d990372dd5sm2986508wmq.20.2023.01.18.11.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:59:39 -0800 (PST)
Date: Wed, 18 Jan 2023 20:59:37 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] staging: rtl8192e: Remove unused variable H2CTxCmdSeq
Message-ID: <3e6da78dff15cb5e5e26450d8e3f23e2e10ce61f.1674071236.git.philipp.g.hortmann@gmail.com>
References: <cover.1674071236.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674071236.git.philipp.g.hortmann@gmail.com>

H2CTxCmdSeq is never used. Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index e90cc61b3817..12a869a556bb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -525,8 +525,6 @@ struct r8192_priv {
 	bool		force_lps;
 
 	bool		chan_forced;
-
-	u8		H2CTxCmdSeq;
 };
 
 extern const struct ethtool_ops rtl819x_ethtool_ops;
-- 
2.39.0

