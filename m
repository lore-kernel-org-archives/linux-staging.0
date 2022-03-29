Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176829A2;
	Tue, 29 Mar 2022 22:25:40 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id gi14so15600607qvb.0;
        Tue, 29 Mar 2022 15:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=EDIv2NnbA2HoBvysLf3wHiMFJpgyzFX6SdC4PgZ8XbE=;
        b=E078j+CtyyfVfdi8VFaQaMdt+NElXSLQzSkBfloPiGe2UYTglMBZJz7mpbohxh8F39
         S+8oZhLeHVKS0ITF6aHCz8jNJLeK5L7/k5RXItXPMyWa6nbWmUAufWcoYpxEMdxyBPNM
         CmcQpNUwtyC0HhEqmZAPs6nZaRv6F+qnXuwlrM+XztOrZa4XD7ny2FJp+jdlzCXzBdjs
         Pd5WXBXG0LY1pnRanTcouM6xMyslAf64QA5OaDFcrR7+XR9uZyYcRjUxD+UQrT9oKBcN
         p4v/9P8minyCaTbqkJ3lEf0kxw2rHo1UX04iVsr+2lez3FyYWm0yKpNW2rXYFClkdG57
         ourw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=EDIv2NnbA2HoBvysLf3wHiMFJpgyzFX6SdC4PgZ8XbE=;
        b=zdOetnLZPaJrJLbRZccl1jlg6toQxQtLrVfGTocJbT7aCf5ZyrEXjPLlCaK05KtqLb
         iVqlwQLYgHY888cT1Z4pRH954MGDeuIbrxuxNIeG6J7OkV/Je5e2Hz4NsrpKERHHA7RU
         8GNRd0IkumdJLbTxCrEazgagmI90LC/bhhY/4Y4DC06/hAClSTFGbnH9dCj+tVPFRANR
         S1DAxkcvtEd/cUBWYliozWkj9fWeTelMdKZXnSP213vdJ+AkfTf3ufDMfusBOd4qvzcw
         QxSpY1HYyONjtPC1uB6L16wVIflbjiAu2J09t7HELl+ZVOol8+TK8kHnyvNUQG2hf+25
         RqrA==
X-Gm-Message-State: AOAM531/5ysTMfGIO0ZHnyvYvJNAdmP9y/NCrX206KcQZq/CCQ89+rOp
	BshX4WBC1grqY7dckhqXmDs=
X-Google-Smtp-Source: ABdhPJwQeCznI7jJGwMXETg1DyJ2CXIcdL8cnv8H29sEKJ+HqpOlskcyhNZrmoCsSiKDi98S2MQ+6Q==
X-Received: by 2002:a05:6214:19e9:b0:443:6799:829e with SMTP id q9-20020a05621419e900b004436799829emr7392065qvc.30.1648592739643;
        Tue, 29 Mar 2022 15:25:39 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id v5-20020a05622a144500b002e1c7d027b1sm15338135qtx.66.2022.03.29.15.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 15:25:38 -0700 (PDT)
Date: Tue, 29 Mar 2022 18:25:34 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: wfx: remove space at the start of the line
Message-ID: <20220329222534.GA1002253@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove spaces at the start of the line to follow the linux kernel
coding style. Issue found by checkpatch:
WARNING: please, no spaces at the start of a line.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/wfx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index b93b16b900c8..e575a81ca2ca 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -170,7 +170,7 @@ bool wfx_api_older_than(struct wfx_dev *wdev, int major, int minor)
  *
  * The PDS file is an array of Time-Length-Value structs.
  */
- int wfx_send_pds(struct wfx_dev *wdev, u8 *buf, size_t len)
+int wfx_send_pds(struct wfx_dev *wdev, u8 *buf, size_t len)
 {
 	int ret, chunk_type, chunk_len, chunk_num = 0;
 
-- 
2.25.1

