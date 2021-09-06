Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A663FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:20 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id s25so10673848edw.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qc2GV8eyLuBArlRm4HdaZBsA+XfwTyg8ciFIuh8ckds=;
        b=BBvISXC/hjQIUxoiVwgZ4IzQyBPyYRVIok97v4SZciNcflbGha+RJ/gs6NtDBZ9bEK
         cmDsKlvyupc6nnr1z5g8kFWiGe+fWMkm+//qQdCjIy8K9gRSfE8viuUrTQ7nFtrjBOhl
         d3JGZC7SzZboZgVxv+Id99VAwlJgMfn9caIjXlb4fNl+pcaL9mUabatYbXsQ2DWYuO0X
         +TIYYH5cwKhqQSfAJVzuX65Zw2iADBxVeVplYrvWeGRpQvRUlv6jMbXdS7/jJN9zwmNP
         /gTL1P+ypWIFLgcidTHy3i/t6nRsp13RPKMTQDYvKoBxO++aJSkc3tQ0hGUpcsmweZ4Q
         nL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qc2GV8eyLuBArlRm4HdaZBsA+XfwTyg8ciFIuh8ckds=;
        b=YuIv6Ipb1Ikq6u2FRiiGKWGk2YslmDrnFoygfPY0FtIDQS/f+cWDHrDbd/fpyuN9kr
         wkgQpaLUSkx2lS1u+aF0yX8nXeRpxQWEoudYjjWoUP14xv65ANGfTVFPPNFawEGgx8Fd
         YF+vFeSH8cIoXnqcz7qyKAEN+iVVATQMglLUsRBVGVw0jnZ+02EewezW88aNDKq+Wypv
         S1rtO3J5DwgiBrGi0HzUJVpL+vIoVyt+NjngM5WWvl7F8FZSmfDcnXY5JriYRC+dbA7z
         /Smyu8iO1ykJdRsD8A+p4deWHlcoHONT1AJcDoHJX262XTdd+CRNdz1TvrycoolFL3FM
         i2vw==
X-Gm-Message-State: AOAM532Pv1Go/h2nvBCdwYbdWCJyxX7RpqwbjARgqstzm68LBt4UPT1T
	Jgxhs6B2ajvUJE6ePWEWUZc=
X-Google-Smtp-Source: ABdhPJzoUMMA5XZhOxmjdygO1T1KJZOpggz3zegqXVS9b/YD5VOr9vtyGwazat0WZ00InPpJzH5Dsw==
X-Received: by 2002:a05:6402:2792:: with SMTP id b18mr14655396ede.173.1630954458768;
        Mon, 06 Sep 2021 11:54:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 22/40] staging: r8188eu: rename hal_EfusePowerSwitch_RTL8188E()
Date: Mon,  6 Sep 2021 20:53:09 +0200
Message-Id: <20210906185327.10326-23-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename hal_EfusePowerSwitch_RTL8188E() to get rid of a wrapper.

hal_EfusePowerSwitch_RTL8188E() -> rtl8188e_EfusePowerSwitch().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index c7edb9ba4085..b5d0cd332165 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -707,11 +707,7 @@ hal_EfusePgPacketWriteData(
 		struct pgpkt *pTargetPkt,
 		bool bPseudoTest);
 
-static void
-hal_EfusePowerSwitch_RTL8188E(
-		struct adapter *pAdapter,
-		u8 bWrite,
-		u8 PwrState)
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
 {
 	u8 tempval;
 	u16	tmpV16;
@@ -757,11 +753,6 @@ hal_EfusePowerSwitch_RTL8188E(
 	}
 }
 
-void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
-{
-	hal_EfusePowerSwitch_RTL8188E(pAdapter, bWrite, PwrState);
-}
-
 static void Hal_EfuseReadEFuse88E(struct adapter *Adapter,
 	u16			_offset,
 	u16			_size_byte,
-- 
2.33.0

