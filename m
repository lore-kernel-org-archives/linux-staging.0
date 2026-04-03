Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271DE270575
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775179179; cv=none; b=SungxmxIW/9esvEWBfSDDQgz44wnTFeKHl1n/4UEY7u3hzbH3d7XHaEy+VrHG99uDv+AlIvDB7UypjcZG9jz8+6dyMDU3Qon1Gc1SgEjE/69DIbktReMJHPbiW+OK0JhLXFEN/RF78meH9Vdt8u9GqD/SFbx1tFYOV8sY3ZGeP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775179179; c=relaxed/simple;
	bh=/eS4sWK9gQ4gV360NHB6Tqy22SOB6pPXAYvR9VMJiN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BXQ6aKMQHmGyOltQLFFEKzYtHq6sX6Y66UgyfjK6X5NamWKcZAOVuC5G79hWxy5SOhA1MH7KL2wAd/Z0lQbfqf/NhdCvbzrN6urxLafuN4xzjsay/ni9kWh0+pzHF3Fg0lK6Bz1Pfr83Do7t4CvsJmsNQvGw6HNH55TQJC4I9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyQKtTM5; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyQKtTM5"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89fc4147f2eso20949246d6.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 18:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775179177; x=1775783977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+BN18+r7rmxEshMrN35v0sLRU+kkJAIb3cFC49W2YaQ=;
        b=YyQKtTM5C4NHN5sEFgVTZj7AyHvNo/ma/O6uuqbtknkTBqqTTA/ln/xYAocNloXiww
         bCHaZQLNRKZcBcjAbs86nvuvjGjNfMe1+X67tt13flc4fdLXT8giJqbePUPgkp4tlBPW
         tTmX7/1tUpILmiLNaBVwrurk8U2E/OoXg7fp8SnqsWm33StLPgxc61FIAj+LXKFH6UEp
         JImbSficRF//WBf9h/x9w4p92bVOd1aM36JPBcl7C2SislCNFV3J6f2uSkwNRRH12CSg
         3josfsOBolqz0ycd6JdyCrJrw50ymgQSXt3+6/t8vmTcB9L/n6BGrhIjKz61JJnLM7XV
         BiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775179177; x=1775783977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BN18+r7rmxEshMrN35v0sLRU+kkJAIb3cFC49W2YaQ=;
        b=N5JQCYEZbz8XtZC7EjmJn0H4wwzAwn0IwRuy5z6UEDlVWwtpkkL4IMgg6YY+gyf2TW
         2fVcPIOpzH6PMAOLN1Fl4O89SLIa6sXyh8TdN2Rd3tZ8Ug69Nz98yN+7XFaw6iPVGUag
         xheXxQ70FQc5B9/HudDxrfpp4mXji7eeEgKmDD2LJSMlnYxy+3QRSodiHMK8m4NbIZ2s
         Y3JWLMBuuDzODxZZFWMktwnt0xdaACAOVD3jj44VJ1/DQO+kFQZZGEuVBpMVmDwOBEbw
         d1FnnWbiMKCzNDGnzTRFNpkEeZz9Pssj5B/tQJQJ/kIA9UaXL38AxamheztivwoMcu/o
         h/hA==
X-Forwarded-Encrypted: i=1; AJvYcCXPZSpZQVnMGOpht5fi4yWc9xpZwU4EoJQ5ksEW8n4wkQ6GHDJ+K+MTGOS7hLI7o6kOjoYNreEiir5mrzJh@lists.linux.dev
X-Gm-Message-State: AOJu0YwSyQsWzfIgR4Iv5daOm+HVcVlKKfD3gmM7BD/rYmK/E0fOE/Lq
	jZNAneeqdBdCejChzBv1Yz+yXeiTJhq1HXEA++kClDmXnyF6teY6kCgf
X-Gm-Gg: AeBDieu3HajIALPrItboB8wpefefj0uUHsaT7rg+dKopYXItSmSOfIVlhqAXknvsdfT
	dW3cpxvObfn3gPAPzT+UD543+cjb1gsjR3JVSCd6PO+f3R7Orh+oOPtqiSDIOGo9AaAyZsG3TxW
	RIntCQVwjnHofm7t19EgVCk5zHHBFadtianBKjRzFkU0rDLXHNPVRjP7ndMrkXZsfaIDYyXp737
	DOCV8tttD26NnKgVsMyYaV8SbQkKtipV7VOuVsjengeO9WoReJlUHZU3r+/reNpGJACHhIm9eq2
	6GYP0GIEW0/E94X0g+VR0YdDI9xUAOBp2SQegh+iH6COy/QGo0CxQoy9M+Ilep5tDNU7NGNExi8
	K3TimekSJTxl7iXPUyCFJqAydVAqqTg4Zf1QAewcJbVA7ezk8a4QC0YxMfaERN/+kC7MwVVcJ
X-Received: by 2002:a05:6214:5d8e:b0:8a4:71fa:1f4a with SMTP id 6a1803df08f44-8a6ff3b4e2bmr25949276d6.0.1775179177005;
        Thu, 02 Apr 2026 18:19:37 -0700 (PDT)
Received: from r9 ([2601:5c2:100:2f60::418e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf6741sm42830576d6.18.2026.04.02.18.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 18:19:36 -0700 (PDT)
From: Xiyuan Guo <tommyguo039@gmail.com>
To: gregkh@linuxfoundation.org
Cc: tomasz.unger@yahoo.pl,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiyuan Guo <tommyguo039@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix include guard comment in rtw_cmd.h
Date: Thu,  2 Apr 2026 21:18:59 -0400
Message-ID: <20260403011859.307665-1-tommyguo039@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The #endif comment at the bottom of the file mistakenly referred to
_CMD_H_ instead of the actual include guard macro __RTW_CMD_H_ defined
at the top of the file.

Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index c4c3edee809d..3014fcf7bb85 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -712,4 +712,4 @@ enum {
 #define _GetRFReg_CMD_		_Read_RFREG_CMD_
 #define _SetRFReg_CMD_		_Write_RFREG_CMD_
 
-#endif /*  _CMD_H_ */
+#endif /* __RTW_CMD_H_ */
-- 
2.53.0

