Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55833201
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 18:48:44 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id y14so10287607pfe.10
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 11:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UUb+ppLFoogYwaTmCBdznH5CdpGbI76fYVRaRMz3mZY=;
        b=LqTp+ahzDUi8OG8Tezrr0Q3SfgqNt7jmuPYJhWCTvWArypx7loPGZE8E77ri8gcwMc
         6NSMN/Wr8C4LWJOqzcS0vbQHe6TXARhDo3QN1zMNiapcl62aFdeF7Wwuo19uoeSqJjoD
         kQD0z6BIEyitPcu+mgCh0704ol93oXQB1f0XUqhAYaC6LO+SeW4Eg3hWeq3lUaWd9j61
         2g3U4fh5XHV3fWgQaEUdWIRDf4fNxEuYOzJQi9TQydTX4QqjMIWe83wNP4LJQrtrL5C3
         1humejQSw7/42jtOc+uUgQ1P9/G59M320ElSp0cdeJWQlXRxXLxElMMHNUAU6e1usr+b
         pwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UUb+ppLFoogYwaTmCBdznH5CdpGbI76fYVRaRMz3mZY=;
        b=Zm8XBPuRk9oY49pl24j34HZi+VuTilHeJTiYlbR4sv4un/apewvFZ45sTx1quN46uA
         1cwtiKIb4g8/XcZmL3jcG5YTv6+mKhJ9VUtP5uUZzjaCiWSlWJcGEcKojvWMmOu0Rgj8
         pSBT9WV/vVu4LiVTnUBwJp0cGRHspDYMhETXRdte+Zd2HDx5DPxogOHaOEB7t4lnmsoL
         HQl4yTCvcBaYduiha/0Z0ylZa5bTfHmb/uhgI22mlaN7VXzCdFIODWytuoj5i8spaCQB
         +Wwbg1sFNH/9OS3ixCFdVpqiUvITxb8d35Rudg4ZEAfXlq1G63I8oPhxoBNTNmaKem+G
         lXGg==
X-Gm-Message-State: AOAM530NlnMZnT+qfoPUK7ioiedcEc8K3kiV8md1646TQfmP/Yk+xqhH
	QHLrVm0jp5qOVgtm+DBduTZWH/97kpFHbg==
X-Google-Smtp-Source: ABdhPJwqDzYgIhXoXKNro0nwo9XbCmjvIts0kZXsSLVI6Kcteoyp0FInfGeAHPBDV1Fi5EG4u0z5xw==
X-Received: by 2002:a63:4a09:0:b0:382:597:3d0d with SMTP id x9-20020a634a09000000b0038205973d0dmr8783928pga.18.1650739724308;
        Sat, 23 Apr 2022 11:48:44 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bc6e:cece:6009:3520])
        by smtp.gmail.com with ESMTPSA id 124-20020a621982000000b0050a73577a37sm6529113pfz.45.2022.04.23.11.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 11:48:44 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: fix a potential NULL pointer dereference
Date: Sun, 24 Apr 2022 00:17:48 +0530
Message-Id: <20220423184745.21134-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

recvframe_chk_defrag() performs a NULL check on psta, but if that check
fails then it dereferences it, which it shouldn't do as psta is NULL.

Set pdefrag_q to NULL if above check fails and let the code after it handle
that case.

Fixes: 1cc18a22b96b ("staging: r8188eu: Add files for new driver - part 5")
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index c1005ddaa..db54bceff 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1244,7 +1244,7 @@ struct recv_frame *recvframe_chk_defrag(struct adapter *padapter, struct recv_fr
 			pdefrag_q = NULL;
 		}
 	} else {
-		pdefrag_q = &psta->sta_recvpriv.defrag_q;
+		pdefrag_q = NULL;
 	}
 
 	if ((ismfrag == 0) && (fragnum == 0))
-- 
2.30.2

