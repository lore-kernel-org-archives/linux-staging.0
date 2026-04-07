Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82077258EF9
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572685; cv=none; b=bD09wNgNMRV4zrU8qdIYQTmE5dgjs6IlDZ6ORSBVAM6tlvVoQsVxMzvL6Bim5GvtpxTq9Z2+UnAK/AhgMDG0R9LEIknRrylwvD5FITx2ZQfWZqJIGUywhEg0Pv3ARvH/2YiuaXwKGjZ8yRlc8qniNeteVibCgUokVv5nGBDXbl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572685; c=relaxed/simple;
	bh=jQsu/rhDTVCm1ObjsKpA3t2BY+TDjdn3oGFyrYgJGIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BErO2Soyzkxd6IAeLUhBnm/6rKj7NY1piGeNoZaKPR5srKhvd3Yb7NqmLCe2vlqMNBeSCAu5JwPNN5HfA6p/Dd5UkK+g99RM8u2mo8Wv+P9kZa4fg3U/6xJoKAQb4AqqlpiAK9N9qzcaOGKiRqmghIOuWze/hNFPqV0gozRhf3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Us1ABBIX; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Us1ABBIX"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65006c99d38so5514770d50.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572683; x=1776177483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ogh4EbIZJ15yv+oN+47Hl6uQrMgIotk7DBAz3z8eKCo=;
        b=Us1ABBIXtBVW6idUJPgSxq79tOptDbywlUCnrKcZNn53Q0hgeneGKzM6slQBHuDS0Q
         v8doVKXe3PAN5NC07KyNC3lO5ofEdoSJoJVuh+fmoaORnBsabapNCP3EeFIHZ0Qc9UYz
         rLM0+v8uqcaR0C/A7MjXMElGJ9TmLggKh/ngTZaGsaq26mCPGbQW8zVXVje91CB/0x8q
         Ptf7/KgLrYFDEowD8WUpdQjzyorjXMLCAR/0U5dX69Fc3cBRYjb76n7NZRXfue/wxX0t
         6g8IBHpHwVD3JQFG5rnszcyQOR+1G/IkahhFGTD9fRgfhbQozFN/bARzqgbPlQVc6VUK
         hqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572683; x=1776177483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ogh4EbIZJ15yv+oN+47Hl6uQrMgIotk7DBAz3z8eKCo=;
        b=hUFly3kljgRpwRk9GZ/b3cwxGX1mo3U/mBXryWToRApK4fcioYtquR6JrQ5MpcQkk/
         OyKCP/SN7IfCYOe7scQFxJLpOZ7X+1ZaooW1aTAWmkEbGw5tEyv+iv5BUhTxEERPgte+
         11z7AnHRkmjmwDfpTh0pz9Q128hW3r4oFPrzve2NIU39ukoL5WFTZDLNhyYbJmDexvgX
         iFo8rVFrqIBTPdUbEkTv5W02STh3a7DrNvi+jUuCP71SOi64Wm0CiWK2LW4KZLknqlVo
         Yuy8HifHzMVjKqOH/Q8aBwXQdYjgk/154FLf+vBwq8UgYWoPn/EUXtv9s1GtlcknMBJj
         3afA==
X-Gm-Message-State: AOJu0YzqKzueD4nO7QxYmfb+M2h0j2YxRMC26NLDiPO9hf5y2wVNNnzt
	gP4CPBhkgw0PiuW99v/t+ozpeq7lkUSx6w3+vxOWAC0h99HOou/xfuwa
X-Gm-Gg: AeBDieu0WjGol/KoRpLK1raHDOjYbhi6lR4oFGsZ0k+htE+gxQ14p4CTDWtJcFCo0Nn
	hNf5kc6a0w0HI0pAJbHhVYdBlywyxkhUvx6XStp/6I797l8elP1jbBu0WuZF6btHkKUwgsMZxWe
	n7E+LowIkcr6IUU3WzeUdrWd2CNUqc3BIFz4k9GYLgPBorrtv4/MI0JUSP0Jle7ejwcxeMeYR1Y
	U4mUN0vLtJetGbtzZpE+xdpa7aITBsqegzsyd61nAI/fI5zg7AiztYq3GoWU5IJ6eGIyelQK9+d
	e4ZDUnocOqGebKUhoK0kxMJSU5ypJRXAVE8p6xpztl2E1iozdKNTaBTE36EXegO71fT5+7HZkmc
	WuZTTyqsKJNq53yYWb2IA3p8r068LiAjN0eTxyuu84gyNkwiq0hQzUxqbHTw4/sJixU82f3gbUz
	cx4rObwSAeRR8b7mSHKmoYjwFRKdwSKenum/A=
X-Received: by 2002:a05:690e:4394:b0:650:3bbc:5375 with SMTP id 956f58d0204a3-650486f10e5mr11808985d50.17.1775572683504;
        Tue, 07 Apr 2026 07:38:03 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a828f3csm7868159d50.3.2026.04.07.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:38:02 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 3/6] staging: rtl8723bs: remove the header of non-existent _kfree() function
Date: Tue,  7 Apr 2026 17:33:28 +0300
Message-ID: <20260407143622.9767-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407143622.9767-1-nikolayof23@gmail.com>
References: <20260407143622.9767-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the _kfree() function header, as it is not defined anywhere and
is not called anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 664c67e48f06..82def452b335 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -54,8 +54,6 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-void _kfree(u8 *pbuf, u32 sz);
-
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
 #define rtw_netif_rx(ndev, skb) _rtw_netif_rx(ndev, skb)
-- 
2.53.0

