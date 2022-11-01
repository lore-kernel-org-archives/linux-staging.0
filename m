Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF51641;
	Tue,  1 Nov 2022 09:55:38 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id j14so20105008ljh.12;
        Tue, 01 Nov 2022 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zpGDf3BIPVG3Rl6WILp7Vb55DMORDglMgQCuvktOS0=;
        b=nWR/ZwN3abb0naQDgrTsC+vN7RTPjNOzHE7eCCW9DdKrxp75h49anfuAkdfWABY5yM
         G9DaADKc+AB2O9H8SwgVhssz496jFhlWMxc2o4/1R3C+TIPL4uOwNyUIEpCfPQSrRqVO
         HmJzVjR7W5sfw2nuRk160BKqJLzOzW1Dm/5Asw7owWSvRox+wlYB51GGBYCqcODTUYpy
         xLic1jrmz0qc+ew8wGRqnY6MR+0YSzrbdVxtFSUsYyqZekdRjzDVdTbboEFhZFdXLBSh
         4L9bOqOX0hH2Cgb5QnQIU/d9n+rOPBwar9BnkCMQspXhwXQDCJorJLwoHUzIM/sFJODD
         9k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zpGDf3BIPVG3Rl6WILp7Vb55DMORDglMgQCuvktOS0=;
        b=B2/L0qgGRAKDh7UwB4AtZkLMzdrfQ9vWqsqyv9adrgl7ltB5eZB5LYzn+2fTSGB65Y
         LHuUV63ToHAyXw9V1jli3b21/eiCNiwsBNUk011luJj3KJ3MywnYxVW3VHfrzf67mCAL
         joYMHa5d0FW+JgGdpXV66UZ8g//Xeiw2sQlEq9ZfSuzjB0mmASbtGRyHkUYW/5gblXc3
         mDqnCZEWh14V2gZXfOi/b086QXkao1oEmZMlnmVolxiFDrkG5Q7vdLTdgusVoXGsIaVC
         uD+0khbCokASct9M07g6wYUfdmCKzCbzW9vH49DXwPwc9z/Z80URXiOTBLPh1KjhXrDE
         UwaQ==
X-Gm-Message-State: ACrzQf3P7+WBMS37Djo6z7ey0oZz21BDn52JUtkVV4TY2i7GIJBGciaM
	elfiNNgM+BZKP9XmIly4GNCtcZsJvO3v1w==
X-Google-Smtp-Source: AMsMyM5VSDHV/jZFK4Rr+lLcsW3eV5esqktXlgZ4+yc2YMjV+ZJjF+dUDOGzg+bZeFZoxyfI4PscNg==
X-Received: by 2002:a05:651c:b9f:b0:276:762b:3499 with SMTP id bg31-20020a05651c0b9f00b00276762b3499mr616139ljb.444.1667296535904;
        Tue, 01 Nov 2022 02:55:35 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id x9-20020a056512078900b004a03d5c2140sm1619630lfr.136.2022.11.01.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 02:55:35 -0700 (PDT)
Date: Tue, 1 Nov 2022 09:55:33 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [RESEND PATCH v3] staging: vt6655: change variable name wTimeStampOff
Message-ID: <Y2DtFRdhCiyNF2kF@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the use of Hungarian notation, which is not used in the Linux
kernel.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
v3: changed confusing patch changelog

v2: modified confusing patch changelog

 drivers/staging/vt6655/rxtx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 1e5036121665..9bdcf2337235 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -54,7 +54,7 @@
  */
 #define CRITICAL_PACKET_LEN      256
 
-static const unsigned short wTimeStampOff[2][MAX_RATE] = {
+static const unsigned short time_stamp_off[2][MAX_RATE] = {
 	{384, 288, 226, 209, 54, 43, 37, 31, 28, 25, 24, 23}, /* Long Preamble */
 	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
 };
@@ -130,7 +130,7 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 
 static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
 {
-	return cpu_to_le16(wTimeStampOff[priv->preamble_type % 2]
+	return cpu_to_le16(time_stamp_off[priv->preamble_type % 2]
 							[rate % MAX_RATE]);
 }
 
-- 
2.34.1

