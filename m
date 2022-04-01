Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255177C;
	Fri,  1 Apr 2022 18:35:19 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g20so3925022edw.6;
        Fri, 01 Apr 2022 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HwvsNVubztdYKgXLtsvkx6INUsTkEhAT0Rw4f8IMAMo=;
        b=Xcn8nF2R5LJEHbhs1V1/l/VEgg+pGar5DdZIQ8xwzExhCd/A84R4g77oZby0x19077
         /uJCka7iPlqTiJ029x+CbwGcCwEE2jFye6DjEkl2q80KKzlr7ngt3CTEbaoRv4feSaM7
         Z0dDYsw0wadOXuPR4Jgg96elUr3DG2wZocmySOXbiRXJu5952YSxEw87YPows1xpiN8B
         HRFWOxEH+leHb3skrswnGhFL+CHRBZa1C6VchrIKRJtIU+fFDWFVN1MSqizlyNYS6Eno
         Roil+V+pbnhlJqmdHH38rccM+6/LLvw9L+QxEHLkkE9nVvxvgwnMbdEcSYCnQpd2I3rd
         UCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HwvsNVubztdYKgXLtsvkx6INUsTkEhAT0Rw4f8IMAMo=;
        b=s7isUQWI+KQVeKb/SeyAUxiE3ulxv+BESe/maHN7QHnK982G5286fZ0WI6h85V0CPj
         IzS3becsGmdkz7FMPNDGE4zAPcFU4dXzWx89apxCfbDE4rKkiLHFvPGsiXJVu0jRPfPs
         1/RPpnZhOYR7PX5pGgb50oCwQBLObt4oZxrHqVNDBizRvDX3wcAiUmSIofWkXoCEWJ48
         rLO3D5dYQVv1OEM2KozpQpK9BHlEkiGTzFjPOZOLh+9CIUl1UlFHkoLov55z16kL82Jz
         tNBbxCVMLIvTJhvyEcINnkeFJeAWySieJ+rlE7COu65DzcRlVRFZp161dh07Vm7EF9N0
         U0zg==
X-Gm-Message-State: AOAM530BTnJbXU2IQpAT723nYlBuCEfRj5A+6uALimINYbg2mR9CytvO
	3l1lA5zDoq7yU4ughpVARbM=
X-Google-Smtp-Source: ABdhPJwHOb8kRreHG9rzDqQ31EWROiF+cK8Oi1m/wEhs46Appl0tGn8pjrroiFnmjIfLZk6mxRdYdQ==
X-Received: by 2002:a05:6402:510c:b0:419:3fe5:15f with SMTP id m12-20020a056402510c00b004193fe5015fmr22337749edd.274.1648838117280;
        Fri, 01 Apr 2022 11:35:17 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id b7-20020a170906490700b006b2512921b2sm1296420ejq.48.2022.04.01.11.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 11:35:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Remove goto to no-op exit label
Date: Fri,  1 Apr 2022 20:35:13 +0200
Message-Id: <20220401183513.26222-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function rtw_free_netdev() there are two "goto" jumps to a no-op exit
label called "RETURN". Remove the label and return in line.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/os_dep/osdep_service.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 7a6fcc96081a..d680bfba7f5d 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -117,18 +117,15 @@ void rtw_free_netdev(struct net_device *netdev)
 	struct rtw_netdev_priv_indicator *pnpi;
 
 	if (!netdev)
-		goto RETURN;
+		return;
 
 	pnpi = netdev_priv(netdev);
 
 	if (!pnpi->priv)
-		goto RETURN;
+		return;
 
 	vfree(pnpi->priv);
 	free_netdev(netdev);
-
-RETURN:
-	return;
 }
 
 int rtw_change_ifname(struct adapter *padapter, const char *ifname)
-- 
2.34.1

