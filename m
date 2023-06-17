Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ECC9467
	for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 13:57:14 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5183075a5ecso437502a12.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687010233; x=1689602233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n97eu40lLD5raDHeMPetald7UVarkQD2e/uUhF7bu8w=;
        b=jJhZIW2w9dd6qxCPFexKLtSZrWzRWdkzy4CE5/xSqnc5hhN+bVOwF3/+Yt/jZBaRZc
         UgQA8N4Y0ne6z0Dj/KjiYRPA1MlSyZefDaVSnxbLsmtKRvBmJU7K5YiiE0dimWtrECOi
         V+T6EtOvWHNLVuYpKuz+5uRV23LCfZjor0OgYzfjoaFFCKBANEHfR81LrAWkR51YTySc
         XuvPJljf+hTvl5IluRvR48W6naJkHvdqzF1zF6HZHZEF7SfzEjc0/1cLaJBjiq2m31bP
         adRv3KSTH1eTGcpbXDHSyRNwS8/9wcaASzQrPPdKlJ+FpEv06JAuupF+gojg40OwP9r3
         LCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687010233; x=1689602233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n97eu40lLD5raDHeMPetald7UVarkQD2e/uUhF7bu8w=;
        b=NZJAbld4Q8yU+FUIuOt4022luTkc5El4tqo0z+AXc/I96w6tQ84l6jSFZCtASThfBZ
         +JFE58PysrqDeZ0kJK3X6MkOOkT0LiOA9UiTiRqFFMLRhJgL79+Esm6jYqkqVJJj9QRU
         3XpVmeqMzUhqLPPHptup3lGq3rkm9E/r7uSH7sO25yAcZURr8q/Jquc0S1cpyPasV40r
         CepXwmTOj49ZLuTU3WH2xibBN1odwNPu7UGBoJ+lv+ZT0xr5/aUuQWvnvUb044ZToJdV
         MtLfn+MtiHa+JcOuqemh8bneBV7jSK5NQTDTsSoUW5OxGkmm1XYKQ123oj1sbHz+e0wE
         ASnA==
X-Gm-Message-State: AC+VfDxGUwySYgVVDnIoTIztcmMJ+Q5r6dAOLAD+RXyLo9b6xFv5pNUI
	vYn1wkIc6/dTi7yYXUO5B60=
X-Google-Smtp-Source: ACHHUZ51QYtle5vgneRhqcr45ejHRlOFJUQ13ZMfe927Im7i+hYhIBOvVx5Tj1BSf7vAFfOEPEEgCg==
X-Received: by 2002:a05:6402:4312:b0:50b:c57f:d464 with SMTP id m18-20020a056402431200b0050bc57fd464mr4147455edc.1.1687010232769;
        Sat, 17 Jun 2023 06:57:12 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id p26-20020a056402075a00b00515c8024cb9sm195856edy.55.2023.06.17.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 06:57:12 -0700 (PDT)
Date: Sat, 17 Jun 2023 15:57:10 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] staging: rtl8192e: Rename rtllib_state to rtl_link_state
Message-ID: <f21541c16c83356e3cd1e08059847ef9a9eb2ef8.1687007788.git.philipp.g.hortmann@gmail.com>
References: <cover.1687007788.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687007788.git.philipp.g.hortmann@gmail.com>

Rename rtllib_state to rtl_link_state to align with rtlwifi driver and to
increase readability as state is to general.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 2ebacd6720f1..1aabbe11b484 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1119,7 +1119,7 @@ struct rtllib_network {
 	struct list_head list;
 };
 
-enum rtllib_state {
+enum rtl_link_state {
 	/* the card is not linked at all */
 	RTLLIB_NOLINK = 0,
 
@@ -1489,7 +1489,7 @@ struct rtllib_device {
 	 */
 	struct rtllib_network current_network;
 
-	enum rtllib_state state;
+	enum rtl_link_state state;
 
 	int short_slot;
 	int mode;       /* A, B, G */
-- 
2.40.1

