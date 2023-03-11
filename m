Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E067B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 12:14:48 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so12473047pjg.4
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678536888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEwimVpSA5+970dCFAmfCv72yDJ+ahuHEICR9gkyZtA=;
        b=dr18+cb+NSAMQJXGcNX4s3r4zdp2qSaZFnBlM5A91bznYDjgJCBxIcL+cKdlcWDMwf
         9zlXTYXf01s0IwpLenABfSJiaJsAiH5oqjCZ2MlbbqQTNfYaY7IHoQ+NRJnIhZOgDfIX
         XKeNm3ZlVATQJoezLNP7GJ6ceYznLRoyqDe5Ko1mk+aWojCHm4dGVtq/iWZoRoM0jNMN
         lslERbJZ7O+3NYRAcuPekLtXKPHnsmrrDIFElThunIbtP8HuMWnyYm6VCGkvqzXkTn+Y
         /TCAxGeilZ0ptLLJ9khavqClDtg16zsvQ4Qma+wOo6JHMzhK+aGRcPnfAHabqSHJDUeg
         k4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678536888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEwimVpSA5+970dCFAmfCv72yDJ+ahuHEICR9gkyZtA=;
        b=2iM1/Kc8KxIrXEUZUmBHxEG8IaEhxn6JlO3aEqDamOH/G4nAXzESo8E3k82BWhuAgg
         loddvELP3sOSxv7cP/f20i4wyYJVzKjOQtpHYDD36qoTyFBnk7WiNGbk7Pqjs5i4dgIN
         ZYBsbl77oUX2HJRn84HAhYF1/pSi47mEE/hKf8OVvbIcas0ec1yzQSBAMOwgIbg9L4+M
         N5KbDQV2N52zOm5NImGzZDk9vROuvZJamH7VsX9l1GzJYxWDNfJOxLCN0e/6il7eni2G
         t6U14OV/m9jKnJClRqtZ4dW1R/APxWsWXNfPi6nYB681uftwxi9dcUnNxfcGnMpwyedB
         GH0w==
X-Gm-Message-State: AO0yUKXc2ELT+z7xget47Hh9tbJk3Ifgtj5awTOgWk2wS94z7KqRzGzy
	FrlUPtqxnlSqnVlCf6LUtQMFNN3d7DcXiQ==
X-Google-Smtp-Source: AK7set8A5CAC5xeh54Prq3IdEpmt+ydibThCsjL5sfgOpoW/ePW+I0sP1droRmUn19DvF5INWfB5hw==
X-Received: by 2002:a17:903:2341:b0:19c:d5c7:e3df with SMTP id c1-20020a170903234100b0019cd5c7e3dfmr33408804plh.8.1678536888068;
        Sat, 11 Mar 2023 04:14:48 -0800 (PST)
Received: from craechal ([20.230.228.239])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a174400b00233aeec339fsm1489764pjm.1.2023.03.11.04.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 04:14:47 -0800 (PST)
Received: by craechal (Postfix, from userid 1000)
	id 2F624C62; Sat, 11 Mar 2023 12:14:47 +0000 (UTC)
From: Archana <craechal@gmail.com>
To: gregkh@linuxfoundation.org,
	drv@mailo.com,
	linux-staging@lists.linux.dev,
	error27@gmail.com
Cc: Archana <craechal@gmail.com>
Subject: [PATCH v2 2/2] staging: wlan-ng: small cleanup in plugimage()
Date: Sat, 11 Mar 2023 12:12:53 +0000
Message-Id: <20230311121253.10225-2-craechal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311121253.10225-1-craechal@gmail.com>
References: <ZAwwRnthlPFta9oL@kroah.com>
 <20230311121253.10225-1-craechal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's cleaner to set "j = -1;" before the if block and remove the else
statement.

Signed-off-by: Archana <craechal@gmail.com>
---
Changes in v2:
  - Make the commit message more clearer.

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

