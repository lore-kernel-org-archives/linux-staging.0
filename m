Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573415A8;
	Tue,  5 Apr 2022 01:10:56 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a17-20020a9d3e11000000b005cb483c500dso8388054otd.6;
        Mon, 04 Apr 2022 18:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hh3bnTlEGk3VlP0hz02GBXWX+XEzV5IY2jvUvwAG3Hw=;
        b=kQqkj9gTOKGnqQQMyT5BWPtnJD8d8oZzKUo9COxUNgIREnZhtcWPlvVs4rFpEV9A++
         Xh2knjyzBHj+dySJp93r4LPd+kLuA2DeGomuUM13cSC5qNSn1PmoNoFJphevvZ55egH5
         PesBH1xnMkV+0lX1xYTuQoD1wVV80GH+Z6ZrPbH66eOAOyTdMyGypNSluad3dasiNmOE
         rVcO8XmO0ofSQM74c5lrWvQ4HXXc6UfKYWYmp06zfimnCYv49Sq528Vcr7qo/YI6arUQ
         6mDAAzC4ni1RGYqlgiX9lL9wxzJ67vtIdCMER0X8KyA9HDxyYJjpLfJtP4RHY8gZkoGV
         cJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hh3bnTlEGk3VlP0hz02GBXWX+XEzV5IY2jvUvwAG3Hw=;
        b=WRmy3cjUY1VYg+UbIVtlJJoLSTfVdzqD86ebjFjMd8ibZxfDZ6iuE4DE1VVWfNnLGR
         mk78QnT7xZANR0Ojac1g/V8VEKwscxEduOesHh81XCveJSuY9gJJUqVOf6k7v5MNxGO5
         lrxbUzyG4FgFlpeZeWifdbLWZczGZajZTMe1vXrArI+f0ZtlEGVvjVe6DLg3Y0emmp7I
         xpA33XuIIX2QeL6qzb7+C4iGmvb67StINYUPNWOXMqIeFy0M4UdSAoB+PerCBbqBI9L9
         bqWoUBnz57jL9J6KW+6P8GhtlBO4has002mrklxH0OQFbl1/4Acm5+pTzzsdfGBGBdnL
         ZgOw==
X-Gm-Message-State: AOAM533oH2idfPtAYzcebYfY1NC8nGpai0J+FhaS8PKizk2IJDmfaOPR
	xIO2v2fUTM+B1B6Ter3NIbs=
X-Google-Smtp-Source: ABdhPJzfY0a8mvy/V2gG5sQfuEGhRoPtCfuBeNlLV7hMUfIDu7kaNFuYW6yuHz+wjM0b2hC89ilh3Q==
X-Received: by 2002:a9d:7f95:0:b0:5cd:b19f:2c3a with SMTP id t21-20020a9d7f95000000b005cdb19f2c3amr365037otp.272.1649121055356;
        Mon, 04 Apr 2022 18:10:55 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id mj27-20020a0568700d9b00b000de29e1d6adsm3164195oab.16.2022.04.04.18.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 18:10:55 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove handlerOS independent comment
Date: Mon,  4 Apr 2022 20:10:43 -0500
Message-Id: <416ed753b7b3062cc8c674dea9028fc901e85426.1649120568.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649120568.git.remckee0@gmail.com>
References: <cover.1649120568.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "need to make timeout handlerOS independent" comment is incorrect.
Remove the comment to avoid misleading developers.
Additional instances found with git grep.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 46e18a90529f..c16a2b644296 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1887,7 +1887,6 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 
 	if (pcmd->res == H2C_DROPPED) {
 		/* TODO: cancel timer and do timeout handler directly... */
-		/* need to make timeout handlerOS independent */
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
 	} else if (pcmd->res != H2C_SUCCESS) {
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
@@ -1918,7 +1917,6 @@ void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 
 	if (pcmd->res == H2C_DROPPED) {
 		/* TODO: cancel timer and do timeout handler directly... */
-		/* need to make timeout handlerOS independent */
 		_set_timer(&pmlmepriv->assoc_timer, 1);
 	} else if (pcmd->res != H2C_SUCCESS) {
 		_set_timer(&pmlmepriv->assoc_timer, 1);
-- 
2.32.0

