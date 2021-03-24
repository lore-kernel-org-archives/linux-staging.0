Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BFA72
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso1784079wmi.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pMHyIkrjtNN6hi37yJ4w3ZmVQxMENRgJp7MDDMF6LYU=;
        b=CGxEkghli/LuqJL/79JxB4jQnKPYF+F7WAzIwlrFo09ZJZf6uLrMTRBXSM+pB2eVDZ
         qdsIR6i91iZBYCny/6bZIa/Ef/BrDkw4eM8VqmBiUu3DzxiJBz0B1Wc9KZXGx/qVEZ/4
         qK5C1ar4iq33sa3MKtSYAcyfzjKfzo/v5QqeXHIKgS3Wygfkj/NAZ5tZieVwQ8zB6Txv
         yQyAK2PEPwHqIw1DDMDOHvEX0fNIumjg8jl9rOB0YJIQsao8aXN6dJw5ayvSulQO+/hU
         3mQQoPdfXNfH8blHhg6h2VEvVMXcMWN1xtm12r7e024Wm89TZWuntmWGa8u1oXXaObX+
         dYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMHyIkrjtNN6hi37yJ4w3ZmVQxMENRgJp7MDDMF6LYU=;
        b=TCfCqWfPCtJC6PeX2vY4BR6j0yHDQdoyxu60konC+KsYYxNZa5keeIVlJA9hV5n6rg
         TyB1qhA1KeQQOg/MnW5XAd6G4whmZdCETc0NUDZ2bCwQlSeWLN69sJPKxjnqXCD8CkAO
         KStTqF5SwJt1Nvk0kLnuzHAfLwWqnEflewlss5HAqHAMurDPzjYkWq9PUcnU9hcs3mmu
         R/V6Vg+N2FJHW8RHEqKr3BZr503s5Sn92CEnioDgXpH9rIdM5dvFeQIbbNLT9+zUv9Oy
         3HoDhCzQeJ4TptS5TpfRT8qH18DKcU3gXSiaNNp0JG5E6aOxg7/gMtsJDzQyMhhiE9m1
         7KSA==
X-Gm-Message-State: AOAM533syQVFvR2TgKjbrVJ3pOLopOxZAaP7m/kx9sK1VM8HmSxkZdz2
	qody8SH6X9F2sk2asVZUZUY=
X-Google-Smtp-Source: ABdhPJycDGONsPwWdd3mQoscscEOwUwpUXy/7u1d8N7DH7TGG4QsoYRetnBf4ipvxAbG1PfMbn4Llw==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr4201618wmi.28.1616611132022;
        Wed, 24 Mar 2021 11:38:52 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:51 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 16/21] Staging: rtl8723bs: remove enums in odm_interface.h
Date: Wed, 24 Mar 2021 19:38:42 +0100
Message-Id: <20210324183847.5595-17-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
hal/odm_interface.h:

	enum odm_h2c_cmd

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_interface.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
index 8159bbd06c22..ceea8b96e453 100644
--- a/drivers/staging/rtl8723bs/hal/odm_interface.h
+++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
@@ -39,13 +39,5 @@ ODM_REG(DIG, _pDM_Odm)
 #define ODM_REG(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _reg)
 #define ODM_BIT(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _bit)
 
-enum odm_h2c_cmd {
-	ODM_H2C_RSSI_REPORT = 0,
-	ODM_H2C_PSD_RESULT = 1,
-	ODM_H2C_PathDiv = 2,
-	ODM_H2C_WIFI_CALIBRATION = 3,
-	ODM_MAX_H2CCMD
-};
-
 
 #endif	/*  __ODM_INTERFACE_H__ */
-- 
2.30.2

