Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE6370
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id u11so5639354wrp.4
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qiGPwwug40UNnH5K1BDplcA3s5jT3Pjwy9PYy6X9bbM=;
        b=eV/EQHWAEdwBvEYpfn+Xe34b7weOWs25lzpjokgjdrYAVIL5DsGamqMWog/6F3yBYJ
         qGr3GTfqX9t13GH6+GUjdV7x8iMnvDlEtHZ1UfhiE+hvuyi6V/F2yl/mgDRt9sTiGsw0
         t3BJ4H2eu7XrM+HPfM4uTwwiYDq3yBKFyqhfhdevV/rjgp6rxe7SizBGTSOLtcrevAjT
         H/g8aP0XttXcCsMfOn19K79S3iDFuCN0UFBCtipf91gqUnWOk7vEM2lr32QP2OpwAILF
         7vXzkh7iyI2D7iLU6yK3hQf7x+LlMHRHkiFtU+MklscLPjGq/Z4RXjeXwVw6as5AAr5l
         /gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qiGPwwug40UNnH5K1BDplcA3s5jT3Pjwy9PYy6X9bbM=;
        b=f3eYLNrfjnDmr2p8Z0o5m9fVlK/QrTnhX5wXM5UvuG+iolW0LNlbEHCyTiUnJAuznt
         CfgwAnTxqfL5s/0JiC1thYLNNjB83QnMGXD2531kYSjxVxxR/12y/Je5sIgQLyk6fA3L
         wT0qVwY74jd2qAxfd3mEyU85CHeSwXar3H5/f4ULbauDstPBgEgsRHw/diw3ZGSPwwRg
         9p7Hzn+hH+8C/ByYgALlkjxXyM7yHimX1bs/c9/9JvwDtOLBtjjC8EdHSUC/Nf9tYufZ
         FRNKOzmXOsQ4Q3QMAbmetiLinqxe8IAs37MpD+u6rEqwgz1XH0Fm/0mp7T48gBDnWXUk
         LlyA==
X-Gm-Message-State: AOAM531AHsKGU5/Y5Sr+Q+wmWpWHbHupB/MfO9HXXDPDsPo4h2RR+OVZ
	9rZyjUZ/JsPg1zEnPjXwv9ne32H7+VPm/g==
X-Google-Smtp-Source: ABdhPJxiFPCd7/peJv4Aez6qQgYYeoeW2ThiGdsNu1cLpoc2BFMbgBb2XfaIMtS/bIRseOj9ufHo5g==
X-Received: by 2002:adf:fa0a:: with SMTP id m10mr4568073wrr.147.1617803417357;
        Wed, 07 Apr 2021 06:50:17 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id v18sm8267009wmh.28.2021.04.07.06.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 13/19] staging: rtl8723bs: remove unnecessary parentheses in if condition
Date: Wed,  7 Apr 2021 15:49:37 +0200
Message-Id: <3f5cf6b7b9aa5a0fa09b71278fdc361e9f113c41.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issue:

CHECK: Unnecessary parentheses around pcmdpriv->cmd_queue.queue
85: FILE: drivers/staging/rtl8723bs/core/rtw_cmd.c:422:
+		if (list_empty(&(pcmdpriv->cmd_queue.queue)))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index cc00bd4f4bc6..baf8b1e0f43c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -419,7 +419,7 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if (list_empty(&(pcmdpriv->cmd_queue.queue)))
+		if (list_empty(&pcmdpriv->cmd_queue.queue))
 			continue;
 
 		if (rtw_register_cmd_alive(padapter) != _SUCCESS)
-- 
2.20.1

