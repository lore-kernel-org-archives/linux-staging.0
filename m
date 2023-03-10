Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7F2DABA
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 21:00:33 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so6331421pjp.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 13:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678482033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psAfFNiNpsSuK9qPrYRt16o4yVGy2q9JMyLhfhmh/2E=;
        b=d3XycDFJZBTfWTZeFu62MLKE94A6drSWmoU2a9Q7t0ZxlIoWlro3cmmG9SsE3vOvfA
         SNzV9t5gzSbhj3YEA2iuZkyDXyUrbFucr/Ta4J1G3+6bw5KG8/bb5h8YXuYr/Z6li/WZ
         lyeWahPCe50A7SoHCLp3SR4P81BII5CBnzI5Onz4LcecKtvr+PYq9gv2wi2XX3+kltAv
         hqe6NasRc/efnJvGr640CgVCCfePDspVY/bT1LiB/aC5yAimDhxMglnUR4zcr83B88N/
         CB0wKdtQBkbRUOmf0RrxR3ay0JB9iF2EWl4Jv7Q2kNNmTQ6/I8vdSCl8z25/u9d2iZe3
         uOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678482033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psAfFNiNpsSuK9qPrYRt16o4yVGy2q9JMyLhfhmh/2E=;
        b=nK6bxR2GHBVr7sMvUC6kpwyKo3wyRO3keA6NiPWe0mIZVF81DVsEg5cJ20dGS1tpy/
         +QdVsbzS6I78HvbLm3L6II2neRLUc52OtCck/El0NpQVF9M412Z5OF6+y7zY6GElRDLT
         GMHg1MMeF3jaJUuSrH+afzsKBKyLZh7vbDMRIYtHgu9cj5OL6Iv/xPVnR0RkHgmnuzvT
         /+7wPqon48u4R5ABdLiNkho4KKLf/h+e7YXJ+p0JGE2sHNGdjiKlet17Om48QZaPGOXl
         fG913g7dTRTEE4lPqRaFIosmU8KQDpqwlbUNeEaLj8Fj5/ENL8FQQ/99ER/eqWlHCQ2q
         X/wA==
X-Gm-Message-State: AO0yUKWGP2GZuhZJU3lYysC0yyMHY5/JvToRYBzzQ92HF5F0DTbwfyvD
	/daUiMwerEORYXdUxppqteg=
X-Google-Smtp-Source: AK7set8aW7VH/d/65ZiW2hocw9bd0UceyZJMXX/UHGdCjGBIdsnnkCnRTFCM9vi+FMWruH4+q7qR4A==
X-Received: by 2002:a05:6a21:78a6:b0:cc:5f27:d003 with SMTP id bf38-20020a056a2178a600b000cc5f27d003mr6253936pzc.56.1678482033091;
        Fri, 10 Mar 2023 13:00:33 -0800 (PST)
Received: from craechal ([20.230.228.239])
        by smtp.gmail.com with ESMTPSA id x18-20020aa79192000000b00592543d7363sm255145pfa.1.2023.03.10.13.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:00:32 -0800 (PST)
Received: by craechal (Postfix, from userid 1000)
	id 352307F66; Fri, 10 Mar 2023 21:00:32 +0000 (UTC)
From: Archana <craechal@gmail.com>
To: drv@mailo.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Cc: Archana <craechal@gmail.com>
Subject: [PATCH 2/2] staging: wlan-ng: remove else statement
Date: Fri, 10 Mar 2023 20:59:17 +0000
Message-Id: <20230310205917.2161-2-craechal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310205917.2161-1-craechal@gmail.com>
References: <20230310205917.2161-1-craechal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

else block is not needed if j is set to -1
before if block

Signed-off-by: Archana <craechal@gmail.com>
---
 drivers/staging/wlan-ng/prism2fw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 98ed9bb9192c..11658865ca50 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -689,6 +689,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
 	for (i = 0; i < ns3plug; i++) {
 		pstart = s3plug[i].addr;
 		pend = s3plug[i].addr + s3plug[i].len;
+		j = -1;
 		/* find the matching PDR (or filename) */
 		if (s3plug[i].itemcode != 0xffffffffUL) { /* not filename */
 			for (j = 0; j < pda->nrec; j++) {
@@ -696,8 +697,6 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
 				    le16_to_cpu(pda->rec[j]->code))
 					break;
 			}
-		} else {
-			j = -1;
 		}
 		if (j >= pda->nrec && j != -1) { /*  if no matching PDR, fail */
 			pr_warn("warning: Failed to find PDR for plugrec 0x%04x.\n",
-- 
2.34.1

