Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A53F2C81
	for <linux-staging@lists.linux.dev>; Thu,  7 Oct 2021 16:15:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id a25so9367111edx.8
        for <linux-staging@lists.linux.dev>; Thu, 07 Oct 2021 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9E5Szjn+y7W/3JHY/8PTahKiMyq3oOWBAZ37nmcUVU8=;
        b=qXYAbdR7JJWmXd1JWxs3ydPa4FebAJP2Jn4T9o88kWDcWNggwOkNK2M3MUAkfjl5G+
         5SAmqZxPkho0WLsFStgsERMh+zVqp3mPpUQPbcILfCc4BuKppCRolpKYe1ZYEFaNBhis
         cZDnx/Mn2h5tE7WGkyA0+gMlSOZZkfOl8nWSkc9KhEHDE9RX7GX9OSbDWOowERrBlyEV
         BSzvbo3D12Ktj2pqv+uWSVxFvVNhfm5Y6JqOIR+L76yEhxG+pIJqaX6zNzbSJKcUKipn
         dzqI/Xu2w0o4O/nromJkRFHdBGTtGNTmKZSPY0WgCXnLZVoW4FP2UxUJD7QF0Sx5Ku4T
         Om6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9E5Szjn+y7W/3JHY/8PTahKiMyq3oOWBAZ37nmcUVU8=;
        b=uhXlTRRu2Hal6ZzuCOIVGa13b/NFwLYLmyoIHuDn+Lc6FZdbgLemymRmldcSxrqkMN
         8a0jrvvSm0SPCuYymzMlwKQWj/MIiweFxPBBnGg6kcHBvCXisIoMyghb+Ti0moAphkYQ
         WNW8hnFROQ0VlDSPKkSq8Pg9i6QMTTwlqL5Rzx7E3SxnLO6GjrRUSen/N4ozitGGMsVd
         uN3RDKiA4IiQHO2EjLj3d3D3K1MNLGAsHDEe4xfNm6nGyDXTBWp+AsBlEdnbWZfdCtc5
         Q6ekFRav/rG9B3gIeqyDYWFzxU+neB7UGSTLliAMbDFWrnceUY39LQRYWbGTNECVB15k
         Y8mg==
X-Gm-Message-State: AOAM5304u9jtM9IgD/r2BGdJoOgAVXIWkf/TdBNHl1Ck9Bzo4xtUS2aK
	jBGYZAdDfHqX3Hyex52zZ80=
X-Google-Smtp-Source: ABdhPJyor8yu4eAvavDwJUzhzTnifar3Llb/UAcCLRUKrYYKtan60NQgKRK9eAepC7DDaxHVjIbD+A==
X-Received: by 2002:a17:906:53c8:: with SMTP id p8mr6644978ejo.422.1633623339151;
        Thu, 07 Oct 2021 09:15:39 -0700 (PDT)
Received: from tom-desktop.station (net-188-153-110-208.cust.vodafonedsl.it. [188.153.110.208])
        by smtp.gmail.com with ESMTPSA id z19sm17859ejp.97.2021.10.07.09.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 09:15:38 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vt6655: fix camelcase in byRate
Date: Thu,  7 Oct 2021 18:15:32 +0200
Message-Id: <20211007161535.7563-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camel case function parameter name byRate (hungarian notation)
with snake case equivalent, in card.c

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/staging/vt6655/card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 3ef3a6e0e6e1..2b2255b3147c 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -56,7 +56,7 @@ static const unsigned short cwRXBCNTSFOff[MAX_RATE] = {
 
 /*---------------------  Static Functions  --------------------------*/
 
-static void s_vCalculateOFDMRParameter(unsigned char byRate, u8 bb_type,
+static void s_vCalculateOFDMRParameter(unsigned char rate, u8 bb_type,
 				       unsigned char *pbyTxRate,
 				       unsigned char *pbyRsvTime);
 
@@ -75,12 +75,12 @@ static void s_vCalculateOFDMRParameter(unsigned char byRate, u8 bb_type,
  *
  * Return Value: none
  */
-static void s_vCalculateOFDMRParameter(unsigned char byRate,
+static void s_vCalculateOFDMRParameter(unsigned char rate,
 				       u8 bb_type,
 				       unsigned char *pbyTxRate,
 				       unsigned char *pbyRsvTime)
 {
-	switch (byRate) {
+	switch (rate) {
 	case RATE_6M:
 		if (bb_type == BB_TYPE_11A) { /* 5GHZ */
 			*pbyTxRate = 0x9B;
-- 
2.25.1

