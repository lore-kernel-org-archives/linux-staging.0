Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47AC2D77EC
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893384; cv=none; b=WlacIqAF0hmhlSkZxqGdvJLrHt+LAGlb4xjVBQrF00H11isxxNubJ+2U5u12ErXwigLUUEIRQB7UXwRkXl2AH5Pc/NsSjPCQmURGto7eZMG6Ec/rZBwvdqiRWEPXfBrKIXBmYhdLcUv6VF47gIvQM3ZP0v3x9jGzPRJq5KeW+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893384; c=relaxed/simple;
	bh=bcfYnlCtdr28EEOLAbmZKjtSdxMowufDuiy32UHD3FU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZwac2dHLw0eLrh/UpCH/Ua2og5LYJ0WEVHFDW5okAlTQzAFowzVZQfsODz0BdCdNoq0PtRDZst3nvv9evR7thcWhmrnbKzjmAUveWUxRzY+z9VmE/gcTTOZqTGYK1ECbpnuTx8+wjNmfIUrWQp/i2h4IOyrQREdzSRLIMCWKP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3Avqz5n; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3Avqz5n"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76bd7676e60so3281385b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 23:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754893382; x=1755498182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/qUrSc7klQ++8ep4smyxivzCQGJ/HAqWCkX0/tJWg8=;
        b=V3Avqz5nGO3vMYtheFk53R+Qtna8zsgCSDiBGJT2NJSJCXsnopjzKbPTmn207GJIt9
         gRO3usCA3lbXxFAsznm4Ws93rNYeDSh6ZrAmvykgHef3zWGeQKahK6AvbfrdpDVLa0nB
         CyiWAvaiQzJile68zRw78Rh14/P72UPbIXzJ97CkVIofSIJGCI59VkpQzdIXnavgUUwr
         0A313LphSGzAqQ+eE0F9P8AlEyrGR9Z+eVpk7H3XyvBrOZl5y+Yv/9vXL6hrM7/zOB+S
         INS+Hv51Uk3IzlKr3JwzA3zVwJL6dVWPmeo6qFZ++LYgxvwKHY6MvIt50zJQdSLV+x3b
         Adyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754893382; x=1755498182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/qUrSc7klQ++8ep4smyxivzCQGJ/HAqWCkX0/tJWg8=;
        b=T/7GcXooiI9kF3Mee3W7V8xTvDwbILbfx6HtBEk8ZpNY9KjVC7YvPYs5w1eG+BmeG1
         DAHu151UzVMz9Rsylz0L9WaWxsA6IyGT2jMrv9tY3x6+T5DGvZzW8YHvleWBmvcmjEU6
         cIc3QLaKGpxZlEALIYU55FwOcYEbF0jtzp6vrU1gVboS+HKjs+f47ZiMdWu2OJ7Zm+rs
         Svu8AafguaIhH+gun4vrU0uGZp0py86KONsMzRK3gKyM1TwTIAgSSp7j4SvJuyxJshZJ
         JDG5I8Nqshf+H+KzMYlFt79t1i1zQUhpgiM1woA1UqPE2fCL7kd0hyzvP72Z4HNpP29a
         GtHA==
X-Gm-Message-State: AOJu0YzFg2SWUESj/T+/xWnh1vRtbrbTocKYuVQUTszlRhHVUM3sOgCe
	/XEg0gAEogJA8mKXZhciZUh06QG6DL+rCzRCyogm6E2hcrl3z4zvepVh
X-Gm-Gg: ASbGncslJQRigQNn0oGjxC/56gl7WC8niM/ExcGZThcN4h1CI2PwZttJ1FnmUidl6cI
	0mEpuE+yPSeqTQWxXS1xHgkJdSEmDuefDWmCuXr0+n725+GTMF3Oe+NsXrWStJ1Vjzp2mUVG3E1
	DdzuMVRDWVrv9BhqsgMRx6SCVvI1M/7do4dAC1dRNMmrUpWEFs68c8m1Mxvt40Xys9wTamqKX/u
	DqQeYhvzPfW91Rzy4Xqct0jmZ+vrP22X7t6kE3jEIcptEhUAVMIID0adsD8VA19tovDhKnIUdhN
	M7w+zjFKlD4fthYJ6knpwkQaSSAAaIU0f9Qgs6C2aQxf2RLBk6zmmv7TldbcrGxou2YUBatUJkC
	jzP+n3cprBWsrj19oZHXnSVMjdKgsuV2vQbqywbZYBH3302VxRJIfDuERWE3glqYaLnhjHxQKtz
	rEKZa47sdl/15kbwqd0XCE0vvthZVuHsSq0Qy0h3Xe
X-Google-Smtp-Source: AGHT+IHmAj7XXdb91si+5GhMmPI2SmLuMySZvkdteZI3w95BBfn7ypdMwr7ecuO5XE179G4GMgcBPg==
X-Received: by 2002:a05:6a00:10c6:b0:748:f854:b765 with SMTP id d2e1a72fcca58-76c4603e0d0mr15737000b3a.4.1754893382271;
        Sun, 10 Aug 2025 23:23:02 -0700 (PDT)
Received: from wen-HP-ProBook-445-14-inch-G9-Notebook-PC.. (36-239-105-221.dynamic-ip.hinet.net. [36.239.105.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f800sm25861623b3a.42.2025.08.10.23.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:23:01 -0700 (PDT)
From: Yao-Wen Chang <changyaowen19980629@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yao-Wen Chang <changyaowen19980629@gmail.com>
Subject: [PATCH 06/11] staging: rtl8723bs: Remove redundant comparison to true and false
Date: Mon, 11 Aug 2025 14:21:29 +0800
Message-ID: <20250811062132.102525-6-changyaowen19980629@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811062132.102525-1-changyaowen19980629@gmail.com>
References: <20250811062132.102525-1-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes a coding style issue by replacing the expression
'if (var == true)' with the more idiomatic and concise 'if (var)'.

Signed-off-by: Yao-Wen Chang <changyaowen19980629@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 919581965015..09032131e35e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1015,10 +1015,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
@@ -1160,7 +1160,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				added = true;
 				break;
 			}
-- 
2.43.0

