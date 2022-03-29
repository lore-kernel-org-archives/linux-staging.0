Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DB17C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 10:38:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g20so20167812edw.6
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LeYLey+K7jnrJjLXpJq4vuRTho2PLYRKv2z0lAK2TlM=;
        b=KKPUj2Qex5+/EasmmIfkwgmWYeCayDcWgB7zvVAVk+GrA8sqbVwMB/5UPpISy4LTkZ
         8ZXQkqT+D0/nnIfu8bxuJvzKDd26LLhLMnoXwM5xulk60HptX7kp3h3nRQaS1JLXQ3Yw
         kKuKeQkV2A0+TrM5laPRK22AHk1EeFq1kvZLqZMR542V7t1bck/qdC4+YPpKFxyzEueC
         dXUC2Hl/DDL1NqdiAkgQ233cz1zFIwuAdgoxIyFzLw4EsCRkaVwAgEgJLlgyf4m4aSoe
         pmWhhmZFfba6cDSpGwAMogelbI8Rt4QckEXJTfyg4JrT/5yqkRdND4v9K8haf8NGWwfM
         vneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LeYLey+K7jnrJjLXpJq4vuRTho2PLYRKv2z0lAK2TlM=;
        b=wow9EGw8zCbwFPMb05P9PoIKVfkhjrb90Nd5WyHSoIenc9uInslqqbgt2zyQOHWkaJ
         M1gyT1DIaxVgxbP8ZFh/JymkGh/FOv65Cwo4d5iPr8eyOrD/gDghS1gkxjzyf7jmSPUg
         c4Nj860TzGXRmRA+fBCcWnMKETqNBspENpYNAK0yYtFjoGkGtVzO9jh5tOoIcqGuzt0K
         J5rSzdc3khPM1/59UlAsCjWKvruF5z2caNHxFTsvr5/BJdvgQDg4iItPA2q7549ryQiL
         CcYNYX7RfNSpIBa/uuScpwBZYeIMzt7SxOC5k5jWxTdp/K+UURDSkZsmH9dRzSJqkHNK
         plwQ==
X-Gm-Message-State: AOAM53084yMyHUcX+Aw59XNkeJ6eaM3xQmeXZQCk5TlFfAzlCAnRQ5QI
	2aJRI5T/bwaAuVyXGz/Mm34=
X-Google-Smtp-Source: ABdhPJzfvZ2a4hk9t2SroRmjvkPR/HE3ANBkLeh0MRSS0XuNqK+QDggW6tLP9PgFsG8/ysw9BcVVSA==
X-Received: by 2002:a05:6402:2747:b0:419:4817:ba22 with SMTP id z7-20020a056402274700b004194817ba22mr3575366edd.253.1648550289542;
        Tue, 29 Mar 2022 03:38:09 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id qw39-20020a1709066a2700b006e03017d60csm7058151ejc.54.2022.03.29.03.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:38:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: convert rtw_inc_and_chk_continual_urb_error() to bool
Date: Tue, 29 Mar 2022 12:37:56 +0200
Message-Id: <20220329103756.6740-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329103756.6740-1-straube.linux@gmail.com>
References: <20220329103756.6740-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_inc_and_chk_continual_urb_error() returns boolean values.
Change its return type from int to bool.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/usb_ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 5ee1c8c7940d..ddc46cb44358 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -25,7 +25,7 @@
  * @return true:
  * @return false:
  */
-static inline int rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
+static inline bool rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
 {
 	int value = atomic_inc_return(&dvobj->continual_urb_error);
 
-- 
2.35.1

