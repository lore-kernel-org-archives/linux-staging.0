Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4C2F7F1C
	for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786826257; cv=none; b=CEJKqWJuPmkFNoZhy41+Y6gdrtostCkViJZbMl4LZz7fgqHiDveO9N5zvjWnEyC7dbW5w5Zp+kPRzA1bNx7KamN+qD5dzBeCKxfUVX3MTQkNPoYpuoGvL34w5bvOEpUxnyWNJKQMjkXG5sb6pPPpGB22XWnMdm/hTjhWBqV3BAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786826257; c=relaxed/simple;
	bh=jGdBot/ogw0rk0Z5KnGbtAuhPnyO90tt9SLnYTCs2pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rurNCBiPUkl9fCJbVYX28YPBkXqvKMf0NeC0RArC7YYR5FDPAPSxfn6PpuX/uKy8vWn/2oIH4OGanJIbzyl9/2vNvDNB7zT0ypKWF9MmKY2Mka2lIMTCXzuz6CKual1jtgNEBrPz3smr/waVdgeZMUGBUemns6nBxtSO6IGk1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRsnuu1E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRsnuu1E"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4994c49f588so18037075e9.0
        for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786826254; x=1787431054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5i0OgMLNRVnAPLfnZ0d9k/CImptze9EYEWAsWU8dczY=;
        b=NRsnuu1EkNxN5XaOXiEbvAYasAS4QEkpW9bnqXasrbDSnqelJ2HrVYJCuoSERa57KY
         mkUXDVtjpk1EDVd6xPtTYSccago9GGO/KL1PQ8mA0cRP132OTZPIiMccbXyDF3LLVXU9
         a7b6us9OR+mj9GIKAKmEqdhLNVQdyfNfF0A5jP9ss1LDKN3NK79Je5n5wUMS4OnXjnOe
         Gkw1v4+IE3XR8LgLPBqJRmn7slSVay0F1akpbQc/bqk8nGIgPJ189AIrF5tNG3mh04d/
         GITQRsjXdkMO9FioVoaBqnv9rKjGkaXnrl8K32sxWg8fTzeulBteYEtiYQFsPc8Q9YkT
         5uCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786826254; x=1787431054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5i0OgMLNRVnAPLfnZ0d9k/CImptze9EYEWAsWU8dczY=;
        b=WxPJU66TrF9JIhT6vFV3wg8CkYJOQolmgN452c7At1V6Ob9SCsmopKT+kGO/zC8YH0
         lxmwKlgflDmGbe7APr48pKAYwJW3IhE23KbVEQ9l+IYyFybVEfqVkFsxPi6GXoJqvap5
         Jrd4i+3cE63zuHwnhiGjLd7CR5IKIWIyHSdTaZogXdAs+aGqOl8GjXTRnPWgrS1EfACH
         e87dd3Ma/Xf5y7jbn9gSG08b0kwxZnnfCGQ0Om8yGKslrQ8VLTudT/Jpk5I4PQZ+GP//
         mOPia3L7/npog02PSXYkPEcNaLSuNTWs8RX2gVEeldw4zmAu1NiifgPo4AwDLblXFs/J
         /Ejw==
X-Gm-Message-State: AOJu0YxpPR4INoxDug2hxXPFZmcak7RsrS34ME/z35hnbBrXlrsUDiNm
	mvmYzQHWbDmbiVgQAsMbkW7J6rxaHK5p84IFYWOZfsG9V2x+YKE1dybt
X-Gm-Gg: AR+sD13xRpp1xoD3Tz/fzJb3jR662Fk/2vVYE4BSlYzvpIXxNgfbVhg+hsJdBSJVzMN
	ptqtZ1G+QeBKZU3wcnj4zLqM5j6p8N7LBO0BOjOc75+aFBHOiVDaweMFqr9te1QVrIwyVQzl+QL
	jbBoeUiWNZsPOt3q1O7aCssNNcL9rYo+uhAjSuZSeP0ls/OWUGlzNhlJQgoHQ2VKwRpo5IIbP1f
	oqQPpqbfDVPLcBKgZG34xodVoWTUCv3EISKgblyWeZon5sZMJkxx3kD1BUK2Rns28/TUaZb4RQz
	BQ8IbzF8v9zOkDwTMZUWBeN9VF20qkrv0QtSVTu+QjoY11pJ3q7B68wUZiz99CiDCM68wYR2g8v
	379g+UJ2dBEB2+Rekac6xWL3b6NUGZ1+8EWCs7mUoyQCkQfcBgwQelmPHUG9YiZ6sERT4pv4Brg
	rEokzfpBjKdXwHhhK/KwfkiG0CP8k7daELy52irRi5JZYOlWXTRYSWZCNjXquCMq6YDQenYxywy
	aot4JrQft9lyob62d+42Th8/GldbY7fEAvrcFSwtLMfvxs3tA==
X-Received: by 2002:a05:600c:8119:b0:499:596b:2e91 with SMTP id 5b1f17b1804b1-49987a58078mr215994455e9.3.1786826253757;
        Sat, 15 Aug 2026 13:37:33 -0700 (PDT)
Received: from fedora (cpc106993-hali7-2-0-cust876.17-1.cable.virginm.net. [82.6.131.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988adfbd5sm184091665e9.1.2026.08.15.13.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 13:37:33 -0700 (PDT)
From: Oliver Burns <oliverburns.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oliver Burns <oliverburns.kernel@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove CamelCase variable bAllow
Date: Sat, 15 Aug 2026 21:37:11 +0100
Message-ID: <20260815203711.36973-1-oliverburns.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch.pl warning regarding CamelCase naming conventions.
Change the variable 'bAllow' to 'allow' in rtw_cmd_filter() to
conform with standard Linux kernel coding styles.

Signed-off-by: Oliver Burns <oliverburns.kernel@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..aa4a810d8322 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -299,12 +299,12 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
+	u8 allow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
-		bAllow = true;
+		allow = true;
 
-	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
+	if ((!pcmdpriv->padapter->hw_init_completed && !allow) ||
 	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
-- 
2.55.0

