Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A253370E0
	for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262454; cv=none; b=McfOOxJGEUXkyBiJLap9e0AtecE4yDZkZlUjrblTRi8mh5UPli1nQ5gcL4sHPOYKTwn3dCd2aSxe3995F1LdmAe25icJeqBRO53FRezvz7sXe3oJve8GCJyhUqzsojJe2/mqgb6T8HOrc6rqteBl89zstDaIyC2JJvH+9SlwrUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262454; c=relaxed/simple;
	bh=pW4aGxkyJzlDY8mzHVYKMSn48+6DhevnhNrwrfll3fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7lyY0sJUDz/JMyYXraJX4WsySXx3rGlmljRWQ2+L7h8oNz0qsh1JpSTcti0Xv3vVDWtvexFjULpx+BUN97KK/W6MZvJPEZq3In6E71G8blHA4HikQivYyDYKdgCxlXW00kpjcgzIZ/HfXBdHSBCJdAzYxP59cXKugasUwYNgwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjLz1yqP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjLz1yqP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1229752b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764262450; x=1764867250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExKtXnnneeww6lun1Yn14XCHi1VlQQEOBvjuqcrngAo=;
        b=FjLz1yqPwHOAd4BEUmVQACXZd9p7TeZWpdjXKR7O4slquQmONhkRUgq78MKplB5bU1
         +Wsm029ikmbCX0R80v1k5z8aqSfsOwuzODgL8wUO570OKlMfiJhy2OfWDRbl3I+txYWS
         RSpHKTYsQClIjLWKlL4UF7QOCzrOti70cLF64ccUxRnzdhbvDkf6n2Yo297Ljtqrrn2A
         a/ohyMnyHq70EeNzrdKPZXdS0Y3C/BUxt8KOMSYsowR+cVKvwK0d6aW3Zbmz8vNTfkMI
         rmzYBPclIWZ6F/ter1P6U+MTEOXPbBV/S7LZ0LxIaeiwV1iDPxSe+YCKm+qhktXRYUnb
         P/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262450; x=1764867250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExKtXnnneeww6lun1Yn14XCHi1VlQQEOBvjuqcrngAo=;
        b=xKdTJeeJqPOywc/1LgHufmAp4cpyvyC7Sm1GuWK8rgHIQAUfl8O4BpWr/CxSB0FKXl
         w0pQThgjizDe5Mi4ijOHbWa1Md+jVI5oUMaOBNWr7GtsS03Bi3s49xt8MjFIBnxquCPF
         8EWHkuzZhECpnjv7a7i5aNZNJli2M/4co12ccrHdUfZmTgoU9w+6hXo4rYgA1e52lso7
         uhSE6uXkfD+BMUhLVJRDYC7/bB0OPyvmeSAD/oUExj/Uveh/yLasZAAq/YGyVEgy1MNh
         /idvuKOy9y9wgHZcf1y7QREDrnXF7zZKbR4GvDnlF+X2lP+BhsqxgNpLItI36b7x+fpT
         o4RA==
X-Gm-Message-State: AOJu0Ywrwa/zHXP5vJ8aGU3ib/JWqJIOR2G8EhJVcDa8fgEeXxYk7qLG
	BKeuP2NoDouwkssXbzYXyH6IVM5s8WqtT1tWaZySeyWUHIVBr+UtB+ZW
