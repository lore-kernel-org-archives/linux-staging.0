Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D342C80
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 19:18:53 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id f4so9539665edx.12
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 12:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZRDRWDv4/r6ZfEE8mTA49GOZiqrpDsppcPnKkD1I6ow=;
        b=ZkSfZK6Gg/s3GZFoUruXehhlMNzE9+3u78SB1/KhUYZb9YOjv73+v5K5xU8YmEZpme
         RCoEGzKzYUirEPFTDC2J2c+JSH/SYmYVN+xbA/dKlJLHQoylNP0ORVAOSS4QWirLAr9z
         GVfnjEk980vjr7T7/QIE92TBLj5nNDXsFYjUgmvFQcJ/awULim9dS5x/AdaFR6HwF/3G
         j/HGmNoQY9sklAiAc5wDySsel7D/Sm+1FGSDsu1zyvFmeQGCL4OPtswweLWlr5KJhi09
         EUXy1O4fBGivYaXTtxHV034G0GB5bJqMD0ts5tOd4JKhbftuYD74H2/5p6RHDFVUU9pw
         bN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZRDRWDv4/r6ZfEE8mTA49GOZiqrpDsppcPnKkD1I6ow=;
        b=LF3BuSGq7UP0IjAur3/ip3J8dC585oNhE1blckjc/glp60G+2od2b7JG3AUAX6yrtO
         dY/NIdKye3KlgqQ6u/B8Kv6INHzpw8wvwPjAHJ6AxlXt5NOrSfugYMON981qKtm7d8Hj
         +V9If+kyVHTTZkL40qfEqrM6fI+u6SKqZj6M+c/NkvPG8viTaqmJYpmwiIkaxZ2H4FOZ
         MQmBDRk50ciNpfBlGxLn2nFtTDSbiWQPQD/OWpDpKK5kMUVRr6PrvI+HJimv/f+xrqdZ
         0xo5U/V/lAA9l/bpKZ7ns485mbGHuiX7mbFHP3B+H43dSExqi2P4fnf2tdBX/xFSI8SG
         rUcQ==
X-Gm-Message-State: AOAM5315hAt91smray4C9M7zrAMhRM22XPTbu5180u/jvg21XT+SwKty
	/jisiBiZZtZfA+ebXy+vVvk=
X-Google-Smtp-Source: ABdhPJxWj1AG699R3OSE/SSstbytHQ3ewDk7/uwVDA085sY+FH/hte144ZjNrArrV3A5iaM/ME+giA==
X-Received: by 2002:a17:907:72c9:: with SMTP id du9mr38967258ejc.124.1635794331676;
        Mon, 01 Nov 2021 12:18:51 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id s12sm9499998edc.48.2021.11.01.12.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:18:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
Date: Mon,  1 Nov 2021 20:18:47 +0100
Message-Id: <20211101191847.6749-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
report_del_sta_event(). This function is called while holding spinlocks,
therefore it is not allowed to sleep. With the GFP_ATOMIC type flag, the
allocation is high priority and must not sleep.

This issue is detected by Smatch which emits the following warning:
"drivers/staging/r8188eu/core/rtw_mlme_ext.c:6848 report_del_sta_event()
warn: sleeping in atomic context".

After the change, the post-commit hook output the following message:
"CHECK: Prefer kzalloc(sizeof(*pcmd_obj)...) over
kzalloc(sizeof(struct cmd_obj)...)".

According to the above "CHECK", use the preferred style in the first
kzalloc().

Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() and kzalloc()")
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v2->v3: Add the "Fixes:" tag, as requested by Greg Kroah-Hartman.

v1->v2: Fix an error that I introduced with an incorrect copy-paste
        of the sizeof() operator.

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 55c3d4a6faeb..315902682292 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6845,12 +6845,12 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	struct mlme_ext_priv		*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
-	pcmd_obj = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	pcmd_obj = kzalloc(sizeof(*pcmd_obj), GFP_ATOMIC);
 	if (!pcmd_obj)
 		return;
 
 	cmdsz = (sizeof(struct stadel_event) + sizeof(struct C2HEvent_Header));
-	pevtcmd = kzalloc(cmdsz, GFP_KERNEL);
+	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
 		return;
-- 
2.33.1

