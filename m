Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA7720FF;
	Tue, 29 Mar 2022 07:53:38 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id r8so18268289oib.5;
        Tue, 29 Mar 2022 00:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=KCFMGfNYizh6pzOTqsxgLLJuZZfsr83zhrOGb53NYPQ=;
        b=aRwrrxn8IEL+X82hc+96+iD0zXCnJjJYP4lO0q7ULschJPbL45YLvBqJ++M8yMQB6Q
         u9EYAxq6btOkP9NSxsvEBFpF5uqxLtSyaxqRID0HDvQlF5wCPRdMdsEdvO7ZB3Krcu7c
         DF16sbLThsZfms7+9JorppHYeAxoXUpkw5zcESZXl22El3UGGvES36WV/kdyW9s5UeSe
         F2EVj+fkFAYzxHTRyD9kZBPajrx16HAaj+WVp3YrbR8t04YEtKzNicEfcOtc9Bjc4bC9
         fxu74xZ2MI7DfiQ1aO1qHcvDQTEp6f4fh8/ItymsUc7CIPpufVPMJTbf+8d2qg+zeuJC
         TVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=KCFMGfNYizh6pzOTqsxgLLJuZZfsr83zhrOGb53NYPQ=;
        b=z/pR9DhirgtTi8cMzgf9MWwC+JxhktDGvbIR5O4jUXkqqDo+/v7BifhspCGGqxUEgl
         SYHUqaOdL6nV8endXbdExX1xf9y+U5DN6lFv+SOGJuO85CbLtxzklpCPCZeXoxVQ7sFs
         2KIqqQEO3OpYU/z4QzE4VMrepITH1uWlJOILqgzlzM2ZKKHGHAVrIBwSd+CN6rlIkoVW
         kFz4LTCzU7s/E++hIS81irepa++y3vpvUQ4pP1AAfKXvLjNN62q3y0e9x9qKUSt5l86/
         mk/qvYnEO78MDN/2PnK/TirW8ffBVGDDfZFFVcuBJ0okl5kawYZlGy5o7C521Vgq1qyG
         fu/A==
X-Gm-Message-State: AOAM532sqMr2ot0ZzAgCl/vBSz3lgFyWt8S0QXFTNYfsD4jKBZz5ZbVF
	aXsdKRV1ToZ25UAOdXnjeWoh0xGdscVaAIFXfXo=
X-Google-Smtp-Source: ABdhPJwYQacqsHy2tk8qS/8ZNe/lsC0CrDqg+g+TH91qEyztXbB7TzVH6xu/cdqZGiNMJyxlxfly4w==
X-Received: by 2002:a05:6808:f07:b0:2da:4916:578e with SMTP id m7-20020a0568080f0700b002da4916578emr1515111oiw.271.1648540417651;
        Tue, 29 Mar 2022 00:53:37 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id w7-20020a9d6387000000b005b2265711fcsm6989536otk.16.2022.03.29.00.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 00:53:37 -0700 (PDT)
Date: Tue, 29 Mar 2022 02:53:36 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: r8188eu: fix suspect code indent for conditional
 statements
Message-ID: <YkK7ABTVt0TCbd18@bertie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Align the if and else if branches of the conditional statement
to improve readability. Prevent bugs that could be introduced
if developers misread the code. Issue found by checkpatch.

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 6eca30124ee8..ccc43c0ba433 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1408,7 +1408,7 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 		/* TODO: cancel timer and do timeout handler directly... */
 		/* need to make timeout handlerOS independent */
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
-		} else if (pcmd->res != H2C_SUCCESS) {
+	} else if (pcmd->res != H2C_SUCCESS) {
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
 	}
 
-- 
2.32.0

