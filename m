Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4643770
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:43 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id 14so2250380wrz.12
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EpY7kwFv9XB+zDjbRmdoTTr9wFPGvJQR5njz/BE4A3A=;
        b=uyHvPTrZykSd8cjjb9gqQdPHbu46Wg09WI5oNEvOYzSxkAXN0BvQZ7gtwTehJ39A9n
         iVkQpmcq7Mw0J0YXtg292PMiee+TJKvY5eOCM1IxxY0Caog/ifFxQBcfiZVpEIseiOZC
         gwM9SU8g/P4p5Va+7KHQlA/ePEIKopxdySdEAqDcFf9tswH5+WYhuMI2RmHpNuB6J1G6
         Um40Gbid27iefMXPJ3txbRo9w8npCdgsb0d1fW5mgiv2m7KWWMjacRiJAyqKigS27bQ6
         rkf25wWRG4oTjx6sqeHuXiD+n9tU9eR6y5OSPkXcqMjshG3UNdU3Y2zFnNh2qjEDdIyv
         zjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EpY7kwFv9XB+zDjbRmdoTTr9wFPGvJQR5njz/BE4A3A=;
        b=bXGr//ElJTgbbOVxfnDdH3JUn2FUZ9tgaKwF4pgkYT/ig/hJDbIJdxq7ZLo8ZW62Bu
         FEkYoriu8XMqcpJkLHeM5KDuFNjfXwOuPXhOy2BFhxeBnVYfPZjqwE/pueCAYORTi9wB
         oW31XQIoAA6zvYYp9T+XtlIunsweGcmLAnqkoYaKe/E5SUarCk3d9Iat05LgF3xBW3wx
         6xrnE6+lgdS2dLVqCqzIAFi0vsDFxAdx6317tcWUfQmd4yjk/yh44XX/GHW5s2Mr8Q+7
         svZI34r+1w/VhzjtbikyOg7A8kDPEEhUVQblQHrdGsRHO+WCwRnCzhdUPJhGgEfiNukX
         otWg==
X-Gm-Message-State: AOAM5302f4YSThdJt47OjPErWQEpwpugKtYYvmj2YhVGx6UVGJGiA+C3
	Pv6jyRci9P3BuZvO5ACDNGw=
X-Google-Smtp-Source: ABdhPJwmKDseKknzt4kmPKAbGrvBCPoM5OKvZM9iSM+iahQdJyx0Y0lDy9smnoH4ziYYEthyRlciFw==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr4866822wrw.120.1616611121741;
        Wed, 24 Mar 2021 11:38:41 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:41 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/21] Staging: rtl8723bs: remove enums in wlan_bssdef.h
Date: Wed, 24 Mar 2021 19:38:30 +0100
Message-Id: <20210324183847.5595-5-marcocesati@gmail.com>
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
include/wlan_bssdef.h:

	enum ndis_802_11_reload_defaults

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 9d63dc003795..4d2a25f78440 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -127,11 +127,6 @@ struct ndis_801_11_ai_resfi {
 	u16 AssociationId;
 };
 
-enum ndis_802_11_reload_defaults {
-	Ndis802_11ReloadWEPKeys
-};
-
-
 /*  Key mapping keys require a BSSID */
 
 struct ndis_802_11_wep {
-- 
2.30.2

