Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62172ECD32
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715469; cv=none; b=gg/X73WXEtztugDQHPBVb0aXA6rpgrkTL1vHxKfWY2YIMc2rzM3J0uxm/pApUN6YEzeW3F2JQDrbfdWHvYcV8k6dSnSCRRG6L6BiuZXRvhx3Iv/smeB5fSY7Tel0jOkcDgTJaBo7LajMU5/tTJ7hHzYYyiBRnQgARYquymKQrow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715469; c=relaxed/simple;
	bh=fCdr2q/wSrR3PXcLuJG8MQCydwJskIprcF+rIQlhelA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M4nc4VkY3dD3waIpHPcq3bH2drd5KcMEjpDaLj/QD8rsNeOZFpB1BX1yvdNMc6kk3jvxyjZPEqTEjZQABJbdnzbaHiMXpcbf2UquiTfB0BnfRIdrcmEXEGx+wIuiijxbQTGi0DqB6TMM3CZO0PXOOoQPJiBoSySHRSVg6xB9FaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBGzwA2a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBGzwA2a"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso3611535e9.3
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777715466; x=1778320266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hd8SemS//RBxd/5EhICj8iX2AaD4XeUWClxdQwZ5cNU=;
        b=qBGzwA2agPhwavxtYdLpg4HXMy+Z68yn5cOzDmT6YljQOQOJxiB+Wp35WnCj2TOegV
         OvrL6DH/o/Kt5J6EA1zn8u4xMj3AY19ta46wlQx7H4Vli0OTA4syQYqbtrWxkWJHaEPC
         BsTmYB8rloIOpbF9T2ey+cO7ISTIEFIjsqGxBNQZ9DvRG9utebLWAeMOylBHxz3QayHD
         ZvVoYtz+tVlkvHdj6bxpSxYK9PGsi7ePGQFZxmXXnWPal7QMVKNXmAIkt9V/Qamf0M1V
         det18drTCM4ckafDX/IxdfrHVD05jJYvk69+UynhhQ6nzlZed9ovbEqAEFhsboeybj3Y
         ncAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777715466; x=1778320266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hd8SemS//RBxd/5EhICj8iX2AaD4XeUWClxdQwZ5cNU=;
        b=ETdXx86WQgkU+Y4cCpckJ3LKykUHKUCbnCS2L1q/ZhHB2ddlVnyKTlMOqMIr7JDqTl
         curcBsX0EXOd+rFxkFdqTC4Rflp3OXEnL8dYvPEgHFGquExmIgQCldtpFlbU3WPtCHqR
         YK03aZhjMIauNRpZv39MHWZWWx47cS8HmcNOPj7kSHLv9IpKAfaNJHxffBy6sgv9rpg/
         Z3yf1hlMX4I3SjyAJ/YvqBDj8eYuVUv+vJl6H6RcrGFFatwzk7jq78K7yjyq321VNe4S
         liKRf6XmOYH+1Tx8yAd6iv3G3W/fqEBR+onL3XoEm0mzAKjvUwWQ4tdg0FfppqSPzLBK
         ujMg==
X-Gm-Message-State: AOJu0YyH9tfVXx7SrLxkh9onJCJyZ/7zf2jwrD3bixO3eyeQL32SNGwW
	BzeVUJUtT7kUmIctpkQcfEcbrAe4KlkvPSwpWF8YLHvYBU8Z9uK+yckl
X-Gm-Gg: AeBDietEs0tqV5ZJhRW4DKw5e1HzaVr2N3CIrui81tPDmQ68GFzqLpHAtF1fTlkExEU
	EfNNgiCrNGv2GwYsST0L5lE+yHxqY6VkKlRSJYxNmLtUX8kiiYHX8rYpJ13QLOfkWUyAmbGvHGE
	SAzkRGkfFswmUkbBCmHPsy6RMgOpse0yd0Cc2QeDv1rOk6yEkO9FhKHsP2jy+GbpWhU+dlcpphO
	7B4DkFDBhxhVovnV+LWgKoTetQiVms7BriVeN5Y50yJXQEv+cxyR/6PE87ouUqSYjNPOooLSmnC
	Uku4WpsazgYv/Pi0a/+hgSXOLVTKjg90goUkUcy87hykigC9CElMMhqNOMNX1J8V7e9aLsBCvm7
	vlrP3y9IhFcbywEzGF6vre5fehkMCXz9YGCLCd8cbVfvVzVVVQcYINPYRBxC5L7HY/AdBH5s+Nt
	PQRtX6MTLlX1TxKQgf/mOG1WQOdT+1PdZEMJykKf/pcs3+LanObcs6Bt8=
X-Received: by 2002:a05:600c:4706:b0:489:6c28:dbb4 with SMTP id 5b1f17b1804b1-48a986631c8mr17666195e9.5.1777715466205;
        Sat, 02 May 2026 02:51:06 -0700 (PDT)
Received: from localhost.localdomain ([94.158.62.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe3cae3sm43241495e9.0.2026.05.02.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 02:51:05 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: drop blank line before close brace in rtw_ieee80211.c
Date: Sat,  2 May 2026 13:50:18 +0500
Message-Id: <20260502085018.1440-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260501165917.1504-1-sozdayvek@gmail.com>
References: <20260501165917.1504-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a blank line before a close brace in rtw_get_wapi_ie(),
flagged by checkpatch.pl:

  CHECK: Blank lines aren't necessary before a close brace '}'

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
v2:
- Rebased onto staging-next, as suggested by Luka Gejak.
- Dropped the rtw_btcoex.c and rtw_efuse.c hunks: already addressed by
  commit 7dbc9fd71438 ("staging: rtl8723bs: remove multiple blank lines
  in core/").
- Narrowed subject to reflect the remaining single-file scope.

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731d..5fb1fe5b7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -593,7 +593,6 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 			if (wapi_len)
 				*wapi_len = in_ie[cnt + 1] + 2;
-
 		}
 
 		cnt += in_ie[cnt + 1] + 2;   /* get next */
-- 
2.33.0.windows.2

