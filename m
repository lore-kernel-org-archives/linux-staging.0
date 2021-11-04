Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB832C85
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 03:22:52 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id b13so5018016plg.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Nov 2021 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=v7JV6sBSjHncLlA/Je17qJW+JL2/u9zGNWzcM/tGeGQ=;
        b=iowS55dMHmgYSfkBWWCQtgegTudprjt8wmXVxeOwd6dvZWjcrLB08Sz1ygrnJkPZwW
         agjvCWv+w80j/VhP34Rauc+Bdibfzs82V6xboxx0Y259KePWFMUpfksnnjzGmY5Lx5uW
         gZiFP67XV2Xnfu+KT3CG/6A0Xu8oJ8/N0NnphbXJQ9YGFwwm3PU3T8d1jWFRNs6VvmAO
         +v+6bkMrtQ4kZqwGn7gaN5EDKrCrSM8ovFkwn7ATfxzHYfapPSg6Fd8Z9PdAnf+T/LD8
         meKMVRsDO5pbeu+bpnRXwhwKcBZNLQiX8X7OwqpPdJSN1AB9XV3fm4iDTav2ZZPeaNI1
         fcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=v7JV6sBSjHncLlA/Je17qJW+JL2/u9zGNWzcM/tGeGQ=;
        b=PvcrqazVXn2T5wNnfIhiF9Dq/SRktBPR6WIv2HtXX5obA/Qxj3J2Ia86ekZ6nuFXfd
         N3PorU4d2/7M/UBrHg4eQCfxtQGYedm3+nm3F5hu/8pZEfhot9HG89hS4gnuYH1hg8M/
         1X6qCm0YWg+eq7rF/gtBCPSx4aVsO94pXwK5R7ecjm6G6jwzUwWsVJaTXKaEc6469Bco
         p/QtfUv2buoTj9xZEeoqqgMTazDaisfIoWqqY+1uYgS4oiFieuSJ3jS16gRLSud1JxL1
         lC2p+4zfGdGv5Gkz6lNF2Yc3BoXpob9tKKJftCeD7X0dUW7jH1O3e8gmBwA4vv3kQXhq
         P/CQ==
X-Gm-Message-State: AOAM530ZVIp+LqdzbgXFtJ8z2jSRxbE/Y1BR72Tgf+jDBxJY1OPiUXt4
	4Vwojrw98cSwF1LRccO09xw=
X-Google-Smtp-Source: ABdhPJwOBXGeQSZgvDoMBXxO7KZwleKLJHiTvoteHDDwCxHDV5j1CPOewAnolh6Fqmj9QbQ7faCwZw==
X-Received: by 2002:a17:90a:9418:: with SMTP id r24mr18953177pjo.238.1635996171894;
        Wed, 03 Nov 2021 20:22:51 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.84.218])
        by smtp.gmail.com with ESMTPSA id z3sm3789967pfh.79.2021.11.03.20.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 20:22:51 -0700 (PDT)
Date: Thu, 4 Nov 2021 08:52:42 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove the unused variable pAdapter
Message-ID: <YYNSAqGgDPhV1IE1@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the unused variable pAdapter from Efuse_Write1ByteToFakeContent
This variable is not used in the function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 03c8431b2ed3..39c77f6b06ef 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -40,10 +40,7 @@ static bool Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 }

 static bool
-Efuse_Write1ByteToFakeContent(
-			struct adapter *pAdapter,
-			u16 Offset,
-			u8 Value)
+Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
@@ -162,7 +159,7 @@ u8 efuse_OneByteWrite(struct adapter *pAdapter, u16 addr, u8 data, bool pseudo)
 	u8 result;

 	if (pseudo) {
-		result = Efuse_Write1ByteToFakeContent(pAdapter, addr, data);
+		result = Efuse_Write1ByteToFakeContent(addr, data);
 		return result;
 	}

--
2.33.0

