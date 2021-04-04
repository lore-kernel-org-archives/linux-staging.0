Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB88070
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v11so8761712wro.7
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kcJCSOmYpxcf+ptWmUJmH8IOVjOvLmxAelD1jsprrwA=;
        b=gBvwJYaTt2zvSgsPzz76Tz+Ew4kbmCTLkq6UnLfZN8DXnV/t5smNq9mGoiPyCPAjOq
         FjnwYdAGAR0itXn5dMVqU0QKsiT1/AsGSrg8iigQDnhRfigTpvRJCsEsxShDH8oCqR/w
         2wLm/WOEqmjVPzb2n1ang5bnaecYauB1rK0kvuKnS5bTot2ybNYWTShuyJI3sQnXqs6i
         3IdMMeCPn/YdgyLET3qo1WkRlAJBqDJB9FO2OEm9K5nnC5EmLAIsF1XQX18vh3cHcUUe
         JPFJ+Kob3qW0RqAAme1FmVlYCcxo+HeMsMAQ8TnRUQeHA80AW6hDe178hzYC/I0GgTU8
         Wy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kcJCSOmYpxcf+ptWmUJmH8IOVjOvLmxAelD1jsprrwA=;
        b=fBjF6NmQpRzgthrYZjqfAQK+/N7/FOOlFkUByv1EZ7vf1GysI6FFZASjA+wehosVRV
         iZi46AR+RpX76PVhwuXMEM2SLEC+ZNYOCDazVJ/RvFPGOnd8/WDhbgOjdHlfJajLWWkE
         q6qPR7EBJrAaqgT6fUgW7D/aZzAZmGBQKL4Ty+SbFa6cjf6Y+iwSGZYH/knksrMvbDTQ
         8Kgmjv2uf7595QH4BBm+YwWUV2f4qPNIvyMpZ14XCUvjzum71yY/wBsbsNBhAhym+9Ox
         MvyFV/SoiS9M/b5SUwJ/My/jrfTlSV5EYdXVTh1nMWwjfYazvHA0ZaG8l2TU2kKzgi5r
         3EbA==
X-Gm-Message-State: AOAM533yJ7ALAy6vdtHRFPuCY1svrIrLxL6GlRNxGGHYdpyaYSvkQ9Za
	K+zPnglxLSrIq6fUyMTyjQg=
X-Google-Smtp-Source: ABdhPJzzuJPTOufJ7JDA3PtMEWVU2CQ8IqzuGm+9c+nN/MX85b1WfLEKx170oy4gSq9gXWLn68QUng==
X-Received: by 2002:adf:f852:: with SMTP id d18mr25339907wrq.210.1617545433440;
        Sun, 04 Apr 2021 07:10:33 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id s8sm22959559wrn.97.2021.04.04.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:33 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 26/30] staging: rtl8723bs: place constant on the right side of the test in core/rtw_ioctl_set.c
Date: Sun,  4 Apr 2021 16:09:42 +0200
Message-Id: <3c701cacd71a6bb0f59242fc3a987f72dabb93e2.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix posst-commit hook checkpatch issues:

WARNING: Comparisons should place the constant on the right
side of the test
40: FILE: drivers/staging/rtl8723bs/core/rtw_ioctl_set.c:71:
+			if (_SUCCESS != ret)

WARNING: Comparisons should place the constant on the right
side of the test
69: FILE: drivers/staging/rtl8723bs/core/rtw_ioctl_set.c:122:
+					if (_SUCCESS != ret)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index d4920d7d2452..f8c7dcb7ab7d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -68,7 +68,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		) {
 			/*  submit site_survey_cmd */
 			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
-			if (_SUCCESS != ret)
+			if (ret != _SUCCESS)
 				pmlmepriv->to_join = false;
 
 		} else {
@@ -119,7 +119,7 @@ u8 rtw_do_join(struct adapter *padapter)
 				) {
 					/* DBG_871X("rtw_do_join() when   no desired bss in scanning queue\n"); */
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
-					if (_SUCCESS != ret)
+					if (ret != _SUCCESS)
 						pmlmepriv->to_join = false;
 
 				} else {
-- 
2.20.1

