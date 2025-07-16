Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F520C00C
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 05:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644191; cv=none; b=UXsbLb8WaW0NxdmFUkkq0ebAvRFy+hhvJ7MtzXLKPDeTbx6B63isKxtcgoiqZjrttVxdT3baQy+jZ9wT431otJDpROwSv4pP6OOx3wzdX+xJWIsnswgoDWixXg1PDDfMGougnpsPvdXNudwft8QrQvKnPIGArle0Nfs44Fk43So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644191; c=relaxed/simple;
	bh=aqEc+0+eaKsK0e4VoRJPPXWBqjg9AwwQIxFaffeFvxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HJZHSN6PO72xliX51UitlUuCln11SwmwrdbEsL+SPOo+2erXExS/J7YpeXam5eY3y0v1F8VyMruNxl9W7RItqa9GHYauDlCT1k7Gtzwu4ztzzdb3+bw3DZGMALMlc+yMrF7unmytidRjb9pTjwQyVVV/VBei39z2cnk2YH6+YCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUwrF1ev; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUwrF1ev"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2ffaf8283faso651629fac.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752644189; x=1753248989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGYoK97UMicKRY+/A45+HBgl0cbKX+YpMqQkBOCWKT8=;
        b=dUwrF1ev0lIhSo8rDpVBBXwuEJbZ7jW9nymfd0+0srpIhQ+xAnrkGLqWoCj/HN0HDt
         fAAgLZNIUv3ZY1MkZ0ObVLgQVovAda7S+VNYFoCVGIxaEniStThWzj/lhg0sxAfhG4Me
         mcThPtYTclB448DUUZ0AgmJO+8ZrateTFfeLzdsEdsbpzSjozOZaIpcUWi/MT80p+LmU
         S6a7YqCjtEQDMCj65eUa8ocrX5O+o0KZzag6P/qL1ghUqOqnufwGzQUzlyoqpcy0y6m/
         qK9G7jUJX4sGNAAHndD7kpQouy5/hEwR6JVvX3WjJs9kgWoh8tfK6Jr7gTNmN7vas3dh
         oQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752644189; x=1753248989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGYoK97UMicKRY+/A45+HBgl0cbKX+YpMqQkBOCWKT8=;
        b=ehOp8q62MVpI+b+Zwms5XlIQNbM/J6HNCiLGwl/OGjrHc+egGZvD2CQZzNVt69mm0q
         LLN9JdaHrmwkQjJqUpoIv+3IKru7gsctj1CDwlf1092NXbgnU+9CaPEqU0mI1uFYsakT
         u8zlfZO3EaHhAbwFCosmIIbUGT0c0/AN0q+jxIk9JRVgRUZ6db+QbGLIOx0R+lcZC8WO
         6DmXX3tTs5NKTnSklBkOv8pANiPeXM2pBTY2PfnDNUnz1g8XlJuYhHOVmoIMk95Wlf/e
         f20QBYBY4qtpPh9EfFP3/LKaTSYa0CjuuE7TRsLvclsY9VMtCpBjtIBXnMotbLvBluPG
         pSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvBNjBMIUEDtsfWluHTtw3YKNYlab/idgFm5oYHzRUovFQmnQ8SmnlEWacYgbSKxUCNJL5xAiivH7NSC9O@lists.linux.dev
X-Gm-Message-State: AOJu0YzaUqS3k4YRgl9JoAUVoOdu+fQtwiq0jfHTp/z7LnlSgMEb0Kk3
	8zMyoD9PX+rlFaxAigEsJLKWAahpS/C/j3w7WbTBhwPaua5iL+6EwBcP
X-Gm-Gg: ASbGnctJuTJPdpczjkTX9JsM2owU8M42IrZS4WCjTPNZhkfDMCMYpx7Q1TGlqbSnl9G
	1SAQZOzqlwxYDCEeApG28jCo1+ffHhshWnr7VzuSQ9V6pOTuoKEZVZBp7/ESmhCBVorB/T0hpeS
	MrTT/xWy5uTBb0sqXtGPy+jDSC/tf+X+BZp2bJS+j3zi8fDDnQqTaTUvkfh0B9weVJh9/nl2V2t
	d/dwvNsMoMHC3bclWL1HXJ787MqYwcSxoniy1pXQjFM4D8oBoYxbCS2zUwRU7EVkiVQ4EouYoZ6
	zBwgMtNGB/hQJpl6uquGGKWgl7dFgdBKN55lBkYqEzYdiUCmqi1QemxyGDTHYU2bjMkyYeKZimX
	tDR9EKp5mD5KWyHdbb7zfIo/PfCEHlO81P4lSwasN6rxZDBLGqOfWJpGDqCAnimg=
X-Google-Smtp-Source: AGHT+IExJOyKHzJvi8FNI8mvpa4pMZzstUgEM7+m+aZrR7HMNz6U42ep1aWfY5ht1BIlh3k2HhrYqg==
X-Received: by 2002:a05:6871:294:b0:2ea:8091:41f2 with SMTP id 586e51a60fabf-2ffb243956cmr1243399fac.19.1752644188567;
        Tue, 15 Jul 2025 22:36:28 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff111c379bsm3177613fac.5.2025.07.15.22.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 22:36:25 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: fix indentation in commented code
Date: Wed, 16 Jul 2025 01:36:04 -0400
Message-Id: <20250716053604.64798-3-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716053604.64798-1-ignacio.pena87@gmail.com>
References: <20250716053604.64798-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warning by correcting tab indentation in commented
return statement.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd2..f02b3b485 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1318,7 +1318,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
        u8 res = _SUCCESS;

        /* if (!pwrctrlpriv->bLeisurePs) */
-       /*      return res; */
+       /*      return res; */

        if (enqueue) {
                ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
-- 
2.39.5
