Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981910961
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="hAtc2ojr"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b7f6caf047so93753339f.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296798; x=1703901598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7kA13qzzRRivJTH6xVTb3Xz2KZfH2aJFCGhcmqO778=;
        b=hAtc2ojrt2EDcsUItEHzEH9eWgG/tawJZUZm3S7Wlcoc7SOx/mfMB+0ydqda3oGpus
         t+AuZTIHqEbdHno6EdGVgy4KIE2tQkIvV/q3o2LaNgY2eUkF+y/3LuSFJz0zG8lk61mt
         mkkeOhI97QD51PGpqK6bY7sI5EeTy32dg5r/wDajcFesSEfeblY0lKQF6Z3sBVcNdkb6
         IBG1ko5MCzUEz10iTFzX0v6ZKwAtobKDAAIdCu9QdptUgARXmqf2lIcnEYqG1J7TkSDA
         vHrD8adbGjOKecw4Ak9hd6mgeYGRZ6gPXKhfVDjc9urBhbfkCYyuHiNPMOVap+KFa4vQ
         9dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296798; x=1703901598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7kA13qzzRRivJTH6xVTb3Xz2KZfH2aJFCGhcmqO778=;
        b=D3z+jr6h52KjZvXDU+o42gmfUdudzt3gZ2EdxkZBg5cqfoBVyB/PCKxGeA5SDqbu3t
         gpnxBlSgj+PQ0ouHh0TM2hzCBc/DFHrGuPJCiE0sfeDetKkc55PkPYzGjlP7b7D8wvtA
         w6rFohQzNC+5zmbcLiaqR0XwT6pb1jUVZ3+bM6xPZJ45HNYFhQVz91Lxz716qm+nFCKL
         S764Ld9wRB6/pMQ1pkie7xxMF6asST5QoRGwpudRMnQ4eI1lgZzN3m7YrNn8z0/LwNCV
         ZvPmXMJ2hz7ZGs6GNm92jPpLeNVAptGJrnfKJrt2Yn40B/p2jr8qhx3ffCGQ4MTtI8s1
         xzhg==
X-Gm-Message-State: AOJu0Ywn87YcbDtpOET8HKByZ/25nY2PJhnL8xQRjeSEdvl9WJU4mqvh
	8wSD8nr1K/y4nv4zrZtp8b20W82bhOG3tQ==
X-Google-Smtp-Source: AGHT+IHJrmdVcS/p38eP6ADGP1VB31bRc8vMArDnQ57xjTcyZrF7UZsSbZpO3rutzFv05+ryVFS8nQ==
X-Received: by 2002:a05:6e02:370b:b0:35f:b06f:9c99 with SMTP id ck11-20020a056e02370b00b0035fb06f9c99mr3010001ilb.64.1703296797838;
        Fri, 22 Dec 2023 17:59:57 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:57 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/20] Staging: rtl8192e: Rename function rtllib_WMM_Info()
Date: Fri, 22 Dec 2023 17:59:36 -0800
Message-Id: <20231223015942.418263-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_WMM_Info to rtllib_wmm_info to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index f3de04b98803..7cd7ffcda58e 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -82,7 +82,7 @@ static void rtllib_mfie_grate(struct rtllib_device *ieee, u8 **tag_p)
 	*tag_p = tag;
 }
 
-static void rtllib_WMM_Info(struct rtllib_device *ieee, u8 **tag_p)
+static void rtllib_wmm_info(struct rtllib_device *ieee, u8 **tag_p)
 {
 	u8 *tag = *tag_p;
 
@@ -888,7 +888,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 	if (wmm_info_len) {
 		tag = skb_put(skb, wmm_info_len);
-		rtllib_WMM_Info(ieee, &tag);
+		rtllib_wmm_info(ieee, &tag);
 	}
 
 	if (wps_ie_len && ieee->wps_ie)
-- 
2.39.2

