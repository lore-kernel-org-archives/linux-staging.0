Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C9D4749D8
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 23:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453463; cv=none; b=PpXW+g4dWCedpBCp+G/3i97rKvJ/pj3WRw7zhjTnU1bGxWLOU3YShXc8un8t2eHpNEBoGDLaEmOmV6ccXP8RdM6l87xYEwIYtDeFxj/YSQM0HzOaS0gTzug/Be6fSDvmneZqZgAetAy1tn4mb9ons+7nVMe/EnD4ydLCnGge5qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453463; c=relaxed/simple;
	bh=EHvfDpfxxWUHYnVRRayq7I+H5XtU9cbfpd1Wv3pIpgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKrMHj5b88supCEIWMTk8piNlIhNszX4NrCrTkWOrGicL5YcmrrC2BVW8xybqbVJdDt+zByzSo+42hKaZSkhIiV4IwiFfYxJII6De3KxnZKMmRWE5ml/OFKwDlTialBqTFG4Zwz6lw8ByM696RkM//Be8bG/wIAFWn6KqWx7UXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5BlzCfX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5BlzCfX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d0407aedd6so3424845ad.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 16:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785453459; x=1786058259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXdvAClsqaKvl5me0t3HAq930Gjdl6GY+XY0N1BhN0E=;
        b=D5BlzCfXqPubjYm5kALEEOVJQyjauZisHKAQPtPH/u3ir9uL9VrmP/DmUl38pdiTvH
         JdrpdMzey+GujlnfSA9hELHfqri/S0gP7whxI7PhhD6D8OK+lV93Jabe+qKVfmRvxdXM
         V1exKgA/2dxgZTX0TQBHmj5bumW1AUa04R8AyFpnecc5wjCswqiywrWze7QHPtsGiv53
         Fic1SHKsRlFG0VsGwkCCB1lcELL3UtnawwAIN6hI8m9RULZxP8j9EHNmwTFx8XgeErOR
         gsIH9m7l93/C+7P4OBXP44g1/gV6mLpkG2RRqRDERSeyYMekF/hwEnps07N41M9Wg5yl
         YtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453459; x=1786058259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXdvAClsqaKvl5me0t3HAq930Gjdl6GY+XY0N1BhN0E=;
        b=fK11R0duaLBBXExQ55uQwC8JGmihMsMP0+6U0h+nW6dqrBEOd7OoFUBDFLZRI2/1hR
         K/lhO092p75JVPkhjG1MN1CUgV5kG2yqKhp29qR0K8PTaCtNwKjarPKhS2q+9PPSNusc
         hrhJH73R2nnc6cpSLudcogtHZXQSA1my+0D7GD6sTbooyQ2GhWYP2oJxP4Swa1WbM+Ek
         yvEk+Pt1+eCqiOnT/ehPPzRV3q2LtQriVYbKY3PLUckL9fyM9zkcJlndRuzNMSF87P/Z
         LhLWT8LH/uTAyU1sD/F3fd3NeUs9JoIyuf5gz6RWBXDhu51eTGgHz4yo/WjmkVNMkEpC
         B9Fw==
X-Gm-Message-State: AOJu0YxUWoP0UPl0M3DmltHwVmGZ0/FUKH4ZQetWeZZsZDJSRX4NGYMh
	JJfWFhcvuIqS7UW2/f9ZzmDgUwJu2NEcSmfWgxEc8/L7y7PjsWUGY+4n
X-Gm-Gg: AR+sD11CT72vWDT85sHEi1xj1Tv22CaV54IBcDEf5Rb2tikbBkuqm5kYR4AisziF3T0
	8/DHADo48Wp6MfbEIXYBC7WimRCor73lbCZeUdf5gtuW3OhWH7htTT7WiSUEwhT/16eCgBwZkCF
	EIc3a7ysa6l23rIr1jaJXHuhT1wuiDF/FtzPrt/w29wLjKNSo9yheYy+g3HA1Th9myFS5eGMMIS
	ziKfUzDyM1Q3bbdbMjq5F6UMTCOkeDU4Ays+i9r44bCAwe7ShW0NRwGL+Y5B+yjjUnQMBtnfRrA
	cKgfaKyGfL8ZMX/y9lfrVcaQobNxy80cbvGgyxkczMy3J9x9dSZ3nkvS2mNFmgSgs0gF8uy1gm7
	zuZ4y9KeFDLvP/67hir36I0+t41t8OuOVNLK/RMSaIawR7YMEI9N0ijkB3TwnGQIYCFnxy947b7
	uUfzyGJ03/25nj4Y/4Apr5ufyTSH4jggkhq8nhR+TTjv9u0UclhimWDvT0XmosOBdv3wgs4sWVb
	Ee4+wgEMwvFptIYbs2sP6YyTgPVWXiaasrqviXl5yEuU88Wk3jZzxEXjHIV
X-Received: by 2002:a17:902:e550:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2d035cccd3dmr45068535ad.22.1785453458798;
        Thu, 30 Jul 2026 16:17:38 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0228417adsm32537195ad.0.2026.07.30.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:17:37 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key material in rtw_set_key()
Date: Thu, 30 Jul 2026 17:17:14 -0600
Message-ID: <20260730231714.81977-2-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730231714.81977-1-skunkolee@gmail.com>
References: <20260730231714.81977-1-skunkolee@gmail.com>
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

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
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

