Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221A35E93E
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 06:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110518; cv=none; b=gUUD0tOmsZ5xVfRD3BGWwXXZhqeaZDDdZ31ShekOcm0Oi5lrZ0Fcdvcl5AsbPz89M73xkIPKCj2F0e3l5Y0UIP1xKeKPhLVxvNNiup+QBzroAF+4GYuEr+604cdCP27BSeCe3xoNAXmpzURtNfiB8uh9/v/TnC6DBSJ7F8FkE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110518; c=relaxed/simple;
	bh=8DRxTLsBLD1FhXPDtWI+stPohyXG0s/KfymBngn1kgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GJbYkyV4iIioDGZaP4qTBFqJ3axuc3v18ccv245C0KeC2NFpkeKfFEE2Bazewiw5195QIe6mAoiRKy90bh5QX0du1yXpC6veSTX5WQHpnVN3yILz1LjZeGuazlr6GV9RNiPVZMe4FOzX/gHyMG/FPHOo6aGbNm5el9LaW3MAONA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeuY6Wdk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeuY6Wdk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf3781ca51so37362745ad.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 23:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110517; x=1782715317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xM2EsqGg0CD/FdABhlpfa2rBmv9jnKvk0r22cXuPap0=;
        b=oeuY6Wdk6qqw8FzIiU7mOJySImDZbTNHlOzo9LVYTRhM2RHjnPGo7uN85syuQMlF5y
         IXEkUv6oeRDio70XFKDCBydnRyaUXQStqaMbS/SkXIb+Cx2ByrJ7R/Q8SWE09loLcZnW
         pNICBROT5TvfGTp8sFH7yMzkL3Z2smselgq6abkyvojTNkdqT4oqv0XWeF36TqkgjjHn
         AWn3zKAd88Ur1o7eZcQS6gy0auwppivE3MyFcZSk3ozX2Hpn3OxfJ4Iownx6KN6g4/Rf
         soXS9W++1z8tyw6EYhaWnIGqrEXnTnp9G85f+GVctr0mUQL6yVnpRthj12cr8sGgDJ4b
         nOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110517; x=1782715317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xM2EsqGg0CD/FdABhlpfa2rBmv9jnKvk0r22cXuPap0=;
        b=ed4K372PpSonEtrrn5StCwmZApwQFRXIm/z14TIh1l+QdW0Qwu7wZSla/Ro1Baur3O
         gfCt75zxYq3pxAPlVSNy6trSMrFvFSKbiA5MjuIzjpaPaElG0iilyuqAAkvYo+pb7Sy2
         PhLzFraS05fuUW43hcKvD9Yw2ekYdM1GS8nysGRNs5T7+lBJ1u7jMwePxi9iYN9vbjAn
         j24BqGBGn05VyvmVDH5X7sXegL4vXUF1Gby5xSFpWyUYSbaHzEQRC059N71eW4yMVEQw
         brVhr042jWq8MnI5lxtSbdKXTBFwAED35jXFSIqb/IMDvZhP9KzRV4d8MgBbljNQI7vj
         fzsw==
X-Gm-Message-State: AOJu0YxbzuPj49vxJovxqoKqcMQvBL/bPXbf1gF3GrKsxt3cwUvtMjEP
	jUjaZQ9ia5Jh0vNoxpG9OwuvCUpAsI6cJCbOPPA4bxd9Nny4ZpUgSu+K
X-Gm-Gg: AfdE7ckI1DIINHoXl0WiyWtXW6c8sh+m7Ok1L0lYPeu+O7J3aBbWlCuIvb2yB2Xb8K/
	k4hoKurJwXcjhld4O+RIUSuHv2DcM4CzKLr6Ed1XpHJRhOpJh1nUpoqbsrqfOFXw8qRrT3y87Mn
	TEl/EixDpQxqqYat8DenPWsZoa9MHodVcdrqyBxGaUeyNh+s29C2MbzttkQstfohm4Pb06akx89
	Krg13xuvHWMpCn0lZ85Yji6PZUY/IoNZ9+YxyLDWgnFckg1XXdFVqol2UPZjQsDxnJNE0NdwHm9
	97xxxWKQPvJK5/JBo1EnLnGfvdaE1ti9BIcpmFDqiRRDDRU82tHIzA4CweaHAzcm76SYaCpPOUm
	2MieldourN/YRN4sfuIpfqmqsMoIcrDbi2YhoI5BTOkd3njkEGb0SRp+/0QEi37F2KGe4DIQbrR
	DCv5OcJ8ZIHWiu30jEzJbly/nNbaar5Xedled9X+F7FnhTKRUFxssglnZDeXsJxsA=
X-Received: by 2002:a17:902:dac9:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2c718c77482mr143084865ad.8.1782110517025;
        Sun, 21 Jun 2026 23:41:57 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c799749cb3sm21123865ad.72.2026.06.21.23.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:41:56 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in os_intfs.c
Date: Mon, 22 Jun 2026 06:41:29 +0000
Message-Id: <20260622064129.10261-4-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622064129.10261-1-mokshpanicker.7@gmail.com>
References: <20260622064129.10261-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace bare use of 'uint' with 'unsigned int' for the status variable
in rtw_drv_init(). The module_param() uses of 'uint' are intentional
and left unchanged. This fixes the following checkpatch.pl warning:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..4434e66bfe63 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -791,7 +791,7 @@ int rtw_drv_register_netdev(struct adapter *if1)
 
 static int _netdev_open(struct net_device *pnetdev)
 {
-	uint status;
+	unsigned int status;
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
 
-- 
2.34.1

