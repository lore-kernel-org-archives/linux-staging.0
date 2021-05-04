Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0A71
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 13:13:02 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id w3so13094291ejc.4
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pXRitWWRRFW0ojzwHJ4zpfVrafyqDHpLGDB/FMLEkjA=;
        b=uR0rWgEn3vx0xKzg6fFNSUPJ0iGTGOgJl/mJVjwfvk60++XDgNCqyk2E9AZxzMwo5Q
         HBBrWYoU6dYFcGAa9PIDkdld3NPhj8oBfUYEC0JvohnJPC6mORDtvXY40W0TU+r531oG
         vGb8lgxmqy5PXle8hbYzEc8SnjzNCLX6aHqYZbSMQzorFsfj8KAcXYlGhxYd+NOrIPOc
         hN/E60UlayDR+7684/DO2F/oEftIPDgnWggJQHTN4D/aFnhN8qScFrntYIhA7HXnXvHA
         tY+uMNYu00iO2o8pAMoSfvqrICj9f5ZV6OF8Y2Q5zgVO2hTdT0D+fo+O31Hp/m2pAFCh
         yg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pXRitWWRRFW0ojzwHJ4zpfVrafyqDHpLGDB/FMLEkjA=;
        b=PZ3hwRn2fNLV42jOnMOwbdCxivqK9WJcVgQvjv5LecBECPDXQcMeEs3yMTUx8XExYe
         ff3S7TtpfM6KeJglml5dvgB07PYGm1kLkmv4X13OkdFTd+gW2KtKmVB76Q0RJFFLKK0J
         B6aRcNXuj0tVBOvOEC+Sdym8TWrRp0P7vjYtax3cPRmqF7a2UJwfbYYaJihBMbvNUsyC
         /mtdUHrxdaIXg8rWzc9AfFGr+2GBsjHNgubBHFpzEr9iCiVCgaL+JgKP9/kVAiJqRV0O
         HKz/DxNW3Z4+VNsIdqVBpxqjndzmGWQKJQl1HrqSaqxMxynHpxHoMBA3c5NcBMDau1o9
         YJBw==
X-Gm-Message-State: AOAM532FFdpmnVMMNugSd1Gvac44JpeOPp41dQU9Gm1t0arQuqjPOn3h
	fVoytKjDb4utDUHUIqMr0hs=
X-Google-Smtp-Source: ABdhPJxkA8SUpPHLjcdS/lCMfwtVNold+sp1LgodeWf+E1FxlTBZSP/JzRRB7mN/pSK9NodJ2PuMCQ==
X-Received: by 2002:a17:906:9a02:: with SMTP id ai2mr22336260ejc.279.1620133980948;
        Tue, 04 May 2021 06:13:00 -0700 (PDT)
Received: from agape ([5.171.72.210])
        by smtp.gmail.com with ESMTPSA id ga28sm1237444ejc.20.2021.05.04.06.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:13:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8723bs: align argument position in a new line
Date: Tue,  4 May 2021 15:12:55 +0200
Message-Id: <f195bc7d72c122e5e16b3857cf99ae1f84734915.1620133620.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620133620.git.fabioaiuto83@gmail.com>
References: <cover.1620133620.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

align function arguments position on a new line to
open parentheses.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index e4f3049ac351..0cb603aa4ee6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -2056,7 +2056,7 @@ static void aes_encrypt_deinit(void *ctx)
  * (SP) 800-38B.
  */
 static int omac1_aes_128_vector(u8 *key, size_t num_elem,
-							 u8 *addr[], size_t *len, u8 *mac)
+				u8 *addr[], size_t *len, u8 *mac)
 {
 	void *ctx;
 	u8 cbc[AES_BLOCK_SIZE], pad[AES_BLOCK_SIZE];
-- 
2.20.1

