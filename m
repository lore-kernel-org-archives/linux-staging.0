Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA152C82
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 14:27:45 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g10so64738780edj.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uPf+iT4fwzI/SoUUxDbRDAYvExd9vocMw0cUgy57Zcc=;
        b=Wp8btRtmJM41T7dOmTx8He6zSn3nMOtBeF3JbWpmcL42yQw/swcdCgwidUoGPdHpe7
         uKR6AvYQI3w0ovKn0yGrzy/8UFn6TVtxnISkktWKB73KTQjsZLYmjUUpFjNvQR0qIwXR
         a8wVwu2Pow7/t0bFDdfTAzjd5Xz9icOYGcnccE7tSfGua2sp9CvwE2qpo9rRPglur53Z
         3S9Oh4O6P4DAlw0gZvrIaJvvBajkCRkFcHmZz8SFWLg5HAffR6gfWs4xbaeMC9Z6W3Wg
         RZqqztClYP6uIPJfKMI9WrOwPhPvAtbIuoZkUpYnQGM6XI90HPIn/PuzEfb60TWxEOpP
         u+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uPf+iT4fwzI/SoUUxDbRDAYvExd9vocMw0cUgy57Zcc=;
        b=HZSGLGJ54RHO/+1p6ydOZUwzrjb4sCB8CeIFcdNB1jrhfRkXVyr1E7OG9SADESOFzG
         17Aj0/Use0gnkIS43v2iMkTphvIkc04FIHaxd0zzbiyEeEWUDwldGkxcTidAbUpPH3sU
         NJdwwNnslej5tdNhytB4V1hQ8l9HWLOU5cvoYm1PaNgB53KKmBkw8s7Nx8RYgkmvrKRK
         SsXOCm5cQmvCJDMF8jf44B0urKvbFNsuIpKCHVIw1fsHpmyPN5EqR5Rc2IdGt9vlfqPS
         cLKW3fUlG/HOekKpHpZlQhzmPghIZARBETwoBe704zdX2bAgYG9mFihRn2ms+VVRzWq/
         ovBw==
X-Gm-Message-State: AOAM533kKhZSGZuwpB0zvQpoEP8TuK3ez3R170vJXcGtOQPLXL5KaJkH
	UjJ+gjmNZobZ2dOISF8mXTa+7rVrxBE=
X-Google-Smtp-Source: ABdhPJxgGsMjLYNHKTuzcpEvtW+OHHT5HqunzXh7mRoLUv4Il0LoTlbmmcQU7TDdKh4/N+lJmYo7ag==
X-Received: by 2002:a17:906:a84a:: with SMTP id dx10mr17697421ejb.569.1635776863508;
        Mon, 01 Nov 2021 07:27:43 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id d3sm4133836edr.0.2021.11.01.07.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:27:43 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in  atomic context
Date: Mon,  1 Nov 2021 15:27:32 +0100
Message-Id: <20211101142732.5638-1-fmdefrancesco@gmail.com>
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

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1->v2: Fix an overlooked error due to an incorrect copy-paste
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

