Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4028E5
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 12:43:45 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id j8so10775499pll.11
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=32znQNcCvJk/J0LQPqfBrFopN6gveol4Y5sCPC/EtaM=;
        b=MZMONg6evm1b06ebf10VUy5qFruE2ufypLDORfiNPGI9Nm0V2d8NKPNfbuYFXbxynU
         Ew5pEiXL+/KwKou273b4JRujttgweTrjxe1fAy9x5lxWCMC0drqctxQwhyb95FPOLZgA
         M2GCBt9hNOFC4/fXKhg8UBwwjYM3MxkKj0saUBeRaN6TZeFpC4g51PHtvYi8xJQ6OGra
         eoa1gHvqGo83aGXxWV+nlgrBMVEmlWLj0Rbn48iMd00FALXO0M21yLmHguVJCwSsKS42
         ySxbWr3ZrLtYfyGkDI3Ry/aerkx5NxGRDDuG+fXVHARuTb+F1Bn5hI0ft1DrvENkaJ/z
         XDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32znQNcCvJk/J0LQPqfBrFopN6gveol4Y5sCPC/EtaM=;
        b=YjyCICgtEC6SMG/6Ps2NFG/dfq8p3BzaaD+kW4P5dssdmQ/wt45fx/AzU2rHv1Eeyr
         /s8K+ikxTbglLVWaGnkfayPeoL8GDKU6NrLYUKSf/DxG3SctQFkI49BLTd+6s0ynbFQ1
         efY5CYUK7BfK2G+h1qitO0yprK6jqcnVcQGKY4lX+GPuuFJzzF7jnUlS1PKN7oTzxbLC
         bYgq6mFYcbcOuq4ZPR/EQG609FJYsLA0SkU8X/VUZeSf7fTki4ox+v31g04bMaUXU+GY
         0ptEbygX59UqRS5r4H+rJmHnDURIaHHXOswCUkwP+EaIGWn5E0blr6YwvFacwRMJjgSJ
         zZlw==
X-Gm-Message-State: AOAM533fHPpHTRCEdMyLuTsSBTojSLeGjobwfsWqMUrBxA4b1wA+YjJm
	pBXa4rD/vZaj51WjVq4yaOQ=
X-Google-Smtp-Source: ABdhPJzr7+HkHfXYcUBAah+Burhp6afkKXykookxCMdIonn8reMbllmPBZT9DGXRbz4AgS+4r6fW0A==
X-Received: by 2002:a17:90b:1994:b0:1ca:9b45:405e with SMTP id mv20-20020a17090b199400b001ca9b45405emr3861657pjb.22.1649162625300;
        Tue, 05 Apr 2022 05:43:45 -0700 (PDT)
Received: from vihas.localhost.com ([103.85.9.59])
        by smtp.gmail.com with ESMTPSA id nl17-20020a17090b385100b001c70883f6ccsm2760014pjb.36.2022.04.05.05.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 05:43:45 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: simplify rtw_inc_and_chk_continual_urb_error
Date: Tue,  5 Apr 2022 18:12:40 +0530
Message-Id: <20220405124239.3372-4-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405124239.3372-1-makvihas@gmail.com>
References: <20220405124239.3372-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if check and variable "value" is redundant. Drop it and simplify
the funciton.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/include/usb_ops.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index ddc46cb44..c5982704c 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -27,12 +27,7 @@
  */
 static inline bool rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
 {
-	int value = atomic_inc_return(&dvobj->continual_urb_error);
-
-	if (value > MAX_CONTINUAL_URB_ERR)
-		return true;
-
-	return false;
+	return atomic_inc_return(&dvobj->continual_urb_error) > MAX_CONTINUAL_URB_ERR;
 }
 
 /*
-- 
2.30.2

