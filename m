Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FE44C94
	for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 13:02:09 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so7841380b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684069329; x=1686661329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRndM6dwLyg+CH40gLpw0L0oNCaMTsXiybvOzf1CBdM=;
        b=UOpBDf/UdqFprkz/RaGVHjIHh4ZVukFEER1c03onGY1QQrIksKTtlCedPjz3MGeWBW
         KE5nPnSo8fF/vUXXgNYlD9as/unN4tXAnt51PyM3TTV//0RNYGFeHFPdKuRhPD88bQOW
         Vw2HDSO4KPeSTXai3fv7kCPcEtZfiMyDpBnvFs/R2CZOZ9tccpwjBPndOBNkSF/A+TNr
         vjCFQV7OVn27eGIet6A0y1tk3TNxOXf+hnv6V2bUJt16hxQEVnL2dNCq1ev5kbL+wcqp
         5uWM6ucTKa1Zxh9+/JjOrPUojRHYtMp+QTptJEXCZjeAYVBRBZaNAJsHCRfD6/8+896R
         iYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684069329; x=1686661329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRndM6dwLyg+CH40gLpw0L0oNCaMTsXiybvOzf1CBdM=;
        b=ASwy0aJ/0FiRc8XL14MelEL2E0ibnwBOBKYSLmErBNeL8amilRZf0dzx+UUfOU2bEl
         yn+55MqmoOn8dDtVJdBiyKrETvMfhpMcpGKr9hOXBazhRKQdm8z1i1rS/5wTk0/ETNM3
         OTsHKwd0zRBcS4GqCCSlOCxgDdSOc5jMzKNjSrfbo7MwYy/dq/WaIhpm0doQmUCwBpYd
         8chktqhJ0TIz6WfydWtbBqTz2I0RrfSKwfAVBRkHEnMAprqpfdOgGoUMsDhco5ohxeKT
         D6agcyXd3HOyXB1IaPVFvKZHnqhoEX57Q/TU3LH34TcT4c/tbyxTNzv8Gr/t2aDByafM
         1Uog==
X-Gm-Message-State: AC+VfDzLYXVc1gqAhAKykqKF6b9D2sLhFAGGrrdh1o6GjcNJcm6gRl2u
	KiFVT8mg9Utd8bKC7lZZoss=
X-Google-Smtp-Source: ACHHUZ5QJJrM45x8eaWbsW8g7uaVPN75hlKQ2lWbhMYHrZaQFam4iHhjYo8H5t0i31YWv9Nwg+KkyQ==
X-Received: by 2002:a05:6a20:c701:b0:ef:e589:28a3 with SMTP id hi1-20020a056a20c70100b000efe58928a3mr32710915pzb.16.1684069328625;
        Sun, 14 May 2023 06:02:08 -0700 (PDT)
Received: from redkillpc.. ([49.207.202.99])
        by smtp.gmail.com with ESMTPSA id e35-20020a635463000000b0051b70c8d446sm9766146pgm.73.2023.05.14.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 06:02:08 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	prathubaronia2011@gmail.com
Subject: [PATCH v2 2/2] axis-fifo: cleanup space issues with fops struct
Date: Sun, 14 May 2023 18:31:48 +0530
Message-Id: <20230514130148.138624-3-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230514130148.138624-1-prathubaronia2011@gmail.com>
References: <2023051411-happier-mural-a8ef@gregkh>
 <20230514130148.138624-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required spaces for proper formatting of fops members for better
readability.

Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7b3080202b31..2692fda89583 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -716,11 +716,11 @@ static int axis_fifo_close(struct inode *inod, struct file *f)
 }
 
 static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	.open = axis_fifo_open,
+	.owner   = THIS_MODULE,
+	.open    = axis_fifo_open,
 	.release = axis_fifo_close,
-	.read = axis_fifo_read,
-	.write = axis_fifo_write
+	.read    = axis_fifo_read,
+	.write   = axis_fifo_write
 };
 
 /* read named property from the device tree */
-- 
2.34.1

