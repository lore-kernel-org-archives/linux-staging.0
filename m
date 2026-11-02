Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628752;
	b=J5RZA+tSO5wfr6blazEGI/Onk2+usnXdm5yD+OOTr9i0iViPo1XBsOPbMbGxPiVTy1Z0
	 jXFSNQ4kBLJwaA31oOBudjIrR4ggdkvZSq/hcL+tCjFT5Fmnr3LIswpx5D75QOhj8+wi7
	 9+tCx+8hzqqj8vG8wlgyr7VDtRMKl0x17f5F72wPSvwMCCCcr9PW/ZVzdSy5sI+DV0Sva
	 jqpXtg9kdd9FEgh1wlIuH52svhBTlOx33yIae+jozk6XLx5pb1Es1I1U5h+gMY8rbTtD0
	 6Oj+CPFoH/aPXZAvV+yHPUmMM2SltSlboj0fRYs6sJtga+e+rrI195OOP3hjqThnXmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zbt90t1wgRfp0YpX0T9Ft+WXbhZP3kkNCP+Z5PBV6hk=;
	b=LFx9Yy55N60+16CgkkSpD1FhJ8lLTPgEx80/ouPEpr6342X8TTbZWlQXaNFCxMp/lGHG
	 uVvcBLml9KfG4FzMPq4l9cWt91yPu/0wsTQPs9JRmBEfkNffeTLuZznzb4W4JJf864vza
	 xaXKqu2g20Dt0hsXBu9UB1UD1WTK270QLqacrWugLFU7GMUkUllZHXMr29iEDjnv3RXbR
	 JGOmWqgvC4WBotWui8K3qnPCu6k865U059lQa61pnuyAnoSokC1Xx0ex9DvoJ/vnsfbD+
	 UJ4NYUBkzG5+vucj6sfCMvOAtktwWoXx/nyZJZGqRjuthc/KdTvYZE/sEGVh3g6lhWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cT+s8qQ5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8956606A324
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 14:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8956606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cT+s8qQ5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so29229315e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 06:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628750; x=1794233550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zbt90t1wgRfp0YpX0T9Ft+WXbhZP3kkNCP+Z5PBV6hk=;
        b=cT+s8qQ5pIrPAZF8GouXqQuutdV7SZbRennIwto2c2yS4Gsel/awfPwl2laMC2hGA/
         FcN9HW2a7I2PrwuHcTVq50jqSJ36VYDeeDKMuP1IA3YJE5JYrrmSxcg43gtqBVHfpm7B
         4Yg6YkcP32ZMF87eDsCb/H9G6Nc3PMxp+vTfSiyBhMR7cmWiYCpaHscP0KH+NIsjxLVt
         waa4z2vVosDxrnA4pPZ3mhZNLjk0ZdgzP7rqoq9owAGdhrP6x1qMNLwm7Syjsj8GC/9v
         wfW90aSqGL7mkK5SkibA0GselWArv6szpEZnu6Qbd3lFEgbybK93GKdaQx11CapNOOsQ
         rpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628750; x=1794233550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zbt90t1wgRfp0YpX0T9Ft+WXbhZP3kkNCP+Z5PBV6hk=;
        b=Xf26b7T2tNJp0sCq3w/J/pBMRpQ+vuF1CKFn/8l3Vrdz7OaaD7we53oU25lasuH0L0
         OXoacGPV4ToAAiFtaPDTv/hXRCgTsQR7nOXxYehIyz+3LqdZe6CaWSqvxjubJGrMjm0/
         wjwzDMa6a6s6lGPUL8yk3+6d2QTJvQd061LNfECo6lj+6b7+I/AhmjH+ACKCbCt1i1xW
         IRN1X8AgBtNphnF4US5rY4gr6admtTRnjK+sWuiVpGOAv0JgQFR9mGM072YJizaQ+vW5
         HQD6mSoVnZE2a7XWkUEEReEsJsJtgKrxkIvSSiUQNsvwv7ECU21oQ5MEYb9gmbH+eWAE
         4I+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVBDv20aqkC8mZSUTCTQ+g7CR5UJmQ7W3v3ayBth/RXZd6Hty62GH/yaFIqEUJ80luN7BAiw1yBOvsAAXx@lists.linux.dev
X-Gm-Message-State: AFq9FYJLVv5xxkFJ/43lUQFrQdh8zFmBYruYzGHzWpTHsCccbnnSvQ7a
	tpR9odVpIaajn1oZRn/bEJr8jBbe2NVJpmgsz3/zT4t7s+VUS6TA/h/Y
