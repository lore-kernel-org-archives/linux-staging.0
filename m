Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E946029CA
	for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 14:17:36 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b26so22985117edt.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Qs8ocYYWIoKCUwNvO6ccY6ArZAl7WcN4rLzhCGCErNs=;
        b=NDK7BxfZQG92fJR1PY3ARzwBJg2lnYIV2v23oDGJpOMeNr5tY1OcQuYt+hDtUYKads
         Uo7c0X3aZXmRRDEhDpY4QZmPHyOk4Vp65W3fzxClEroY2DYlJ4XUQjqMIKFK52vfvC3r
         iqvYi/S/LJjTLSpwDqah2kxShsWtmI+Tb3xVuTxu2D/QPs0/3AqnpnI/wbdP8pdFX08o
         DGt+fTwxPIWikeOAlSOsD4jrPUCcijSRmcwd+mtgOBMvvEW5CRGCQHAD+QTxCuYzmR4z
         I0rbqNosrEC1MTMmwfZ6bzWhdQ0JGocnnQr9gOGMwuzIJssSFNVVPn6cp4AD9zq2S5Ks
         Jf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Qs8ocYYWIoKCUwNvO6ccY6ArZAl7WcN4rLzhCGCErNs=;
        b=b+Z05d0wccWA10N6h/ZXxC6Ix08Uyc0nRj2vqxvd/UawX7LO+lSdWh2Z4bp4oAdL/5
         JtroPSaq0PvhpTDTnS9H0dERbFoarwTj9tboyonrl5XLLeqcLYhnj2SSq8A3gL8YI3E8
         Bp+A+7pB1WEU/hDVAstt9XHh7EYQ46oy8DV4UeqmaFDhuoOo/ndBsu0fSeBhDJ/+jVEy
         6eaTEf0sZfgT5tsovAr2mYM4OBS/5E3OMVT+bFPfj3GLhI2vRPybd1PvJ29RvehNxKij
         MtdRgNGT2xA4xUtgdKOMFyA3DfXcq2ljXW+9oJ8bZcS1jYqLHyqSTkcEEsRZrGdTYX4K
         Uh2w==
X-Gm-Message-State: AOAM533uls3tqK2bUXtmNlbzF8gqnk5avUP4+F+xAl5k8gPshzSDjlKj
	036IlkLCVowNttY495DPt6s=
X-Google-Smtp-Source: ABdhPJzKztxn3aPGBZFDU/ZZGBgHWlkEtVRdG5CYj5erUk732ieUZ7p4U+5bFyzuPShRgw92S6EPTQ==
X-Received: by 2002:a50:c04e:: with SMTP id u14mr2860973edd.235.1633011379453;
        Thu, 30 Sep 2021 07:16:19 -0700 (PDT)
Received: from kkobus.whirley.local (94-214-33-179.cable.dynamic.v4.ziggo.nl. [94.214.33.179])
        by smtp.gmail.com with ESMTPSA id cf16sm1536708edb.51.2021.09.30.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:16:18 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:16:16 +0200
From: Dawid Esterhuizen <desterhuizen@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rtl8712: Statements should start on a tabstop
Message-ID: <YVXGsMZDGmdGjErJ@kkobus.whirley.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This path fixes four checkpatch.pl warnings:

Statements should start on a tabstop

Signed-off-by: Dawid Esterhuizen <desterhuizen@gmail.com>
---
Changes since v2:
	- Fixed the patch comments to comply to standard

Changes since v1:
	- Removed the volatile comments as they served no purpose
	- Fixed the styling with corrected spacing as per checkpatch.pl
        for easier reading

 drivers/staging/rtl8712/rtl871x_xmit.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.h b/drivers/staging/rtl8712/rtl871x_xmit.h
index 2e6afc7bb0a1..cdcbc87a3cad 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.h
+++ b/drivers/staging/rtl8712/rtl871x_xmit.h
@@ -182,11 +182,11 @@ struct sta_xmit_priv {
 };
 
 struct	hw_txqueue {
-	/*volatile*/ sint	head;
-	/*volatile*/ sint	tail;
-	/*volatile*/ sint	free_sz;	/*in units of 64 bytes*/
-	/*volatile*/ sint      free_cmdsz;
-	/*volatile*/ sint	 txsz[8];
+	sint	head;
+	sint	tail;
+	sint	free_sz;	/* in units of 64 bytes */
+	sint	free_cmdsz;
+	sint	txsz[8];
 	uint	ff_hwaddr;
 	uint	cmd_hwaddr;
 	sint	ac_tag;
-- 
2.33.0

