Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4E37A;
	Tue,  5 Apr 2022 14:54:29 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j21so11463491qta.0;
        Tue, 05 Apr 2022 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=GiOCB0LEnVJnuUDKgIp7T1dC76Lv7y/CQVx5+uI2YZc=;
        b=M4hADWEp021dn2H8CsRC3C99oEW6F8vJHJoOMLrMCUtoe85gORP+719UDYi2PioJJ3
         GAsgSFwUvRgL8dnof/nCYGHgPIa1D9XSoPsoIXWanp2KBItOXOVI2x5vt0aYpRQfdiZB
         HHKE/qkU+hyMsvzIK6CkqHKMgoxN97q8Z4ea4nnIyD/gUD17zGKWZIafrQHusA3jX10q
         BJf6b1JG5zF174+wAgF5T1WJ8R9h4qVTE22/B9YkTgcl1C4jAyXI50FDli44jMrzaNIQ
         vCzcayMxf5CKvgNqsYxf6Mj6swmrVLwPvB11MJUtx/UVVPyWFX9kKiWXc7vUDesLtrlo
         lVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=GiOCB0LEnVJnuUDKgIp7T1dC76Lv7y/CQVx5+uI2YZc=;
        b=Pp5Y7R8fOX00qsq0OXn/saPnCbk9QvLITy7vE7LtFVgC5HB1KM56bb7zLBDbAM8Uan
         tCKxTLR0/ZSpGiLJyIg2kK04x1j4pj0YF0TXJmIQs/gtgSA1fmWMDNuRKyQc+bky5lQF
         M0I2jdpVm9bceAOnhrWQiR/bU+xXUBRWIOa1qnAnVdQPO5GrEKYV0KlxpAQg+gfmZY56
         kPB8Eqs5uMYAHpd20OGPfOnh104QZIFAeLt9J8XpY3swSAPlITrF2QaM9ozMxDyYNHUE
         KotJemDSh+tzP8dbL8gb2CAKEhyRIDGYt2kYNQIhMHj1EBitqtEUQN8mTzyv7+Pnokze
         qHeQ==
X-Gm-Message-State: AOAM530oJihpWLv/FJxKrs/JP1jYYUkSzpyeT7MDghyjHaZ5OtcGPBP4
	vlhgY518JZ6YyR4DD170yag=
X-Google-Smtp-Source: ABdhPJxWyKR68v2HR7slViur6n1YhBWHCXKEZdM79ZxGegD3hmcTEcx9ZnCjsvnh4vH3eih2OrSbyg==
X-Received: by 2002:ac8:5dcd:0:b0:2eb:9458:4985 with SMTP id e13-20020ac85dcd000000b002eb94584985mr3329851qtx.85.1649170468792;
        Tue, 05 Apr 2022 07:54:28 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id u62-20020a379241000000b0067ed2b0994dsm8201646qkd.54.2022.04.05.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:54:28 -0700 (PDT)
Date: Tue, 5 Apr 2022 10:54:24 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: fix indentation
Message-ID: <20220405145424.GA623343@euclid>
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

