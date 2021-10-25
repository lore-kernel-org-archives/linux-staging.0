Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872182C98
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 12:15:18 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id y1so7773111plk.10
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Wl35bTMgdm50FXjVnlZEEjFDAcjupSKOXZyrA0S47QE=;
        b=XvAXyDun2bkUItZUlkomMCQyrY+Bj5Le4OuZvwl8L7ubouqW/a4TSauAuWeYIqk4Lt
         czhw6t00XUYxFW+51vOARyqtYTBnMJ6hR6jK3VJRUFOaw6ZgmpWHn3tE2PWmeNDJ+/dx
         0qgUqdv8NxSBTE+nJZwYknT10HZf2ACwSrDab27S7wEzmhJdZF8LO3fLvsQBC4Y8Yrm5
         +YvAUoHHybbKHnC9f0sy9fScjf1WHJ7WxbUfxDmtKIKNUpFKcdyo8k7LIEhpRCNDLQY9
         dM4Wd7pztdU+FVU+yX8Jv+syN+o9yOkT39NsV89Ol+aLf/sQDmmbso4R8M01HTN9jhDK
         6Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Wl35bTMgdm50FXjVnlZEEjFDAcjupSKOXZyrA0S47QE=;
        b=lJNYpxaz3vdlZJ1ZLUJOsEL8s7znMYXK3KPQfcJV0oChYaHIn5Gq1+hVMF/ooH/QdE
         K1fif6UHsCEnzvotZ7wQH8+iGIuFGGP44fs1TG7DIIVacr+fN73WyDIF6HSz7M1poNCF
         VDL5gcuFUa6sq55xt4A6ek8inucxsPnxUz0iw20CzovGxsxbRGfPMkmjAzHF1Asw5nKW
         iZqmUNqrWepuvoE12BHxYdMZuAOJdQr4K/BgpQiplMVeAbnNx2Pz4fbhqcliFeUqY3zN
         Y4lb7Bw3dBvj3n0R1p6VUZDnZ3dRQyUdL5Ca17H3cYyiqAhk+LwA1D4e33pYGcB/x//M
         SGfg==
X-Gm-Message-State: AOAM530EEd5pNziq4uPU8oDw07fnMFPfqab32RIvDqCtjDqoIZCFvehn
	Sc5T+NWFqCbkQnuLdkbOVaA=
X-Google-Smtp-Source: ABdhPJx3pIuwX5AE8QymqSDRb3UgBG6yxFyUL+uolvdTuVdlfJPKTE3U6/hpYqDXQ8zkYxKkTbYtWw==
X-Received: by 2002:a17:90a:2a41:: with SMTP id d1mr16246035pjg.153.1635164117969;
        Mon, 25 Oct 2021 05:15:17 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.95.35])
        by smtp.gmail.com with ESMTPSA id d24sm18259925pfn.62.2021.10.25.05.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 05:15:17 -0700 (PDT)
Date: Mon, 25 Oct 2021 17:45:10 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove goto statement
Message-ID: <YXafzp5F8T7/+tk2@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the goto statement from rtw_do_join(). In this function goto
can be replace by return statement. As on goto label exit, function only
return it is not performing any cleanup. Avoiding goto will improve
the function readability.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 2b54cdfa9d6e..411b06e135be 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -51,7 +51,7 @@ u8 rtw_do_join(struct adapter *padapter)
 			ret = _FAIL;
 		}

-		goto exit;
+		return ret;
 	} else {
 		int select_ret;

@@ -78,10 +78,9 @@ u8 rtw_do_join(struct adapter *padapter)

 				rtw_generate_random_ibss(pibss);

-				if (rtw_createbss_cmd(padapter) != _SUCCESS) {
-					ret =  false;
-					goto exit;
-				}
+				if (rtw_createbss_cmd(padapter) != _SUCCESS)
+					return false;
+
 				pmlmepriv->to_join = false;
 			} else {
 				/*  can't associate ; reset under-linking */
@@ -102,8 +101,6 @@ u8 rtw_do_join(struct adapter *padapter)
 		}
 	}

-exit:
-
 	return ret;
 }

--
2.33.0

