Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFB198
	for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 07:45:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x8so1661570pgj.13
        for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7eI5KlH8jvd2AEJBKlQ3J4jXLlokaOXyX+ZrVY++9vk=;
        b=YmxDu6n74rkBICZ6OVQ14dYA1c/vmpv+9puClWEMW3wgBcX3L7S7yMOyr1wITpWnJA
         Ok4/ZWXkcp+nNo3VnBk0jdgV2Jo8tdXMPi6jrYkW30OBf7O+/Qog6siMYDnnb9+ESjce
         HiEEskIDqz1nnnewCMykc+ilDNofnFwx8dR3rArY2kg9ovfM9Lz/hJ5ZUer65Sm6D7sM
         KmUa7OGuyNjAu8mTfQ0H6aZ2MMTLUwNbQwcuQnUmNdHOwIi9Ol6UOYXerR3OJfRjWJI3
         PFSTP1qJmc05sb8NziC83TqhxhQ/U5m7BZsqoEYu1/fuhFGoVIPqjJ8amZ9t9AcNljay
         C+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7eI5KlH8jvd2AEJBKlQ3J4jXLlokaOXyX+ZrVY++9vk=;
        b=Y3/PorGIpQwW1uJ8DG78Y9Z91HXUdS1P5rqvpQN6n9W37hNTLp5isnP0UF0zq0owPG
         2zHcA8mavHsUpb1e1jxl4Y3EG+ZI/oAjQqN5hF2fs9XuE1sfT9xjtJz0Ar+KnFKzb5Mu
         SYPSNpfAS19kFk7JrV66Njw+UDIrXMeFJypYsJjoK1kVPs5Z0avCv/Aqll+7MLuAHeYc
         yPqb3zu3UWNtEf/DSzl9g+/3aIl6KN0EsLEclwp9bv3+YHMBBTTk8x1pztTRVyve8Dk2
         kl3oAu5X2VIdH5GFIAUX9Mci5SwTD9e9DbVQTleTYMrkd221FzhpzpW9qd4DS/H5fI/m
         ckMg==
X-Gm-Message-State: AJIora+DFnXMD6HCSN013jN7HC3SFpDILeDpM4cjZCmfHLedBlzYyM1S
	bkIQq2447Ds9RSBSj+qVI+c=
X-Google-Smtp-Source: AGRyM1suBXCRt8KBt367wr5hGvoxdwUh1ZPYvZlbV4zhU6zLaOTIG0PeXbdd+COlxiEO7UpR7QEiRw==
X-Received: by 2002:a65:6745:0:b0:3fd:fd52:85bc with SMTP id c5-20020a656745000000b003fdfd5285bcmr6888172pgu.350.1656229530012;
        Sun, 26 Jun 2022 00:45:30 -0700 (PDT)
Received: from sebin-inspiron.bbrouter ([103.148.21.74])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709027e4500b0016784c93f23sm4715873pln.197.2022.06.26.00.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 00:45:29 -0700 (PDT)
From: SebinSebastian <mailmesebin00@gmail.com>
To: 
Cc: mailmesebin00@gmail.com,
	skhan@linuxfoundation.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Remove null checking before freeing functions
Date: Sun, 26 Jun 2022 13:14:11 +0530
Message-Id: <20220626074417.661312-1-mailmesebin00@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following coccicheck warning:
drivers/staging/r8188eu/os_dep/usb_intf.c:376:2-7: WARNING: NULL check before some freeing functions is not needed.

Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 68869c5daeff..f5f1119b5444 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -372,8 +372,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 free_adapter:
 	if (pnetdev)
 		rtw_free_netdev(pnetdev);
-	else if (padapter)
-		vfree(padapter);
+	
+	vfree(padapter);
 
 	return NULL;
 }
-- 
2.34.1

