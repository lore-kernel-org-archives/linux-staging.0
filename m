Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D326B2B0
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 06:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126091; cv=none; b=r+WgEGWtPTU8GuFrvRTb6Uq0ncC/8PyXDgHCpIgsykyfXDeYgj39hqzTXO7dbR+IT18VrVGv2ZXmny4Sr95MHQrolPjqU0nmKRSDUoCi6TS7toTC8EoIt7/1SqYbH082PnzLravMqQ+zYnNhZq++CSAbxLlh7ZDUaVnxRirYTmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126091; c=relaxed/simple;
	bh=5XYnrBndNSgN3wqzh/1ZQgI2QbI7BEqovffqJ/MehXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fa1E7OOr0u0LYDBdbMITyssfa7wzDp8iUEbA8KCBungmWjAndIqyozBEMeJaTtcg8ddkDNOG1PmVaFFcKmSta2iNkCwBZeKpeFqCN13HINB0h3Dw+BylTdlOuZjypDKGF3bzgoGwZjIehkPPOHI/5iBpQMijruxF3IkstgOyc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugx6L2CK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugx6L2CK"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso2292580b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 22:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766126089; x=1766730889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGKDt1qSwrqUg76PLiBZ0oJHGVHGcWLg6FW0JKlVBQc=;
        b=Ugx6L2CK1GPuMHhKEv/OurcRKcw4bMT7vqBqFXuHQTSZHQ+MjRcdQ7cIj0ldD2pCLV
         hfEo7c5N0NOOWjdnf9E0dKYlI7zxHWbygDkjMRvRHipAbtr6vvYcVTGtK5YMJU/MppxU
         yB4JDYpiCmSsMKna02knpXtS8SmCiXJftJ0cwZ1EMmefsTsgSROzAE5Am9NZNVnGJZSx
         MLpCVYKSV6TkeYu99j95qmH12y3Z9Qf24x1EZM7n9BOuJ9Ocm9iDDQZ7xGlcTiYJ0wfK
         /cPzEXCRGs3pLbap+aW8ixDCgSM1OttTkVfMALXvdGQvFlhal+q2m6Uuwinkl+aP929g
         Dm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766126089; x=1766730889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IGKDt1qSwrqUg76PLiBZ0oJHGVHGcWLg6FW0JKlVBQc=;
        b=I5ctJzKQ42Xd+SSyIb2H/wL4vxb2NLW72s5p3fY4R+D8EvXPWdr8LqdOqLsZoAiRq4
         wLytByWaBhNXhWpYYYOxkQgmF5V8OcL+0ZaaJKhRBxhqKuITM1UwFvzXlem1JJxf6a1x
         ewKJ/J9LCT6bZxLi4S2m/AfyWKaUlEoCy1W3tj1NCgX/7UsBfS86OGiu5CkP1fHsqJ07
         +faQtTx9RnoO7XYGmgvTnc/GILecUjPds06Hi7ixb0XrZa0XPcHpNICJi4qhNMaHddGC
         CA/aDq5N1HiSjuI9oOHznlscpsHivFSighOayxGF+52yVJIq7QObTgJGo2iynK6JMo+K
         lwIg==
X-Gm-Message-State: AOJu0Yz+fPeN4YTiEx++oubfLj4WxOA2rwhr1N3WqL/QKtWUWnO/3yH3
	oozMXriwqx7LVL9LuLZOWUg3lhVwe8+JjUqZBWn0nsdYNsBQBdJtTwyq9A+2Kg==
