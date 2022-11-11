Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317037F8
	for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 08:37:44 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id q9so11180639ejd.0
        for <linux-staging@lists.linux.dev>; Fri, 11 Nov 2022 00:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMeVhviS95T1ATK054u2qDdwy0bMtS+NUWOBe0eridQ=;
        b=iH9iTA5VKXpqT2HFYwETbz/+vaY4WLsnQs+IbfOUNUawdLJZBm/3smJ59KoKMj2V9G
         EpjPgn2TId1nY/N3qn0PJ2ae1VajgHPjXAm+/0kRJKYQ2nLYZQsgyQbvlmHeNQtgZ2Bu
         QAUnafvRC+dUfqju9fO+joNG0CfpmtAt1dt8h4+stcnVb2Wjq5ek9jerS9SJ6QWseuQu
         XvTVBHyQW9efizj6/Gi13K1XzN1F+qc8PG1FOIZYa6bama5yGzRM67o36B2LVbcsfciv
         WZq3wIijkR0DN15mSy3+XGQkpBcL9n3Qcq+of4SJfJv36TAtIazAongvCPLYkZcH1tpt
         c2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMeVhviS95T1ATK054u2qDdwy0bMtS+NUWOBe0eridQ=;
        b=lFNqml12LEaWPsxcj9spYT35T3I8UqFfUflfExJr43HLS0GP7pc/iQfwavblIiz95v
         MPvBLHzMN7+tnyR/VyIUv882ear8FXgAbgoViMR7cp4/eN3+D8au93+8K76VqfTWtElF
         mQHSJdDRnRu7u1gSxt+G5mkpZ78u0MLfpOn/0ylqoVk4oB6WarDnTXxNZsp3I+QMqdJ7
         Fwa1sgUHE7BCvgQwJyh/aU1jP0r7R+A7IWDEHZGnByi2UOGzyKF0UWbSosdyFz97U/de
         BQsC9LuLg7SXPiCQFI9JYe0xVqOrOXhNOkGjR9I8BMsAt9hWiets31p2WQKpcil2Vna8
         npig==
X-Gm-Message-State: ANoB5pnmOILd95hqFlEeJS8qmkR7hIQWXWPIhMhyUdfFm2XKnaG9JNfA
	n2uzbUBKST846Hj7hjCy750=
X-Google-Smtp-Source: AA0mqf7XYO5CBBhMKAtXUNjLIJ8caar1m9Zex1CE3ThQYW7VTuLCA3XzQ/YMcq54hNtMTB5XqfeIOA==
X-Received: by 2002:a17:906:b891:b0:7a5:f8a5:6f81 with SMTP id hb17-20020a170906b89100b007a5f8a56f81mr959785ejb.570.1668155862529;
        Fri, 11 Nov 2022 00:37:42 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9a.dynamic.kabel-deutschland.de. [95.90.187.154])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709063ca200b007ae566edb8bsm643190ejh.73.2022.11.11.00.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:37:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: convert aes_cipher() to void
Date: Fri, 11 Nov 2022 09:37:30 +0100
Message-Id: <20221111083733.3144-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111083733.3144-1-straube.linux@gmail.com>
References: <20221111083733.3144-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function aes_cipher() returns always _SUCCESS and its callers
do not use the return value. So we can convert the return type to
void and get rid of another use of _SUCCESS.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_security.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 5bba57d18b5f..780019ce1b98 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -954,7 +954,7 @@ static void bitwise_xor(u8 *ina, u8 *inb, u8 *out)
 
 }
 
-static int aes_cipher(u8 *key, uint hdrlen, u8 *pframe, uint plen)
+static void aes_cipher(u8 *key, uint hdrlen, u8 *pframe, uint plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
@@ -1083,8 +1083,6 @@ static int aes_cipher(u8 *key, uint hdrlen, u8 *pframe, uint plen)
 	bitwise_xor(aes_out, padded_buffer, chain_buffer);
 	for (j = 0; j < 8; j++)
 		pframe[payload_index++] = chain_buffer[j];
-
-	return _SUCCESS;
 }
 
 u32 rtw_aes_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
-- 
2.38.1

