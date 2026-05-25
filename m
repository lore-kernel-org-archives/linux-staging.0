Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3356A39183C
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779739853; cv=none; b=bFWJfq0NJ8j1zotFSwVjkUBGRZ1CyOnJeKn1+JfTkCOE2JUVao19w/4M/gI9zDTb3kLcymP2pIYVUgRnDnEAOS0iMrjV9ZTOmb92ZyDe3pqbcAEtVSL7j8/jvDMao8WQRQzc3irOBXL7veZOjMAqEKjDwmgmpivdwqmJJh/Gxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779739853; c=relaxed/simple;
	bh=qOMWKtxkh0emtX8gT3Ztz9ZwYfasUhrgEK4uvsPBPyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dr3Kf8HBNXCGsOxOr4oMoYJ3o1gaKEoG0mbTOoSIxYLU2l/ahJcwKR1AsJEije7esJx7mV5hokb8uK6J91OXfOLLwwy79CQMiR1g1XdViTI28pLw3DR71EBwXsmwnC81XoN9JF28FgAHfcAEyGVmnYMgwsDJ4m7KBP1NV3kQ4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGfVazol; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGfVazol"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a14580111so7432144f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779739850; x=1780344650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YKy5lJgLdKCaBHU9RKyIiL/mxXhhw2y1N8YTqL1P0vY=;
        b=SGfVazolL5WDeyZYzpX35H+6zWWp1mBmAVaUguu8yvBZKGoZMa4o6psGwg6ZkgaHQO
         kcwRM8XI8mmJzNEa8eN6cJi6icHz0FjksBfm620bRZinElF5OjARumvqhL1n5o+5QlhU
         aqE96HHqRECo4KdN3AHTjmgsUZT5iKQME2Gm01l8FwEM/kJ03v0N1t3KChfkJPsUb0AA
         Ny8Ydi/6Yw6pDgtT/KTlsykkqzttA4vB37htGxdkjQp6kBJ6Qq8EoBQe8w2MNI5tZuCD
         icHY5s02nIPau/TW1D6vKXMeRwOwB8qWTtUACv6VrKmqOaEB8XaCoo2x1yCXSDnH5U2q
         jDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779739850; x=1780344650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKy5lJgLdKCaBHU9RKyIiL/mxXhhw2y1N8YTqL1P0vY=;
        b=k0UDmo+X10EPuSXVA4SvQJCfYvd7mGixCuMGK5dpT3FLjphg15yTYIaQ4qDXDSPKah
         DoC474n3MMRTdwmnZT5tW1oz5Xav0eTA8K15yQRYJuLWexPJS/9jtjBo0XCsp8VfADQX
         yyMVmcFIB7jn9ko+u0l6GGZ+xPmY8iV/EVHhZVewll5Zrt7r4JCf/27bgkw5jUzpJ2jY
         DJkWqulNBpwgggA2BewbL9eYIU/15DTSVzTURkSJsWc2AO03ybvBS0fZn8gE1yja9YJY
         CKu5P3BF/LRAynwQ79+dTJF18XiVoFlHMOedcdI8UVqexW8GOb1df6CXJl/4QIVVK/6b
         WrXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WKU9nHVuofqgy+5Hh6IzNKYczyb1fyoobq7LX1uMZh6h5dnJJyTk4HGh99dAIVIo6ayfGTmB5Bn2O8kgZ@lists.linux.dev
X-Gm-Message-State: AOJu0YySVmZOcqB3lZXA6eOyHGF7N6uVDb+XocfPgpBUjnrQfx7F3Uro
	cmKTL4Ni6GPEQkuic81ipn7RjYqPjW5JHZTQpfuhgXSc419f8OqXVdBk
X-Gm-Gg: Acq92OHQICg6FgO70UoKVI7lP2JKCDSplt6wg/r5WyKfKu+RwqEbUf1uSNNEl9bqeIT
	qBIZZ3699OcMIwL+nVjy3nYun3jLQGLVur/IHuwrLbb4LVnFeyhvwvLMz/eM8zu1e2Gb9YhISkx
	qoUL7Xs7kxS6E/pdCNamj/SdPNREhaG+Sml2KiiGlSyjLNR2O76G+mJ7lfmrpy0tLZTx0JcGhhH
	ZS8hClH5aGzpceEw8yq4Z8chUFNflsHeMAVuSdoxD0Y2b2SL6QDlD8qabeLNhma/A+gsvO7t5F6
	2sYeZZd6b9n+TBrT/yOYRsiwWwASbu8IYOv6nMy2vd49CX13dE2YBAIJjfXGr3KpqHSiQxF98Jn
	uriC548/WFMUhNh5s9qA2OpdOZtegOQdKwjZIHaKP35bMMz+vVZZnNlqk66gOE9Fl1LlQsokwrm
	d7bPzd4/fl87+HyUPWY6ZR2gDJ/YES/HAzUi7y50RcQ9UBIVO5s1byeYACbsM4Do0yxutS47Cgd
	H7QC9jKpk7A8no+T8YBFeE=
X-Received: by 2002:a05:6000:1844:b0:441:1e41:19c with SMTP id ffacd0b85a97d-45eb38af5d2mr25668448f8f.20.1779739850439;
        Mon, 25 May 2026 13:10:50 -0700 (PDT)
Received: from localhost.localdomain (user-109-243-64-150.play-internet.pl. [109.243.64.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cce0a4sm29108116f8f.12.2026.05.25.13.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:10:50 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wo=C5=9B?= <krzysztofina2022@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	khushalchitturi@gmail.com,
	architanant5@gmail.com,
	s9430939@naver.com,
	andriy.shevchenko@intel.com,
	kees@kernel.org,
	=?UTF-8?q?Krzysztof=20Wo=C5=9B?= <krzysztofina2022@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style in rtw_cmd.c
Date: Mon, 25 May 2026 22:10:01 +0200
Message-ID: <20260525201001.14852-1-krzysztofina2022@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix spdx comment style and indentation in rtw_cmd.c to resolve
errors and warnings reported by checkpatch.pl.

Signed-off-by: Krzysztof Woś <krzysztofina2022@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..dac7a615d158 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -184,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
+		((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
-- 
2.47.3