X-Gm-Gg: AY/fxX4HpstagjwXGg6CkWz3Jwp/w3ov8c7PeAffbGD39MawsO1zoOjZ54YG0vnuFEO
	J8FIecLElsFyibLD226Ooq1lX/bn3gvb5D0ltazCbj7nA9ib6e1WGqYqNVW0awiEmICg0DTl1JV
	00pcA0hOC2FWQkeJx3diX0GOzDDV7h4kfaiUXDO4qNQkfd4Gl2GR0R9zXX9Y7eDR+MJAW8iiywE
	VvMIyUWVLw5gHi7lc12qb+2Zyi88lzeGW/nf6cPllFUweiHALaENFZz/wW2gsm1RbDB03lmi5UI
	sDsQU/wdXsXaS6DHiU073IEh4ghH4m9tdFUXonrfuyNb/AJRIcRFgwDKyT58mTuj9yTQu3rVGYi
	oRTSSX9CqLNfyHM0awl/+3OcRk+35xbZ9lB0emlp9KpdyPHnDsoLXM0wrRXs7RvKXroCw1a7xsI
	ABJK2ZhwDIsXES/+OQIjK+
X-Google-Smtp-Source: AGHT+IEitu8tNrXhhhFpVD5EHWXl8DR3AJgGt+GdQlDwp+9KH1fCButUnlQrtYH/d8GR3w5DWgZAow==
X-Received: by 2002:a05:6a00:4514:b0:7f7:4a39:55cd with SMTP id d2e1a72fcca58-7ff6178be74mr2019244b3a.0.1766126089145;
        Thu, 18 Dec 2025 22:34:49 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843a18sm1282071b3a.14.2025.12.18.22.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:34:48 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 4/4] staging: greybus: greybus_firmware: fix long macro lines
Date: Fri, 19 Dec 2025 14:34:15 +0800
Message-ID: <20251219063415.46818-5-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Break long ioctl macro definitions into multiple lines to satisfy
checkpatch.pl line-length checks (<100 columns).

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/staging/greybus/greybus_firmware.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/staging/greybus/greybus_firmware.h
index b6042a82ada4..f59a2def3d45 100644
--- a/drivers/staging/greybus/greybus_firmware.h
+++ b/drivers/staging/greybus/greybus_firmware.h
@@ -64,11 +64,16 @@ struct fw_mgmt_ioc_backend_fw_update {
 } __packed;
 
 #define FW_MGMT_IOCTL_BASE			'F'
-#define FW_MGMT_IOC_GET_INTF_FW			_IOR(FW_MGMT_IOCTL_BASE, 0, struct fw_mgmt_ioc_get_intf_version)
-#define FW_MGMT_IOC_GET_BACKEND_FW		_IOWR(FW_MGMT_IOCTL_BASE, 1, struct fw_mgmt_ioc_get_backend_version)
-#define FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE	_IOWR(FW_MGMT_IOCTL_BASE, 2, struct fw_mgmt_ioc_intf_load_and_validate)
-#define FW_MGMT_IOC_INTF_BACKEND_FW_UPDATE	_IOWR(FW_MGMT_IOCTL_BASE, 3, struct fw_mgmt_ioc_backend_fw_update)
-#define FW_MGMT_IOC_SET_TIMEOUT_MS		_IOW(FW_MGMT_IOCTL_BASE, 4, unsigned int)
+#define FW_MGMT_IOC_GET_INTF_FW			\
+	_IOR(FW_MGMT_IOCTL_BASE, 0, struct fw_mgmt_ioc_get_intf_version)
+#define FW_MGMT_IOC_GET_BACKEND_FW		\
+	_IOWR(FW_MGMT_IOCTL_BASE, 1, struct fw_mgmt_ioc_get_backend_version)
+#define FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE	\
+	_IOWR(FW_MGMT_IOCTL_BASE, 2, struct fw_mgmt_ioc_intf_load_and_validate)
+#define FW_MGMT_IOC_INTF_BACKEND_FW_UPDATE	\
+	_IOWR(FW_MGMT_IOCTL_BASE, 3, struct fw_mgmt_ioc_backend_fw_update)
+#define FW_MGMT_IOC_SET_TIMEOUT_MS		\
+	_IOW(FW_MGMT_IOCTL_BASE, 4, unsigned int)
 #define FW_MGMT_IOC_MODE_SWITCH			_IO(FW_MGMT_IOCTL_BASE, 5)
 
 #endif /* __GREYBUS_FIRMWARE_USER_H */
-- 
2.43.0

