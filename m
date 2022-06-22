Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430C10FF
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 04:53:10 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id t21so8762172pfq.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 21:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=miDHh8TIXvhG9iaGpB6jefg7h3ay42uNe8cnWKGwUNM=;
        b=H6++axkvJgfmn6n3LaeDwik2qAP91cPX6DQctcDvpgU3kkAk+jCelu+FO8wdZfLNNB
         lWha5g2gfEYAMNBiq0hhdWD1na1d8OkqCzZDpAbTYFDDZVY/G6rnJm1Y3AScVQh9Sefy
         lPVxWHIQr8NYwfAgTKHBff33VgMiO6xNmpeCSNSlhuxLO6Qgzb06148N5XO3OiTSnNhz
         uEizQwa/LOb6D9DOL4HzowJ/L9MluKz7prOYrjE9/2osMcc9dB7AxEt5UmeiuBROsT6n
         5MI30fGl5UC8/n4ypmTGfhzlcpyG22lrgjnk7WZUdTqIt0iQP0qNS+Q+1hBD9DNYmKmB
         3NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=miDHh8TIXvhG9iaGpB6jefg7h3ay42uNe8cnWKGwUNM=;
        b=OZbUPkULiWRHIxIpbEOISrHNNxX47HCAzsG/Ia3foHAa3qWAUbw1GflLnLxCOQEdaK
         e7JW0W+FK60kzgV4I7MLlaAie0EYgrLGWjI2e/V+elVeTJqlK98x75qOkqLkc6pC1YDD
         9e4qGnt8XeI1Fu9PFRdaO7IBW5+mt0w/n1+bBCESPGwxiXX1DcLA5oyNd4KqB5FKzGYy
         HQ+pi2bQtuKiUHhctPm7UzItXzRQAKFrxUBxwrWIH0rnT7aUesC7WryfUdDRU1lKJoKd
         VzyEjADfJ915zq8snuPUZRW96ZbwbhTak67Ta5qdAnp/jbK8ej/duwm/XIpQGmA6Q3X+
         So2Q==
X-Gm-Message-State: AJIora+o782pgmmVudltti5MMSl6naJSD+Z/lyIBnSr04WPxiGM5tq/R
	62PU7M4ViOXJjMALcDSA3MA=
X-Google-Smtp-Source: AGRyM1sfWuGFQ0cMtpUQWtwL/DSxT6D90LTQzU8iTv8hKDvHwDOE5PCYCmL1jj+1hsXVdN3jKYTqyQ==
X-Received: by 2002:a05:6a00:16c7:b0:520:6ede:2539 with SMTP id l7-20020a056a0016c700b005206ede2539mr33230812pfc.46.1655873590035;
        Tue, 21 Jun 2022 21:53:10 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902da8200b00163e4410b82sm333812plx.239.2022.06.21.21.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 21:53:09 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: Fixed two brace coding style issues
Date: Tue, 21 Jun 2022 21:52:31 -0700
Message-Id: <f08a494f324cf5a3b5ed73aab6b3a432cb1da67b.1655872968.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655872968.git.marcus.yu.56@gmail.com>
References: <cover.1655872968.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed two pairs of unnecessary curly braces as per checkpatch.pl

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 7e2f5c2f9111..38b7905dc88f 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1365,13 +1365,12 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 		a_len -= nSubframe_Length;
 		if (a_len != 0) {
 			padding_len = 4 - ((nSubframe_Length + ETH_HLEN) & (4 - 1));
-			if (padding_len == 4) {
+			if (padding_len == 4)
 				padding_len = 0;
-			}
 
-			if (a_len < padding_len) {
+			if (a_len < padding_len)
 				goto exit;
-			}
+
 			pdata += padding_len;
 			a_len -= padding_len;
 		}
-- 
2.36.1