X-Gm-Gg: ASbGncvSbd8ESyAGp0lBWyyg19Xf6Z4dpetVrm6T4tkQo2Djpj6JNgCq+bmp+DLdTAO
	Xco9VLgEHkqyo92gorPG4W0vZFJiXAZdQrt4uIjK5oUI+j3CmL6bZjun3sE8Er8rijDcaDXSnxN
	Fl4P3GhXhQBBk7dh/KMbJWyvUIsgeVI7JPQOdM2XW4hvUKBI0qByRzSCcIgKjvE2jJXJSA7/t6l
	Y1c0WxTu+2wB/+yM3JC3ibzXhSheh8eo7O1cxxVXepgbNLI3NCL3oNtrzp1oMkOYLk0uJpj05uu
	UB/yVcHZfRpzA3iz3idBbuZLmHS53lKBku5QErEqyx2Rm0IBh1U7cmss9ZNclFsygT/7ztTKTMv
	JX2amV9XC3bgW5c1GOV21BmTMFnRq0l46zOG2zz47vAFZfWvn6OpbQxJSv4NNyS2XmEBrvUPdwt
	13dwxXgpOMFtmNYNxUirkGxUrujoOqK4J7wFfNDtA5qwcc+6JPC83Hik/DeWKT5a8VLa+YXpETl
	esQqYfclMbR8HL9LvhLb/kRNqHEBnkjMoi10fiiSX8OsnksW3AmvrJKbiizVPZ4OnDSI0zfDmXi
	QtsU8FePCYmESzAJt8B5gUm29Axv9nxdjA==
X-Google-Smtp-Source: AGHT+IFJ1v7QO6JslFxK1flOhHU+oJ1gZXfCghqcfNz5B9Ti0HUk4aTCJymj0eR745ra+Bs5ORAWdg==
X-Received: by 2002:a05:6a00:1803:b0:7b6:dd81:db74 with SMTP id d2e1a72fcca58-7c58c999e9emr26931048b3a.12.1764262449642;
        Thu, 27 Nov 2025 08:54:09 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f175d95sm2404197b3a.45.2025.11.27.08.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:54:09 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	abdun.nihaal@gmail.com,
	dan.carpenter@linaro.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v4] most: core: fix resource leak in most_register_interface error paths
Date: Thu, 27 Nov 2025 16:53:37 +0000
Message-ID: <20251127165337.19172-1-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function most_register_interface() did not correctly release resources
if it failed early (before registering the device). In these cases, it
returned an error code immediately, leaking the memory allocated for the
interface.

Fix this by initializing the device early via device_initialize() and
calling put_device() on all error paths.

The most_register_interface() is expected to call put_device() on
error which frees the resources allocated in the caller. The
put_device() either calls release_mdev() or dim2_release(),
depending on the caller.

Switch to using device_add() instead of device_register() to handle
the split initialization.

Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>
Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
Changes in v4:
 - Removed the '!iface->dev' NULL check as suggested by Dan Carpenter.
 - Updated commit message to explicitly explain how put_device()
   triggers the caller's release function (suggested by Dan Carpenter).

Changes in v3:
 - Dropped USB cleanup patch (already applied upstream).
 - Added Acked-by.

 drivers/most/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/most/core.c b/drivers/most/core.c
index da319d108ea1d..6277e6702ca8c 100644
--- a/drivers/most/core.c
+++ b/drivers/most/core.c
@@ -1286,15 +1286,19 @@ int most_register_interface(struct most_interface *iface)
 	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS))
 		return -EINVAL;
 
+	device_initialize(iface->dev);
+
 	id = ida_alloc(&mdev_id, GFP_KERNEL);
 	if (id < 0) {
 		dev_err(iface->dev, "Failed to allocate device ID\n");
+		put_device(iface->dev);
 		return id;
 	}
 
 	iface->p = kzalloc(sizeof(*iface->p), GFP_KERNEL);
 	if (!iface->p) {
 		ida_free(&mdev_id, id);
+		put_device(iface->dev);
 		return -ENOMEM;
 	}
 
@@ -1304,7 +1308,7 @@ int most_register_interface(struct most_interface *iface)
 	iface->dev->bus = &mostbus;
 	iface->dev->groups = interface_attr_groups;
 	dev_set_drvdata(iface->dev, iface);
-	if (device_register(iface->dev)) {
+	if (device_add(iface->dev)) {
 		dev_err(iface->dev, "Failed to register interface device\n");
 		kfree(iface->p);
 		put_device(iface->dev);
-- 
2.43.0

