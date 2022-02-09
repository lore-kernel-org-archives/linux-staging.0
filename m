Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C482F21
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 19:32:41 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so2261445oth.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0IpGy20grOcd5vJjpM1uGLot1+fNqnNeUgBZOKzN3GE=;
        b=EjJky+ALw6AJ6laDzAhpshF2DLSxDj4k8++q+GZ0VC99je6G7oC/AQWrtQCVMjK5xT
         9S59hpSUn17L+XuMhORtvm9kJCWyaScDbyS/14zaqlaBbwiePd5VkVrpQd2N53kd76mx
         bo+bNugiNa+w+48EDoRSGzVX1V6zhwkYGLNW8rQ6jkt7LWRFqm/Qs4RGQCSWVzY60pi+
         cTrBkJwBcyG+/7NrVoKxw9/2522ms/OoLn7srlPyrfg9oxXtssM2lrlf6z4AzEWsjURo
         At4B/z+b5nryn71IYYfaNw1bVdI0xdpS9Wm2Q85i+6/FofqHvc1BFDT+6W2p5i6YH81F
         cKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0IpGy20grOcd5vJjpM1uGLot1+fNqnNeUgBZOKzN3GE=;
        b=kBJNWFYei+iO73NFbf67aA/67OA0kjS1+8wJXPdYOcoZD6aVwSJkFuIICzEGXXWkOb
         +AleZ6qYQYiGo6xL/QQ/dgh77+4xl3GI6VFDZWgKQ5gaedBeAygdvODY5GOI2JEd2KjM
         DwV+s4oM5Hjyrtfz7kE2Wsli0YMuVi6Mf//bnL/4eqj75JoDctu25gfw34CsONjO0SlN
         OST9n3v+PUqyyJii0HmniBKyYosKZqf8Wv2/vwEjBbsI+AKEvgennI6udsVAo6srgT2a
         y25oTwANbUgUPapE4TTX3S7b+8vLsf3yXR05yHhi6kO6En1mWEDzp+lLkEY0nxjWpGy9
         g/ZQ==
X-Gm-Message-State: AOAM530KzCLKBWB1nq7KRumVK7yh/4C3Jh9umxQiedWG8/AImnhdyllK
	vDfEj+TDCLNOXiV4BvaAwOY=
X-Google-Smtp-Source: ABdhPJxV1azGRFBKVpgbmq7a9Jfa0UljglBe26tdIR90GlY1fS3Ti5+MYtjWfrTdeglU6YROg2Kj6g==
X-Received: by 2002:a9d:71c2:: with SMTP id z2mr1581359otj.188.1644435160401;
        Wed, 09 Feb 2022 11:32:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:758b:9a0d:6e95:934f])
        by smtp.gmail.com with ESMTPSA id j6sm6885572otq.76.2022.02.09.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 11:32:39 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Possible repeated word: 'the'
Date: Wed,  9 Feb 2022 16:32:09 -0300
Message-Id: <20220209193209.25934-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

WARNING: Possible repeated word: 'the'

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 8bfb01c2ebb5..bf15f224aee7 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -529,7 +529,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecnetwork->IELength = 0;
 	/*  Added by Albert 2009/02/18 */
-	/*  If the the driver wants to use the bssid to create the connection. */
+	/*  If the driver wants to use the bssid to create the connection. */
 	/*  If not,  we have to copy the connecting AP's MAC address to it so that */
 	/*  the driver just has the bssid information for PMKIDList searching. */
 
-- 
2.29.0

