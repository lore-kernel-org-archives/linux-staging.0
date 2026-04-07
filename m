Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E767A22DFA4
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572717; cv=none; b=u+89eivxO+ZeNA/BSeXl2kxmZNti+FRvLLQ6p6uobOheh7wPbFInjwPljDzy3r1JwnkWFwkybPm6Ewd69ziWCphdgTu58X0F3OezsTgIcsHbrY3A/cDNo+VT2BCof+UtOHA8MdZ/UzOLIPteUNYOVSx4NgEjdR71bNV2ghDRMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572717; c=relaxed/simple;
	bh=36Hh0CD9QcmzcbGwWZP6AHgcQCeTNkIgPdlyswWvipI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuoQB7WiLgCgcTEF0wSr8romt7/tcMVHdN3WcbMwQSn9stcCvQ9WWj6Dn8q5+ptVk4+F11cF91m4/9QtBDN/162lizj4TDU9pP+UidhxDoyKKdn3Z0THztnZpFYsxOtAkdX60SiPe5NvQvSDuItn3ACXp6ZlpR/qSe928gG9SHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACh213Sq; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACh213Sq"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6501d242e3fso4940677d50.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572715; x=1776177515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3VXDE1atFL0oQCMLnmoyCwmwFWua+y8jVs0h3zDUqg=;
        b=ACh213Sq6za5h5Zs5nIkACzlOegekv+83e9Xe4UeDqE/k/xL9KLBJx3v++nVNdwHS9
         chwRaWCDsE7jKdmsyV7idIQIxZOgEKAYyks225dlnQdmPkojjyvLrFhXifE69LDmMZPm
         8Zxwl005viXugvODYxjLw7dY7/6itO5yJltlDyfihlpkT6OcLFjXATIdgaTl0eCTro21
         iVDOazwW7qOuFyZjgzEAD3tVWFrJVuOGJ5/syLjiVSqw6VI0hLlxjZjzCIu5w1jM/9Eo
         qfKdHBes1zKcN/gvCRbyK70+swNBtP8CB164Ci/BMCqZ5TRXh653GNhKdSczmbgPZgUg
         lxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572715; x=1776177515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3VXDE1atFL0oQCMLnmoyCwmwFWua+y8jVs0h3zDUqg=;
        b=YjefCo2owUKuy3ss/wlOB+/8140RzQt4v8lq6AcO/npqKI5HVVQDqxxfZosJzePcqL
         OMy5zZtjSFG3/bcop0WzMX6DoRT1x4XQ5kDrQ5PGGiqYZdiZvL14BPocQ8l665Vd1JYS
         LukzdyPtHNMVYHNfeYgisT1esAgZ9E7eEN/rizBkaztMKJDbRcaXHlgzn4WZq67+I0V5
         tm0KEts7XfEPstYFt0IviJYIEjn5STwBuMYLVmoyzCWDWjGTY2lQ/TKZv+OYD3csRO9X
         62wlpVnMtdGIaHbg/PlaZU5BaHUEZ3Kas9qlbC9Yif0awFKgW6mEcRJR2lP3MYoOzc7f
         cHHQ==
X-Gm-Message-State: AOJu0YwKn0uLhnRAe9xga9YJ2mKyN/VjrEUsYoxVhTLMpry4KQewt7AC
	J1RiGPF0c/1Af/r30jSPP4lcIEhtSi6rU+61zKs4U8rGIdtmWFsvB5JPfwnjoQ==
X-Gm-Gg: AeBDietlbNoLEsE21gjtyPIEi+2bDpARA29/Rep8+5JM908nQnIQ3MKyNvEX8qsZyTg
	B1GzWQqPfHD8vetsZXC2y/PYZomX7Jcv3KPVe66ZWBK59vfdhVQYYaPUHhFD4F/gcB1RYodazwF
	8rDodO9ZSJ2clK6PiXJdmFzKS0sipHP2It6t+Xp7BlvmTKausIupixgGfdQYMKwTiMHa3Fo27s9
	gfAVDU5mQ6mWEQY0txYPria6moOSjPfjcAsK9Pnj29DSh4K/TiFLsOZ6Ct1EXNqU5K+eMnJMgJJ
	QXRRwGgm+SxDFv6r+wwWCgBbJYNQQ2TRjna+KP867v7XjAkhW+ujstaSxDaqv+qO4VM8gCx55ts
	uihxrFBSg6hSlc/8cfXUy9iBEX4jR0HNmWXD4sUEdzROvUahypP0VWE07fZlsEDpgc7tEmYjwME
	OqhQMO6a2FO57vxRgBUwxxLBAeSCwNK9s/s9Q=
X-Received: by 2002:a05:690e:4190:b0:650:3307:f7c9 with SMTP id 956f58d0204a3-6504880e977mr17361397d50.36.1775572714876;
        Tue, 07 Apr 2026 07:38:34 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a828f3csm7868159d50.3.2026.04.07.07.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:38:34 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 4/6] staging: rtl8723bs: remove unused rtw_sprintf() macro
Date: Tue,  7 Apr 2026 17:33:29 +0300
Message-ID: <20260407143622.9767-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407143622.9767-1-nikolayof23@gmail.com>
References: <20260407143622.9767-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused rtw_sprintf() macro, which is a wrapper around the
standard Kernel function snprintf().

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 82def452b335..cd73fa294a56 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -87,10 +87,5 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
 
 #endif
-- 
2.53.0