X-Gm-Gg: AYBFou17OuyQh/KWyjT9Vi5Vrc44eFV4PHKNu/nIC7OWEU8QF8/7yZMxEIgOEFshP93
	i9JUJg2oUqUgetup4VGG70XZSrdaiorMdb1CgtgLpJABx348TIfMVRmrG3TCXf9jlTW5asMfzY7
	Kf8UY5PjQrq4dqFDLMuPSThU9NPA/Ok8aTdEM1RwepUi5cQpwFeSqz0ulfY/RuHs73g7W0Jtx6D
	cfB5rZQqsqHmu9yPcgqHJlO7uMFfSfmFm1Me8zlgq8k6kpU53k+yb4TZJXyHKAxydgEVrQy6AFh
	1wsmpa0BKlv62mbp7s2yfaDYo2ys3S6ybmCcEA3N9Ao/CukNi88Bfweu6+xp/1m77eYw2ZWEjWO
	eLVbTULqus+oQJgQBjnFRj5WHT/jnv/X/IezIELgkECs6/AAb9dacXjhplu1giLyKcHlWy3Hqvd
	3Fep1gU7EWqPzyCDjOnfdjGlkNPLLdC34bOz7dVyUjO7SJ8GiHFkHIlhu5+NPQBK9kKsMOWZiR5
	EDfkhc+l318b62SEyQPfOHoJmpw0VzKAUCA/Y6yx0YYZbFqCUTSOPvctNx0Sq78lWZzAeUdUJX8
	9W4ZOG0Bpt8MbUaYb8zPc3WVoHSbeFwE+xAvGCtz7xZlvTQeFr6MM1NfIqG9jll54FYwk9H6xFw
	85myxHO/xy3oUZWDppTIRjD+D9QmIZ5kZxiLW
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr219933115e9.32.1793628749862;
        Mon, 02 Nov 2026 06:12:29 -0800 (PST)
Received: from x1e ([196.189.89.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm301441565e9.15.2026.11.02.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:12:29 -0800 (PST)
From: Maritu Hone <marehone12@gmail.com>
To: vireshk@kernel.org
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Maritu Hone <marehone12@gmail.com>
Subject: [PATCH] staging: greybus: fw-management: validate firmware_tag is NUL-terminated
Date: Mon,  2 Nov 2026 17:12:21 +0300
Message-ID: <20261102141221.87646-1-marehone12@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fw_mgmt_ioctl() copies struct fw_mgmt_ioc_get_backend_version,
struct fw_mgmt_ioc_intf_load_and_validate and
struct fw_mgmt_ioc_backend_fw_update directly from userspace via
copy_from_user(). Each of these contains a fixed-size
firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE] array that is never checked
for NUL-termination before being used.

While the array is eventually copied into a Greybus request via
strscpy_pad(), which safely bounds its read and always NUL-terminates
its destination, three error paths print the original, unterminated
userspace buffer directly with "%s":

  fw_mgmt_backend_fw_version_operation():
    dev_err(..., "failed to get version of %s backend firmware (%d)\n",
            fw_info->firmware_tag, ret);
    dev_err(..., "Firmware with tag %s is not supported by Interface\n",
            fw_info->firmware_tag);

  fw_mgmt_backend_fw_update_operation():
    dev_err(..., "backend %s firmware update request failed (%d)\n",
            tag, ret);

If a caller supplies exactly GB_FIRMWARE_U_TAG_MAX_SIZE non-NUL bytes,
"%s" has no terminator inside the array and reads past it into
adjacent kernel stack memory until it happens to find a zero byte,
leaking that memory into dmesg.

Reject the ioctl up front when firmware_tag is not NUL-terminated,
mirroring the existing check already used for the equivalent
Greybus-module-supplied field in fw_download_find_firmware().

Fixes: 013e66537273 ("greybus: fw-management: Add firmware-management protocol driver")
Signed-off-by: Maritu Hone <marehone12@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..2ee609dd67fb 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -419,6 +419,11 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 				   sizeof(backend_fw_info)))
 			return -EFAULT;
 
+		if (strnlen(backend_fw_info.firmware_tag,
+			    GB_FIRMWARE_U_TAG_MAX_SIZE) ==
+		    GB_FIRMWARE_U_TAG_MAX_SIZE)
+			return -EINVAL;
+
 		ret = fw_mgmt_backend_fw_version_operation(fw_mgmt,
 							   &backend_fw_info);
 		if (ret)
@@ -433,6 +438,11 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 		if (copy_from_user(&intf_load, buf, sizeof(intf_load)))
 			return -EFAULT;
 
+		if (strnlen(intf_load.firmware_tag,
+			    GB_FIRMWARE_U_TAG_MAX_SIZE) ==
+		    GB_FIRMWARE_U_TAG_MAX_SIZE)
+			return -EINVAL;
+
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
 				intf_load.load_method, intf_load.firmware_tag);
 		if (ret)
@@ -457,6 +467,11 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 				   sizeof(backend_update)))
 			return -EFAULT;
 
+		if (strnlen(backend_update.firmware_tag,
+			    GB_FIRMWARE_U_TAG_MAX_SIZE) ==
+		    GB_FIRMWARE_U_TAG_MAX_SIZE)
+			return -EINVAL;
+
 		ret = fw_mgmt_backend_fw_update_operation(fw_mgmt,
 							  backend_update.firmware_tag);
 		if (ret)
-- 
2.43.0

