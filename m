Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06AC52F8B
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008928; cv=none; b=Viu5S23iWb0bT/MG6aom2RblGCZOQ5njcCXpbP3CctwY+fy6N4fb7Kbbyk34e6DX3fvtxULX1XoFE5K377gWy77NOHpp2vRbka048zhHssiaeI/Ew88xjwPZZEFP9AKf8/B0EuV5oJXA9LAEdLJK+3vWgki0lDBgHrQYaikTmWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008928; c=relaxed/simple;
	bh=7LIDCeeXftRipDweuLYYHyh0jPpG2lXCLfRAMbzxrKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ttZ0UuJdWCOQwCKw4XJOcdBmoo11qFXruKFhoLf86lmGoNn5GSrQVvYyhatwE8930yYDPBxW7NStycVQOWoGFfk7NCsINWjebhnPIn5dQBTIzG/+B7Z5bicazac6Y/FPOmmKNoaC4ihdWigvMAUm3WFtMXd4S4BIhAKWeUaFXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=fcvoLfZZ; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="fcvoLfZZ"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3650df44657so10733945ab.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008926; x=1709613726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeW6OJcZaT3D0Ifh+ovuyXecGgo3ptPQ+fpuDeZafCI=;
        b=fcvoLfZZ6FwlpyvIt4Q1X64Re/Ml67fyFN9RVOd6pJ9jk+hJaD8JhXx/dw3Mb1TC2t
         lmb6TWXHFKfZPIedXmGtdwtrk/B42c7dT/0abZasA9e0BOezCU7wmPiLorYdUvgRbapY
         7Xu2hyk+2e0l+X8MH6FHI54YYT9+aIZX+6HYnxNjtEQNU9Mvu+eWnRf8KuERaHdg/2KF
         Z1+6OH2WitbSVxBYwy3r4jvLJ3GRu0MPiGoUREFiqDjuDdQqNWKrfvOHMOC9lBpjV+UP
         PX96MN6xTjIHHculE0BiN3sY9QH6YGzNUdLGV23c8QqrO3mDgJNtZX4tKx5HfmygHIi4
         +hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008926; x=1709613726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeW6OJcZaT3D0Ifh+ovuyXecGgo3ptPQ+fpuDeZafCI=;
        b=DfyRgb1IMdfZ0Hnj5rcOu+xEuyXwwOs7YnSDAk9a3jzkbYLjPiMxJ5xWzAS6xaLIgd
         PEFF+58P1bdbRQhNOG777JUuQyBt0fAIDIlhL9IPEG3R2gRx9r3D73mpcenXRvNaJWG5
         qyH/Yoa+tOf9t+hxvcYucZjQT9LPilRlhbSOIXTpnDSOwfvqcd+ARYgBvobHmrryBTwK
         TzrAKL3Fx4L9Es6Yqq2ajS6XHDiV0pFPmTEgZrmP2zaQtJY+UQkl/cdV4dN37YAOnfiS
         AwbjL4XBSmm9+rHODZRwOeYssGYQV1triaqQVCxb1UeU68btGrVGRK6cgMKRtoBOfsor
         0d1Q==
X-Gm-Message-State: AOJu0YzGJMcQ8yQLOQsdxOy8V12jSR8CcY0MMyWoC7bBxKA0LHshPdxu
	aagRphQKBmA5pj7QQCTbwqwM1a3Z0eIXDkj+uC+Bfq6xwTZYxgsolr5YmIVhHnE=
X-Google-Smtp-Source: AGHT+IFRmhFr29TBT/8EGQQ0hBpnKFYEZK+J7pmHhxp6x7S8JLVCiIMFGm1Xhq0NqbZiX8qhwCmMDg==
X-Received: by 2002:a05:6e02:6c2:b0:365:ac37:cb85 with SMTP id p2-20020a056e0206c200b00365ac37cb85mr260167ils.3.1709008926066;
        Mon, 26 Feb 2024 20:42:06 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:05 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 04/20] Staging: rtl8192e: Rename variable PMKIDList
Date: Mon, 26 Feb 2024 20:41:41 -0800
Message-Id: <20240227044157.407379-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable PMKIDList to pmkid_list to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Fix checkpatch alignment warning
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 30b9178071ae..a00db0d153da 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1281,7 +1281,7 @@ struct rtllib_device {
 
 	struct sw_cam_table swcamtable[TOTAL_CAM_ENTRY];
 
-	struct rt_pmkid_list PMKIDList[NUM_PMKID_CACHE];
+	struct rt_pmkid_list pmkid_list[NUM_PMKID_CACHE];
 
 	/* Fragmentation structures */
 	struct rtllib_frag_entry frag_cache[17][RTLLIB_FRAG_CACHE_LEN];
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 607122ab4b00..a847b6505c42 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -669,8 +669,8 @@ static inline int sec_is_in_pmkid_list(struct rtllib_device *ieee, u8 *bssid)
 	int i = 0;
 
 	do {
-		if ((ieee->PMKIDList[i].used) &&
-		   (memcmp(ieee->PMKIDList[i].bssid, bssid, ETH_ALEN) == 0))
+		if ((ieee->pmkid_list[i].used) &&
+		    (memcmp(ieee->pmkid_list[i].bssid, bssid, ETH_ALEN) == 0))
 			break;
 		i++;
 	} while (i < NUM_PMKID_CACHE);
@@ -881,7 +881,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 			tag = skb_put(skb, 18);
 			*tag = 1;
 			*(tag + 1) = 0;
-			memcpy((tag + 2), &ieee->PMKIDList[pmk_cache_idx].PMKID,
+			memcpy((tag + 2), &ieee->pmkid_list[pmk_cache_idx].PMKID,
 			       16);
 		}
 	}
-- 
2.39.2

