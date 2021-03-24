Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CF6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:54 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id g25so12862543wmh.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vxK2r8Y0ZlDIG1yQ2Q0/BluBgsbJ57gL+VksPVyV8Rk=;
        b=WTzJdCEBTRaoI1jblsGZ0gFM9erntLIrgSJVB3fv4UBKlZ6RMLXd7Nhdn93PXqBewe
         X5zKj1E2MXy3zTe0lprIRk7Qkhc5FH0OiJFCG+K9qMvf5Q1dFq+0Aun7J3uLkxxIHJIT
         iR6ScMflupEMvfa2B1Fo9JXVhkIzguSoYSw7ExeDDLBDx7xOcuvk8o+yNhjrSpwystLE
         1hrrgh947jGFLpgXyz321kB0HQA1kkR9I3MKJ2wYh1DDQVmMgPmj+0LJjNHvjyP6HKNH
         oRRSNG+aCMpFCXPHcRHAH7ouYczzK/T9lDlGJxt9L1b4h7P7wUDJwWMFRpXfRh3AhPZX
         0tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vxK2r8Y0ZlDIG1yQ2Q0/BluBgsbJ57gL+VksPVyV8Rk=;
        b=mKge/ddFXKbjw57NDXuKxe9y5AJFofxYoDPnyTnAPDkE8mu6+a4E0WjLUsNOMAsaBg
         EvRtN6+bJqkkRDP0QEUYvnDBHCZzDbUSQqpjTx2fh7OyLxB64uqjVkV12HB2+KL+pHnw
         Fd3J9cr7FlhXFkTTCDYiFuI5HbRLPo8yWYikl6CN4/F2c+uxJkgMWmBFmj8vHGQwEj3G
         wsTcOFfZomB73wNgHz+F/7RNLTEQCGZzASV1pn/EF+23Gv2ERNY+NXVL+UoqISHFtMOp
         /hhwsMjO7VsdMYYepDtqT+WHEGkCweWEptSFfXL+uxVzeN1nf1ucXUt+5Nv01kQ76Z+R
         0NuA==
X-Gm-Message-State: AOAM532V0nGHE8YFr8cafw4Qe1UjuC6y86QdaJ1Ur3czrHeVz2DYqv6r
	DX983Yq8vdLkTh7e/BvqXIc=
X-Google-Smtp-Source: ABdhPJy6PjkFQ0KX6HxcebMtM6BC7IvolyZ8FG1Nso+STZG+kwcon8j72sXMEUd4kdTAyS8/2T9G4Q==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr2786534wml.147.1616589892942;
        Wed, 24 Mar 2021 05:44:52 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:52 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 06/33] Staging: rtl8723bs: remove named enums in drv_types.h
Date: Wed, 24 Mar 2021 13:44:29 +0100
Message-Id: <20210324124456.25221-7-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
include/drv_types.h:

	enum _nic_version	[definition]
	enum _iface_type	[name]
	enum adapter_type	[definition]
	enum driver_state	[name]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 1658450b386e..df1dd9fa7b90 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -24,15 +24,6 @@
 #include <wifi.h>
 #include <ieee80211.h>
 
-enum _nic_version {
-
-	RTL8711_NIC,
-	RTL8712_NIC,
-	RTL8713_NIC,
-	RTL8716_NIC
-
-};
-
 #include <rtw_rf.h>
 
 #include <rtw_ht.h>
@@ -347,19 +338,13 @@ static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
 
 struct adapter *dvobj_get_port0_adapter(struct dvobj_priv *dvobj);
 
-enum _iface_type {
+enum {
 	IFACE_PORT0, /* mapping to port0 for C/D series chips */
 	IFACE_PORT1, /* mapping to port1 for C/D series chip */
 	MAX_IFACE_PORT,
 };
 
-enum adapter_type {
-	PRIMARY_ADAPTER,
-	SECONDARY_ADAPTER,
-	MAX_ADAPTER = 0xFF,
-};
-
-enum driver_state {
+enum {
 	DRIVER_NORMAL = 0,
 	DRIVER_DISAPPEAR = 1,
 	DRIVER_REPLACE_DONGLE = 2,
-- 
2.30.2

