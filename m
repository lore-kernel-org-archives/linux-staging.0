Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63135E1B0
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 06:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812009; cv=none; b=VicVJTjh2xqBwgnbBFhgPreiuEDLVW7OgviiNdydDog3Ga5Kab4HIeKjj1qvdg7csRRG64vYByxqdPjXJ2Wogj6I7LI7+FnQ61hPEmKDQiPz8Xub3yWp5ZD632HVJY/ZJUMtLP3tJxbPgwJPLNM+oeGDgEekHU0S+rEi/tKqz58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812009; c=relaxed/simple;
	bh=oMjEaxWaK8GzABw78h9GyDd1f2Y1YM4x0/BHkzyxhuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6tLT9e9I8N4fHaTfCF1zAm67kgGWdXXDnIydvcERJ7XAdC1JDt0t4ku3fDd9Qv02WVgNoTgKIon+giO6riLqblbImvg7bNfSzFW6AksB5G2uoVpsvh+Vzt69J5sm3nnaVS4Dwvir1l6A3v9dplANMzpU+q87BDPbD3AZCkZtAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQSXfPlD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQSXfPlD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f84023916so253910f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787812005; x=1788416805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cEA9sV0tiBsNi9eOekk/Eu572vric8jOLL/+Ez3K3Y=;
        b=MQSXfPlDC7/TCU8318YmfdR1WtC9v9FUkWKJcWt58PDrPV95hhBUdaP0JRqBzEGPd0
         XGDEnZHPIRP6Ef1jjUeFZnESImmXo1kvXFVvfCaS1+b3+nnL8EH659Ba9Mf4NCgoUo+Z
         M68v5uN3qoJVrmxG6nJbhescJuMqdhr0PYCZ8hJgaifPnUCG/fNnnB1zl+T1VlfENmSN
         KmUZXNKOlqXXJgBukBbd51lxgqEit1OWG7oxDMMDEoAGAj/7RkMySfLRC0EHays59eN3
         JNpZdpZ7EIvcphloy+r3ukGCcb8pCs8Gt9jEf3idygfnYSojKRcGB2RC9uQEj7V97NA8
         /v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787812005; x=1788416805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5cEA9sV0tiBsNi9eOekk/Eu572vric8jOLL/+Ez3K3Y=;
        b=Bu/j7mZIMO5zUTIF9+SY4ihqy7rgs96eVD93cQD5HStm/QdHX9tMiRc6iFcUMsW0F6
         Flmp0Gfam6DJkGQaGfSv6tUhkSCSfKzuztp6ZbCl5RWOG63wklgg3B0Oc6masl+QvmJz
         qr/Mx+r29g+NXwnPBbNSmf9QYIjlgU7fDQc3iSEEq3Y3T8vTO7OICXJBeYZAXMo3a5Ly
         g0HCZd5GQKla6lv5db5CH0RSlYFIPiDqxSFNfT5NRhVMZRlodbJS7rYwxamuiabyrBhx
         Z/LzpkqLpUHD3yp31oeLz5W1Ql2rUjtn7+PyejEVWegdlkIDUCbuFbl+pxhDZ+DuQwgM
         OERg==
X-Gm-Message-State: AFuF++nZ90iJSuoYL7ezYlCznQrrWDdF8+cOVHjFPCLthccp1i6Fd34l
	j7Wpeh6xx82Ni6llqIB86WvHhgMIq+e26db2zu/UDkOs0kAv3JqkbqoQ
X-Gm-Gg: AR+sD12DGXv7+teSvi1jqDdS04YK+Q9D5Ssk/xMNQMqPS7ZvFw4KLiLinRMeGdwjkH3
	ic614CjS9U1/DyKXA5IjOjjoXznAg8FMNF96wQfMQu+5QPWMOJvpEtxr9jupvsiOMDc47j3HQ1J
	WoNwuumUxNBivUKlGO+2AKDS+D0TVvYZygMmSU5VHDxkI2Xji/9NqDyQF3rOMEiTCmaWVKg4KXW
	8PFRSPYC+43r3QNVMBLSrJUInrYJATAZjl2Kc6wTUpwe1RS8YIrqJpOvLpCcQqS+x7d2rHNHhcl
	zifxlwHbXHxPGhE7/Nu1Y4QbLE/654xr38vaDNM2DnVAhvNXx7/hg+RZNve6rnoIbpRM0Qb9+hU
	OVEzx3mdrekH9S3Z/yWtr0WuONITT0sz6Sd1566GJeQkS9cCUs6SY4Hbr6Wp7hqYXkgJwI9qA7F
	A6UXrSfBwOC44BWZmaTtjr6RoB2pwJHT6LK44LKpXSHZvw/rUyH7/mOkhb/fBgZ0oiHPTvuz2hM
	w/wm3deX/jH5FVBQ+aqAjp4dsbesUY/h1yQdFY5rK0=
X-Received: by 2002:a05:600c:1382:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499dc70b76dmr120592805e9.7.1787812005535;
        Wed, 26 Aug 2026 23:26:45 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4d08d86dsm24536605e9.12.2026.08.26.23.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:26:43 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: wrap long prototype of rtw_os_xmit_resource_free()
Date: Thu, 27 Aug 2026 09:21:37 +0300
Message-ID: <20260827062137.12937-3-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827062137.12937-1-godanaemiru@gmail.com>
References: <20260827062137.12937-1-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function prototype exceeds the column limit. Wrap it onto two
lines, aligned to the open parenthesis.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index c5f90a906..4a3c3df5a 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -49,7 +49,8 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
+void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf,
+			       u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
 		kfree(pxmitbuf->pallocated_buf);
-- 
2.53.0

