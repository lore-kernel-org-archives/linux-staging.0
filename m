Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C458A3019D6
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 09:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715423; cv=none; b=WYEW4Xc8aRWz0+QbAiQpw9nYESWgGF+EdbzZwbRLK5557kN/a2zDG8V1y9P4leoe20ztf+pLmBeHC0WSyc4+ZfOa8ONojCqV8Vf4mpOX9eItpKlOJEpfmZGvqcHxbCNshQPCFagW5YvOa1D7uRXzadS7xElutejOZz5USJgueic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715423; c=relaxed/simple;
	bh=ePVzqR3OAqbGdQOuK6zL1Lp3mdzg5Y4r9naY+pUdFo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hx4aBeRphGd1VzqCFtvP2PNCStt/ea+MFQW2kjs/NICR9peb7jMouBa2SR2X4wTUI5G+TaOnqevOPjHz2Kj/isBrimv+XuMgyd2XshggYu7q612wQDXI+tJDurxPyBsksFUkhq/s3vX4Phw2gBq8GWTDeQauYU7k4qfKwJLXZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIxn8rFg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIxn8rFg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a525dd2b5so3003395e9.2
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777715419; x=1778320219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJhvplvmE8mYRms3mNN6cRarvzKbeZjjnrcGylaBS00=;
        b=jIxn8rFgEAb2lZGbz40z0uRLQjoCYfmns5GM4n0J0KyNfeFNxIJld+2lvIIWxuz+On
         lAzQxCxX7V+2xFEFnO1OepH4YAlS6DYtlu0eVLLsPFU9r3IocYzzM5IX+LJMaLzGMM4I
         Y+Ex+8LL62aXRxlrvxjJx+QeHwws9P6ntJ0+yug0EiQhGFiemkdWzYpv1926Tg5GFUM5
         4BxzakrJsv20QKZa0BjEI/vuKy0sjc4Yz0krN8nmUp4tmi4SVweFW6LUqxOdWxPFjc77
         XppVWI4tCIWOpfDQCN0BLSI6BVXtE9jkRtAwCQAix/F6JLqazDCwOx+BnZPR+fz5H1hr
         +5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777715419; x=1778320219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cJhvplvmE8mYRms3mNN6cRarvzKbeZjjnrcGylaBS00=;
        b=EaMuFm5YlGMAt2dAlRoiRB6/YtXLRoYxUM2HQ69vFv9axOtGYQwg6dSfzne1ZIDYRW
         atlkj6b1kxUIrcgO1WWs6Oy202afYz0WgEemlMEqiJClsGuW6J3qlnaebzDNheKZ4juK
         bQJUSjEoVJUCa5BkhTRz32HRGVE8HK4NEAzxWoqVu2bTOJorS2+PRSgHMYN0CghSMFOU
         AEqwv9Otmur7yMO53iaMYdIz9p0Ael2WmuiuCP+vbpPTcps8n7t5MpGZf9bEL1tv+qrr
         z1YkQr1WfCvDRoHnOhKV7GQNs9g+kEKWI3xvbjusjsX++zawPiqSjML3ScfGIrQ5Dx9y
         wovg==
X-Gm-Message-State: AOJu0Yxk8RJH/9RAKl+BtF3k2hRA+cMjy7DVi83a5qzex1AvMptdvqqs
	5Dh89sFET1yWX3NGvpaoff5IKXkKtyM0ycJTLM3ARRx7yCwXZK/FXQsO
X-Gm-Gg: AeBDieuglxYh2SNSsPYCw7VkfEcN8eACwnMuUkGfRn6ubGFwg3M3Ec3hUTRzJMVzmlS
	KffhauaXoiqebwGop9NvKjZpwMyDRzEirgCGEMtPqVIDUJQmRbkEEUv6hVjE6p8VLUE3VB9DoJn
	MXS8Zq7cCx9do77D3gi5skyRRFWrhyH7mFOrwDnvYl7MtvfLDhcmHfk/f9NAg6ebiSu6uaa8eg5
	Jyh5vbyu6rfRuqCoy77SKfibGWb+j4Y/wn0XERmQxlA+exSSSpnSwgBbSYXJCN1WkI2oJnAGfuJ
	1/q0Glu1mEjvlBxyAYzkB0iVkY23e94s8iiWJR9Id85vxekcOxGcYrh+e/K/5WAu0RGSDlkrVLG
	HZOuew9iy3zumYR5SYFp57FHLGxxTAF3tG7WKXqjKiRKkJqdb1up/kUMAumUNyua4teeDA5DwUX
	0cvpKsmzWRUCQtvD2aPNenqusO/e6MJcXTIm/KxKaKZkHRLqaGVizTikE=
X-Received: by 2002:a05:600c:46c6:b0:48a:5302:8ed9 with SMTP id 5b1f17b1804b1-48a980fb90fmr18090705e9.0.1777715419063;
        Sat, 02 May 2026 02:50:19 -0700 (PDT)
Received: from localhost.localdomain ([94.158.62.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm194379575e9.0.2026.05.02.02.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 02:50:18 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary blank lines in rtw_ioctl_set.c
Date: Sat,  2 May 2026 13:49:30 +0500
Message-Id: <20260502084930.857-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260501163815.759-1-sozdayvek@gmail.com>
References: <20260501163815.759-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop blank lines flagged by checkpatch.pl in rtw_ioctl_set.c:

  CHECK: Blank lines aren't necessary before a close brace '}'
  CHECK: Blank lines aren't necessary after an open brace '{'

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
v2:
- Rebased onto staging-next.
- Dropped the hunk between rtw_set_802_11_infrastructure_mode() and
  rtw_set_802_11_disassociate(): already addressed by commit 7dbc9fd71438
  ("staging: rtl8723bs: remove multiple blank lines in core/").
- Narrowed subject to mention rtw_ioctl_set.c, since the wider scope is
  no longer needed.

 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 69cbf89f0..3cc2a7c9d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -120,9 +120,7 @@ u8 rtw_do_join(struct adapter *padapter)
 					pmlmepriv->to_join = false;
 				}
 			}
-
 		}
-
 	}
 
 exit:
@@ -416,7 +414,6 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 {
-
 	signed int		keyid, res;
 	struct security_priv *psecuritypriv = &(padapter->securitypriv);
 	u8 ret = _SUCCESS;
-- 
2.33.0.windows.2

