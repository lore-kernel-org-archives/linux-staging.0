Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1254BEB
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261453; cv=none; b=V+TH2Deuxe/hfUU87VGuhhGniJ6barVhBc+4furn2wP1SiFmIhQvY1gjthO1XPCw5CkJvqrUfcX5dOrkp0gozC9UxgwaqdhkvkNcDL2XEArUtC/R/5kcZmCeRn9DB6ZJL9ytMKWFAdTTLG6PlodoUW+Ee4D54uCL/HGeM5+iLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261453; c=relaxed/simple;
	bh=gVS9SiiP3Jqr/gOO8soEZkMdLYajewLyAHFLwln8wjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vwg8y2kmgBlFYko1eCtbI/jXx23OiAcPWR4VIp93LRdkHkLFka1tXs+duVS840UUjV2bpiteXz3Ho7upLobiZjaBKSQL8uW4tOdN69vVzaHdgach8k+pnn2bZpb5iQlRiW8lj2WijgXOxmJwe2WLMHFUAOoaLFXUVMv0txQpH8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=jzxQTN/J; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jzxQTN/J"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f304533064so9681645ad.0
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261450; x=1716866250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9y3vOCZ0Z5C3M5gLdN2/bw89sLnlW10XMSKoOopYVI=;
        b=jzxQTN/JtrIzQk5orcwxDu1jQtMLPSNBNkMcKQIPRpg5siX2aZGXZ4RNnc5QtYxa7B
         IHPlfu/gl9sTGdUJPhvCQvKwb+a+jd4lS7AGHr1iTqb/SL/bU83v+ZlOjuYIa2w1YFQs
         xHej1IKhue4j6r2NPlCQxs5mOtxyV/CgxSE9CSpkWMr/X4lGVPvqCcUAEhT5BXFStTsf
         z6s5QfhPMgo3k9OQKpE+HNbqt5a2mR/85JdxZIqZDzDqp0tWb0NaOwNXBZ+rKLzStwOl
         Pd4U3pP+uChktdPTkvVhiEUPxC9mQo94mub7FIyHbuQwVGu9qBnRTikYtdZpEkLGUvrj
         4wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261450; x=1716866250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9y3vOCZ0Z5C3M5gLdN2/bw89sLnlW10XMSKoOopYVI=;
        b=ghPPhfkPs6sq6G1prmAouaettVLsGEzgny/eABeWbsKhuR8Bt7hSvEDhfbrioQmRVs
         n2xzblCPgDIucvE5SezeWUTk63HJSGR0vT7KqtM9iZgdAnLuhdoAW62GrOx9GHUm7iPf
         9La/YbyLoxVM9DXIPygqGMS1bo6demarlpDOObh/fmyObARxb7SfYIp/6jvSFh3RARyF
         zOMDegL/Oa62JMwEJ8XPc571neClk8NbQrX9DCkbrwKu2EufcqF3xEjWJkjogDecxpGp
         tfWTt+h92wVxgfZmvq5ixHhssGzveK8sUwarNu0UJXrri3ckP47a7nZVuIiZVmhzvqN9
         Ti+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWKSHHW6V7eixJkjq0KvpoFggMgGx2m6i02oK4AmdhZiz3I4fOZCh4s+F/U5hJGQSUEvieUdQnEBZa9PffIcznqa2gJneGBquLbLxEcw==
X-Gm-Message-State: AOJu0YxXAE7BSotrtSBKHK4vkf+q6JDZpGb/AoLwPXGa7lT/9cdU3rox
	TAEfJabkieiK6CHYhU1aDVyV2z0fCRZGYD/0PYekEmQXM/Of5+Jg/31uy+OKi+4=
X-Google-Smtp-Source: AGHT+IFjkVC8ANjXpaRvethnrKCdkYfNqHmoD7I5z11eexJoDDsjhzYeSydmfkHG3t7A7bSzHN/OiQ==
X-Received: by 2002:a17:902:a50f:b0:1f3:b38:aaee with SMTP id d9443c01a7336-1f30b38ac34mr18877605ad.24.1716261450105;
        Mon, 20 May 2024 20:17:30 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:29 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 11/31] Staging: rtl8192e: Rename variable IsLegacyDataFrame
Date: Mon, 20 May 2024 20:16:58 -0700
Message-Id: <20240521031718.17852-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable IsLegacyDataFrame to is_legacy_data_frame
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4645fe803a15..cdb3ebc77a53 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -339,7 +339,7 @@ enum rt_op_mode {
 
 #define	FC_QOS_BIT					BIT(7)
 #define IsDataFrame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
-#define	IsLegacyDataFrame(pdu)	(IsDataFrame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
+#define	is_legacy_data_frame(pdu)	(IsDataFrame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
 #define IsQoSDataFrame(pframe)			\
 	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
 	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ea8cab9707bc..24136bba64b6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -882,7 +882,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 	if (!ieee->ht_info->cur_rx_reorder_enable ||
 		!ieee->current_network.qos_data.active ||
 		!IsDataFrame(skb->data) ||
-		IsLegacyDataFrame(skb->data)) {
+		is_legacy_data_frame(skb->data)) {
 		if (!ieee80211_is_beacon(hdr->frame_control)) {
 			if (is_duplicate_packet(ieee, hdr))
 				return -1;
-- 
2.30.2

