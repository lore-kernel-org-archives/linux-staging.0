Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1317A;
	Tue,  5 Apr 2022 16:16:48 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id z19so11911110qtw.2;
        Tue, 05 Apr 2022 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=FLSzkzyFKsMmWfcxhBs2Il7HtUd5I2QlvTXEeLFEpwI=;
        b=j9daqXZVYch5PcpAusIBWMCwCZEA3KuTMvcnCJaxNxRmfjMoMsoNrNQZfOxu51vnLp
         LmXUEEnUs+fN2pcJOcHqj0RSl/YrbpWNq3Px1arRKi/1PJQbDH2s3Zd43OqHi9aeMIfk
         49FXG0jcUhMbkUAIagFnqSO4ZO3YIxij/23L6s/bAwH51pqO+L6He0sK6ZO4U+2CClJ+
         7E6rGSmG1Yoe2MrDplF1/IPg+TYoCjqIojEo91MdsP5NE4CrS5qXvWW4+N6kJfjFJn74
         wC3XiQTmBoDQlzC36uwwR0TRsFAJqVgRZM0PV/SOvxlvVsGmwtZcWZgyLSmPnAxmBv72
         mgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=FLSzkzyFKsMmWfcxhBs2Il7HtUd5I2QlvTXEeLFEpwI=;
        b=n1xjUe9ALTWJ6wjGGUFsWeoB+V/8IbzltCL5A0Aivrd2Zm8SB+CLyQXOPqf60eFFRp
         3Rq4p+Q+S2Av+Oiso/errx+L4N9UGlKduViDAJ94x/VMWZR+IpxIjeW2ctnWw/zapXN8
         Q1Wo5+FpGDxrF4syE3DjTeTMWHOMvYn88L7WawaH9JQJCERV2c/yVjyNjlrPdf16yLdq
         /hyMZry2VfV9Ihoc3TnwlBrfPS+t5RJGt1JRukV7oqA8uTjJnerKaSmyfc6SDoCCk6Ti
         o3aniVD/v6QPGJst/THUANjKIZOtbCohDivveJnrqB+0jWrZLEiWKxP9AJcYlpEjVyDE
         EzwQ==
X-Gm-Message-State: AOAM5305TdsVFIQGyyS3WeUM59+UOoZ3fGpX1jjy2mtPa8U8eLuOgak0
	AUpePQgk0AnD5ni2lpSKcLM=
X-Google-Smtp-Source: ABdhPJyfBydtZeKLeim9Up5yEFW9t0urIMuUeqTm5Q4+BL7NMsNpsqz5Yyt2XPRxiO0/MgGVyqlYIw==
X-Received: by 2002:ac8:7dca:0:b0:2e1:db1b:7ba1 with SMTP id c10-20020ac87dca000000b002e1db1b7ba1mr3631493qte.614.1649175407387;
        Tue, 05 Apr 2022 09:16:47 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id h8-20020ac87d48000000b002e1c6faae9csm11228777qtb.28.2022.04.05.09.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 09:16:46 -0700 (PDT)
Date: Tue, 5 Apr 2022 12:16:43 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v3] staging: rtl8723bs: fix indentation
Message-ID: <20220405161643.GA630826@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding indentation style. Also remove the comments that
became irrelevant after fixing indentation.

Reported by checkpatch:

WARNING: suspect code indent for conditional statements

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---

v1 -> v2: Remove the comments that became irrelevant with proper indentation.

v2 -> v3: Update the changelog text to say everything the commit is doing.

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

