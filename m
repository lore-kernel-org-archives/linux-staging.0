Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB021FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:53:07 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id w18so2170589edi.13
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YEtYo2gnt++pvnsYGIYS9pvktdaQH4lw368nfE7WujQ=;
        b=L7Dii95LUzvQe6fRXpgyYQqIDzZQqBJT8gZKxi1wJpM0H/j2kGmRFEwlITraIGTWV+
         Xh0aBd5xYiOCPRjktdmZQG4p8JF0sr6gwD6PDPInLfj82SXHpVAMuLzwSywTtmsOm0+D
         KLYzZ3xd+yNf0Z9E9V8UdEZVZ1eJZsoWtlcqGG+fiqcimZDGpHJBVoZ9n+M0UJMNG0sy
         X9MQwQa4pb9TUeeL4WefpX0TXttroIAr727i5bY9sRQ4NaW6S7uVx3IbOX4zT47HzcmY
         lqtwuBoOr3sHAqezzkOqY3K1RxtupQ5A+nBgxERup9qGesWRrpksjK9AtImzKmJXFikf
         SqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YEtYo2gnt++pvnsYGIYS9pvktdaQH4lw368nfE7WujQ=;
        b=BlUxb4eRPIx1LSOixYtP4JbFVRaujwYgT8wh+YVZYMMIXOco3DnEneP23UM5nF4cFx
         1riYUVxfWbFjpQRWe1ToQnlfNliFwTiujg5vNNpJF3ZG8k/KijSJ89naRGGMaEwhtNZo
         TzQ+39zKeSzYUtlVVUmlbf0/NeczeDuzTlCmjMOYbSG8KcBol585zYC9dbPy2p68RgRn
         S9lyD73oFAMnd5ZKUwmKXSmgAjKQfbsfloZ/05AID4Endxcwa2kAZxFttKlObdTg3kUW
         9+O0IkDPzZwz/nZFd4DIGrnquPOa36KcDdYfzN27pBHhFE6/iXUgXI6E3aI+RlTSr4gx
         Vx7g==
X-Gm-Message-State: AOAM532iWfxvw5Jool7FOnh6NZsz5Bbw/ctduIGzfm3NqRVTQxU+inBl
	vxRWqE2X/CGscbS2WD+58Cc=
X-Google-Smtp-Source: ABdhPJzHan5prHCKHnYE2SNPpmLLo+8S96+EsT/DTNhE5X6S0xSrHcuaTDxhB+Q5pD4P/aG4pjgF+A==
X-Received: by 2002:a05:6402:278f:b0:41b:79b1:39b4 with SMTP id b15-20020a056402278f00b0041b79b139b4mr16987672ede.163.1649004785422;
        Sun, 03 Apr 2022 09:53:05 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402000400b00412d60fee38sm4018138edu.11.2022.04.03.09.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:53:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: remove dead code
Date: Sun,  3 Apr 2022 18:52:53 +0200
Message-Id: <20220403165255.6900-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403165255.6900-1-straube.linux@gmail.com>
References: <20220403165255.6900-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_select_and_join_from_scanned_queue() the local variable
cur_ant is set but never used. Remove this dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index b6ed5fb5b281..24ceb8028f89 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1484,11 +1484,6 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 		rtw_free_assoc_resources(adapter, 0);
 	}
 
-	if (support_ant_div(adapter)) {
-		u8 cur_ant;
-		GetHalDefVar8188EUsb(adapter, HAL_DEF_CURRENT_ANTENNA, &cur_ant);
-	}
-
 	ret = rtw_joinbss_cmd(adapter, candidate);
 
 exit:
-- 
2.35.1

