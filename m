Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D43FC3
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 06:20:33 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so7835566pjt.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 23:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Q/72TZxviiCkwWN8QnZlclMQc+rmLTuqlV6J9W/56aY=;
        b=sf+r7DBnlFt5Zpw82wTMGqkUBgenr2o2QmZrXK7+eSoyMgsB/gWWeRbCEwo7TU4Vex
         JgCU9v3TwSRQ8mQVlND8ZN4wF+Le7SqeX6HN4gXWHRgQpGKf4jVz3p6TUZ1DAS0fVqdU
         xfEHiiMTJGoPHwxSBu2MKfS4GROZdHJJ0jdPouwPDuoBaOD9htpgl/Q/eXGGPrF2jqnV
         0XbZ0VAzLqTibnCnTx1z+E8r6M3dn6rRJub/BOMBQSquDiukvV6Blgv+2qn3kCPQvvw1
         ARG5J9CbO1hI44S9zruW4KVxq5ezIz8vniatIL5zXCTh5tw9JO1sslhrBQafCH3I5+VK
         X4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Q/72TZxviiCkwWN8QnZlclMQc+rmLTuqlV6J9W/56aY=;
        b=iaoVPihV7MACt+mPGz00fyaUQFCeluEB+ymDKl2y/9JHp90cTTZ+Tmstil7YPggMpS
         UaCVH+YQmr8qj98WkReriMNINsxWEZ9OoNo8W8H/xIFE4UVecQC7q13YNqzTWadOx8/0
         fUbX4F2HVLBYHRuKSTARIe7+CtqxWI0/nW4qCtZgYkqQd9bimhuULtZL2z1zItvJ6ArQ
         2JkX8TNJVI6yQ2sRV6xJzy/4of3ymesh6oRBB0UpVz+lrh+WVSsLjQ0JwcIpXNsVd0cX
         r1rbLGRDAezfWxEoBR+eY6u/Fi7Y3vDLTAA5naK23VsBm+wU0fYL2h9Y+go22h7gfPOC
         KpSQ==
X-Gm-Message-State: AOAM530TBp9I3alZipc6Lm5MOmi6enMspxMMr9G5L1l068FDldDKrOdV
	wt3kPjvE7HqURv6iAd3KrMU=
X-Google-Smtp-Source: ABdhPJxGNI2aLBh/vHAYvxzY2Z3gU/cJ0ZivsaolkROrZlqdKSSNEUenujlZNnSd/RRlscFVyhPM8A==
X-Received: by 2002:a17:902:b190:b029:12d:487:dddc with SMTP id s16-20020a170902b190b029012d0487dddcmr16321536plr.24.1630218032949;
        Sat, 28 Aug 2021 23:20:32 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id u21sm12639086pgk.57.2021.08.28.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 23:20:32 -0700 (PDT)
Date: Sun, 29 Aug 2021 11:50:27 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: r8188eu: core: remove null check before vfree
Message-ID: <YSsnK7Wepn1Dv+oy@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove NULL check. NULL check before freeing function is not needed.
Correct the indentation.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index f6dffed53a60..c3600cb1790a 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -155,9 +155,8 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		/*===============================*/

-		if (pstapriv->pallocated_stainfo_buf)
-			vfree(pstapriv->pallocated_stainfo_buf);
-		}
+		vfree(pstapriv->pallocated_stainfo_buf);
+	}

 	return _SUCCESS;
 }
--
2.32.0

