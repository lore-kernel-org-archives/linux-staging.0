Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B92FB2
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:29:35 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id r26so5918937oij.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ep/byKh0NuVpkH8Herix4A8TT0fTgaV62jYcvRPVYXQ=;
        b=B0AlQHDVJjoUjcROJnHXZlQlM0RwJAr4Y+2PzuhDaik1A/rJB9fzhBB0vgw0kN0a+M
         hVixW9kpfT0gjBVHePMa235S18n4tEFjje0WnWVXOkZmZmc8EKGUpnF/0uSBRk8EJGCq
         Kxbg34OYV851lA6P2B/D1d0dfAGYYcWyQ4EVdxkXH9g+T34bbna7nNLic/W4iJhmrahl
         AmEiCdUZFJGMQu1CVrMlUNFBmkgGsuVvL+2nC3Jyg0VuQdpALnXyvzgoh41+rgMSt4Og
         M7qvTDNGp3ZqiPQqqsBPAkvsKrHtrZyaaNWCIPGTUx5tbXFFFLC2ctsHby8KQQgMEZme
         R3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ep/byKh0NuVpkH8Herix4A8TT0fTgaV62jYcvRPVYXQ=;
        b=H0Hw9O9xByMH6zn3pCpL2VkBo5NCBY/TRZtqKpQlAJpIlyOEX6Ts2BX9vHLyi52hbf
         YE8K4NTiw0C0KbqUDVczV4qMPYW7mfIpOBFSStf/iR0O2DJNSDKBunYBirjPZcJRKdRk
         TMdL6rmgWK36SKsbH63ADcvu990uqBRYzlqkcn7tz0g/8SPr08PbRXUa8AYoHDxwLi3R
         rhudCyglp2VP3NvjMW9fqJQzqpGJKQEDcUGFP5yCZLylbsnUchhvn4rUg3ASj1J2SLXw
         W+78jGqdUqOkl56qe6807rBHMNVVtjQ/D7gK+htXOlPlwM7EmDXfb5yikDgwGi2uBp7m
         ibpw==
X-Gm-Message-State: AOAM530mmKasHMboI5wo9mohBri5mOBlIZYUAi8zGsEWoa/wxSIuRUCw
	T+vn0sduaTLrUJVtywi7k3bltW3nxw7tGw==
X-Google-Smtp-Source: ABdhPJy/5z2ic5/GvSkn/yyqMCItDM65BJjpu8uzY7UN6I+FKmb85kh0rfgO6j/91CwXtoLz19oTbA==
X-Received: by 2002:aca:1917:: with SMTP id l23mr1177025oii.10.1631737774938;
        Wed, 15 Sep 2021 13:29:34 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id l4sm247584oth.4.2021.09.15.13.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:29:34 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 2/3] staging: vchiq: add braces to if block
Date: Wed, 15 Sep 2021 17:29:15 -0300
Message-Id: <20210915202916.413914-2-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915202916.413914-1-gascoar@gmail.com>
References: <20210915202916.413914-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule of not using braces in single statement does not apply if only
one branch of the conditional statement is a single statement. Add
braces to fix this.

While at it, remove extra blank space after a comment inside the if
block.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_connected.c  | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index f367dbe2bc63..1802fd5e4888 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -34,16 +34,15 @@ void vchiq_add_connected_callback(void (*callback)(void))
 	if (mutex_lock_killable(&g_connected_mutex))
 		return;
 
-	if (g_connected)
+	if (g_connected) {
 		/* We're already connected. Call the callback immediately. */
-
 		callback();
-	else {
-		if (g_num_deferred_callbacks >= MAX_CALLBACKS)
+	} else {
+		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
 			vchiq_log_error(vchiq_core_log_level,
 				"There already %d callback registered - please increase MAX_CALLBACKS",
 				g_num_deferred_callbacks);
-		else {
+		} else {
 			g_deferred_callback[g_num_deferred_callbacks] =
 				callback;
 			g_num_deferred_callbacks++;
-- 
2.33.0

