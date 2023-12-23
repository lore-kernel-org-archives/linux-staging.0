Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F845D28A
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ttw92QCO"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35fe456b94cso3094065ab.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296794; x=1703901594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsFHzDa0Te8ALb5Wr+fprh+y2GTjxlZ6wlPnLscqJhM=;
        b=Ttw92QCO7LBHqDp9nnLBi8UmhG4kzQsCSZxe9x4lKhnwP6LowPOQRbu4Zmv0XKtU8r
         SDd7SslGfnwhqmxilsTbR3nEgc6bMfcj2BDCiqRmdTOvBcUIQPhzKJS7oE443NwI18OQ
         sJdst7zv7hc1r+i+O3BNa7Jx2SMkezlXqtfBCpA2bl0zAF465EmjOIMcwsfyR6xov3VP
         D/3sbRny6v81pwWCFvy9xS7HFqS+irxMo0NEotghbFx0n6cQe88x1G5xLHvHdq8xPwjZ
         fia8P3IM+c38UqM1OImFEdwkfSZY+SOG4yOzA4ambWBSQVsYNGs3vlE6dLu4DfTmVS4g
         N7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296794; x=1703901594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsFHzDa0Te8ALb5Wr+fprh+y2GTjxlZ6wlPnLscqJhM=;
        b=vCRjUqiP4v8YqCE6XXGyE013sZ81XNNKOKsyLa1kIbQaAtMKAxloMn0zz66zfOB+7B
         YHJsRfCrIRVD+KnljJ4eICUbxeZjmE+4uF8Ul2Thix4ooYSxBwzNHeyhedGjtdtkIk1e
         /eOX98qyL0lUNj+nnBiImYNkERd0amNPWN01iKQLbTGJoqc6qO1Twut/KGRJxb+qFLBp
         KK/7iwL2/u2D9jzLIohgtrn51OaHY78wJGKT/pCYbps10FDrlbK6ypbv4Sp6krSwvx7v
         RnG/gRdSNmHAeVp/6A9Wvompp8E7YOhcp9V3YM4Ckfdbvez5IoavaYhII5AfwbXx/EBc
         T4vA==
X-Gm-Message-State: AOJu0Yzlw82b9jm2iuLBX6b5wMYwAMyK+Mv8eWkUngBd7eWBTiLZAKql
	Q6xDwThGwFsohsi5k3Z4qpOBh4l4HDLyKQ==
X-Google-Smtp-Source: AGHT+IEu0RIc8Ky5HxhG5b3GTQZwhVWMUmU0ALvwf8jeBMRADTzqFgjNX6AFawTYsuMayrDyefHBUA==
X-Received: by 2002:a05:6e02:1707:b0:35f:e71f:4c60 with SMTP id u7-20020a056e02170700b0035fe71f4c60mr1969765ill.13.1703296794663;
        Fri, 22 Dec 2023 17:59:54 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:54 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/20] Staging: rtl8192e: Fixup statement broken across 2 lines in rtllib_softmac_xmit()
Date: Fri, 22 Dec 2023 17:59:32 -0800
Message-Id: <20231223015942.418263-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Join 2 lines to fix Warning: Lines should not end with a '('

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 49ac73320fdb..5d14d7c0f8c8 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1838,8 +1838,7 @@ void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee)
 			else
 				kfree_skb(txb->fragments[i]);
 		} else {
-			ieee->softmac_data_hard_start_xmit(
-					txb->fragments[i],
+			ieee->softmac_data_hard_start_xmit(txb->fragments[i],
 					ieee->dev, ieee->rate);
 		}
 	}
-- 
2.39.2

