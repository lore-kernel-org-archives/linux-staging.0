Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B1F36B16
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 02:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709174617; cv=none; b=jkqQ+7nAEjZ3+ldPUZUaMnj7aRcEGsjhMpitdo9jTqqkIITLBxGcJy0VFuFaI+ZlrPzeOdqUNdSEH8KuWXPXkdYj3GLu1Nt4/Wz9bzaVNuDnUxut8n+Uakw5avIfEotHEWGkqkZIPGwW6OfLB7j+FgJ9PYNDSRwzYdlDrsOoVK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709174617; c=relaxed/simple;
	bh=F1ihdIW8vfyX3y6wO2jcGVCXQ20EA2UlCt9aoxu89jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Odl/xRik18JPlQjYXMbbdOCeRVo58gXg7/oOZxV561i+PhA20nkIqIFz3t79HWZvegF9I7/SB0FjnOR1gyIuqiuwc6i77586gY3NQJl5M+waLItn00buVVKmc+QkwwSOgzSTaSL9hyycuyTtzywOJj2NTQLs2FrogPTQGHdp+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=hyCyqcjp; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="hyCyqcjp"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e5675f2ca2so254106b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 18:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709174615; x=1709779415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNnU7s6E97gQJp6cYkW4MWjfZimKMSlrbqPhhGmgBdY=;
        b=hyCyqcjplxXmSgcOnmSzsoUQ+rISVxqlxjyoS/T0w79fDG42T5lylV6wsgeOYjm46A
         5U+vWIB12YROrOJcSXhE3N6BnvQwzIepJ0EqW9tBq6G4DniJTM2CrE0BVj/ZWOUdl3Ay
         Qs0MU1SftKM76VUJOHSLUD87xcuXfbuPEFsZNosnPdQoe0cOzmHUSNytuia3yuIQfG1i
         1ZRXkjebfysHELsLUgGb66ljckPut4KYnAdMtrrM4yzBJlIMRKyPOYJd3cFThxFPf+cf
         aY8H2XVwXQyGdu5ei49ZGCgrXpuSZjV8RgVhUxK5DtBtpiB57NZRwk99NzGWF06YahWs
         2oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709174615; x=1709779415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNnU7s6E97gQJp6cYkW4MWjfZimKMSlrbqPhhGmgBdY=;
        b=qdJCyqURN41DiiSZYjlEmMr4y/d1KWisWx1HLseuwBSCwIiCy+oIOnb7ryJrlgCAjR
         eKX0enV5GFXcpuThBgJL7MHwC8yJ8+kfUCB6PMbakg+NboNBMb5JfQUsuFCKPJw+JsRl
         wuK4TA7MDuzja/R39lJF6jY2ffqQhqgey9fdOYIE4GgVdDl+jX+hLPVSenOiOzZLoTIn
         4efh4NFB1tqn5ZWq6UYFCL+UxepZVQpmU6VmtVE6NZGnkWb7TiQRHO4UHhe+B7YoRFWR
         UEffVKF88+IKq7chzDO5RBcL6RJ+zOfZFLOsJdhOBqvLOchRt11+MU0r0LGDRGmyO/Yq
         6Z1Q==
X-Gm-Message-State: AOJu0YwzRXeYgbVerFVFXlh+vyRvi8i3UGJhpfho/Vd0ag7HJ9RmZcWZ
	2VvvL5m0QJZGzMoGEeJtA1u2geE++2x5uGz6laFt4I+fXOT770uP8XZtdzQdY9I=
X-Google-Smtp-Source: AGHT+IHMTsOxx73ulz3UbIiLluQkOVI4rTeaxBtTz6J4PniE7ZxUgLejbee0Eot7YwVRKHTEC9lP9g==
X-Received: by 2002:a05:6a00:bd7:b0:6e5:58cf:89b7 with SMTP id x23-20020a056a000bd700b006e558cf89b7mr871325pfu.4.1709174615438;
        Wed, 28 Feb 2024 18:43:35 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm141504pfn.159.2024.02.28.18.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 18:43:34 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 3/8] Staging: rtl8192e: Rename function rtllib_send_ADDBAReq()
Date: Wed, 28 Feb 2024 18:43:20 -0800
Message-Id: <20240229024325.453374-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229024325.453374-1-tdavies@darkphysics.net>
References: <20240229024325.453374-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_send_ADDBAReq to rtllib_send_add_ba_req
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 030e0a87c931..1aa57f654b82 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -173,8 +173,8 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	return skb;
 }
 
-static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *ba)
+static void rtllib_send_add_ba_req(struct rtllib_device *ieee, u8 *dst,
+				   struct ba_record *ba)
 {
 	struct sk_buff *skb;
 
@@ -481,7 +481,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 
 	activate_ba_entry(ba, BA_SETUP_TIMEOUT);
 
-	rtllib_send_ADDBAReq(ieee, ts->ts_common_info.addr, ba);
+	rtllib_send_add_ba_req(ieee, ts->ts_common_info.addr, ba);
 }
 
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
-- 
2.39.2

