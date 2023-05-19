Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AA395
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:14:40 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-64384c6797eso2173746b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 20:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684466079; x=1687058079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgmUah9AmRN5xRowBiuNUq3Kw2yWXbCwwhfNF2+jE1U=;
        b=D64F5dRY7u3AeUP6pEbj8K96JscgeJMVDPx4KZyPdOelgF9W5afgjuXpUHuwMBBCCi
         iT2g4+KIjZDXysy4nwCE7+Y9E0ZbJxu33hRE4VKcQHogU/tVyNseIbPOWYpbAYkpuQjB
         EMjwG8ka8XXp7Zioa59Sy6C8oTEsHr7+yd5JGAS/V0y33KMm+JhBUmXaNpSt8SJLc7EW
         CnRHJ995dpZ+NsQZI+GNTGEnTBLNo1VKK4IuHnM/C2UOUa+QMLvsGdw+VjFKttKKgfCw
         r7ol1E3Uzj9pXh5U86JTQ7ichXIY7uLJ4imDydFQ5r6TVltxMc/Y/783WHtdTdPXM+RS
         titA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684466079; x=1687058079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgmUah9AmRN5xRowBiuNUq3Kw2yWXbCwwhfNF2+jE1U=;
        b=XziVYVLwanoQsFlrLZONcWoNQGLtdfmowznRQH2SHecT4uMBphYdvN/lsBl7MZ/PcS
         m3OYDOxOz6+nudmx2yRdonq5SAlmqeJzvV90k/CvayvdM8a3za6j9FriHeLWBQbGnGg+
         QE4k/ZlqgX9AzrFbpvWh/SObi5ioZhnfDBp/V2I6znUvOQ0DYFoAUEQ5+/VyjvkIEP0F
         zFZ3+LmeHcHqM56+ThVSmlRcehT/m0gCiFfAiEtfVw0joehztXiQnL33e5t5O8GHv07m
         Jc21Z9FO6ylkYtEWVlmtsWukwrNHyPc2q39i+4m+0zdyKOSTywcmFRz3EdO/a7xZOeMQ
         b6Ow==
X-Gm-Message-State: AC+VfDziy0QUbJMdzZWTBC0LshghePIOKSKrCVSf9gJ4bFJ5WQQBw2qz
	VjMWITd+LYbTc2WvF/qbfac=
X-Google-Smtp-Source: ACHHUZ6i+rL5NFRjTiY5g++pjsUENZPlcZ9PWvqV05KoSpCrCW8pe2e8BFqkBlNZl+hWTAYgvl38iA==
X-Received: by 2002:a05:6a00:22d4:b0:64d:3227:b806 with SMTP id f20-20020a056a0022d400b0064d3227b806mr1025838pfj.33.1684466079529;
        Thu, 18 May 2023 20:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:8f78:7441:2406:8b26])
        by smtp.gmail.com with ESMTPSA id c8-20020a655a88000000b0051b4a163ccdsm1760024pgt.11.2023.05.18.20.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 20:14:39 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH v2] Staging: rts5208: rtsx: fixed unbalanced braces around else statement
Date: Fri, 19 May 2023 08:42:04 +0530
Message-Id: <20230519031204.20058-2-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519031204.20058-1-kartikey406@gmail.com>
References: <20230519031204.20058-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed unbalanced braces around else statement

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..47dacef0aaf8 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		/* we've got a command, let's do it! */
-		else {
+		} else {
+			/* we've got a command, let's do it! */
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1

