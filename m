Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E73A1A38
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856178; cv=none; b=OyRmRiydvz2h9/d6TqYmYvUTlOc+0h7n+xS4vVTSBJxcqJtye9cCQY3LCzqizh07/oYi2HWYlejNZx6N1QqkxafM2nnnKHWuLQvOlVrK3ATZVipOriA4zXfQ8xKKqgLsAgryaKLvH8dgb+SeTe1i/gvEd1evfzTgPFexgHf5ObE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856178; c=relaxed/simple;
	bh=I4h+Hb85bL/zpjRA/hGHNI3yGfnFlHifIvIALM1Wh7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=td6lnqp3MuN6kpkBBM9u5g9MXe76+19h3ntF/Ia2E9oSQQC8ZutqpLGGrY96qzyW38kIBprw0uLuL+86oiyI/+ukKmvdYMx1KJUBgWKDpXzNOMqWqpwdePmZLy4fC2TVDN19v2LmdQDSNb4e7SSDtY31zVma/NauAWdoy/2ZuJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOrz5fqO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOrz5fqO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso34774715e9.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856174; x=1775460974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=SOrz5fqOIMHOU1LJoHhp0IJoLNWtasMU7mP2/2lcCLmmwTAP8aXCD0Z/fyflhoOwii
         RZHdYnOzhc/byiqvhQiKUWsXu1YJa2ni7IKKnsTf7PoUeZg2PrXO906s6Damxf/22OCg
         WYM5euJwxL/hk/eLbzB9RkLllskYCSi+sdXTUCXvTv8shGzvhIAk4H0BnVWaGa1sekBw
         BHC3tEMG7G7Tm3ejdPBw7PLGe5p5kvk1OfE7EOyWiWy4J/HZc+7tJav3KjNbmkEQBVtf
         VOK1hokPmibfDYiQ9NmF2zio+tC3lDTPDsGPYbdWFjFQgKXr34iwMWtdCVXbgqe/MdqG
         4DoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856174; x=1775460974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=X0w7EFPkIfSdwYS2TTBXlNjzaSupYlnQAOgbIlISOAEbW9EJKHMCZnnL5xeAk1By7J
         KJggL2qnumkY4bCEz7gDhw5m/H5r2GfWghnV0U9LxfmTA5gjzhr2B+yloefKn2xCmH+4
         /tT/bjlMu6BFFXbZqSQKQGhmF3kEOMIXZjjjWxjgunlZ3uOi/N0mveXknItLVUzB3zdK
         +6x3K1q7Q4IE968i3OCCw5EWKjhdjLQyfzZz8pNPUO6J/XaeJu+hJxwV0goMFIrUtEzt
         gOURNuQQiP51UGIQSr9eDD+o07pWSQYf+m+kLX9nktNP9qZN4Cnqjc0USOHAyH5mv4Uq
         nreQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnXZyj5KvugeeGWs7oS7FgX44KVep/fj93oglRd9LhGj3hb6KEufGfGeeSkDhi34/BgJSRIL8wOuZ5e6wG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnj9jbJA6vYOq0ohZ0GaVQz183tTNbO09QMtfkEpautaRnl0ta
	9R492ExUs55N/WFox7gN9oEc8+wrBYDoTT5FYMlvn7bl62Zce1qPLzL5
X-Gm-Gg: ATEYQzwled4CikrmR1yTfjGkTFwSo5nRxx6m+9yk6A4pu6tDzN5kI6uLEtrc0RsTfRx
	LOg0DUqDd2cxiJP58OUawx4ivEVq99zALMJdnmgrpO4Iad/goS2mqWzOLx+A7vU6Rn3hCh3jvE6
	2qvZz+kfgXwmwKIG/laa7JjsSqqHUxZq3NKIC/xcE/2eF5K+L6LZrzmJvg6W8D/vIdNncA3AAeJ
	8piOrbbpcDoZwzToT8TW/DpiBuLe0QIeooQK+/lKXS0sEUVbyzLLI7uVx0gSVV2wH6JXu8QshTt
	UxK0lKqEH73L/3iHloLuUxOOVWBKBpAXozJGzbY/P8C9dP1YoMXcGCKDyl9SInD76QkmTaRffHx
	O+ttE2LJOLS9KC0U09m39Z9dbPpOCYFXb99oXFaLW8gZN+PN1E6wzwbdqokrIDjQoB6HD3la/IT
	ZQmbGuQS9OpW3i6Nurp6Ch4UdLgU/jpp9WHe242sgWC9AFghLywf0=
X-Received: by 2002:a05:600c:160a:b0:486:d76c:fa21 with SMTP id 5b1f17b1804b1-48735166d0amr57756515e9.12.1774856174056;
        Mon, 30 Mar 2026 00:36:14 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:13 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 3/4] staging: media: atomisp: reformat block comments
Date: Mon, 30 Mar 2026 10:35:48 +0300
Message-ID: <20260330073549.5782-4-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing asterisks to block comments to conform with the
standard Linux kernel comment style.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 6420436d88f7..c65a5be8445a 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -100,8 +100,9 @@ typedef enum {
 	N_GDC_ID
 } gdc_ID_t;
 
-/* this extra define is needed because we want to use it also
-   in the preprocessor, and that doesn't work with enums.
+/*
+ * this extra define is needed because we want to use it also
+ * in the preprocessor, and that doesn't work with enums.
  */
 #define N_GDC_ID_CPP 2
 
-- 
2.43.0

