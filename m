Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE112CAB
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:36 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x15so32286216edv.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2glchpcv+1d/9FAJVmf1wbGz2GHlcABraoRmMcJeBDE=;
        b=b+40/mFgq7OEUK+kMv5lhAte63pNSTfefUkkc9omG6HGP6e9Hy5AvZgtXeGNkwOjl+
         ES1L7rpUNd92URj9vl42wetXf1itxhVSFYYOWyAuL6PJL6dHa4fnhcVukh56EqYa4d0+
         4tejmyixlIB6qLEpy3Txloe/gn14r0IWQr6JKAF2oiSBLq1H8S2289osefBcYDQxbSZU
         NqygO4kc37zF/V0Ay1PGSP6e2aeyhiAfkp0faB1zf/mRxyiP3y1Oqp9EbTEgRudPiGtD
         8tRt4ZA9A2AwEi7WQ805T73JdKVjD6RIH273hdlLxNK/4n/ln9eObYOuBEdPXI7Xa1nq
         ZyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2glchpcv+1d/9FAJVmf1wbGz2GHlcABraoRmMcJeBDE=;
        b=OVZazAIJpikmGQ6j6DzjgCiZzmKZpbn47x12R8C+qTEXHRoOXDh5y0K1KDRyVMTbih
         IB2u+F6DtOnroN0waPGnnD7NU+TQLV0eCtjkUUKGqMHVI8uAj2XjaP7fMXaMHjQJBvsT
         dibUOE3HfmmyZiaYj+8kIyEG1gHDkRESbzgkESvjAaSuSP1T8G8Z3fEIJap1EehwFaSf
         lRIU3pXeMChuw2OWkoMdheN1VAn5Rpy1N2Mc/gkqqd2OCfw9Zp55UpqSeS2dxYgZgkIu
         A3sA+Mvj5FfLNUeqTwgBONKD5KFXIia+ch1sKu5bsZdBztcoS5euZzbYdNCUjozjFPVu
         4UDA==
X-Gm-Message-State: AOAM533VI+ifAgWgWsacbeBxk2Knz9XCBtbNUcH8X4VQjFRkFSC74mB3
	G58hqjZrJDT70lf4WpMegbA=
X-Google-Smtp-Source: ABdhPJwQ6TYXOaa+6LJAwH2wJNpTaY4dqRIQNjXZbpviol3mKr9pNZDtjHg5aEjzoEHtAIZM3FAISw==
X-Received: by 2002:a17:907:e8a:: with SMTP id ho10mr37955459ejc.191.1638712774609;
        Sun, 05 Dec 2021 05:59:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:34 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/12] staging: r8188eu: remove unused macro IS_FW_81xxC
Date: Sun,  5 Dec 2021 14:59:17 +0100
Message-Id: <20211205135919.30460-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205135919.30460-1-straube.linux@gmail.com>
References: <20211205135919.30460-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro IS_FW_81xxC is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5791172fa5c4..3fbaccbbe775 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -508,8 +508,6 @@ static s32 _FWFreeToGo(struct adapter *padapter)
 	return _FAIL;
 }
 
-#define IS_FW_81xxC(padapter)	(((GET_HAL_DATA(padapter))->FirmwareSignature & 0xFFF0) == 0x88C0)
-
 static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
 {
 	s32	rtStatus = _SUCCESS;
-- 
2.34.1

