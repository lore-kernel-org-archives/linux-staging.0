Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660133FE15
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 01:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314015; cv=none; b=cIzGFEWfg3ZZYMB6r94jHcNkekWiJMZz/oj5rilnbnlN7p7GeFaiI7LRF9MSKs+GQ0Nncw8C0GMh6XMDBVgjlietvh5Bj99szA/7qZrSF22H4vmncKe+w/pM9uE15K5jat/ejOs1RtuCsK8W8X00mNFo2O79FpItxVvo6Rgmt4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314015; c=relaxed/simple;
	bh=0inVXbYiGxiGXy6j7SvTUy//4zaCBXiLbcknOERUIVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/UHzbvQbM2oLcvJIlKgpiQRbft70c4Q106ynQsLJjf5jrTocWqyUJXbJ3PwgdfLBPhEC+CMMF4d8zwAe3jXp9/BC9rqoKA3Oy1WMqBeicUardHpF2AwaRee2aLpu/2XwDYkqdi5d204lGHpukSFzW8aipgUPFOF3fw+XbJ22PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4W1HjSJ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4W1HjSJ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so640285a12.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 18:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314007; x=1788918807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYKtlERduPFiYIX1bfhWeBK1L/1dAk0lE32+h0N/XY8=;
        b=b4W1HjSJ7DjKku6dY/qm+dvASkpIoniOAn8D48g7qtdZSVXumZagC45X7Vx+SSnV1b
         RonuTFGMSGDAjOt5TmXISNkfe91Qcb3nJ6bUeSMbAkBohxU+W+Fy55+JUtPSx0GtUmhF
         YC3l+ktpv4fz5OvDtJWcP9kEWDek4O1oqHrJKUlC/PEP4FUs/8Tor6zIpAtQTO00Vuco
         8aEyYILTKNI3VVaUvexlLnnWaLDTvIdL9F3KGHkaCcR9xbmDHlN66eohy70HyCFzUbro
         ZoKEzjOqn2fhhcHUk6reXPLtn2wcaAdVdAxHNTuiMv7Pjom+KfAB8+xnaSDxzebo2GW1
         e4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314007; x=1788918807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYKtlERduPFiYIX1bfhWeBK1L/1dAk0lE32+h0N/XY8=;
        b=Kst6KnWrXzwvNnEEUqE2yMmzW/mzSeqA1KTTb8m9Gcth04Z4PSs3RrWc0jXESlIJY6
         +rEXiWAgbl2kED5Oby8jf1DzFmeVq4h+jRL1R2EicKkxlsPPM8je1jqbT+BCPbazFFNn
         wvSov2r8hdigvSWh6DmCDkrQVKwAEi6OOut836PjTUM0qMZbJ25i8DwbZD/M4WAtCUGs
         etGGHn7q6aGtZMzEC6WQZ7O8KYMc4irU1z2siAWbw0DTP+qoJEXarruO4YMn6/k4lb7L
         NBXy0Tbtzq8GjfpQDiIgwCuh3DdG0jQQt0XOnkP3k3RUBhWTmvKVy9Wnf0BsmKU9LPp4
         DNRg==
X-Gm-Message-State: AFuF++mzef8OI+LEJE6uILM4gbfHQkfaawnaZBIdtqodA1zq/oqn74WG
	nMpwG8EljC7zomPb/5kbQE+Z9rxxsKJiiJ3IUNLDX9OKZdBbd+wnJHmSXEw9GC+Y
X-Gm-Gg: AYBFou2mJXZMTlzlEJw5BFBEaX7iYrFIbiWg43ESQD5zmf9bcIDEJ21sJtQGc2dhQdK
	JRxSnygyLW2MoXWTV2RviiiFxSj9qlG1Ol1RsgDsvL4hP/ggnV6taEWDtUK4UiR7w41wM8TMJ6M
	plcJzLPFkWs4Ekbua+xwQBjceaOkXBrAq/wIidKIeu8tlkMGh+CyJ91bnmjPAqxmylb4HU8pNoK
	tSl1Njk5iWrVsLe6RhXQU8VEyCsTVQbvYvj3lC6py3x3Ox7xjDnlvfiVgltS7Ilg8WCHyEl4hyW
	BBfoe2YK//worYkZaYdLu4KEWvcXB4JApm22dqtIrIooZPdddEIfaS49lvAcHtoQ7aZdq/eLpsa
	b4+ZkFcSpmHsy2wHPJxxJ0w8wSqZ+IYke0xraBqK1Jrw3FQnOE/1nSLQuMnJCe/CaWjm82p2my8
	UshW3k3/O88mdc/8S4ELH4ie1tZQwWjwJtVy4SQ4zqGd2gjZY0ouvwqA==
X-Received: by 2002:a17:90b:524c:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39aedfb8ebcmr1963259a91.7.1788314006989;
        Tue, 01 Sep 2026 18:53:26 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62cfe43sm467404a91.1.2026.09.01.18.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:53:25 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use kfree_sensitive() for key material in rtw_set_key()
Date: Tue,  1 Sep 2026 19:53:14 -0600
Message-ID: <20260902015314.21525-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730231315.79688-1-skunkolee@gmail.com>
References: <20260730231315.79688-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psetkeyparm holds WEP/TKIP/AES key material copied in via memcpy
from psecuritypriv before being freed. Use kfree_sensitive() instead
of kfree() so the key bytes are zeroed before the memory is released,
consistent with how psetstakey_para is already handled elsewhere in
this driver.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2: add Fixes: tag
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..fb45f7295386 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1926,14 +1926,14 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		break;
 	default:
 		res = _FAIL;
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 		goto exit;
 	}
 
 	if (enqueue) {
 		pcmd = kzalloc_obj(*pcmd);
 		if (!pcmd) {
-			kfree(psetkeyparm);
+			kfree_sensitive(psetkeyparm);
 			res = _FAIL;  /* try again */
 			goto exit;
 		}
@@ -1949,7 +1949,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		res = rtw_enqueue_cmd(pcmdpriv, pcmd);
 	} else {
 		setkey_hdl(adapter, (u8 *)psetkeyparm);
-		kfree(psetkeyparm);
+		kfree_sensitive(psetkeyparm);
 	}
 exit:
 	return res;
-- 
2.55.0

