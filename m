Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5E17D4
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 10:49:27 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id ot30so15881684ejb.12
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 03:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zD1kXeS1kclzzdV89Yh6GTfc9Fb/ROE7/kA41SKYvPA=;
        b=JvijGFR0Mo9047KejSeh5imWsynBG2ab7mdKpGSk7iREVkHWUP3qVkSoBI0i3ZVSuy
         mOy3gQC42UCpZuE4FUymaZWOexVhTNqRrF5NbQq73XC6wR4SVrJk5cy20KHR3+7Fhxcm
         OP0uasULbcaUt+1O+/sRRcSJEGx8bS3LLDmwfvKf0HXlVdctfTDKdd4pMJtxIFgpnHhI
         DxKL1+9KcO57fxRSSP+Bu+hV34vEgYuBJRz53q/Rz5bpg/xT7vPLOIK0b8txP4NVBPMh
         aBGoRyyGSPkBMa0cOCAnpTUryFbV0A4fcouQpVkU3z6sxZ9XN14IIQEAG63rAnpelzxO
         U+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zD1kXeS1kclzzdV89Yh6GTfc9Fb/ROE7/kA41SKYvPA=;
        b=HEK435/gp87DKPOMug4OW4gwWFA1SWSdZD3NvthBtvrvJuIfTVQGBm2uMXO9wMkQqk
         evk0ntLe3gdWOlFaMBFFKAJnHHw91Fu/oXFUtXEbx9KyP9w+yNW97Ax0/wuqhjPU6hxF
         j1WIQoF7+vvLjTCJ8sHjnKMcyXQCtRKNTwCxENl8wnbxSfZFqmfrOCFko1a8s+ePbvQ1
         cLGW2N1JIUyTYjK9AAUjxO5WZGMGIXX8BXSaSOS7fzfZiMqHUtTd2lVXI45p1Bqp7U6E
         s62bAV72VtN/qmDFJtPTO5esZ2fe1P8O1wkZDYGQ9zhJOEnP63wENyR41pUbZ4XjbPrT
         ovPQ==
X-Gm-Message-State: AOAM531sC5vBChwhXK9nFzrgEbElAb2yFm+0a71Dv7Kr+AM4XHjp4yY7
	9853Bwjj5YyjjIM7LfZhvRY=
X-Google-Smtp-Source: ABdhPJwmvbxYcATdJGs6tIu5uarpASeWFbRGq3gJjHqxw8Y9mHDS0WnAWMzFzkswBpgf0+/IjidnQQ==
X-Received: by 2002:a17:906:d146:b0:6da:f381:4dfe with SMTP id br6-20020a170906d14600b006daf3814dfemr2856426ejb.670.1649155766340;
        Tue, 05 Apr 2022 03:49:26 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id j12-20020a50e0cc000000b0041cd813ac01sm2436702edl.28.2022.04.05.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:49:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/4] staging: r8188eu: cur_ant is set but never used
Date: Tue,  5 Apr 2022 12:49:07 +0200
Message-Id: <20220405104910.9769-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405104910.9769-1-straube.linux@gmail.com>
References: <20220405104910.9769-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_select_and_join_from_scanned_queue() the local variable cur_ant
is set but never used. Remove the variable and related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
- made it the first patch in the series
- changed subject line

 drivers/staging/r8188eu/core/rtw_mlme.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index f94b1536a177..24ceb8028f89 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1458,7 +1458,6 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 	struct __queue *queue	= &pmlmepriv->scanned_queue;
 	struct	wlan_network	*pnetwork = NULL;
 	struct	wlan_network	*candidate = NULL;
-	u8	supp_ant_div = false;
 
 	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 	phead = get_list_head(queue);
@@ -1485,12 +1484,6 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 		rtw_free_assoc_resources(adapter, 0);
 	}
 
-	GetHalDefVar8188EUsb(adapter, HAL_DEF_IS_SUPPORT_ANT_DIV, &supp_ant_div);
-	if (supp_ant_div) {
-		u8 cur_ant;
-		GetHalDefVar8188EUsb(adapter, HAL_DEF_CURRENT_ANTENNA, &cur_ant);
-	}
-
 	ret = rtw_joinbss_cmd(adapter, candidate);
 
 exit:
-- 
2.35.1

