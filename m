Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C966D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so309440wma.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ST/CqS76gXW84UrfFcjVMxVM5TUugWBRCp1rsIVvXzM=;
        b=c9E0txQJyXsoUeoMVbHMfDYwNpzq/zEENZTsWMtvlW4XfWszYpGX0VNDGbyq0U1XV8
         E/2TEhct++u7DZNINo+iRNZsngIIOhu3k/OmAtKZ595CeI2gJk5H2lTTn09kc2LPyTib
         wjzk2yFl9k0TB0RCCzS56fj/JuN5DlnV/zOL2k65PpFXt+8H1BvKuEceSdv9AV7iFj/a
         sKuQ1CnsvolfU2oSftK8J+lmwwgYttSasKMVsYgeTsIo4Bord2VPQgmdBWIoOrp9PL7Q
         MODErTGkdy7fZ906hJs9Iw/+7GSLPFywaMo6apEknysiMd+veJ3pa9e4U0YNquB3hxol
         wXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ST/CqS76gXW84UrfFcjVMxVM5TUugWBRCp1rsIVvXzM=;
        b=Fd+qrDL8uUOLcVMyh1gEKbJshtwK0KDbG8AVJaFc1JAxxp9UAMgeSIA5RfClsYvFTO
         5An663QXK3qn6WxOeV+NTWIziaNMrkiCHq0eChv6WXrH0eaUvf1oOYBH3RIxgPCC6GDE
         c9chaaxqVUXfIMFKvxr8mcAVRs1bpZRf4Gy3zxsz4Xpfjixklr0TeRw6kgvrnCW/nyW4
         +246vWgAFshnNUsp0MrLuTHLcQcC4PS/HgrUlHNL7ifTREkKdskbRcnbQeAEXTeDaW+T
         AGXODtYmZm3ME6sivIopUZPKvIUBteNNrupbLMZdr/sggyNSs1KKIZBe88rga6pzp/WK
         11sQ==
X-Gm-Message-State: AOAM531VaEm+WzMTCUWrJBx+d0SDvUMyhwD2Qx/+zegEsRxOS3SovZic
	bzt1ODkJPZHDXgtn1emPs4k=
X-Google-Smtp-Source: ABdhPJzmCNOVhLQudmqv6Uh7ayaBIoA6rIQpWn7fWm5sf/fTiFAC31Enyh1al6hvanZsCqm0EJHZJw==
X-Received: by 2002:a05:600c:a49:: with SMTP id c9mr15392618wmq.159.1629129558931;
        Mon, 16 Aug 2021 08:59:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/23] staging: r8188eu: rewrite subtraction in core/rtw_cmd.c
Date: Mon, 16 Aug 2021 17:57:57 +0200
Message-Id: <20210816155818.24005-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rewrite subtraction in core/rtw_cmd.c to clear missing spaces around
operator reported by checkpatch.

256-1 -> 255

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e95cb27516b0..ff6c5fa71101 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -832,10 +832,10 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecuritypriv->authenticator_ie[0] = (unsigned char)psecnetwork->IELength;
 
-	if ((psecnetwork->IELength-12) < (256-1)) {
+	if ((psecnetwork->IELength-12) < 255) {
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], psecnetwork->IELength-12);
 	} else {
-		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], (256-1));
+		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->IEs[12], 255);
 	}
 
 	psecnetwork->IELength = 0;
-- 
2.32.0

