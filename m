Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DAE3B6C07
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513123; cv=none; b=Mfogp3eLVwWV+IcYVdNby/1JBWA24MDI3/6y81RMXlbOQ3jZqs1VUZ+BMFQ8DemPmLQJRI+WId9e7ZJyMszcmIej+JjsErjfztDClw4B37/clWmOWedE+UjSyEuRz5dESd1k8FYp9IHBjFamu4JAGc2iWqcZsnZLcNg4ear4OB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513123; c=relaxed/simple;
	bh=Bd/5OfzV7Sarf3QWBs7/bSDFPUaIF5mzDS/I9XfZQvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCvD5U0Rkg62llDwJ+1iTIKNlSMUH2Cc7yfW+L4pyYjDXseJ2pwSB2tVPgclzHcVOuJtV7oQbBtdNOfs04wUS4MUrGCn0E9yRWnj1TueRi7KMzV9Cs+rgRyB0AZ6NKdVBVdOVbT/OLSz3jh9Jqg4uoDAQvZDYA4UbEsRY5lrEos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJR5qrYi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJR5qrYi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b98652f05so65461f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513120; x=1775117920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXqWD/J7jCnsXdMGUm54CWym6mF6LX/bj6037DcUiaU=;
        b=UJR5qrYi75IQAGQ28u0git/aVOlateKCQYGH1G2DNR/Ga1HMMkU0m5B9udDEcU0ssE
         S+Gz3FLck+2Wm92pk9XWQ/XubGuTu+IlIwx/HUJ++eVh1Nd335bi2xty9AQK/Fhfq28w
         p6vKqSfdijqz/XhNKCUrZZhRK5rhzFLoFAdwbObb2qHJUV2FeT6RvDXs/BGT5w38Lvt/
         W0fsdjz5TQmQEDGhKrEHECUViQCtjel43c/zGIGSPUcRBfsAkX9OzLwixjI2YyZ+x5aR
         47GpblL7rwHVVLQQAHNjBjT6+KzzVHuuLOzE9YnRd7+WPBL9xyoBiNzGfE/3teEpQZ/L
         ixHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513120; x=1775117920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eXqWD/J7jCnsXdMGUm54CWym6mF6LX/bj6037DcUiaU=;
        b=V35LTN9Xh6OXJWbGpbeP5ocjRuep5MV0K+Gpmos6WwgSEsucsiQrJTbNVkv5D0JJZS
         DJVR5vyY65ORJG3RdvcC0FswPquU/UxhyLEhVzVRziS2c88R6QmqNXZAPKg7kh0LrR3h
         0EIDASVFGg+Nh53abjTWMhCUYzLsQYsIW3Ywj1eOI/36fTH3P+tnsU6jWu0ViRxT8y/s
         fziQBbHwjZsmu7ycebDbo8TvsF7CUBgqWMni9gPJGh9X191SkXsNLbNmvP5MIwW3GWwh
         bVIOQoSj8rDcTOcYRAPm9EkJ1Hd9jKr9RLL1WB1rkE0RQ5OGIuaVNBKd6PKNhHmrYQ4S
         qTGg==
X-Gm-Message-State: AOJu0YwGjpE3MDa0znIS9X4E4GzAmyqdys1fWqkkaYALNFY7kTHxHqxP
	SFwMqhEFc1qCrmlkWQUN/RAJEKwBdQ/t//Yz73Kafmh69S+Q4Uzi6Xi3
X-Gm-Gg: ATEYQzzoigdjz+8TwTT79vPWgwHmeC8P4NS1Uz0vUIuHB/QNzoAfv+cc7QeBeksRCZI
	ZMBwmm772ZTwI+p3Ev96NWxRVa8bivk12I+j8oNKgJhqMYXsxAd2FwMgVHZ1nfl9b8BBKak0z+J
	d26wfbv05QxmCm8wYMx0z1UnS+bCf9+Cx6v6cQZ0f0TAouYZee/W61o5JO1uJCuIS0yF8QjdJ7Z
	QCm4fBKXl50WC3Bz7JAllxMI4ZzlheHAdeuUguyiqvxwQ/t3PMHxt+5HipUghI9Ah4+Z4Yr3xaE
	zHgZ1s4PlFMz8jGpxI5zhzkqE8/MlLlvFyYbDIC4aKuPhqio9OSYzEu89RoOP/Y8Osy3rOcZHFC
	N1nZ97QdXzE+g7NjwtYyYROywMJptGTbzvPu/wLLFEmQFmaxxQXz0XYV/5CEAhUpbkS6A4BErxs
	0wN3JwPPExxk3FwF7sxwy+b5I=
X-Received: by 2002:a05:6000:4285:b0:43b:4136:1e76 with SMTP id ffacd0b85a97d-43b88a0d2camr10029074f8f.29.1774513119440;
        Thu, 26 Mar 2026 01:18:39 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm6130521f8f.17.2026.03.26.01.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:18:38 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 3/4] staging: rtl8723bs: clean up callees for sdio_init function
Date: Thu, 26 Mar 2026 09:18:27 +0100
Message-ID: <20260326081828.6314-4-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081828.6314-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081828.6314-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let rtw_resume_process_normal return errno returned by sdio_init
instead of -1. sdio_dvobj_init returns NULL on error so leave that
as is.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2dfc8..e943dcea1a21 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1135,10 +1135,10 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	pwrpriv = adapter_to_pwrctl(padapter);
 	pmlmepriv = &padapter->mlmepriv;
 	/*  interface init */
-	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
+	if (padapter->intf_init) {
+		ret = padapter->intf_init(adapter_to_dvobj(padapter));
+		if (ret)
+			goto exit;
 	}
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
-- 
2.51.0

