Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2826166F00
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947852; cv=none; b=YE0aVEG6sfdjev6XcjXSQsvs8sTsrHPeM8eBWhxntWoob6ixedHd/pTifJivEBd4LIJakiv3NnGZCopX35Ezw33yl9NvSQXISHy8IxxQoov1dLi6ZktEP288rJmjDo0279VXAoExdmtrVa+7+yrfOJIZLZesPPwBgxKlhCGP7rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947852; c=relaxed/simple;
	bh=rFTsmu66W2cqMwlMZm+VZUMWyz1m8yIGCc3H6gMc4sQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUDm0IMBy7u3PHrzjZAgJOSGOf0KAI3gN5xCalOyDbFOpa2ZlV+EfTEfaMeOIbOl+0j/0c7/o6nQSyJrj+WtbQvk8pl2DXillsnVqkphqyyP9l9ICZH864SOKDOoybgxA7O9yXkwMyNl0rJp5GXvXDhLBcXpYfxmdiqP9n22/lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVzieBze; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVzieBze"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso465185966b.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947849; x=1726552649; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JenHvR0jRUJvf+xKQyKoB5pvp6Qm0Xj5l28apEXo82Y=;
        b=DVzieBzefUyKbx5/0x0FVWQZ3EcJs45coc8kbp9r0KRLpw8YSVTsni90fihZMo1O4h
         xL9CZHD4VBgG6fYAp/XsJy1qqct9JR9+QqcTD0QTRXqrcGOODuVrQKIHuPJwNB8L+yzC
         oaQliSCAfK4YBCwnfeYYREOxZBmqKvQajpxW3bcGQN5QBde4jmqorYkZsTsIo63vkFVb
         Thf4/TMbXuRcaUcx6qxJMZoZaBVkbSyR3R/inov2OiYEKEYwm0bOHDbkTLJpTJnrq/LK
         YOq0K6OA2u001MuqyPW1pkNtQk3qvMe3bV1YzDIxXMOW+b1mZFDntnJrmY73IQb3euZ+
         xJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947849; x=1726552649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JenHvR0jRUJvf+xKQyKoB5pvp6Qm0Xj5l28apEXo82Y=;
        b=Zs1TzTU3kpKdL8PKAis6jFF90ZmaREVBnRo91xHpV5yu+DuC9RPF6V6L5ASwHWNP1z
         M6ylwSisakGQlm5JLetEqyEVrO0FD9fKFZ55GTOvOtWR/fj68y0uPXhkxVXzhswGtvol
         VBj+B4JgW290XzpCLX8Up8KGlkW7KAFIz8FriEf2mLFU8NmfXHIq5KGyZnTe8m4XNqKD
         kLEimbBbfEkywpfVcTYT9F+u3yq6yulZ93HyVgJgZVNGF7s1b9K9NrMDGqpx55AcmdSe
         7bf8X7SdQvhWV902/t8I6sLWzodJTc9bi2k+0LO6VECBi3SysHGepLn3bUQaO/2xkWiO
         aWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Vzrgl+4aUEoLTsFiqwDOQFa05KGC0zHun38Zcr5B6EIO+AgOulfcLvEcHfNhdQSGqzAIZS1ASre2GNwo@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8JFsSKWcpDvqmyBJGlEl+r8p/qsVI9i2vjJxzPx5rCnI8JTDy
	9+fzb4pNjemJpRdhDvt5af0Wh6MCqOIvTBpb9PdZnjjnfRHTG1Yz
X-Google-Smtp-Source: AGHT+IHIMKip8upzlZGqt7QrER3Dr1PwTFF7DwidiZZOaZeCbrp21Lq2EdYqhnyTfvtp91TXDHgY4Q==
X-Received: by 2002:a17:907:782:b0:a7a:acae:3415 with SMTP id a640c23a62f3a-a8a885c3a7bmr1105740966b.10.1725947848806;
        Mon, 09 Sep 2024 22:57:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d2592647esm432513666b.48.2024.09.09.22.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:57:28 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:57:27 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] staging: rtl8723bs: Remove unused function bb_reg_dump
Message-ID: <e0372c46a62df20ecce9a9e66846cbd3484eb85d.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function bb_reg_dump.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 10 ----------
 drivers/staging/rtl8723bs/include/rtw_debug.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 0edd7b6e4f21..e5a4baf1b78b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -32,13 +32,3 @@ void mac_reg_dump(struct adapter *adapter)
 	for (i = 0x0; i < 0x800; i += 4)
 		dump_4_regs(adapter, i);
 }
-
-void bb_reg_dump(struct adapter *adapter)
-{
-	int i;
-
-	netdev_dbg(adapter->pnetdev, "======= BB REG =======\n");
-
-	for (i = 0x800; i < 0x1000 ; i += 4)
-		dump_4_regs(adapter, i);
-}
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index f70da9cc66f8..9948fd0f7e91 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -8,6 +8,5 @@
 #define __RTW_DEBUG_H__
 
 void mac_reg_dump(struct adapter *adapter);
-void bb_reg_dump(struct adapter *adapter);
 
 #endif	/* __RTW_DEBUG_H__ */
-- 
2.46.0

